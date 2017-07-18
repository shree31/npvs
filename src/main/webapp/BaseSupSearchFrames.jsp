<form name="BASESUPSEARCH" method="post">
<TITLE>Circulation</TITLE>
</HEAD>
<%
String l_agency_code = request.getParameter("AGN_CODE");
String l_cmp_code = request.getParameter("CMP_CODE");
%>

<iframe src="MT_AGNSUPSEARCH.jsp?AGN_CODE=<%=l_agency_code%>&CMP_CODE=<%=l_cmp_code%>" name=TITLE scrolling='auto' noresize="noresize" frameborder='0' height='40%' width='100%'> </iframe>

<iframe src="MLBlank.html" name=SEARCHDET scrolling='auto' noresize="noresize" frameborder='0' height='60%' width='100%'> </iframe>

</HTML>

</form>


