<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix = "fmt" uri = "http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>

<div class="row justify-content-center">
    <div class="col-auto">

        <table class="table table-bordered">
            <thead class="thead-dark">
                <tr>
                    <th scope="col">Name</th>
                    <th scope="col">Surname</th>
                    <th scope="col">Username</th>
                    <th scope="col">Tax Code</th>
                    <th scope="col">Action</th>
                </tr>
            </thead>
            <tbody>
                <c:forEach items="${listUser}" var="user">
                    <tr>
                        <td>${user.name}</td>
                        <td>${user.surname}</td>
                        <td>${user.username}</td>
                        <td>${user.taxCode}</td>
                        <td>
                            <div style="display: flex;">
                                <form action="${pageContext.request.contextPath}/user/update">
                                    <input type="submit" class="btn btn-secondary mr-1" value="update"/>
                                    <input type="hidden" name="idUser" value="${user.id}">
                                </form>
                                <form action="${pageContext.request.contextPath}/user/delete">
                                    <input type="submit" class="btn btn-secondary" value="delete" onclick="return confirm('Are you sure you want delete this user?')"/>
                                    <input type="hidden" name="idUser" value="${user.id}">
                                </form>
                            </div>
                        </td>
                    </tr>
                </c:forEach>
            </tbody>
        </table>

        <div class="row justify-content-center">
            <form action="${pageContext.request.contextPath}/user/save">
                <button type="submit" class="btn btn-secondary">Create new Customer</button>
            </form>
        </div>

    </div>
</div>