<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <title>Contact | Anaya &amp; Rohan</title>
    <jsp:include page="meta.jsp"/>
</head>
<body>
<jsp:include page="header.jsp"/>

<section class="page-header">
    <p class="eyebrow">Get In Touch</p>
    <h1>Contact Us</h1>
    <p>Have a question about the wedding? Reach out anytime.</p>
</section>

<section class="section contact-section">
    <div class="contact-details">
        <div class="contact-card reveal">
            <div class="contact-icon"><i class="fa-solid fa-user"></i></div>
            <div>
                <h3>Anaya Mehta</h3>
                <p><i class="fa-solid fa-envelope"></i>&nbsp; anaya@example.com</p>
                <p><i class="fa-solid fa-phone"></i>&nbsp; +91 90000 00001</p>
            </div>
        </div>

        <div class="contact-card reveal reveal-delay-1">
            <div class="contact-icon"><i class="fa-solid fa-user-tie"></i></div>
            <div>
                <h3>Rohan Verma</h3>
                <p><i class="fa-solid fa-envelope"></i>&nbsp; rohan@example.com</p>
                <p><i class="fa-solid fa-phone"></i>&nbsp; +91 90000 00002</p>
            </div>
        </div>

        <div class="contact-card reveal reveal-delay-2">
            <div class="contact-icon"><i class="fa-solid fa-clock"></i></div>
            <div>
                <h3>RSVP Deadline</h3>
                <p>Please respond by 1st January 2027</p>
            </div>
        </div>
    </div>

    <div class="map-wrapper reveal reveal-delay-1">
        <h3><i class="fa-solid fa-map-location-dot"></i>Venue Location</h3>
        <p>The Garden Pavilion, Hyderabad, Telangana, India</p>
        <!--
            Google Maps placeholder - no API key required for this basic
            embed. Replace the query text after "q=" with your real venue
            address, or swap in an API-key-based embed for more control.
        -->
        <iframe
            class="map-frame"
            title="Venue Map"
            src="https://www.google.com/maps?q=Hyderabad,+Telangana,+India&output=embed"
            loading="lazy"
            referrerpolicy="no-referrer-when-downgrade">
        </iframe>
    </div>
</section>

<jsp:include page="footer.jsp"/>
</body>
</html>
