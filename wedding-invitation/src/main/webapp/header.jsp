<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<nav class="navbar" id="siteNavbar">
    <div class="nav-container">
        <a href="${pageContext.request.contextPath}/index.jsp" class="nav-logo" aria-label="Anaya and Rohan - Home">
            <span class="nav-logo-badge">
                <svg viewBox="0 0 60 60" class="nav-logo-ring" aria-hidden="true">
                    <circle cx="30" cy="30" r="27" fill="none" stroke="currentColor" stroke-width="1"/>
                </svg>
                <span class="nav-logo-initials">A&amp;R</span>
            </span>
            <span class="nav-logo-text">Anaya <em>&amp;</em> Rohan</span>
        </a>

        <button class="nav-toggle" id="navToggle" aria-label="Toggle navigation" aria-expanded="false">
            <span></span><span></span><span></span>
        </button>

        <ul class="nav-links" id="navLinks">
            <li><a href="${pageContext.request.contextPath}/index.jsp"><i class="fa-solid fa-house nav-icon"></i>Home</a></li>
            <li><a href="${pageContext.request.contextPath}/story.jsp"><i class="fa-solid fa-heart nav-icon"></i>Our Story</a></li>
            <li><a href="${pageContext.request.contextPath}/gallery.jsp"><i class="fa-solid fa-images nav-icon"></i>Gallery</a></li>
            <li><a href="${pageContext.request.contextPath}/schedule.jsp"><i class="fa-solid fa-calendar-days nav-icon"></i>Schedule</a></li>
            <li><a href="${pageContext.request.contextPath}/contact.jsp"><i class="fa-solid fa-map-location-dot nav-icon"></i>Contact</a></li>
            <li><a href="${pageContext.request.contextPath}/rsvp.jsp" class="nav-cta"><i class="fa-solid fa-envelope-open-text nav-icon"></i>RSVP</a></li>
        </ul>
    </div>
</nav>
