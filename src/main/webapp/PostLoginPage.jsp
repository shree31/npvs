<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">

<HTML>
<HEAD>
<TITLE>Distribution Sysytem</TITLE>

<META http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<META http-equiv="Content-Style-Type" content="text/css">
<META Http-Equiv="Cache-Control" Content="no-store">
<META Http-Equiv="Cache-Control" Content="no-cache">
<META Http-Equiv="Pragma" Content="no-cache">

<%
if(session.getAttribute("UserName") == null )
	session.setAttribute("UserName",request.getParameter("UserName") ); 
if(session.getAttribute("Password") == null )
	session.setAttribute("pwd",request.getParameter("Password") ); 

%>
<jsp:include page="WebLogin.jsp" /> 
</HTML>
