<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>헬로우:구구단예제</title>
</head>
<body>
<h2>구구단7단출력</h2>
<%
for(int i=1; i<10; i++) {
	int j = i*7;
%>
<%= i %> * 7 = <%=j %> <br>

<%} %>

</body>
</html>