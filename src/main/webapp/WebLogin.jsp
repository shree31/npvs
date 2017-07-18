<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1">
<script>

function CloseWindow()
{
	window.top.close();
}


function PageLoad()
{
	//document.Web_Login.target="framecontent";
	document.Web_Login.submit();
}

</script>

</head>

<body bgcolor="#FFFFFF" text="#000000" leftmargin="0" topmargin="0" marginwidth="0" marginheight="0" onload="PageLoad();">
<FORM method="POST" name="Web_Login" action="securityChk_Servlet" >
  <table width="90%" border="0" cellspacing="0" cellpadding="0" align="center" bgcolor="#FFFFFF">
    <tr>
      <td>
        <table border="0" align="CENTER" cellspacing="1" cellpadding="0" width="100%">
          
		  <tr> 
            <td colspan="6" color="#2D80AC" bgcolor="#CAEDFB">
			<B><I>Logged In Application</I></B> 
			</td>
          </tr>

		  <tr><td colspan="6">&nbsp;</td></tr>

		  <tr> 
            <td colspan="6" color="#2D80AC" >
			<B><I>Logged In User  :  </I></B><%=session.getAttribute("UserId")%>
			</td>
          </tr>

		  <tr><td colspan="6">&nbsp;</td></tr>
		  <tr><td colspan="6">&nbsp;</td></tr>

		  <tr>
			<td width="271"> 
				<input type="hidden" name="UserId" class="input" readonly value="<%=session.getAttribute("UserName")%>">
	  		</td>	
            <td width="339" >
				<input type="hidden" name="ApplicationName" value="DISTAPP" >
				<input type="hidden" name="Vendor" value="rajapkar_adr" >
			</td>
            <td width="339" >
				<input type="hidden" name="pwd" value="<%=session.getAttribute("pwd")%>" >
			</td>

            <td width="339" >
				<input type="hidden" name="Language" value="en_US">
			</td>
		 </tr>

		  <tr><td colspan='6'>&nbsp;</td></tr>
		  <tr> 
            <td colspan="6" > 
              <table>
                <tr> 
                  <td align="center"> 
                    <input type="hidden" name="Login" value="Login Main"  class="st4">
                  </td>
                  <tr> 
              </table>
			  </td>
          </tr>

        </table>
      </td>
    </tr>
  </table>
  <br>

  <br>

</form>
</body>
</html>