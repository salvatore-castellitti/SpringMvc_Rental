<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<div class="row justify-content-center">
    <div class="col-auto">
        <h4><i> ${error} </i></h4>
        <c:choose>
            <c:when test="${controller.equals('DateChosen')}">
                <form:form method="POST" modelAttribute="reservModel" action="addDbReserv" class="card p-4 form-group">
                    <form:hidden path="id"/>
                    <form:hidden path="startDate"/>
                    <form:hidden path="endDate"/>

                    <h3> List Vehicle available for this period</h3>
                    <div class="row justify-content-center">
                        <h5> Start Date: ${startDate}</h5>
                    </div>
                    <div class="row justify-content-center">
                        <h5> End Date: ${endDate}</h5>
                    </div>
                    <br>
                    <c:choose>
                        <c:when test="${empty VEHICLE_LIST}">
                            No Vehicle Free Sorry
                        </c:when>
                        <c:otherwise>
                            Vehicle:
                            <div class="row justify-content-center">
                                <select name="idVehic" class="form-control">
                                    <c:forEach var="vehic" items="${VEHICLE_LIST}">
                                        <option value="${vehic.id}">${vehic.houseProducer} ${vehic.model}</option>
                                    </c:forEach>
                                </select>
                            </div>
                            <div class="row justify-content-center">
                                <input type="submit" name="Create" class="btn btn-secondary mt-4">
                            </div>
                        </c:otherwise>
                    </c:choose>
                </form:form>
            </c:when>
            <c:otherwise>

                        <h3>Select the period for which you want to rent a vehicle</h3><br>

                        <form:form method="get" modelAttribute="reservModel" class="card p-4 form-group">

                            <c:choose>
                                <c:when test="${idReserv!=null}">
                                    <input type="hidden" value="${idReserv}" name="idReserv">
                                </c:when>
                            </c:choose>

                            <input type="hidden" id="controller" name="controller" value="DateChosen"/>

                            Start Date: <input type="date" id="startDate" name="startDate" class="form-control" required><br>
                            End Date: <input type="date" id="endDate" name="endDate" class="form-control" required>

                            <div class="row justify-content-center">
                                <input type="submit" name="Choose Date" class="btn btn-secondary mt-4">
                            </div>

                        </form:form>

            </c:otherwise>
        </c:choose>

    </div>
</div>


