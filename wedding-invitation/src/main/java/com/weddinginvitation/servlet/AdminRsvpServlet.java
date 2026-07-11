package com.weddinginvitation.servlet;

import com.weddinginvitation.store.RsvpStore;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

/**
 * Displays all RSVP submissions. Access is restricted via the
 * security-constraint declared in web.xml (BASIC auth, role "wedding-admin"),
 * backed by Tomcat's realm (tomcat-users.xml on the server).
 */
@WebServlet(name = "AdminRsvpServlet", urlPatterns = {"/admin/rsvps"})
public class AdminRsvpServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {
        RsvpStore store = RsvpStore.getInstance();
        req.setAttribute("rsvps", store.findAll());
        req.setAttribute("totalGuests", store.totalGuestCount());
        req.setAttribute("totalRsvps", store.totalRsvpCount());
        req.getRequestDispatcher("/admin.jsp").forward(req, resp);
    }
}
