<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
     <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Subject</title>
</head>
<body>

<c:set var = "year"  value = '0'/>
<c:set var = "semester"  value = '0'/>


 <table border="1">
      <tr>
         <td>년도</td>
         <td>학기</td>
         <td>이수학점</td>
         <td>상세보기</td>
      </tr>

 <c:forEach var="subject" items="${subjects}">
 
	<c:set var = "years"  value = '${subject.year}'/>
	<c:set var = "semesters"  value = '${subject.semester}'/>
	
	<p>
	<c:choose>
	
	<c:when test="${year != years}">
		<tr>
		<td><c:out value = "${subject.year}" ></c:out></td>
		<c:set var = "year"  value = "${subject.year}"/>
		<c:choose>
			<c:when test="${semester != semesters}">
				<td><c:out value = "${subject.semester}" ></c:out></td>
				<c:set var = "semester"  value = "${subject.semester}"/>
				<c:set var = "credit"  value = '0'/>
				<c:forEach var="subj" items="${subjects}">
					<c:if test="${subj.semester == subject.semester && subj.year == subject.year}"> 
					<c:set var="credit" value="${credit + subj.credit}" />
					</c:if>
				</c:forEach>
					<td><c:out value = "${credit}" ></c:out></td>
				<td> <a href = "<c:url value="${pageContext.request.contextPath}/show">
				<c:param name="year" value="${subject.year}"></c:param>
				<c:param name="semester" value="${subject.semester}"></c:param>
				</c:url>"> 링크 </a>  </td>
				</tr>
			</c:when>
		</c:choose>
	</c:when>
	
	
	<c:when test="${year == years}">
		<c:choose>
			<c:when test="${semester != semesters}">
			<tr>
				<td><c:out value = "${subject.year}" ></c:out></td>
				<td><c:out value = "${subject.semester}" ></c:out></td>
				<c:set var = "semester"  value = "${subject.semester}"/>
				<c:set var = "credit"  value = '0'/>
				<c:forEach var="subj" items="${subjects}">
					<c:if test="${subj.semester == subject.semester && subj.year == subject.year}"> 
					<c:set var="credit" value="${credit + subj.credit}" />
					</c:if>
				</c:forEach>
					<td><c:out value = "${credit}" ></c:out></td>
				<td><a href = "<c:url value="${pageContext.request.contextPath}/show">
				<c:param name="year" value="${subject.year}"></c:param>
				<c:param name="semester" value="${subject.semester}"></c:param>
				</c:url>"> 링크 </a></td>
				</tr>
			</c:when>
		</c:choose>
	</c:when> 
	
	</c:choose>
	</p>

</c:forEach> 

</table>


</body>
</html>