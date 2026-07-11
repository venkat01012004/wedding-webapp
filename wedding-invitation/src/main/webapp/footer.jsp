<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<footer class="site-footer">
    <div class="footer-ornament" aria-hidden="true">
        <svg viewBox="0 0 200 40" class="flourish-svg">
            <path d="M0,20 C40,0 60,40 100,20 C140,0 160,40 200,20" fill="none" stroke="currentColor" stroke-width="1"/>
            <circle cx="100" cy="20" r="4" fill="currentColor"/>
        </svg>
    </div>

    <div class="footer-content">
        <div class="footer-brand">
            <span class="footer-initials">A &amp; R</span>
            <p class="footer-tagline">Two hearts, one beautiful beginning.</p>
        </div>

        <div class="footer-col">
            <h4>Explore</h4>
            <ul>
                <li><a href="${pageContext.request.contextPath}/index.jsp">Home</a></li>
                <li><a href="${pageContext.request.contextPath}/story.jsp">Our Story</a></li>
                <li><a href="${pageContext.request.contextPath}/gallery.jsp">Gallery</a></li>
                <li><a href="${pageContext.request.contextPath}/schedule.jsp">Schedule</a></li>
            </ul>
        </div>

        <div class="footer-col">
            <h4>Celebrate With Us</h4>
            <ul>
                <li><a href="${pageContext.request.contextPath}/rsvp.jsp">RSVP</a></li>
                <li><a href="${pageContext.request.contextPath}/contact.jsp">Contact Us</a></li>
            </ul>
        </div>

        <div class="footer-col">
            <h4>The Big Day</h4>
            <p class="footer-date"><i class="fa-regular fa-calendar-heart"></i> 14th February 2027</p>
            <p class="footer-venue"><i class="fa-solid fa-location-dot"></i> The Garden Pavilion, Hyderabad</p>
            <div class="footer-social">
                <a href="#" aria-label="Instagram"><i class="fa-brands fa-instagram"></i></a>
                <a href="#" aria-label="Facebook"><i class="fa-brands fa-facebook"></i></a>
                <a href="#" aria-label="Pinterest"><i class="fa-brands fa-pinterest"></i></a>
            </div>
        </div>
    </div>

    <div class="footer-bottom">
        <p>&copy; 2027 Anaya &amp; Rohan &nbsp;&bull;&nbsp; Made with <i class="fa-solid fa-heart"></i> for our wedding day</p>
    </div>
</footer>
<script src="${pageContext.request.contextPath}/script.js"></script>
