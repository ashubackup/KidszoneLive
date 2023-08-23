<%@page import="datacollector.DataCollector"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Play </title>
</head>

<%
try{
String id=request.getParameter("id");
String gameurl=DataCollector.getGamebyId(id);
%>
<body style="padding:0;margin:0;">

<iframe style="height: 100vh; width: 100%;" src="<%=gameurl%>"
		width="100%" height="100vh" frameborder="0" scrolling="no" id="gameplay"></iframe> 
	<%
	
}catch(Exception e)
{
e.printStackTrace();
System.out.println(e);
}
	%>


</body>
</html>