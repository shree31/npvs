<HTML>
<HEAD>
<TITLE>Distribution Menu</TITLE>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">


<META http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<META http-equiv="Content-Style-Type" content="text/css">
<META Http-Equiv="Cache-Control" Content="no-store">
<META Http-Equiv="Cache-Control" Content="no-cache">
<META Http-Equiv="Pragma" Content="no-cache">
<META Http-Equiv="Expires: Thu, 01 Dec 1994 16:00:00 GMT" Content="0">

<STYLE type="text/css">
.itlc_name {
		FONT-WEIGHT: bold; FONT-SIZE: 15px; COLOR: #060606; FONT-FAMILY: Arial, Helvetica, sans-serif; TEXT-DECORATION: none}
.marquee {
		FONT-WEIGHT: bold; FONT-SIZE: 14px; COLOR: #330000; FONT-FAMILY: Arial, Helvetica, sans-serif; TEXT-DECORATION: none}
</STYLE>

<script type="text/javascript">

function blinking_header()
{
if (!document.getElementById('blink').style.color)
	{
	document.getElementById('blink').style.color="#aa1133"
	}
if (document.getElementById('blink').style.color=="#aa1133")
	{
	document.getElementById('blink').style.color="#000090"
	}
else
	{
	document.getElementById('blink').style.color="#aa1133"
	}
	
	//timer=setTimeout("blinking_header();",100)

document.DynaMenu.action="WebLogin.jsp";
document.DynaMenu.target="framecontent";
document.DynaMenu.method="post";
document.DynaMenu.submit();

}

function stoptimer()
{
	//clearTimeout(timer);
}

</script>

</HEAD>

                
<BODY onload="blinking_header()" onunload="stoptimer()" >
<FORM name="DynaMenu" >

<table border="0" cellpadding=0 cellspacing=0 width="100%" height="10%" >
	 <tr>
	 <td width="90%" class="marquee" id="blink">&nbsp;
<!-- 	 <CENTER>Welcome To Distribution System</CENTER> -->
	 </td>
	 <td align="right" width="5%"></td>
     </tr>
</table>

</FORM>
</BODY>
</HTML>
