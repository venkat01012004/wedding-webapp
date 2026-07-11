package com.weddinginvitation.servlet;

import com.weddinginvitation.model.RsvpEntry;
import com.weddinginvitation.store.RsvpStore;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.regex.Pattern;

/**
 * Handles RSVP form submissions (POST /rsvp).
 * A direct GET simply redirects back to the RSVP form page.
 */
@WebServlet(name = "RsvpServlet", urlPatterns = {"/rsvp"})
public class RsvpServlet extends HttpServlet {

    private static final Pattern EMAIL_PATTERN =
            Pattern.compile("^[\\w.+-]+@[\\w-]+\\.[a-zA-Z]{2,}$");
    private static final Pattern PHONE_PATTERN =
            Pattern.compile("^[0-9+()\\-\\s]{7,20}$");

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {
        resp.sendRedirect(req.getContextPath() + "/rsvp.jsp");
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {
        String name = trim(req.getParameter("name"));
        String email = trim(req.getParameter("email"));
        String phone = trim(req.getParameter("phone"));
        String guestsRaw = trim(req.getParameter("guests"));
        String message = trim(req.getParameter("message"));

        String error = validate(name, email, phone, guestsRaw);

        if (error != null) {
            req.setAttribute("error", error);
            req.setAttribute("name", name);
            req.setAttribute("email", email);
            req.setAttribute("phone", phone);
            req.setAttribute("guests", guestsRaw);
            req.setAttribute("message", message);
            req.getRequestDispatcher("/rsvp.jsp").forward(req, resp);
            return;
        }

        int guests = Integer.parseInt(guestsRaw);
        RsvpEntry saved = RsvpStore.getInstance().add(name, email, phone, guests, message);

        req.setAttribute("rsvp", saved);
        req.getRequestDispatcher("/thankyou.jsp").forward(req, resp);
    }

    private String validate(String name, String email, String phone, String guestsRaw) {
        if (name.isEmpty() || name.length() > 100) {
            return "Please enter a valid name.";
        }
        if (email.isEmpty() || !EMAIL_PATTERN.matcher(email).matches()) {
            return "Please enter a valid email address.";
        }
        if (phone.isEmpty() || !PHONE_PATTERN.matcher(phone).matches()) {
            return "Please enter a valid phone number.";
        }
        try {
            int guests = Integer.parseInt(guestsRaw);
            if (guests < 1 || guests > 20) {
                return "Number of guests must be between 1 and 20.";
            }
        } catch (NumberFormatException e) {
            return "Number of guests must be a valid number.";
        }
        return null;
    }

    private String trim(String value) {
        return value == null ? "" : value.trim();
    }
}
