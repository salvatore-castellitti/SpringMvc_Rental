<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Reservation Form</title>
</head>
<body>
<h1>${controller}</h1>
<h2>${error}</h2>
<c:choose>
    <c:when test="${controller.equals('DateChosen')}">
        <form:form method="POST" modelAttribute="reservModel" action="addDbReserv">
            <form:hidden path="id"/>
            <form:hidden path="startDate"/>
            <form:hidden path="endDate"/>

            Vehicle:
            <div class="row justify-content-center">
                <form:label path="vehicle.id">Vehicle</form:label>
                <form:select path="vehicle.id">
                    <c:forEach var="vehicle" items="${VEHICLE_LIST}">
                        <form:option value="${vehicle.id}">${vehicle.houseProducer}</form:option>
                    </c:forEach>
                </form:select>
            </div>
            <div class="row justify-content-center">
                <input type="submit" >
            </div>
        </form:form>
    </c:when>
    <c:otherwise>
        <form:form method="get" modelAttribute="reservModel">

            <c:choose>
                <c:when test="${idReserv!=null}">
                    <input type="hidden" value="${idReserv}" name="idReserv">
                </c:when>
            </c:choose>

            <input type="hidden" id="controller" name="controller" value="DateChosen"/>

            Start Date: <input type="date" id="startDate" name="startDate" class="form-control" required><br>
            End Date: <input type="date" id="endDate" name="endDate" class="form-control" required>

            <input type="submit" name="Create">

        </form:form>
    </c:otherwise>
</c:choose>



</body>
</html>
