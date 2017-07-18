<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ include file="DISTAPPINPResourceProvider.jsp" %>
<%
try
{
%>
<HTML>
<HEAD>

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
	Logger logger = Logger.getLogger("RPT_COUPON");

	HashMap RPT_COUPONObj = (HashMap)request.getAttribute("RESPONSE");

	
	if(RPT_COUPONObj == null)
  		RPT_COUPONObj = new HashMap();

	String formName = "RPT_COUPON";

%>

<TITLE id="RPT_COUPON_title"><%= field_labels.getString("RPT_COUPON.RPT_COUPON_title") %></TITLE>

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

function execute_onLoad()
{
	clearNull();
}

function FieldValidation(as_field_name)
{
	if((as_field_name.name=="FROM_DT") || (as_field_name.name=="TILL_DT"))
	{
		checkdate(as_field_name);
		if(intcompareDate(document.getElementById("TILL_DT").value,document.getElementById("FROM_DT").value)<0)
		{
					alert(document.getElementById("TILL_DT_label").innerText +" should be greater than "+document.getElementById("FROM_DT_label").innerText);
					return false;
		}
	}

	return true;
}

function validateForm(as_event_label)
{
	return true;
}

function preSubmit()
{
	createParamStr('CMP_CODE,ROUTE_CODE,PUB_CODE,TILL_DT,FROM_DT');
	validateSubmit();
}

</SCRIPT>


<SCRIPT type="text/javascript" language = "JavaScript">
</script>

</HEAD>
<BODY class="mainbody" onLoad="execute_onLoad()" >

<DIV id="RPT_COUPON_div" >

<FORM name="RPT_COUPON" id="RPT_COUPON" method="post" action="reortGenToolActionServlet.do">
<INPUT type="hidden" id="Event" name="Event" value="">
<INPUT type="hidden" id="MAKER" name="MAKER" value="<%= (String)RPT_COUPONObj.get("MAKER") %>">
<INPUT type="hidden" id="MAKER_DT" name="MAKER_DT" value="">
<INPUT type="hidden" id="STATUS" name="STATUS" value="<%= (String)RPT_COUPONObj.get("STATUS") %>">
<INPUT type="hidden" id="MODE" name="MODE" value="INP">
<INPUT type="hidden" id="ENTITY" name="ENTITY" value="RPT_COUPON">
<INPUT type="hidden" id="PARAM" name="PARAM" value="<%= (String)RPT_COUPONObj.get("PARAM") %>">
<INPUT type="hidden" id="PARAM1" name="PARAM1" value="<%= (String)RPT_COUPONObj.get("PARAM1") %>">
<INPUT type="hidden" id="PARAM2" name="PARAM2" value="<%= (String)RPT_COUPONObj.get("PARAM2") %>">
<INPUT type="hidden" id="PRIMARY_KEY" name="PRIMARY_KEY" value="">
<INPUT type="hidden" id="SCREEN_NAME" name="SCREEN_NAME" value="RPT_LINK">
<INPUT type="hidden" id="ERRDESC" name="ERRDESC" value="<%= (String)RPT_COUPONObj.get("ERRDESC") %>">
<INPUT type="hidden" id="PROCESS_NAME" name="PROCESS_NAME" value="RPT_COUPON">
<INPUT type="hidden" id="RPT_ID" name="RPT_ID" value="RP_CE_001">
<INPUT type="hidden" id="SUP_DAY" name="SUP_DAY" value="">


   <TABLE class="headertable" cellspacing="0" cellpadding="0" width='100%'>
         <TD>&nbsp;</TD>
        <TR> 
           <TD class="heading" nowrap align="center">
		   <%= field_labels.getString("RPT_COUPON.CPN_EX") %>
           </TD>
           <TD>&nbsp;</TD>
        </TR>
   </TABLE>
 
 <TABLE class="detailstable" cellspacing="0" cellpadding="0">
	<TR class="ste">
		<TD class="ste" nowrap>   
			<LABEL ID="CMP_CODE_label" class="userlabel"><%= field_labels.getString("RPT_COUPON.CMP_CODE") %><SPAN class="instreditalic">*</SPAN></LABEL>
		</TD>
		<TD class="ste" colspan="7" nowrap>
			<INPUT type="text" id="CMP_CODE" name="CMP_CODE" class="input" size="10" onChange="FieldValidation(this);getCodeDesc('CMP_CODE','CMP_CODEDESC', 'g_pkl_companyDesc','');" maxLength="10"  value="<%= (String)RPT_COUPONObj.get("CMP_CODE") %>" >

	  <INPUT type="text" id="CMP_CODEDESC" name="CMP_CODEDESC" class="input" size="50" readonly  maxLength="50" value="<%= 
	(String)RPT_COUPONObj.get("CMP_CODEDESC") %>" >
		<A id="CMP_CODEHLP" name="CMP_CODEHLP"  href="#" onClick="getPicklistValues('g_pkl_company','CMP_CODE','','')" class="linkblue" >?</A> &nbsp;
		</TD>
	</TR>  
	<TR class="ste">
		<TD class="ste" nowrap>   
			<LABEL ID="FROM_DT_label" class="userlabel"><%= field_labels.getString("TR_BILL.BILL_SDATE") %></LABEL>
		</TD>
		<TD class="ste" colspan="7" nowrap>
			<INPUT type="text" id="FROM_DT" name="FROM_DT" class="input" size="10" onblur="FieldValidation(this);" maxLength="10"  value="<%= (String)RPT_COUPONObj.get("FROM_DT") %>" ><a href="#" onClick="javascript:calendar('FROM_DT',event.screenY,event.screenX,null,null,getDatePickerPattern());"
			title="Select Date"><img src="images/calendar.gif" width="16"
			height="16" border="0" /></a>
		</TD>
	</TR>
	
	<TR class="ste">
		<TD class="ste" nowrap>   
			<LABEL ID="TILL_DT_label" class="userlabel"><%= field_labels.getString("RPT_COUPON.TILL_DT") %><SPAN class="instreditalic">*</SPAN></LABEL>
		</TD>
		<TD class="ste" colspan="7" nowrap>
			<INPUT type="text" id="TILL_DT" name="TILL_DT" class="input" size="10" onblur="FieldValidation(this);" maxLength="10"  value="<%= (String)RPT_COUPONObj.get("TILL_DT") %>" ><a href="#" onClick="javascript:calendar('TILL_DT',event.screenY,event.screenX,null,null,getDatePickerPattern());"
			title="Select Date"><img src="images/calendar.gif" width="16"
			height="16" border="0" /></a>
		</TD>
	</TR>
	<TR class="ste">
		<TD class="ste" nowrap>   
			<LABEL ID="PUB_CODE_label" class="userlabel"><%= field_labels.getString("RPT_COUPON.PUB_CODE") %><!-- <SPAN class="instreditalic">*</SPAN>--></LABEL>
		</TD>
		<TD class="ste" colspan="7" nowrap>
			<INPUT type="text" id="PUB_CODE" name="PUB_CODE" class="input" size="10"  onChange="FieldValidation(this);getCodeDesc('PUB_CODE','PUB_CODEDESC', 'g_pkl_publicationDesc','');" maxLength="10"  value="<%= (String)RPT_COUPONObj.get("PUB_CODE") %>" >

	  <INPUT type="text" id="PUB_CODEDESC" name="PUB_CODEDESC" class="input" size="50" readonly  maxLength="50" value="<%= 
	(String)RPT_COUPONObj.get("PUB_CODEDESC") %>" >
		<A id="PUB_CODEHLP" name="PUB_CODEHLP"  href="#" onClick="getPicklistValues('g_pkl_publication','PUB_CODE','','')" class="linkblue" >?</A> &nbsp;
		</TD>
	</TR>
		<TR class="ste">
	        <TD class="ste" nowrap>   
				<LABEL ID="ROUTE_CODE_label" class="userlabel"><%= field_labels.getString("RPT_COUPON.ROUTE_CODE") %></LABEL>
		
		</TD>
		<TD>
				<INPUT type="text" id="ROUTE_CODE" name="ROUTE_CODE" class="input" size="20" maxLength="20"  value=""
			onChange="FieldValidation(this);getCodeDesc('ROUTE_CODE','ROUTE_NAME', 'g_pkl_routeDesc','');" >
		  <INPUT type="text" id="ROUTE_NAME" name="ROUTE_NAME" class="input" size="50"  readonly maxLength="50" value="" >
			<A id="ROUTE_CODEHLP" name="ROUTE_CODEEHLP"  href="#" onClick="getPicklistValues('g_pkl_route','ROUTE_CODE','','')" class="linkblue" >?</A> &nbsp;

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
<INPUT TYPE="button" value="Submit" name="Submit_label" class="button" onClick="javascript:preSubmit()">
		<INPUT TYPE="button" value="Clear" name="Clear_label" class="button"  onClick="Reset_form()">
		<INPUT TYPE="button" value="Print" name="Print_label" class="button"  onClick="javascript:window.print()">
		<INPUT TYPE="button" value="Back" name="Back_label" class="button"  onClick="javascript:history.go(-1)">
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