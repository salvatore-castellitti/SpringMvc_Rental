<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix = "fmt" uri = "http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="security" uri="http://www.springframework.org/security/tags" %>

<div class="row justify-content-center">
    <div class="col-auto">
        <h1>${error}</h1>
        <table class="table table-bordered">
            <thead class="thead-dark">
            <tr>
                <security:authorize access="hasRole('ADMIN')">
                    <th scope="col">Customer</th>
                </security:authorize>
                <th scope="col">Vehicle</th>
                <th scope="col">Start Date</th>
                <th scope="col">End Date</th>
                <th scope="col">Action</th>
            </tr>
            </thead>
            <tbody>
            <c:forEach items="${listReserv}" var="reservation">
                <tr>
                    <security:authorize access="hasRole('ADMIN')">
                        <td>${reservation.user.name} ${reservation.user.surname}</td>
                    </security:authorize>

                    <td>${reservation.vehicle.houseProducer} ${reservation.vehicle.model}</td>
                    <td><fmt:formatDate value="${reservation.startDate}" type="date" pattern="dd-MMM-yyyy"/></td>
                    <td><fmt:formatDate value="${reservation.endDate}" type="date" pattern="dd-MMM-yyyy"/></td>
                    <td>
                        <div style="display: flex;">
                            <security:authorize access="hasRole('ADMIN')">
                                <c:choose>
                                    <c:when test="${reservation.confirmed}">
                                        Approved
                                    </c:when>
                                    <c:otherwise>
                                        <form action="${pageContext.request.contextPath}/reservation/approve">
                                            <input type="submit" class="btn btn-secondary mr-1" value="Approve"/>
                                            <input type="hidden" name="idReserv" value="${reservation.id}">
                                            <input type="hidden" name="confirmFlag" value="true">
                                        </form>
                                        <form action="${pageContext.request.contextPath}/reservation/delete">
                                            <input type="submit" class="btn btn-secondary" value="delete" onclick="return confirm('Are you sure you want delete this user?')"/>
                                            <input type="hidden" name="idReserv" value="${reservation.id}">
                                        </form>
                                    </c:otherwise>
                                </c:choose>
                            </security:authorize>
                            <security:authorize access="hasRole('CUSTOMER')">
                                <form action="${pageContext.request.contextPath}/reservation/update">
                                    <input type="submit" class="btn btn-secondary mr-1" value="update"/>
                                    <input type="hidden" name="idReserv" value="${reservation.id}">
                                </form>
                                <form action="${pageContext.request.contextPath}/reservation/delete">
                                    <input type="submit" class="btn btn-secondary" value="delete" onclick="return confirm('Are you sure you want delete this user?')"/>
                                    <input type="hidden" name="idReserv" value="${reservation.id}">
                                </form>
                            </security:authorize>
                        </div>
                    </td>
                </tr>
            </c:forEach>
            </tbody>
        </table>

        <security:authorize access="hasRole('CUSTOMER')">
            <div class="row justify-content-center">
                <form action="${pageContext.request.contextPath}/reservation/add">
                    <button type="submit" class="btn btn-secondary">Create new Reservation</button>
                </form>
            </div>
        </security:authorize>

    </div>
</div>
