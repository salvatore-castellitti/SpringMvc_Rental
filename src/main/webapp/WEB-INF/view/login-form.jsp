<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

    <!-- Check for error-->
    <c:if test="${param.error != null}">
        <i>Sorry! You entered invalid username/Password</i>
    </c:if>
    <c:if test="${param.logout != null}">
        <i>Successfully Logout </i>
    </c:if>


    <form:form action="${pageContext.request.contextPath}/loginTheUser" method="post">
        <p>
            User name: <input type="text" name="username">
        </p>
        <p>
            Psw: <input type="text" name="password">
        </p>

        <input type="submit">
    </form:form>

