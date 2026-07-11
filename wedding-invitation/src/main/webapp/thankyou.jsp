<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <title>Thank You | Anaya &amp; Rohan</title>
    <jsp:include page="meta.jsp"/>
</head>
<body>
<jsp:include page="header.jsp"/>

<section class="section">
    <div class="state-panel reveal">
        <div class="state-icon"><i class="fa-solid fa-heart-circle-check"></i></div>
        <h1>
            <c:choose>
                <c:when test="${not empty rsvp.name}">Thank You, ${rsvp.name}!</c:when>
                <c:otherwise>Thank You!</c:otherwise>
            </c:choose>
        </h1>
        <p>Your RSVP has been received. We can't wait to celebrate with you!</p>

        <c:if test="${not empty rsvp}">
            <div class="rsvp-summary">
                <i class="fa-solid fa-user-group"></i>&nbsp;
                Reserved for <strong>${rsvp.guests}</strong> guest<c:if test="${rsvp.guests != 1}">s</c:if>
            </div>
        </c:if>

        <a class="btn btn-primary" href="${pageContext.request.contextPath}/index.jsp"><i class="fa-solid fa-house"></i>Back to Invitation</a>
    </div>
</section>

<jsp:include page="footer.jsp"/>
</body>
</html>
