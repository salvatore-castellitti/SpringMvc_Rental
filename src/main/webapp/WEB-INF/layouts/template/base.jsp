
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
  </head>
  <body>

  <h1><a href="${pageContext.request.contextPath}/vehicle"> Car Park </a> |
    <a href="${pageContext.request.contextPath}/user/profile"> Profile </a> |
    <a href="${pageContext.request.contextPath}/reservation/"> Reservation </a>

  </h1>
  <p>
    User <security:authentication property="principal.username"/>
    <br><br>
    Role(s) <security:authentication property="principal.authorities"/>
  </p>



     <tiles:insertAttribute name="content" /> 
     
     <tiles:insertAttribute name="footer" />  

  </body>
</html>