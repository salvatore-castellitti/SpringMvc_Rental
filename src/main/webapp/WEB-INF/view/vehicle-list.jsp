<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix = "fmt" uri = "http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="security" uri="http://www.springframework.org/security/tags" %>

<div class="row justify-content-center">
    <div class="col-auto">

        <table class="table table-bordered">
            <thead class="thead-dark">
                <tr>
                    <th scope="col">Type</th>
                    <th scope="col">House Producer</th>
                    <th scope="col">Model</th>
                    <th scope="col">Registration Year</th>
                    <security:authorize access="hasRole('ADMIN')">
                        <th scope="col">Action</th>
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
                            <form action="${pageContext.request.contextPath}/vehicle/update">
                                <input type="submit" class="btn btn-secondary" value="update"/>
                                <input type="hidden" name="idVehicle" value="${vehicle.id}">
                            </form>
                            <form action="${pageContext.request.contextPath}/vehicle/delete">
                                <input type="submit" class="btn btn-secondary" value="delete" onclick="return confirm('Are you sure you want delete this user?')"/>
                                <input type="hidden" name="idVehicle" value="${vehicle.id}">
                            </form>

                        </td>
                        </security:authorize>
                    </tr>
                </c:forEach>
            </tbody>
        </table>

        <security:authorize access="hasRole('ADMIN')">
                <div class="row justify-content-center">
                    <form action="${pageContext.request.contextPath}/vehicle/save">
                        <button type="submit" class="btn btn-secondary">Create new Vehicle</button>
                    </form>
                </div>
        </security:authorize>


    </div>
</div>
