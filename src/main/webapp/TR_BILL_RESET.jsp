<%@ include file="DISTAPPINPResourceProvider.jsp" %>
<%
try
{
%>
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
<%@ page import="com.distapp.beans.Common_distAppServlet" %>

<%	
	Logger logger = Logger.getLogger("TR_BILL");

	HashMap TR_BILLObj = (HashMap)request.getAttribute("RESPONSE");

	
	if(TR_BILLObj == null)
  		TR_BILLObj = new HashMap();

	String formName = "TR_BILL";

	ArrayList system_params = (ArrayList<String>)session.getAttribute("SYS_PARAMS");

	int cond_exist = system_params.indexOf("BILL_DATE");
%>

<TITLE id="TR_BILL_title"><%= field_labels.getString("TR_BILL.TR_BILL_title") %></TITLE>
<LINK rel='stylesheet' href='scripts/style.css' type='text/css'>
<SCRIPT Language='Javascript' type='text/javascript' src='scripts/CommonFunctions.js'></SCRIPT>
<SCRIPT Language='Javascript' type='text/javascript' src='scripts/DatePicker.js'> </SCRIPT>
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
var bill_type_flg ="N";
function execute_onLoad()
{
	clearNull();
	getBillResetDetails();
}

function FieldValidation(as_field_name)
{

	return true;
}

function getBillResetDetails()
{
	getQueryResultsSync('g_pkl_billReset','','','BILL_DATE^BILL_EDATE^RESET_IND');
	if(document.getElementById("RESET_IND").value == "N" && document.getElementById("BILL_EDATE").value !="")
		document.getElementById("BILL_TYPE_label").innerText = document.getElementById("BILL_TYPE_label").innerText + document.getElementById("BILL_DATE").value;
	else
	{
		document.getElementById("submit_div").style.visibility = "collapse";
		document.getElementById("BILL_TYPE_label").innerText = "Latest Bills are not generated, Bills can not be deleted";
	}

	return true;
}
function validateSubmit(as_event_label)
{
	if(false == confirm('Do You Want to Delete Bills for the months of '+document.getElementById("BILL_DATE").value+'?'))
		return false;
	document.getElementById("BILL_SDATE").value= document.getElementById("BILL_EDATE").value;
	document.forms[0].submit();
	return true;
}

</SCRIPT>


<SCRIPT type="text/javascript" language = "JavaScript">
</script>

</HEAD>
<BODY class="mainbody" onLoad="execute_onLoad()" >

<DIV id="TR_BILL_div" >

<FORM name="TR_BILL" id="TR_BILL" method="post" action="distAppCommonActionServlet.do">
<INPUT type="hidden" id="Event" name="Event" value="">
<INPUT type="hidden" id="MAKER" name="MAKER" value="<%= (String)TR_BILLObj.get("MAKER") %>">
<INPUT type="hidden" id="MAKER_DT" name="MAKER_DT" value="">
<INPUT type="hidden" id="STATUS" name="STATUS" value="<%= (String)TR_BILLObj.get("STATUS") %>">
<INPUT type="hidden" id="MODE" name="MODE" value="BILLING">
<INPUT type="hidden" id="ENTITY" name="ENTITY" value="TR_BILL">
<INPUT type="hidden" id="PARAM" name="PARAM" value="<%= (String)TR_BILLObj.get("PARAM") %>">
<INPUT type="hidden" id="PARAM1" name="PARAM1" value="<%= (String)TR_BILLObj.get("PARAM1") %>">
<INPUT type="hidden" id="PARAM2" name="PARAM2" value="<%= (String)TR_BILLObj.get("PARAM2") %>">
<INPUT type="hidden" id="PRIMARY_KEY" name="PRIMARY_KEY" value="BILL_NO#BILL_DATE">
<INPUT type="hidden" id="SCREEN_NAME" name="SCREEN_NAME" value="TR_BILL_RESET">
<INPUT type="hidden" id="ERRDESC" name="ERRDESC" value="<%= (String)TR_BILLObj.get("ERRDESC") %>">
<INPUT type="hidden" id="PROCESS_NAME" name="PROCESS_NAME" value="BILL_GEN">
<INPUT type="hidden" id="BILL_TYPE" name="BILL_TYPE" value="R">
<INPUT type="hidden" id="BILL_FREQ" name="BILL_FREQ" value="M">
<INPUT type="hidden" id="RESET_IND" name="RESET_IND" value="<%= (String)TR_BILLObj.get("RESET_IND") %>">
<INPUT type="hidden" id="BILL_EDATE" name="BILL_EDATE" value="<%= (String)TR_BILLObj.get("BILL_EDATE") %>">
<INPUT type="hidden" id="BILL_SDATE" name="BILL_SDATE" value="<%= (String)TR_BILLObj.get("BILL_SDATE") %>">
<INPUT type="hidden" id="BILL_DATE" name="BILL_DATE" value="<%= (String)TR_BILLObj.get("BILL_DATE") %>">

  <TABLE class="headertable" cellspacing="0" cellpadding="0" width='100%'>
         <TD>&nbsp;</TD>
        <TR> 
           <TD class="heading" nowrap align="center">
            <%= field_labels.getString("TR_BILL_RESET.TR_BILL_RESET") %>
           </TD>
           <TD>&nbsp;</TD>
        </TR>
   </TABLE>
 
 <TABLE class="detailstable" cellspacing="0" cellpadding="0">


			<TR class="ste">
		<TD class="ste" nowrap>   
			<LABEL ID="CMP_CODE_label" class="userlabel"><%= field_labels.getString("TR_BILL.CMP_CODE") %><SPAN class="instreditalic">*</SPAN></LABEL>
		</TD>
		<TD class="ste" colspan="7" nowrap>
			<INPUT type="text" id="CMP_CODE" name="CMP_CODE" class="input" size="10" onChange="FieldValidation(this);getCodeDesc('CMP_CODE','CMP_CODEDESC', 'g_pkl_companyDesc','');" maxLength="10"  value="<%= (String)TR_BILLObj.get("CMP_CODE") %>" >

	  <INPUT type="text" id="CMP_CODEDESC" name="CMP_CODEDESC" class="input" size="50" readonly  maxLength="50" value="<%= 
	(String)TR_BILLObj.get("CMP_CODEDESC") %>" >
		<A id="CMP_CODEHLP" name="CMP_CODEHLP"  href="#" onClick="getPicklistValues('g_pkl_company','CMP_CODE','','')" class="linkblue" >?</A> &nbsp;
		</TD>
	</TR>
	<TR class="ste">
		<TD class="ste" nowrap>   
			<LABEL ID="BILL_TYPE_label" class="userlabel"><%= field_labels.getString("TR_BILL_REST.BILL_TYPE") %></LABEL>
		</TD>
		<TD class="ste" colspan="2" nowrap>
		</TD>
	</TR>

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
      <TD class="eventscol" align="left">
       <LABEL ID="man_label" class="instreditalic">
        <SPAN class="instreditalic"> &nbsp;&nbsp;<%= field_labels.getString("mandatory_msg") %>&nbsp;</SPAN>
       </LABEL>
      </TD>
     </TR>
     <TR class="eventsrow2"> 
      <TD class="eventscol" align="right">
	  <div id="submit_div">
		<INPUT TYPE="button" value="Submit" name="Submit_label" class="button" onClick="javascript:validateSubmit()">
		<INPUT TYPE="button" value="Clear" name="Clear_label" class="button"  onClick="Reset_form()">
		<INPUT TYPE="button" value="Print" name="Print_label" class="button"  onClick="javascript:window.print()">
		<INPUT TYPE="button" value="Back" name="Back_label" class="button"  onClick="javascript:history.go(-1)">
		</div>
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

<%}catch(Exception e){System.out.println("Exception e : "+e);e.printStackTrace();}%>




