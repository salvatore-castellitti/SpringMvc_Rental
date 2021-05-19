<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles" %>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<hr>

<div class="p-2">
    <form action="${pageContext.request.contextPath}/logout">
        <input type="submit" value="Logout" class="btn btn-secondary">
    </form>
</div>
<!--Add Log out-->



