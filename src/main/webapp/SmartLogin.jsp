<HTML>
<head>

<STYLE type="text/css">
.fieldBorder
{
	border-color:"#af0099";
}
.heading {
	FONT-WEIGHT: bold; FONT-SIZE: 12px; COLOR: #003377; FONT-FAMILY: Arial, Helvetica, sans-serif; TEXT-DECORATION: none}
.textgrey {
	FONT-WEIGHT: normal; FONT-SIZE: 12px; COLOR: #666655; FONT-FAMILY: Arial, Helvetica, sans-serif; TEXT-DECORATION: none}
.a4 {
	FONT-WEIGHT: normal; FONT-SIZE: 12px; COLOR: #ff0000; FONT-FAMILY: Arial, Helvetica, sans-serif; TEXT-DECORATION: none}
#header {background: url(images/header.jpg) no-repeat;  position:absolute; left:20%; width: 60%; height:100%; color: #3B2A0A; }
#header h3 { background: inherit; font: bold 1em "Tahoma", Arial; color: #000; }
#header .title { padding: 60px 0 0 60px; }
#main { background: url(images/bg.jpg) no-repeat top; position:relative;  height: 353px; margin: 0; padding: 0 }	
#main .center { width: 550px; float: right; padding: 0 60px 0 0px; }
#main h2 { background-color: inherit; color: #85621E; line-height: 0.2em; }
#main h3 { font: 85% Arial, Sans-Serif; margin: 0 0 10px 0; padding: 0; color: #5f5f5f; background: inherit; }
#prefooter {position:relative; color: #85621f; height: 190px; text-align: left;  clear: both; padding: 0px; margin: 0; }
#prefooter .particles { float: right; width: 300px; padding: 20px 30px 0 0; background: transparent }
#prefooter .comments { width: 270px; padding: 20px 0px 0 0px; float: right; background: transparent }


/* FOOTER */
.footer { color: blue; height: 44px; text-align: center; font-size: 90%; clear: both; padding: 625px 0 0 60px; margin:  0;}
#footer .padding { padding: 20px 60px 0 0; }
#footer hr { width: 740px; color: #888; border: 1px solid #f0f0f0; margin: 0 25px 0 25px;  }
#footer a { 	color: #999;  text-decoration:none; }
#footer a:hover { text-decoration: underline; color: #FFF;}

</STYLE>

<title>Distribution System Login</title>

<script>
function checkCR(evt) 
{
	var kCode ;
	var ty;

	if(navigator.appName == "Netscape")
	{
		evt  = (evt) ? evt : ((Event) ? Event : null);
		kCode = evt.which;
		ty=evt.target.type;
	}
	else
	{
		evt  = (evt) ? evt : ((event) ? event : null);
		kCode = evt.keyCode;
		var node = (evt.target) ? evt.target : ((evt.srcElement) ? evt.srcElement : null);
		ty = evt.srcElement.type;
	}

	if(kCode == 13 && ty != "")
	{
		//submitForm('Submit');
	}
}	
document.onkeypress = checkCR;

var cField;
function button1submit(theelement,form)
{
	if(document.LoginForm.UserName.value.length<=0)
	{
		alert('Please enter User Id');
		document.LoginForm.UserName.value='';
		document.LoginForm.Password.value='';
		document.LoginForm.UserName.focus();
		return false;
	}

	if(document.LoginForm.Password.value == "")
	{
		alert("Please Enter Password");
		document.LoginForm.Password.focus();
		return false;
	}

	if((document.LoginForm.UserName.value !="" )||
	   (document.LoginForm.UserName.value !="" && document.LoginForm.Password.value !="" )||
	   (document.LoginForm.UserName.value ==""
		&& document.LoginForm.Password.value !=""))
	{ 		
		/**** Validate User Name/Password *********/
		if(1==1)
		{
			document.LoginForm.action="PostLoginPage.jsp";
			document.LoginForm.method="post";
			document.LoginForm.submit();
		}
		else
		{
			alert("Invalid User Name/Password");
			document.LoginForm.UserName.value="";
			document.LoginForm.Password.value="";
			document.LoginForm.UserName.focus();
		}
	}

	return true;
}

function OnPageLoad()
{
}

</script>

</head>
<BODY leftmargin="0" marginwidth="0" marginheight="0" style="overflow:hidden" onLoad="javascript:document.LoginForm.UserName.focus();OnPageLoad();" >
  <div id="header">
    <div class="title">
	<IMG src="images/Media.jpg" width="100" height="132" align=absMiddle>
      <h3>Welcome To Distribution System</h3>
    </div>
<FORM name="LoginForm" method="post" >

<TABLE width="100%" cellpadding="0" cellspacing="0" align="center" border="0">

<tr><td width="100%" colspan='3' >&nbsp;</td></tr>
<tr><td width="100%" colspan='3' >&nbsp;</td></tr>

<!--<tr>
<td width="15%">&nbsp;</td>
<td width="70%" valign="top" bgcolor="white">
<img src="images/topcurve.gif" height="40" width="100%"></td>
<td width="15%">&nbsp;</td>
</tr>-->

<tr>
<td width="15%">&nbsp;</td>
<td width="70%">

<!-- <br>
<br>
<br>
<br>
 <TABLE width="80%" border="0">
  <TR>
	<td valign="center" width="80%" align="right">
    <font size="4" face="arial" color="red"><b> &nbsp;&nbsp;&nbsp;&nbsp;</b></font></td>
  </TR>
  <tr><td width="100%" colspan='2' ></TD></TR>
</TABLE>
-->
<TABLE width="80%" border="0">
<tr align="center">
    <td colspan="2" class="textgrey">
      <table width="100%" border="0" cellspacing="0" cellpadding="0">
     	<tr> 
          <td align="left" valign="top"> 
            <div align="center" class="heading"><font size="3" color="red" >
			</font></div></td>
        </tr>
		
		<tr height="10"> 
          <td align="left" valign="top"> 
           </td>
        </tr>
        
		<tr height="6"> 
          <td align="left" valign="top"> 
          </td>
        </tr>
        
		<tr height="6"> 
          <td align="left" valign="top"> 
          </td>
        </tr>

        <tr> 
          <td align="left" valign="top"> 
              <table width="100%" border="0" cellspacing="0" cellpadding="3">
                <tr align="center" valign="middle"> 
                  <td width="41%" valign="top">
				  <fieldset class="fieldBorder">
				  <legend color="#111111">Login Details</legend>
				  <table width="80%" cellpadding="1" cellspacing="0">
                      <tr valign="top"> 
                        <td width="20%" valign="center" class="textgrey" >
						<b>User ID</b>
						</td>
                        <td width="50%" class="textgrey"> 
						<input name="UserName" type="text" size=25 maxLength=50 value="">
                        </td>
                      </tr>
                      <tr valign="top"> 
                        <td valign="middle" class="textgrey">
						<b>Password</b>
						</td>
                        <td class="textgrey"> 
						<input name=Password type="Password" size=25 maxLength=50 value=""> 
                        </td>
                      </tr>
                 
<!--					  <tr valign="bottom"> 
						 <td height="40" colspan="2" class="textgrey"> 
						 <div align="center">
						 <a href ="#" onClick="return button1submit(this.form);" >
						 <img src = "images/go.gif" width="44" height="21" border="0">
						 </a>
						 </div>
						 </td>-->
						 <td colspan="2" align="center">
							<input type="submit" name="loginSubmit" value="" style="background: url('images/go.gif');border:0;display:block;height:21px;width:44px" onClick="return button1submit(this.form);"/>
						 </td>
                      </tr>
                 </table>
				 </fieldset>
				</td>
			</tr>
		</table>
</table>

</table>

</table>

</table>

</form>
 </div>
  <div id="FOOTER">
    <div class="footer" bottommargin="100" valign="bottom">
      <h5>Copyrights @ Kryptos Software Pvt Ltd. All rights Reserved. For support Contact - 9892008805</h5>
    </div>
</BODY>
</html>
