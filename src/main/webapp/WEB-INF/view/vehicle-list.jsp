<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix = "fmt" uri = "http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="security" uri="http://www.springframework.org/security/tags" %>

<hr>
<table border="1px">
    <thead>
        <tr>
            <th>Type</th>
            <th>House Producer</th>
            <th>Model</th>
            <th>Registration Year</th>
            <security:authorize access="hasRole('ADMIN')">
                <th>Action</th>
            </security:authorize>
        </tr>
    </thead>
    <tbody>
        <c:forEach items="${listVehicle}" var="vehicle">
            <c:url var="updateLink" value="/vehicle/update">
                <c:param name="idVehicle" value="${vehicle.id}" />
            </c:url>
            <c:url var="deleteLink" value="/vehicle/delete">
            <c:param name="idVehicle" value="${vehicle.id}" />
        </c:url>
            <tr>
                <td>${vehicle.type}</td>
                <td>${vehicle.houseProducer}</td>
                <td>${vehicle.model}</td>
                <td>${vehicle.registrationYear}</td>
                <security:authorize access="hasRole('ADMIN')">
                <td>
                    <a href="${updateLink}" class="button"/>Update |
                    <a href="${deleteLink}" class="button"/>Delete
                </td>
                </security:authorize>
            </tr>
        </c:forEach>
    </tbody>
</table>

<security:authorize access="hasRole('ADMIN')">
    <a href="${pageContext.request.contextPath}/vehicle/save">Add new Vehicle</a>
</security:authorize>


<hr>
