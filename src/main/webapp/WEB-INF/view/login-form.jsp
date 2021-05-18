<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>


<div class="row justify-content-center">
    <div class="col-auto">
        <div class="row justify-content-center">
            <h3> Project B - Rental Car Service</h3>
        </div>

        <div class="row justify-content-center">
            <!-- Check for error-->
            <c:if test="${param.error != null}">
                <i>Sorry! You entered invalid username/Password</i>
            </c:if>
            <c:if test="${param.logout != null}">
                <i>Successfully Logout </i>
            </c:if>
        </div>

    <form:form action="${pageContext.request.contextPath}/loginTheUser" method="post" cssClass="card p-4 form-group">

        <label for="username" class="form-label">Username</label>
        <input type="text" name="username" class="form-control" id="username">

        <label for="password" class="form-label">Password</label>
        <input type="text" name="password" class="form-control" id="password">


        <div class="row justify-content-center">
            <button type="submit" class="btn btn-secondary mt-4">Submit</button>
        </div>
    </form:form>

    </div>
</div>