<%@ include file="DISTAPPResourceProvider.jsp" %>
<HTML>
<HEAD>

<%try{%>

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
	Logger logger = Logger.getLogger("TR_PAY_DETAILS");

	HashMap TR_PAY_DETAILSObj = (HashMap)request.getAttribute("RESPONSE");

	
	if(TR_PAY_DETAILSObj == null)
  		TR_PAY_DETAILSObj = new HashMap();

	String formName = "TR_PAY_DETAILS";

%>


<TITLE id="TR_PAY_DETAILS_title"><%= field_labels.getString("TR_PAY_DETAILS.TR_PAY_DETAILS_title") %></TITLE>
<LINK rel='stylesheet' href='scripts/style.css' type='text/css'>
<SCRIPT Language='Javascript' type='text/javascript' src='scripts/CommonFunctions.js'> </SCRIPT>
<SCRIPT type='text/javascript' language = 'JavaScript' src='scripts/DatePicker.js'></SCRIPT>

<SCRIPT Language = "JavaScript" type="text/javascript">
<!--
var sys_date = "<%= Common_distAppServlet.getSystemDate() %>";
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

<SCRIPT type="text/javascript" language = "JavaScript">

function execute_onLoad()
{
//	if(document.getElementById("MODE").value == "")
		clearNull();

	document.getElementById("PARAM1").value="MODIFY";
	document.getElementById("MODE").value="VIEW";

	document.getElementById("ENTITY").value="TR_PAY_DETAILSVIEW";

	document.getElementById("RCD_DATE").value = sys_date;
	chkPymtMode(document.getElementById("PYMT_MODE"));
	if(document.getElementById("MODE").value=="VIEW")
	{
		document.getElementById("ENTITY").value="TR_PAY_DETAILS";
	}
}

function FieldValidation(as_field_name)
{
		var l_numeric_flds = "REC_AMOUNT";

	if(l_numeric_flds.indexOf(as_field_name.name)!=-1 && as_field_name.value!="")
	{
		if(IsNumeric(as_field_name)==false) return false;
	}
	if (as_field_name.name =="PYMT_MODE")
		chkPymtMode(as_field_name);
	if(as_field_name.name=="ENT_DATE")
			checkdate(as_field_name);
	if(as_field_name.name=="CHQ_DATE")
			checkdate(as_field_name);

	return true;
}

function chkPymtMode(as_field_name)
{
//	alert(as_field_name.value);
	if(as_field_name.value.toUpperCase() =="C")
	{
//		alert(1);
		document.getElementById("CHQ_NO").parentElement.parentElement.style.display="none";
		document.getElementById("CHQ_DATE").parentElement.parentElement.style.display="none";
		document.getElementById("BANK_NAME").parentElement.parentElement.style.display="none";
		setfldNonMandatory("CHQ_NO,CHQ_DATE");
	}
	else
	{
		document.getElementById("CHQ_NO").parentElement.parentElement.style.display="block";
		document.getElementById("CHQ_DATE").parentElement.parentElement.style.display="block";
		document.getElementById("BANK_NAME").parentElement.parentElement.style.display="block";
		setfldMandatory("CHQ_NO,CHQ_DATE");
	}
}

function chkAgnCode(as_field_name)
{
	document.getElementById("PRIMARY_KEY").value = "AGN_CODE";
	//document.getElementById("MODE").value="VIEW";
	//alert(1);
	//getCodeDesc('AGN_CODE','CMP_CODE', 'g_pkl_agencyCmp','');
	//alert(2);
	//getCodeDesc('AGN_CODE','CNT_CODE', 'g_pkl_agencyCnt','');
	document.forms[0].submit();

	//alert(document.getElementById("RCD_NO").value);
}

function preSubmit(as_event_label)
{
	document.getElementById("ENTITY").value="TR_PAY_DETAILS";
	javascript:validateSubmit('Submit');
}

</SCRIPT>


<SCRIPT type="text/javascript" language = "JavaScript">
</script>
</HEAD>
<BODY class="mainbody" onLoad="execute_onLoad()" >

<DIV id="TR_PAY_DETAILS_div" >

<FORM name="TR_PAY_DETAILS" id="TR_PAY_DETAILS" method="post" action="distAppCommonActionServlet.do">
<INPUT type="hidden" id="Event" name="Event" value="">
<INPUT type="hidden" id="MAKER" name="MAKER" value="<%= (String)TR_PAY_DETAILSObj.get("MAKER") %>">
<INPUT type="hidden" id="MAKER_DT" name="MAKER_DT" value="">
<INPUT type="hidden" id="STATUS" name="STATUS" value="<%= (String)TR_PAY_DETAILSObj.get("STATUS") %>">
<INPUT type="hidden" id="MODE" name="MODE" value="">
<INPUT type="hidden" id="ENTITY" name="ENTITY" value="TR_PAY_DETAILSVIEW">
<INPUT type="hidden" id="SCREEN_NAME" name="SCREEN_NAME" value="TR_PAY_DETAILSVIEW">
<INPUT type="hidden" id="ERRDESC" name="ERRDESC" value="<%= (String)TR_PAY_DETAILSObj.get("ERRDESC") %>">
<INPUT type="hidden" id="PARAM" name="PARAM" value="<%= (String)TR_PAY_DETAILSObj.get("PARAM") %>">
<INPUT type="hidden" id="PRIMARY_KEY" name="PRIMARY_KEY" value="P.RCD_NO">
<INPUT type="hidden" id="PARAM1" name="PARAM1" value="<%= (String)TR_PAY_DETAILSObj.get("PARAM1") %>">
<INPUT type="hidden" id="PARAM2" name="PARAM2" value="<%= (String)TR_PAY_DETAILSObj.get("PARAM2") %>">


  <TABLE class="headertable" cellspacing="0" cellpadding="0" width='100%'>
         <TD>&nbsp;</TD>
        <TR> 
           <TD class="heading" nowrap align="center">
            <%= field_labels.getString("TR_PAY_DETAILS.TR_PAY_DETAILS") %>
           </TD>
           <TD>&nbsp;</TD>
        </TR>
   </TABLE>
 
 <TABLE class="detailstable" cellspacing="0" cellpadding="0">

	<TR class="ste">
	   <TD class="ste" nowrap>   
			<LABEL ID="RCD_NO_label" class="userlabel"><%= field_labels.getString("TR_PAY_DETAILS.RCD_NO") %></LABEL>
		</TD>
		<TD class="ste" nowrap>
		<INPUT type="text" id="RCD_NO" name="RCD_NO" onChange ="" CLASS="input" size="25" maxlength="25" value="<%= (String)TR_PAY_DETAILSObj.get("RCD_NO") %>">
	<A id="RCD_NOHLP" name="RCD_NOEHLP"  href="#" onClick="getPicklistValues('g_pkl_rcdno','RCD_NO','','')" class="linkblue" >?</A> 
		</TD>
	</TR>
	<TR class="ste">
	        <TD class="ste" nowrap>   
				<LABEL ID="AGN_CODE_label" class="userlabel"><%= field_labels.getString("TR_PAY_DETAILS.AGN_CODE") %><SPAN class="instreditalic"> *</SPAN></LABEL>
		
		</TD>
		<TD>
				<INPUT type="text" id="AGN_CODE" name="AGN_CODE" class="input" size="10" maxLength="10" 
			onChange="FieldValidation(this);getCodeDesc('AGN_CODE,USER_ID','AGN_CODEDESC', 'g_pkl_agencyDesc','');" value="<%= (String)TR_PAY_DETAILSObj.get("AGN_CODE")%>" >
		  <INPUT type="text" id="AGN_CODEDESC" name="AGN_CODEDESC" readonly class="input" size="50"   maxLength="50"  value="<%= (String)TR_PAY_DETAILSObj.get("AGN_CODEDESC") %>">
			<A id="AGN_CODEHLP" name="AGN_CODEEHLP"  href="#" onClick="getPicklistValues('g_pkl_agency','AGN_CODE','USER_ID','')" class="linkblue" >?</A> &nbsp;

		</TD>
	</TR>

	<TR class="str">
	        <TD class="str" nowrap>   
				<LABEL ID="CMP_CODE_label" class="userlabel"><%= field_labels.getString("TR_PAY_DETAILS.CMP_CODE") %></LABEL>
		
		</TD>
		<TD>
				<INPUT type="text" id="CMP_CODE" name="CMP_CODE" readonly class="input" size="10" maxLength="10"  value="<%= (String)TR_PAY_DETAILSObj.get("CMP_CODE") %>"
			onChange="FieldValidation(this);" >
		  <INPUT type="text" id="CMP_CODEDESC" name="CMP_CODEDESC" readOnly class="input" size="50" maxLength="50"  value="<%= (String)TR_PAY_DETAILSObj.get("CMP_CODEDESC") %>" >
		</TD>
	</TR>

	<TR class="str">
	        <TD class="str" nowrap>   
				<LABEL ID="CNT_CODE_label" class="userlabel"><%= field_labels.getString("TR_PAY_DETAILS.CNT_CODE") %></LABEL>
		
		</TD>
		<TD>
				<INPUT type="text" id="CNT_CODE" name="CNT_CODE" readonly class="input" size="10" maxLength="10" onChange="FieldValidation(this);getCodeDesc('CNT_CODE,USER_ID','CNT_CODEDESC', 'g_pkl_centerDesc','MC.CNT_CODE,USER_ID');"  value="<%= (String)TR_PAY_DETAILSObj.get("CNT_CODE") %>"
			onChange="FieldValidation(this);" >
		  <INPUT type="text" id="CNT_CODEDESC" name="CNT_CODEDESC" readOnly class="input" size="50"  readonly maxLength="50"  value="<%= (String)TR_PAY_DETAILSObj.get("CNT_CODEDESC") %>">
			
		</TD>
	</TR>

	<TR class="ste">
	        <TD class="ste" nowrap>   
				<LABEL ID="VOU_TYPE_label" class="userlabel"><%= field_labels.getString("TR_PAY_DETAILS.VOU_TYPE") %><SPAN class="instreditalic"> *</SPAN></LABEL>
		
		</TD>
		<TD>
				<INPUT type="text" id="VOU_TYPE" name="VOU_TYPE" class="input" size="10" maxLength="10"  value="<%= (String)TR_PAY_DETAILSObj.get("VOU_TYPE") %>"
			onChange="FieldValidation(this);getCodeDesc('VOU_TYPE','VOU_TYPEDESC', 'g_pkl_voucherDesc','KEY_CODE');" >
		  <INPUT type="text" id="VOU_TYPEDESC" name="VOU_TYPEDESC" readonly class="input" size="50"  readonly maxLength="50" value="<%= (String)TR_PAY_DETAILSObj.get("VOU_TYPEDESC") %>" >
			<A id="VOU_TYPEHLP" name="VOU_TYPEHLP"  href="#" onClick="getPicklistValues('g_pkl_voucher','VOU_TYPE','','')" class="linkblue" >?</A> &nbsp;

		</TD>
	</TR>

	<TR class="str">
	   <TD class="str" nowrap>   
			<LABEL ID="RCD_DATE_label" class="userlabel"><%= field_labels.getString("TR_PAY_DETAILS.RCD_DATE")%><SPAN class="instreditalic"> *</SPAN></LABEL>
		</TD>
		<TD class="str" nowrap>
		<INPUT type="text" id="RCD_DATE" name="RCD_DATE" CLASS="input" size="10" readonly maxlength="10" value="<%= (String)TR_PAY_DETAILSObj.get("RCD_DATE") %>">
		</TD>
	</TR>
	<TR class="ste">
	   <TD class="ste" nowrap>   
			<LABEL ID="ENT_DATE_label" class="userlabel"><%= field_labels.getString("TR_PAY_DETAILS.ENT_DATE")%><SPAN class="instreditalic"> *</SPAN></LABEL>
		</TD>
		<TD class="ste" nowrap>
		<INPUT type="text" id="ENT_DATE" name="ENT_DATE" CLASS="input" size="10" maxlength="10" value="<%= (String)TR_PAY_DETAILSObj.get("ENT_DATE") %>"> <a id="ENT_DATEHLP" href="#" onClick="javascript:calendar('ENT_DATE',event.screenY,event.screenX,null,null,getDatePickerPattern());"
			title="Select Date"> <img src="images/calendar.gif" width="16"
			height="16" border="0" /></a>
		</TD>
	</TR>

	<TR class="ste">
	   <TD class="ste" nowrap>   
			<LABEL ID="ENT_NO_label" class="userlabel"><%= field_labels.getString("TR_PAY_DETAILS.ENT_NO") %></LABEL>
		</TD>
		<TD class="ste" nowrap>
		<INPUT type="text" id="ENT_NO" name="ENT_NO" CLASS="input" size="25" maxlength="25" value="<%= (String)TR_PAY_DETAILSObj.get("ENT_NO") %>">
		</TD>
	</TR>

	<TR class="ste">
	        <TD class="ste" nowrap>   
				<LABEL ID="PYMT_TYPE_label" class="userlabel"><%= field_labels.getString("TR_PAY_DETAILS.PYMT_TYPE") %><SPAN class="instreditalic"> *</SPAN></LABEL>
		
		</TD>
		<TD>
				<INPUT type="text" id="PYMT_TYPE" name="PYMT_TYPE" class="input" size="10" maxLength="10"  value="<%= (String)TR_PAY_DETAILSObj.get("PYMT_TYPE") %>"
			onChange="FieldValidation(this);getCodeDesc('PYMT_TYPE','PYMT_TYPEDESC', 'g_pkl_pymtTypeDesc','KEY_CODE');" >
		  <INPUT type="text" id="PYMT_TYPEDESC" name="PYMT_TYPEDESC" readonly class="input" size="50"  readonly maxLength="50" value="<%= (String)TR_PAY_DETAILSObj.get("PYMT_TYPEDESC") %>" >
			<A id="PYMT_TYPEHLP" name="PYMT_TYPEEHLP"  href="#" onClick="getPicklistValues('g_pkl_pymtType','PYMT_TYPE','','')" class="linkblue" >?</A> &nbsp;

		</TD>
	</TR>


	<TR class="ste">
	        <TD class="ste" nowrap>   
				<LABEL ID="PYMT_MODE_label" class="userlabel"><%= field_labels.getString("TR_PAY_DETAILS.PYMT_MODE") %><SPAN class="instreditalic"> *</SPAN></LABEL>
		
		</TD>
		<TD>
				<INPUT type="text" id="PYMT_MODE" name="PYMT_MODE" class="input" size="10" maxLength="10"  value="<%= (String)TR_PAY_DETAILSObj.get("PYMT_MODE") %>"
			onChange="FieldValidation(this);getCodeDesc('PYMT_MODE','PYMT_MODEDESC', 'g_pkl_paymentDesc','KEY_CODE');">
		  <INPUT type="text" id="PYMT_MODEDESC" name="PYMT_MODEDESC" readonly class="input" size="50"  readonly maxLength="50" value="<%= (String)TR_PAY_DETAILSObj.get("PYMT_MODEDESC") %>" >
			<A id="PYMT_MODEHLP" name="PYMT_MODEEHLP"  href="#" onClick="getPicklistValues('g_pkl_payment','PYMT_MODE','','')" class="linkblue" >?</A> &nbsp;
		</TD>
	</TR>

	<TR class="ste" colspan="1">
		<TD class="ste" nowrap>   
			<LABEL ID="REC_AMOUNT_label" class="userlabel"><%= field_labels.getString("TR_PAY_DETAILS.REC_AMOUNT") %><SPAN class="instreditalic">*</SPAN></LABEL>
		</TD>
		<TD class="ste" colspan="1" nowrap>
			<INPUT type="text" id="REC_AMOUNT" name="REC_AMOUNT" class="input" size="65" onblur="FieldValidation(this);" maxLength="65"  value="<%= (String)TR_PAY_DETAILSObj.get("REC_AMOUNT") %>" >
		</TD>
	</TR>
	<TR class="ste" colspan="1">
		<TD class="ste" nowrap>   
			<LABEL ID="CHQ_NO_label" class="userlabel"><%= field_labels.getString("TR_PAY_DETAILS.CHQ_NO") %></LABEL>
		</TD>
		<TD class="ste" colspan="1" nowrap>
			<INPUT type="text" id="CHQ_NO" name="CHQ_NO" class="input" size="65" onblur="FieldValidation(this);" maxLength="65"  value="<%= (String)TR_PAY_DETAILSObj.get("CHQ_NO") %>" >
		</TD>
	</TR>

	<TR class="ste" colspan="1">
		<TD class="ste" nowrap>   
			<LABEL ID="CHQ_DATE_label" class="userlabel"><%= field_labels.getString("TR_PAY_DETAILS.CHQ_DATE") %></LABEL>
		</TD>
		<TD class="ste" colspan="1" nowrap>
			<INPUT type="text" id="CHQ_DATE" name="CHQ_DATE" class="input" size="10" onblur="FieldValidation(this);" maxLength="10"  value="<%= (String)TR_PAY_DETAILSObj.get("CHQ_DATE") %>" >
		<a href="#" id="CHQ_DATEHLP" onClick="javascript:calendar('CHQ_DATE',event.screenY,event.screenX,null,null,getDatePickerPattern());"
			title="Select Date"> <img src="images/calendar.gif" width="16"
			height="16" border="0" /></a>
		</TD>
	</TR>

	<TR class="ste" colspan="1">
		<TD class="ste" nowrap>   
			<LABEL ID="BANK_NAME_label" class="userlabel"><%= field_labels.getString("TR_PAY_DETAILS.BANK_NAME") %></LABEL>
		</TD>
		<TD class="ste" colspan="1" nowrap>
			<INPUT type="text" id="BANK_NAME" name="BANK_NAME" class="input" size="75" onblur="FieldValidation(this);" maxLength="75"  value="<%= (String)TR_PAY_DETAILSObj.get("BANK_NAME") %>" >
		</TD>
	</TR>

	<TR class="ste" colspan="1">
		<TD class="ste" nowrap>   
			<LABEL ID="NARRATION_label" class="userlabel"><%= field_labels.getString("TR_PAY_DETAILS.NARRATION") %></LABEL>
		</TD>
		<TD class="ste" colspan="1" nowrap>
			<INPUT type="text" id="NARRATION" name="NARRATION" class="input" size="200" onblur="FieldValidation(this);" maxLength="200"  value="<%= (String)TR_PAY_DETAILSObj.get("NARRATION") %>" >
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

<INPUT TYPE="button" value="Submit" name="Submit_label" class="button" onClick="preSubmit()">
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
<%}catch(Exception e){e.printStackTrace();}%>
</HTML>
