<%@ page contentType="text/html;charset=UTF-8" language="java" isErrorPage="true" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <title>Something went wrong | Anaya &amp; Rohan</title>
    <jsp:include page="meta.jsp"/>
</head>
<body>
<jsp:include page="header.jsp"/>

<section class="section">
    <div class="state-panel reveal">
        <div class="state-icon"><i class="fa-solid fa-heart-crack"></i></div>
        <h1>Oops!</h1>
        <p>Something went wrong, or the page you're looking for doesn't exist.</p>
        <a class="btn btn-primary" href="${pageContext.request.contextPath}/index.jsp"><i class="fa-solid fa-house"></i>Back to Invitation</a>
    </div>
</section>

<jsp:include page="footer.jsp"/>
</body>
</html>
