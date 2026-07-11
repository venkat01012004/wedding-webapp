<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <title>Event Schedule | Anaya &amp; Rohan</title>
    <jsp:include page="meta.jsp"/>
</head>
<body>
<jsp:include page="header.jsp"/>

<section class="page-header">
    <p class="eyebrow">Save The Dates</p>
    <h1>Event Schedule</h1>
    <p>We can't wait to celebrate every moment with you.</p>
</section>

<section class="section">
    <div class="schedule-grid">
        <div class="schedule-card reveal">
            <div class="schedule-icon"><i class="fa-solid fa-hand-sparkles"></i></div>
            <h3>Mehendi</h3>
            <p class="schedule-date">12th February 2027</p>
            <p class="schedule-time">4:00 PM &ndash; 8:00 PM</p>
            <p class="schedule-venue"><i class="fa-solid fa-location-dot"></i>Mehta Residence, Hyderabad</p>
        </div>

        <div class="schedule-card reveal reveal-delay-1">
            <div class="schedule-icon"><i class="fa-solid fa-sun"></i></div>
            <h3>Haldi</h3>
            <p class="schedule-date">13th February 2027</p>
            <p class="schedule-time">10:00 AM &ndash; 1:00 PM</p>
            <p class="schedule-venue"><i class="fa-solid fa-location-dot"></i>Mehta Residence, Hyderabad</p>
        </div>

        <div class="schedule-card reveal reveal-delay-2">
            <div class="schedule-icon"><i class="fa-solid fa-ring"></i></div>
            <h3>Wedding Ceremony</h3>
            <p class="schedule-date">14th February 2027</p>
            <p class="schedule-time">10:00 AM &ndash; 1:00 PM</p>
            <p class="schedule-venue"><i class="fa-solid fa-location-dot"></i>The Garden Pavilion, Main Lawn</p>
        </div>

        <div class="schedule-card reveal reveal-delay-3">
            <div class="schedule-icon"><i class="fa-solid fa-champagne-glasses"></i></div>
            <h3>Reception</h3>
            <p class="schedule-date">14th February 2027</p>
            <p class="schedule-time">7:00 PM &ndash; 11:00 PM</p>
            <p class="schedule-venue"><i class="fa-solid fa-location-dot"></i>The Garden Pavilion, Banquet Hall</p>
        </div>
    </div>
</section>

<section class="section quote-section reveal">
    <a class="btn btn-primary" href="${pageContext.request.contextPath}/rsvp.jsp"><i class="fa-solid fa-envelope-open-text"></i>RSVP for the Celebrations</a>
</section>

<jsp:include page="footer.jsp"/>
</body>
</html>
