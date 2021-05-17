<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix = "fmt" uri = "http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>

<hr>
 <h1>Questo è il tuo nome?: </h1> ${name}
<hr>
<table border="1px">
    <thead>
        <tr>
            <td>Name</td>
            <td>Surname</td>
            <td>Username</td>
            <td>Tax Code</td>
            <td>Action</td>
        </tr>
    </thead>
    <tbody>
        <c:forEach items="${listUser}" var="user">
            <c:url var="updateLink" value="/user/update">
                <c:param name="idUser" value="${user.id}" />
            </c:url>
            <c:url var="deleteLink" value="/user/delete">
                <c:param name="idUser" value="${user.id}" />
            </c:url>
            <tr>
                <td>${user.name}</td>
                <td>${user.surname}</td>
                <td>${user.username}</td>
                <td>${user.taxCode}</td>
                <td>
                    <a href="${updateLink}" /> Update |
                    <a href="${deleteLink}" onclick="if(!(confirm('Are you sure you want to delete?'))) return false"/>Delete
                </td>
            </tr>
        </c:forEach>
    </tbody>s
</table>

<p>
    <a href="${pageContext.request.contextPath}/user/save">Add a user</a>
</p>

<hr>
