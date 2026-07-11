<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <title>Anaya &amp; Rohan | Wedding Invitation</title>
    <meta name="description" content="Join us in celebrating the wedding of Anaya and Rohan">
    <jsp:include page="meta.jsp"/>
</head>
<body>
<jsp:include page="header.jsp"/>

<header class="hero">
    <div class="hero-content">
        <svg class="hero-ornament-top" viewBox="0 0 100 100" aria-hidden="true">
            <circle cx="50" cy="50" r="34" fill="none" stroke="currentColor" stroke-width="1"/>
            <path d="M50,16 L50,4 M50,84 L50,96 M16,50 L4,50 M84,50 L96,50" stroke="currentColor" stroke-width="1"/>
        </svg>
        <p class="eyebrow">Together with their families</p>
        <h1 class="couple-names">Anaya <span class="amp">&amp;</span> Rohan</h1>
        <p class="hero-subtitle">request the pleasure of your company</p>

        <p class="wedding-date"><i class="fa-regular fa-calendar-heart"></i> Saturday, 14th February 2027 &bull; 10:00 AM</p>
        <p class="wedding-venue"><i class="fa-solid fa-location-dot"></i>The Garden Pavilion, Hyderabad, India</p>

        <div id="countdown" class="countdown" data-wedding-date="2027-02-14T10:00:00">
            <div class="countdown-block"><span id="cd-days">00</span><label>Days</label></div>
            <div class="countdown-block"><span id="cd-hours">00</span><label>Hours</label></div>
            <div class="countdown-block"><span id="cd-mins">00</span><label>Minutes</label></div>
            <div class="countdown-block"><span id="cd-secs">00</span><label>Seconds</label></div>
        </div>

        <div class="cta-row">
            <a class="btn btn-primary" href="${pageContext.request.contextPath}/rsvp.jsp"><i class="fa-solid fa-envelope-open-text"></i>RSVP Now</a>
            <a class="btn btn-secondary" href="${pageContext.request.contextPath}/schedule.jsp"><i class="fa-solid fa-calendar-days"></i>View Schedule</a>
        </div>

        <div class="scroll-cue"><i class="fa-solid fa-chevron-down"></i></div>
    </div>
</header>

<section class="section highlights">
    <div class="highlight-card reveal">
        <i class="fa-solid fa-ring corner-icon"></i>
        <div class="highlight-avatar">A</div>
        <h3>The Bride</h3>
        <p class="name">Anaya Mehta</p>
        <p class="detail">Daughter of Mr. &amp; Mrs. Mehta</p>
    </div>
    <div class="highlight-card reveal reveal-delay-1">
        <i class="fa-solid fa-ring corner-icon"></i>
        <div class="highlight-avatar">R</div>
        <h3>The Groom</h3>
        <p class="name">Rohan Verma</p>
        <p class="detail">Son of Mr. &amp; Mrs. Verma</p>
    </div>
    <div class="highlight-card reveal reveal-delay-2">
        <i class="fa-solid fa-champagne-glasses corner-icon"></i>
        <div class="highlight-avatar"><i class="fa-solid fa-location-dot"></i></div>
        <h3>The Venue</h3>
        <p class="name">The Garden Pavilion</p>
        <p class="detail">Hyderabad, Telangana, India</p>
    </div>
</section>

<section class="section quote-section reveal">
    <div class="quote-icon"><i class="fa-solid fa-quote-left"></i></div>
    <blockquote>
        &ldquo;Two souls, one heart &mdash; the beginning of forever.&rdquo;
    </blockquote>
    <a class="btn btn-secondary" href="${pageContext.request.contextPath}/story.jsp"><i class="fa-solid fa-heart"></i>Read Our Story</a>
</section>

<jsp:include page="footer.jsp"/>
</body>
</html>
