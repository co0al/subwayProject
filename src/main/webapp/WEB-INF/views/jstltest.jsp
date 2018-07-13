<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

<!DOCTYPE html>
<html>
<head>
	<meta charset="utf-8">
	<title>test : jstl 동적배열</title>
	<style>
	table, th, td {
	    border: 1px solid black;
	}
	</style>
</head>

<body>

	<h2>메뉴판</h2>
	
	<table style="width:100%">
	  <tr>
	    <th>분류</th>
	    <th>메뉴명</th> 
	    <th>가격</th>
	  </tr>
	  
	  <c:forEach var="i" begin="1" end="2">
	  	<c:set var="b" value="list${i}" /> 
	    <c:forEach var="list" items="${requestScope[b]}">
	    <tr>
	    <td>${list.category}</td>
	    <td>${list.menu}</td>
	    <td>${list.price }</td>
	  	</tr>
	  	</c:forEach>
	  </c:forEach>
	 
	</table>

</body>
</html>
