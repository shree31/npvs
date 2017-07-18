<%@ include file="DISTAPPINPResourceProvider.jsp" %>
<HTML>
<HEAD>

<%
try
{
%>
<%@ page contentType="text/html; charset=utf-8" %>
<%
	response.setDateHeader("Expires",0);
	response.setHeader("Pragma","no-cache");
	if(request.getProtocol().equals("HTTP/1.1"))
	{
		response.setHeader("Cache-Control","no-cache");
	}
%>

<%@ page errorPage="errorpage.jsp" %>
<%@ page import="java.util.*" %>
<%@ page import="java.lang.*" %>
<%@ page import="javax.servlet.http.*" %>
<%@ page import="org.apache.log4j.Logger" %>
<%@ page import="com.distapp.beans.*" %>

<%	
	Logger logger = Logger.getLogger("TR_PAY_DETAILSRESULTS");

	HashMap TR_PAY_DETAILSRESULTSObj = (HashMap)request.getAttribute("RESPONSE");

	
	if(TR_PAY_DETAILSRESULTSObj == null)
  		TR_PAY_DETAILSRESULTSObj = new HashMap();

	String formName = "TR_PAY_DETAILSRESULTS";

%>


<LINK rel='stylesheet' href='scripts/style.css' type='text/css'>

<SCRIPT Language = "JavaScript" type="text/javascript">
<!--

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
	/*
	if(kCode == 13 && ty != "")
	{
		submitForm('Submit');
	}
	*/
}
	
document.onkeypress = checkCR;
// -->
</SCRIPT>
<SCRIPT Language='Javascript' type='text/javascript' src='scripts/CommonFunctions.js'> </SCRIPT>
<SCRIPT type="text/javascript" language = "JavaScript">
function FieldValidation(as_field_object)
{
//	alert(as_field_object.name);
	return true;
}



function execute_onLoad()
{
	<%
	if(request.getParameter("PARAMSTR")!=null)
	{
	String l_param_str = request.getParameter("PARAMSTR");
	l_param_str = l_param_str.substring(1,l_param_str.length()-1);

	//System.out.println("l_param_str"+l_param_str);
	
	String l_param_str_vals[]=l_param_str.split("@SEP@");
	//System.out.println("l_param_str_vals.length"+l_param_str_vals.length);

	for(int i=0;i<l_param_str_vals.length;i++)
	{
		String l_param_fld_vals[] = l_param_str_vals[i].split("@");

		//System.out.println(l_param_fld_vals[0]+l_param_fld_vals[1]);

		%>
			document.getElementById("<%=l_param_fld_vals[0]%>").value = "<%=l_param_fld_vals[1]%>";
	
<%
	}
	}
	%>

		document.forms[0].submit();
}


</SCRIPT>


<SCRIPT type="text/javascript" language = "JavaScript">
</script>

</HEAD>
<BODY class="mainbody" onLoad="execute_onLoad()" >

<DIV id="TR_PAY_DETAILSRESULTS_div" >

<FORM name="TR_PAY_DETAILSRESULTS" id="TR_PAY_DETAILSRESULTS" method="post" action="distAppCommonActionServlet.do">
<INPUT type="hidden" id="Event" name="Event" value="">
<INPUT type="hidden" id="MAKER" name="MAKER" value="<%= (String)TR_PAY_DETAILSRESULTSObj.get("MAKER") %>">
<INPUT type="hidden" id="MAKER_DT" name="MAKER_DT" value="">
<INPUT type="hidden" id="STATUS" name="STATUS" value="<%= (String)TR_PAY_DETAILSRESULTSObj.get("STATUS") %>">
<INPUT type="hidden" id="MODE" name="MODE" value="VIEW">
<INPUT type="hidden" id="PARAM1" name="PARAM1" value="<%= (String)TR_PAY_DETAILSRESULTSObj.get("PARAM1") %>">
<INPUT type="hidden" id="PARAM2" name="PARAM2" value="<%= (String)TR_PAY_DETAILSRESULTSObj.get("PARAM2") %>">
<INPUT type="hidden" id="ENTITY" name="ENTITY" value="TR_PAY_DETAILSVIEW">
<INPUT type="hidden" id="SCREEN_NAME" name="SCREEN_NAME" value="TR_PAY_DETAILSRESULTS">
<INPUT type="hidden" id="ERRDESC" name="ERRDESC" value="<%= (String)TR_PAY_DETAILSRESULTSObj.get("ERRDESC") %>">
<INPUT type="hidden" id="PRIMARY_KEY" name="PRIMARY_KEY" value="P.RCD_NO">
<INPUT type="hidden" id="PARAMSTR" name="PARAMSTR" value="<%=(String)TR_PAY_DETAILSRESULTSObj.get("PARAMSTR") %>">
<INPUT type="hidden" id="RCD_NO" name="RCD_NO" value="">

</FORM>
</DIV>

</BODY>
</HTML>
<%}catch(Exception e){System.out.println("Exception e : "+e);e.printStackTrace();}%>