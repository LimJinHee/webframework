<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
        
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">


<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Custom Login Form</title>
</head>
<body>

<h1>Custom Login Form</h1>
<form action="<c:url value="/login" />" method="POST">
   <c:if test="${not empty errorMsg}">
   <div style="color:#ff0000;"><h3>${errorMsg}</h3></div>
   </c:if>
   
   <c:if test="${not empty logoutMsg}">
   <div style="color:#0000ff;"><h3>${logoutMsg}</h3></div>
   </c:if>
   
   <table>
      <tr><td> User: </td><td><input type="text" name="username"/></td></tr>
      <tr><td> Password: </td><td><input type="text" name="password"/></td></tr>
      <tr><td colspan='2'><input type="submit" name="submit" value="Login"/></td></tr>
      
      <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
   </table>
</form>

</body>
</html>