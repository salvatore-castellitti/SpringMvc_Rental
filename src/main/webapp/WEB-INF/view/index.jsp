<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="security" uri="http://www.springframework.org/security/tags" %>

<h1>${intestazione}</h1>
    <h1>${saluti}</h1>
<h1>hello ${nome}</h1>

<security:authorize access="hasRole('MANAGER')">
    <p>
        <a href="${pageContext.request.contextPath}/leaders">Leaders Page</a>
    </p>
</security:authorize>
<br>
<security:authorize access="hasRole('ADMIN')">
<p>
    <a href="${pageContext.request.contextPath}/user">User for admin</a>
</p>
</security:authorize>

