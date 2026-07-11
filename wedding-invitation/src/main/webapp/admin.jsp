<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <title>Admin | RSVP Submissions</title>
    <jsp:include page="meta.jsp"/>
</head>
<body>
<jsp:include page="header.jsp"/>

<section class="page-header">
    <p class="eyebrow">Admin Dashboard</p>
    <h1>RSVP Submissions</h1>
    <div class="admin-stats">
        <div class="admin-stat">
            <span class="stat-num">${totalRsvps}</span>
            <span class="stat-label">RSVPs Received</span>
        </div>
        <div class="admin-stat">
            <span class="stat-num">${totalGuests}</span>
            <span class="stat-label">Guests Confirmed</span>
        </div>
    </div>
</section>

<section class="section">
    <c:choose>
        <c:when test="${empty rsvps}">
            <div class="empty-state">
                <i class="fa-regular fa-envelope-open"></i>
                <p>No RSVPs yet &mdash; submissions will appear here as guests respond.</p>
            </div>
        </c:when>
        <c:otherwise>
            <div class="rsvp-cards">
                <c:forEach var="r" items="${rsvps}">
                    <div class="rsvp-card reveal">
                        <div class="rsvp-card-head">
                            <h3>${r.name}</h3>
                            <span class="rsvp-guest-badge"><i class="fa-solid fa-user-group"></i>${r.guests}</span>
                        </div>
                        <div class="rsvp-card-body">
                            <p><i class="fa-solid fa-envelope"></i>${r.email}</p>
                            <p><i class="fa-solid fa-phone"></i>${r.phone}</p>
                        </div>
                        <c:if test="${not empty r.message}">
                            <div class="rsvp-card-message">"${r.message}"</div>
                        </c:if>
                        <div class="rsvp-card-time">
                            <i class="fa-regular fa-clock"></i>&nbsp;${r.submittedAt}
                        </div>
                    </div>
                </c:forEach>
            </div>
        </c:otherwise>
    </c:choose>
</section>

<jsp:include page="footer.jsp"/>
</body>
</html>
