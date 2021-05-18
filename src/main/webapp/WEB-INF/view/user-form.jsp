<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix = "fmt" uri = "http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>

<div class="row justify-content-center">
    <div class="col-auto">
        <h3>  Create new User</h3>
        <br>
        <form:form method="POST" modelAttribute="userAction" class="card p-4 form-group">

            <c:choose>
                <c:when test="${userAction.id != null}">
                    <form:hidden path="id"/>
                </c:when>
            </c:choose>

            Name: <form:input id="name" path="name" type="text" placeholder="Name" class="form-control"/> <br>

            Surname: <form:input id="surname" path="surname" type="text" placeholder="Surname" class="form-control"/> <br>

            Username: <form:input id="username" path="username" type="text" placeholder="Username" class="form-control"/> <br>

            Password: <form:input id="password" path="password" type="text" placeholder="New Pass" class="form-control"/> <br>

            <input type="submit">


        </form:form>

    </div>
</div>
