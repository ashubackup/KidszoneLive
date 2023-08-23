<%@ page language="java" import="java.util.*"
	contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<style>
table, th, td {
  border: 1px solid black;
  border-collapse: collapse;
}
</style>
<body>

	<table style="width: 100%">
		<tr>
			<th>Parameter Name</th>
			<th>Value</th>
			
		</tr>
		<%
			Enumeration<String> params = request.getHeaderNames();
		while (params.hasMoreElements()) {
			String paramName = params.nextElement();
		%>
		<tr>
			<td><%=paramName%></td>
			<td><%=request.getHeader(paramName)%></td>
		</tr>
		<%
			System.out.println("Parameter Name - " + paramName + ", Value - " + request.getHeader(paramName));
		}
		%>



	</table>
</body>
</html>