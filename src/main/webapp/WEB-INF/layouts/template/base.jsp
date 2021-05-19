
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%> 
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%> 
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles"%>
<%@ taglib prefix="security" uri="http://www.springframework.org/security/tags" %>


<!doctype html>
<html lang="it">
  <head>
    <!-- Required meta tags -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">


    <title><tiles:insertAttribute name="titolo" /></title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-+0n0xVW2eSR5OomGNYDnhzAbDsOXxcvSN1TPprVMTNDbiYZCxYbOOl7+AMvyTG2x" crossorigin="anonymous">
  </head>
  <body>
  <div class="d-flex">
    <div class="mr-auto p-2">
      <form action="${pageContext.request.contextPath}/vehicle">
        <input type="submit" class="btn btn-secondary mr-1" value="Car Park">
      </form>
    </div>
    <div class="p-2">
      <form action="${pageContext.request.contextPath}/reservation/">
        <input type="submit" value="Reservation" class="btn btn-secondary mr-1">
      </form>
    </div>
    <security:authorize access="hasRole('CUSTOMER')">
      <div class="p-2">
        <form action="${pageContext.request.contextPath}/user/profile" >
          <input type="submit" value="Profile" class="btn btn-secondary mr-1">
        </form>
      </div>
    </security:authorize>
    <div class="p-2">
      <form action="${pageContext.request.contextPath}/">
        <input type="submit" value="Home Page" class="btn btn-secondary">
      </form>
    </div>
  </div>

     <tiles:insertAttribute name="content" />
     
     <tiles:insertAttribute name="footer" />

  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.1/dist/js/bootstrap.bundle.min.js" integrity="sha384-gtEjrD/SeCtmISkJkNUaaKMoLD0//ElJ19smozuHV6z3Iehds+3Ulb9Bn9Plx0x4" crossorigin="anonymous"></script>
  </body>
</html>