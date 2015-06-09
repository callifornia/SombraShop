<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ include file="library.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
	<title><tiles:insertAttribute name="title" /></title>
	<script type="text/javascript" src="<c:url value='/resources/js/jquery.js' />"></script>
	<script type="text/javascript" src="<c:url value='/resources/js/main.js' />"></script>
	
	<link rel="stylesheet" href="<c:url value='/resources/css/style.css' />">
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.4/css/bootstrap.min.css">
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.4/css/bootstrap-theme.min.css">

</head>
<body>
	    <tiles:insertAttribute name="header" />
		<tiles:insertAttribute name = "menu" />
		<tiles:insertAttribute name="body" />
		<tiles:insertAttribute name="footer" />

	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.4/js/bootstrap.min.js"></script>
</body>
</html>