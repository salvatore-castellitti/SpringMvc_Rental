<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix = "fmt" uri = "http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>

<div class="row justify-content-center">
    <div class="col-auto">
        <h3>Add a new Vehicle</h3>
        <form:form method="POST" modelAttribute="vehicleAction" class="card p-4 form-group">
            <form:hidden path="id"/>

            Type:
            <form:input id="type" path="type" type="text" placeholder="Type" class="form-control"/>
            <br>

            House Producer:
            <form:input id="houseProducer" path="houseProducer" type="text" placeholder="House Producer" class="form-control"/>
            <br>

            Model:
            <form:input id="model" path="model" type="text" placeholder="Model" class="form-control"/>
            <br>

            License Plate:
            <form:input id="licensePlate" path="licensePlate" type="text" placeholder="License Plate" class="form-control"/>
            <br>

            Registration Year:
            <form:input id="registrationYear" path="registrationYear" type="text" placeholder="Registration Year" class="form-control"/>
            <br>

            <input type="submit">


        </form:form>

    </div>
</div>