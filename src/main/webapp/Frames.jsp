<HTML>
<TITLE>Distribution System</TITLE>
<HEAD>
<STYLE type="text/css">
.itlc_name {
		FONT-WEIGHT: bold; FONT-SIZE: 15px; COLOR: #060606; FONT-FAMILY: Arial, Helvetica, sans-serif; TEXT-DECORATION: none}
.marquee {
		FONT-WEIGHT: bold; FONT-SIZE: 14px; COLOR: #330000; FONT-FAMILY: Arial, Helvetica, sans-serif; TEXT-DECORATION: none}
.text_name {
		FONT-WEIGHT: bold; FONT-SIZE: 13px; COLOR: #000099; FONT-FAMILY: Arial, Helvetica, sans-serif; TEXT-DECORATION: none}
</STYLE>

</HEAD>
<BODY>
<TABLE width='100%'>
	<TR width='100%' class=".itlc_name">
		<TD width='100%' align='center' class=".marquee" nowrap>
		<!--<% out.println(session.getAttribute("CMP_NAME"));%>-->
</TD>
</TR>
</TABLE>
<table width="100%" height="66" border="0" cellspacing="0" cellpadding="0" bgcolor="white">
<tr>
<TD><IMG src="images/Banner.jpg" width="50" height="66" ></TD>
	 <td width="90%" class="marquee" id="blink">
	 <CENTER><% out.println(session.getAttribute("CMP_NAME"));%></CENTER>
	 </td>

  <td align="right" nowrap>
      <A href="Logout.jsp">
		<FONT class="text_name" > Logout </A>&nbsp;</FONT>&nbsp; 
  </td>
</tr>
</table>
<!--<iframe src="TopMenu.jsp" name=TITLE noresize="noresize" scrolling='yes' frameborder='0' height='100%' width='100%'> </iframe>-->
<iframe src="TopMenu.jsp" name=TITLE noresize="noresize" scrolling='yes' frameborder='0' height='86%' width='100%'> </iframe>
</BODY>
</HTML>