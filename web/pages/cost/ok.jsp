<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ page import="java.util.List" %>

<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
		<title>Sample Hello World Example</title>
	</head>
<body>
	<h1>Export to Excel Example</h1>
	<table cellpadding="1"  cellspacing="1" border="1" bordercolor="gray">
		<tr>
			<td>First Name</td>
			<td>Last Name</td>
			<td>Age</td>
		</tr>
		<%
			
    	            response.setContentType("application/vnd.ms-excel");
        	    response.setHeader("Content-Disposition", "inline; filename="+ "employeereport.xls");
        	
		%>
			
	</table>
</body>
</html>