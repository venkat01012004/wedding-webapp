<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <title>RSVP | Anaya &amp; Rohan</title>
    <jsp:include page="meta.jsp"/>
</head>
<body>
<jsp:include page="header.jsp"/>

<section class="page-header">
    <p class="eyebrow">We Hope You Can Join Us</p>
    <h1>RSVP</h1>
    <p>Kindly respond by 1st January 2027.</p>
</section>

<section class="section form-section">
    <div class="form-panel reveal">
        <% if (request.getAttribute("error") != null) { %>
            <p class="alert-error"><i class="fa-solid fa-circle-exclamation"></i><%= request.getAttribute("error") %></p>
        <% } %>

        <form method="post" action="${pageContext.request.contextPath}/rsvp" class="rsvp-form" id="rsvpForm" novalidate>
            <div class="form-group">
                <label for="name">Full Name *</label>
                <div class="input-wrap">
                    <i class="fa-solid fa-user field-icon"></i>
                    <input type="text" id="name" name="name" maxlength="100" placeholder="Your full name" required
                           value="<%= request.getAttribute("name") != null ? request.getAttribute("name") : "" %>">
                </div>
            </div>

            <div class="form-group">
                <label for="email">Email Address *</label>
                <div class="input-wrap">
                    <i class="fa-solid fa-envelope field-icon"></i>
                    <input type="email" id="email" name="email" maxlength="150" placeholder="you@example.com" required
                           value="<%= request.getAttribute("email") != null ? request.getAttribute("email") : "" %>">
                </div>
            </div>

            <div class="form-group">
                <label for="phone">Phone Number *</label>
                <div class="input-wrap">
                    <i class="fa-solid fa-phone field-icon"></i>
                    <input type="tel" id="phone" name="phone" maxlength="20" placeholder="+91 90000 00000" required
                           value="<%= request.getAttribute("phone") != null ? request.getAttribute("phone") : "" %>">
                </div>
            </div>

            <div class="form-group">
                <label for="guests">Number of Guests (including you) *</label>
                <div class="input-wrap">
                    <i class="fa-solid fa-user-group field-icon"></i>
                    <input type="number" id="guests" name="guests" min="1" max="20" placeholder="1"
                           value="<%= request.getAttribute("guests") != null ? request.getAttribute("guests") : "1" %>" required>
                </div>
            </div>

            <div class="form-group">
                <label for="message">Message for the Couple (optional)</label>
                <div class="input-wrap">
                    <i class="fa-solid fa-heart field-icon textarea-icon"></i>
                    <textarea id="message" name="message" rows="4" maxlength="500" placeholder="Share your wishes for Anaya &amp; Rohan..."><%= request.getAttribute("message") != null ? request.getAttribute("message") : "" %></textarea>
                </div>
            </div>

            <button type="submit" class="btn btn-primary"><i class="fa-solid fa-paper-plane"></i>Submit RSVP</button>
        </form>

        <p class="rsvp-note"><i class="fa-solid fa-lock"></i>&nbsp; Your details are kept private and used only for wedding planning.</p>
    </div>
</section>

<jsp:include page="footer.jsp"/>
</body>
</html>
