<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Error Page</title>
</head>
<body>
	<p>Sorry for the inconvenience.</p>
	<p>${requestScope.errorMsg}</p>
	<p><a href="http://localhost:8080/WeblyWeddings/">Click Here</a> to go to our home page</p>
</body>
</html>