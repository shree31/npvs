<%@ include file="DISTAPPINPResourceProvider.jsp" %>
<HTML>
<HEAD>

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
<%@ page import="javax.servlet.http.*" %>
<%@ page import="org.apache.log4j.Logger" %>

<%	
	Logger logger = Logger.getLogger("Report_Link_Display");

	HashMap Report_Link_DisplayObj = (HashMap)request.getAttribute("RESPONSE");

	
	if(Report_Link_DisplayObj == null)
  		Report_Link_DisplayObj = new HashMap();
	
	StringBuffer l_req_url = request.getRequestURL();
	String l_req_url_path = l_req_url.toString();
	l_req_url_path = l_req_url_path.substring(0,l_req_url_path.lastIndexOf("/"));

//	System.out.println("l_req_url : "+l_req_url_path);
	String formName = "Report_Link_Display";

%>
<TITLE id="Report_Link_Display_title">Report Link Display</TITLE>

<LINK rel='stylesheet' href='scripts/style.css' type='text/css'>
<SCRIPT Language='Javascript' type='text/javascript' src='scripts/CommonFunctions.js'></SCRIPT>
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
		SubmitForm('Submit');
	}
	*/
}
	
document.onkeypress = checkCR;
// -->
</SCRIPT>

<SCRIPT type="text/javascript" language = "JavaScript">

function execute_onLoad()
{
	//alert("proc id "+document.getElementById("PROCESS_ID").value);
	getPROCESS_STATUS();
	//clearNull();
}

function FieldValidation(as_field_name)
{
	return true;
}

function validateForm(as_event_label)
{
	return true;
}

function getPROCESS_STATUS()
{
}

function viewReport()
{
	//alert("Inside view Report");

	//var l_file_name=document.getElementById("FILE_PATH").value+document.getElementById("FILE_NAME").value;

	var l_file_name=document.getElementById("FILE_NAME").value;

	//alert(l_file_name);

	window.open("<%=l_req_url_path%>"+"/distAppCommonActionServlet.do?MODE=DOWNLOAD&RPT_NAME="+l_file_name,"","");
}

</SCRIPT>


<SCRIPT type="text/javascript" language = "JavaScript">
</script>

</HEAD>
<BODY class="mainbody" onLoad="execute_onLoad();" >

<DIV id="Report_Link_Display_div" >

<FORM name="Report_Link_Display" id="Report_Link_Display" method="post" action="distAppCommonActionServlet.do">
<INPUT type="hidden" id="Event" name="Event" value="">
<INPUT type="hidden" id="MAKER" name="MAKER" value="<%= (String)Report_Link_DisplayObj.get("MAKER") %>">
<INPUT type="hidden" id="PROCESS_ID" name="PROCESS_ID" value="<%= Report_Link_DisplayObj.get("PROC_ID")==null?Report_Link_DisplayObj.get("PROCESS_ID").toString():Report_Link_DisplayObj.get("PROC_ID").toString() %>">
<INPUT type="hidden" id="PROCESS_STATUS" name="PROCESS_STATUS" value="<%= (String)Report_Link_DisplayObj.get("PROCESS_STATUS") %>">
<INPUT type="hidden" id="FILE_PATH" name="FILE_PATH" value="<%= (String)Report_Link_DisplayObj.get("FILE_PATH") %>">
<INPUT type="hidden" id="FILE_NAME" name="FILE_NAME" value="<%= (String)Report_Link_DisplayObj.get("FILE_NAME") %>">
<INPUT type="hidden" id="SCREEN_NAME" name="SCREEN_NAME" value="REPORT_LINK_DISPLAY">
<INPUT type="hidden" id="ENTITY" name="ENTITY" value="RPT_GEN">
<INPUT type="hidden" id="MODE" name="MODE" value="VIEW">
<INPUT type="hidden" id="PROCESS_DATE" name="PROCESS_DATE" value="<%= Common_distAppServlet.getSystemDate()%>">
<INPUT type="hidden" id="PROCESS_USER" name="PROCESS_USER" value="<%= session.getAttribute("UserId") %>">
<INPUT type="hidden" id="PRIMARY_KEY" name="PRIMARY_KEY" value="PROCESS_ID#PROCESS_DATE,DATE#PROCESS_USER">

  <TABLE class="headertable" cellspacing="0" cellpadding="0" width='100%'>
         <TD>&nbsp;</TD>
        <TR> 
           <LABEL id='Report_Link_Display_label' name='Report_Link_Display_label' class="heading" nowrap align="center">
		   <%
		   if(Report_Link_DisplayObj.get("PROCESS_STATUS")==null)
		   {
		   %>
			Report Generation Started Successfully. Please wait. Click on refresh button to view the current PROCESS_STATUS.
			<%}else if(Report_Link_DisplayObj.get("PROCESS_STATUS").toString().equals("completed")){%>
			Report Generation Completed.
			<%}else{%>
			<%=Report_Link_DisplayObj.get("PROCESS_STATUS").toString()%>
			<%}%>

           </LABEL>
           <TD>&nbsp;</TD>
        </TR>
   </TABLE>

 <TABLE class="detailstable" cellspacing="0" cellpadding="0">


<%
if(Report_Link_DisplayObj.get("PROCESS_STATUS")!=null)
if(Report_Link_DisplayObj.get("PROCESS_STATUS").toString().equalsIgnoreCase("completed"))
{
%>
	
	<TR class="st4">
		<TD class="st4" nowrap>   
			<LABEL ID="Serail_no_label" class="userlabel"></LABEL>
		</TD>
		<TD class="st4" nowrap>   
			<LABEL ID="Report_Link_label" class="userlabel"></LABEL>
		</TD>

	</TR>

	<TR class="ste">
		<TD class="ste" nowrap>   
			<LABEL ID="Serail_no_value_label" class="userlabel"></LABEL>
		</TD>
		<TD class="ste" nowrap>   
			<LABEL ID="Report_Link_value_label" class="userlabel"><a href='#' onClick='viewReport()'>Click Here to view the report</a></LABEL>
		</TD>

	</TR>
<%}%>

	</TABLE>
     </TD>
    </TR>
   </TABLE>
  </TD>
 </TR>

 <TR class="formrow2" align="left"> 
  <TD class="buffercol">&nbsp; </TD>
   <TD class= "formcol"> 
    <TABLE class="eventstable" cellspacing="0" cellpadding="0">
     <TR class="eventsrow1"> 
     </TR>
     <TR class="eventsrow2"> 
      <TD class="eventscol" align="right">

		<INPUT TYPE="button" value="Refresh" name="Refresh_label" class="button" onClick="javascript:submit()">
      </TD>
     </TR>
    </TABLE>
   </TD>
  </TR>
</TABLE>
</FORM>
</DIV>

</BODY>
</HTML>
