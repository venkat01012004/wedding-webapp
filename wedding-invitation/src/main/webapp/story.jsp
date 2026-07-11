<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <title>Our Story | Anaya &amp; Rohan</title>
    <jsp:include page="meta.jsp"/>
</head>
<body>
<jsp:include page="header.jsp"/>

<section class="page-header">
    <p class="eyebrow">A Love Story</p>
    <h1>Our Story</h1>
    <p>Every love story is beautiful, but ours is our favorite.</p>
</section>

<section class="section">
    <div class="timeline">
        <div class="timeline-item reveal">
            <div class="timeline-marker">2019</div>
            <div class="timeline-content">
                <h3><i class="fa-solid fa-users"></i>How We Met</h3>
                <p>We met through mutual friends at a college reunion and spent the entire
                    evening talking as if we had known each other for years.</p>
            </div>
        </div>

        <div class="timeline-item reveal reveal-delay-1">
            <div class="timeline-marker">2021</div>
            <div class="timeline-content">
                <h3><i class="fa-solid fa-mountain-sun"></i>First Trip Together</h3>
                <p>Our trip to the hills confirmed what we already felt &mdash; we made an
                    unbeatable team, on the road and in life.</p>
            </div>
        </div>

        <div class="timeline-item reveal reveal-delay-2">
            <div class="timeline-marker">2023</div>
            <div class="timeline-content">
                <h3><i class="fa-solid fa-house-chimney"></i>Moving In Together</h3>
                <p>We took the next big step and turned a small apartment into a home
                    filled with laughter, plants, and way too many books.</p>
            </div>
        </div>

        <div class="timeline-item reveal reveal-delay-3">
            <div class="timeline-marker">2026</div>
            <div class="timeline-content">
                <h3><i class="fa-solid fa-ring"></i>The Proposal</h3>
                <p>On a quiet evening by the lake, under a sky full of stars, Rohan got
                    down on one knee &mdash; and Anaya said yes before he even finished the question.</p>
            </div>
        </div>
    </div>
</section>

<section class="section quote-section reveal">
    <div class="quote-icon"><i class="fa-solid fa-heart-circle-check"></i></div>
    <blockquote>&ldquo;And so, the story continues &mdash; this time, together forever.&rdquo;</blockquote>
    <a class="btn btn-primary" href="${pageContext.request.contextPath}/rsvp.jsp"><i class="fa-solid fa-envelope-open-text"></i>Join Our Celebration</a>
</section>

<jsp:include page="footer.jsp"/>
</body>
</html>
