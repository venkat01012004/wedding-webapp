document.addEventListener("DOMContentLoaded", function () {
    initNavToggle();
    initCountdown();
    initRsvpValidation();
    initNavbarScroll();
    initScrollReveal();
});

/* ---------- Mobile navigation toggle ---------- */
function initNavToggle() {
    var toggle = document.getElementById("navToggle");
    var links = document.getElementById("navLinks");
    if (!toggle || !links) return;

    toggle.addEventListener("click", function () {
        var isOpen = links.classList.toggle("open");
        toggle.classList.toggle("open", isOpen);
        toggle.setAttribute("aria-expanded", isOpen ? "true" : "false");
    });

    links.querySelectorAll("a").forEach(function (link) {
        link.addEventListener("click", function () {
            links.classList.remove("open");
            toggle.classList.remove("open");
            toggle.setAttribute("aria-expanded", "false");
        });
    });
}

/* ---------- Navbar shadow on scroll ---------- */
function initNavbarScroll() {
    var navbar = document.getElementById("siteNavbar");
    if (!navbar) return;

    function update() {
        navbar.classList.toggle("scrolled", window.scrollY > 10);
    }
    update();
    window.addEventListener("scroll", update, { passive: true });
}

/* ---------- Scroll-triggered fade-in reveal ---------- */
function initScrollReveal() {
    var items = document.querySelectorAll(".reveal");
    if (!items.length) return;

    if (!("IntersectionObserver" in window)) {
        items.forEach(function (el) { el.classList.add("in-view"); });
        return;
    }

    var observer = new IntersectionObserver(function (entries) {
        entries.forEach(function (entry) {
            if (entry.isIntersecting) {
                entry.target.classList.add("in-view");
                observer.unobserve(entry.target);
            }
        });
    }, { threshold: 0.15 });

    items.forEach(function (el) { observer.observe(el); });
}

/* ---------- Countdown timer ---------- */
function initCountdown() {
    var el = document.getElementById("countdown");
    if (!el) return;

    var targetDateStr = el.getAttribute("data-wedding-date");
    var weddingDate = new Date(targetDateStr);

    function update() {
        var now = new Date();
        var diff = weddingDate - now;
        if (diff < 0) diff = 0;

        var days = Math.floor(diff / (1000 * 60 * 60 * 24));
        var hours = Math.floor((diff / (1000 * 60 * 60)) % 24);
        var mins = Math.floor((diff / (1000 * 60)) % 60);
        var secs = Math.floor((diff / 1000) % 60);

        setText("cd-days", days);
        setText("cd-hours", hours);
        setText("cd-mins", mins);
        setText("cd-secs", secs);
    }

    function setText(id, value) {
        var target = document.getElementById(id);
        if (target) target.textContent = String(value).padStart(2, "0");
    }

    update();
    setInterval(update, 1000);
}

/* ---------- RSVP client-side validation ---------- */
function initRsvpValidation() {
    var form = document.getElementById("rsvpForm");
    if (!form) return;

    var emailPattern = /^[\w.+-]+@[\w-]+\.[a-zA-Z]{2,}$/;
    var phonePattern = /^[0-9+()\-\s]{7,20}$/;

    form.addEventListener("submit", function (event) {
        var valid = true;

        valid = validateField("name", function (v) { return v.trim().length > 0; }) && valid;
        valid = validateField("email", function (v) { return emailPattern.test(v.trim()); }) && valid;
        valid = validateField("phone", function (v) { return phonePattern.test(v.trim()); }) && valid;
        valid = validateField("guests", function (v) {
            var n = parseInt(v, 10);
            return !isNaN(n) && n >= 1 && n <= 20;
        }) && valid;

        if (!valid) {
            event.preventDefault();
        }
    });

    function validateField(id, isValid) {
        var field = document.getElementById(id);
        if (!field) return true;

        var ok = isValid(field.value || "");
        field.classList.toggle("invalid", !ok);
        return ok;
    }
}
