<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
         <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>

   <table border="1">
      <tr>
         <td>교과코드</td>
         <td>교과목명</td>
         <td>구분</td>
         <td>학점</td>
      </tr>
      <c:forEach var="show" items="${shows}">
         <c:if test="${show.year == year && show.semester == semester}"> 
            <tr>
               <td>${show.code}</td>
               <td>${show.title}</td>
               <td>${show.division}</td>
               <td>${show.credit}</td>
            </tr>
       </c:if> 
      </c:forEach>
      
   </table>

</body>
</html>