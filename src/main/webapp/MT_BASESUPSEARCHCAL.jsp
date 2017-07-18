<%@ include file="DISTAPPMDResourceProvider.jsp" %>

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
	//GN_searchDetails obj_fetch_pick_vals = new GN_searchDetails();
	Logger logger = Logger.getLogger("MT_BASESUPSEARCHCAL");

	HashMap MT_BASESUPSEARCHCALObj = (HashMap)request.getAttribute("RESPONSE");

	
	if(MT_BASESUPSEARCHCALObj == null)
  		MT_BASESUPSEARCHCALObj = new HashMap();

	String formName = "MT_BASESUPSEARCHCAL";

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

<DIV id="MT_BASESUPSEARCHCAL_div" >

<FORM name="MT_BASESUPSEARCHCAL" id="MT_BASESUPSEARCHCAL" method="post" action="distAppCommonActionServlet.do">
<INPUT type="hidden" id="Event" name="Event" value="">
<INPUT type="hidden" id="MAKER" name="MAKER" value="<%= (String)MT_BASESUPSEARCHCALObj.get("MAKER") %>">
<INPUT type="hidden" id="MAKER_DT" name="MAKER_DT" value="">
<INPUT type="hidden" id="STATUS" name="STATUS" value="<%= (String)MT_BASESUPSEARCHCALObj.get("STATUS") %>">
<INPUT type="hidden" id="MODE" name="MODE" value="VIEW">
<INPUT type="hidden" id="PARAM1" name="PARAM1" value="<%= (String)MT_BASESUPSEARCHCALObj.get("PARAM1") %>">
<INPUT type="hidden" id="PARAM2" name="PARAM2" value="<%= (String)MT_BASESUPSEARCHCALObj.get("PARAM2") %>">
<INPUT type="hidden" id="ENTITY" name="ENTITY" value="MT_AGN_NEWS_PAPER_MAP">
<INPUT type="hidden" id="SCREEN_NAME" name="SCREEN_NAME" value="MT_BASESUPSEARCHCALMOD">
<INPUT type="hidden" id="ERRDESC" name="ERRDESC" value="<%= (String)MT_BASESUPSEARCHCALObj.get("ERRDESC") %>">
<INPUT type="hidden" id="PRIMARY_KEY" name="PRIMARY_KEY" value="N.AGN_CODE#N.PUB_CODE">
<INPUT type="hidden" id="PARAMSTR" name="PARAMSTR" value="<%=(String)MT_BASESUPSEARCHCALObj.get("PARAMSTR") %>">
<INPUT type="hidden" id="AGN_CODE" name="AGN_CODE" value="">
<INPUT type="hidden" id="PUB_CODE" name="PUB_CODE" value="">
<INPUT type="hidden" id="AGN_NAME" name="AGN_NAME" value="<%= (String)MT_BASESUPSEARCHCALObj.get("AGN_NAME") %>">
</FORM>
</DIV>

</BODY>
</HTML>
<%}catch(Exception e){System.out.println("Exception e : "+e);e.printStackTrace();}%>