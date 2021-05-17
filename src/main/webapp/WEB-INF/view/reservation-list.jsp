<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix = "fmt" uri = "http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="security" uri="http://www.springframework.org/security/tags" %>

<hr>
<h1>${error}</h1>
<table border="1px" class="searchable sortable">
    <thead>
    <tr>
        <security:authorize access="hasRole('ADMIN')">
            <th>Customer</th>
        </security:authorize>
        <th>Vehicle</th>
        <th>Start Date</th>
        <th>End Date</th>
        <th>Action</th>
    </tr>
    </thead>
    <tbody>
    <c:forEach items="${listReserv}" var="reservation">
        <c:url var="updateLink" value="/reservation/update">
            <c:param name="idReserv" value="${reservation.id}" />
        </c:url>
        <c:url var="approveLink" value="/reservation/approve">
            <c:param name="idReserv" value="${reservation.id}" />
            <c:param name="confirmFlag" value="true"/>
        </c:url>

        <c:url var="deleteLink" value="/reservation/delete">
            <c:param name="idReserv" value="${reservation.id}" />
        </c:url>
        <tr>
            <security:authorize access="hasRole('ADMIN')">
                <td>${reservation.user.name} ${reservation.user.surname}</td>
            </security:authorize>

            <td>${reservation.vehicle.houseProducer} ${reservation.vehicle.model}</td>
            <td><fmt:formatDate value="${reservation.startDate}" type="date" pattern="dd-MMM-yyyy"/></td>
            <td><fmt:formatDate value="${reservation.endDate}" type="date" pattern="dd-MMM-yyyy"/></td>
            <td>
                <security:authorize access="hasRole('ADMIN')">
                    <c:choose>
                        <c:when test="${reservation.confirmed}">
                            Approved
                        </c:when>
                        <c:otherwise>
                            <a href="${approveLink}">Approve</a>
                            <a href="${deleteLink}" onclick="if(!(confirm('Are you sure you want to delete?'))) return false"/>Decline
                        </c:otherwise>
                    </c:choose>
                </security:authorize>
                <security:authorize access="hasRole('CUSTOMER')">
                    <a href="${updateLink}" /> Update |
                    <a href="${deleteLink}" onclick="if(!(confirm('Are you sure you want to delete?'))) return false"/>Delete
                </security:authorize>
            </td>
        </tr>
    </c:forEach>
    </tbody>s
</table>

<p>
    <a href="${pageContext.request.contextPath}/reservation/add">Add a new Reservation</a>
</p>

<hr>
