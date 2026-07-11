<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <title>Gallery | Anaya &amp; Rohan</title>
    <jsp:include page="meta.jsp"/>
</head>
<body>
<jsp:include page="header.jsp"/>

<section class="page-header">
    <p class="eyebrow">Moments We Love</p>
    <h1>Gallery</h1>
    <p>A few frames from our journey together.</p>
</section>

<section class="section">
    <p class="gallery-note">
        These elegant frames are ready for your own photos &mdash; simply drop image files
        into <code>/images</code> and swap in an <code>&lt;img&gt;</code> tag for each
        <code>.placeholder-frame</code> below.
    </p>

    <div class="gallery-grid">
        <figure class="gallery-item reveal">
            <div class="placeholder-frame">
                <i class="fa-solid fa-camera-retro"></i>
                <span class="ph-label">Photo 01</span>
            </div>
            <figcaption>Engagement Day</figcaption>
        </figure>
        <figure class="gallery-item reveal reveal-delay-1">
            <div class="placeholder-frame">
                <i class="fa-solid fa-mountain-sun"></i>
                <span class="ph-label">Photo 02</span>
            </div>
            <figcaption>Our Trip to the Hills</figcaption>
        </figure>
        <figure class="gallery-item reveal reveal-delay-2">
            <div class="placeholder-frame">
                <i class="fa-solid fa-people-roof"></i>
                <span class="ph-label">Photo 03</span>
            </div>
            <figcaption>Family Get-together</figcaption>
        </figure>
        <figure class="gallery-item reveal">
            <div class="placeholder-frame">
                <i class="fa-solid fa-ring"></i>
                <span class="ph-label">Photo 04</span>
            </div>
            <figcaption>The Proposal</figcaption>
        </figure>
        <figure class="gallery-item reveal reveal-delay-1">
            <div class="placeholder-frame">
                <i class="fa-solid fa-champagne-glasses"></i>
                <span class="ph-label">Photo 05</span>
            </div>
            <figcaption>Pre-Wedding Shoot</figcaption>
        </figure>
        <figure class="gallery-item reveal reveal-delay-2">
            <div class="placeholder-frame">
                <i class="fa-solid fa-heart"></i>
                <span class="ph-label">Photo 06</span>
            </div>
            <figcaption>Just Us</figcaption>
        </figure>
    </div>
</section>

<jsp:include page="footer.jsp"/>
</body>
</html>
