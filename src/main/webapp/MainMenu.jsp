<html><head>
<LINK REL=stylesheet TYPE="text/css" HREF="scripts/style.css">
<STYLE TYPE="text/css">
<!--
.leftlinkOver {background-image:url(images/bg-but.gif); text-decoration: none; color: #FF0000; font-family:Arial, Helvetica, sans-serif; font-size: 8pt; font-weight: bold}

-->
</STYLE>

<script>

</script>
</head><body background="images/bg-but.gif" marginwidth="0" marginheight="25" style="margin: 0" id=all>
<DIV><TABLE border="0" cellpadding="0" cellspacing="0" height="25"><TR ALIGN=TOP>

<script>



var l_array = Array();
l_array[0] = "Masters";
l_array[1] = "Transactions";
l_array[2] = "Reports";
l_array[3] = "Utilities";
l_array[4] = "Help";
window.document.open();
for(var i=0;i<l_array.length;i++)
{
	window.document.writeln('<DIV><TD ID="tdID1" ALIGN=LEFT VALIGN=CENTER href="#" class="leftlinkheader" style="cursor:pointer; cursor:hand"><B><img src="images/plus.gif" border="none" name="imgSRC1">&nbsp;<A href=SideMenu.jsp?SIDESUBMENU=NoChild&MAINMENU='+l_array[i]+' target="SIDEBAR">'+l_array[i]+'&nbsp;&nbsp;&nbsp;</A></B></TD></DIV>');
}
window.document.close();

</script>
</TR>
</TABLE></DIV>
</body></html>
