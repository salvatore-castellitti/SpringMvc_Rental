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

            <form:hidden path="password"/>

            Name: <form:input id="name" path="name" type="text" placeholder="Name" class="form-control"/> <br>

            Surname: <form:input id="surname" path="surname" type="text" placeholder="Surname" class="form-control"/> <br>

            Birthday: <form:input path="birthday" id="birthday" type="date" placeholder="Birthday" class="form-controll"/>
            <form:errors path="birthday" /> <br>

            Username: <form:input id="username" path="username" type="text" placeholder="Username" class="form-control"/>
            <form:errors path="username" /> <br>

            Tax Code: <form:input id="taxCode" path="taxCode" type="text" placeholder="Tax Code" class="form-control"/>
            <form:errors path="taxCode" />
            <br>
            Password: <input type="password" name="pass" placeholder="Password" class="form-control" id="pass">

            <input type="submit">


        </form:form>

    </div>
</div>
