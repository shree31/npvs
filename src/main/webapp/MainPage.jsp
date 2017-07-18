<HTML>
<HEAD>

<TITLE>Login</TITLE>

<%
if(session.getAttribute("UserId")!=null)
{
	session.invalidate();
	session=null;
	session=request.getSession(true);
}
%>

</HEAD>

<FRAMESET rows="*,0%,0%,0%" framespacing="0" frameborder="no" border="no">
<frame name=framemain src="SmartLogin.jsp"  marginheight="0" marginwidth="0" scrolling="no" noresize="noresize">
<!-- <frame name=framehid src="StoreHid.jsp" marginheight="0" marginwidth="0" scrolling="no" frameborder="0" noresize="noresize">
<frame name=framecard src="StoreHid1.jsp" marginheight="0" marginwidth="0" scrolling="no" frameborder="0" noresize="noresize">
<frame name=framelogout src="StoreHid1.jsp" marginheight="0" marginwidth="0" scrolling="no" frameborder="0" noresize="noresize">-->
</frameset>
</HTML>

