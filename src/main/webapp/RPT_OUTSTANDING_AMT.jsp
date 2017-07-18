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
	Logger logger = Logger.getLogger("RPT_OUTSTANDING_AMT");

	HashMap RPT_OUTSTANDING_AMTObj = (HashMap)request.getAttribute("RESPONSE");

	
	if(RPT_OUTSTANDING_AMTObj == null)
  		RPT_OUTSTANDING_AMTObj = new HashMap();

	String formName = "RPT_OUTSTANDING_AMT";

%>

<TITLE id="RPT_OUTSTANDING_AMT_title"><%= field_labels.getString("RPT_OUTSTANDING_AMT.RPT_OUTSTANDING_AMT_title") %></TITLE>
<LINK rel='stylesheet' href='scripts/style.css' type='text/css'>
<SCRIPT Language='Javascript' type='text/javascript' src='scripts/CommonFunctions.js'></SCRIPT>
<SCRIPT Language='Javascript' type='text/javascript' src='scripts/DatePicker.js'> </SCRIPT>
<SCRIPT Language = "JavaScript" type="text/javascript">
<!--
var sys_date = "<%= Common_distAppServlet.getSystemDate()%>";
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
	document.getElementById("ASOF_DATE").value = sys_date;
	document.getElementById("OUTSTANDING_TYPE_Y").checked=true;
}
function setReportType(as_field_name)
{
	if(as_field_name.value=='CASH')
	{
		document.getElementById("RPT_ID").value = "RP_OA_001";
	}
	else
	{
		document.getElementById("RPT_ID").value = "RP_OA_002";
	}
}

function FieldValidation(as_field_name)
{
	if(as_field_name.name=="ASOF_DATE")
			checkdate(as_field_name);
//		alert(document.getElementById("OUTSTANDING_TYPE").name.accessKey);
	if(as_field_name.name=="OUTSTANDING_TYPE")
		setReportType(as_field_name)
	return true;
}

function validateForm(as_event_label)
{
	return true;
}

function preSubmit()
{
	createParamStr('ASOF_DATE,CMP_CODE,CNT_CODE,ROUTE_CODE,AGN_CODE,CMP_CODEDESC,CNT_NAME,CATEGORY_CODE,DLV_CODE,BUILD_NO,WING_NO');
	//alert(document.getElementById("PARAM").value);
	validateSubmit();
}

function changeValue(ele)
{
	document.getElementById('OUTSTANDING_TYPE').value = this.value;
}
</SCRIPT>


<SCRIPT type="text/javascript" language = "JavaScript">
</script>

</HEAD>
<BODY class="mainbody" onLoad="execute_onLoad()" >

<DIV id="RPT_OUTSTANDING_AMT_div" >

<FORM name="RPT_OUTSTANDING_AMT" id="RPT_OUTSTANDING_AMT" method="post" action="reortGenToolActionServlet.do">
<INPUT type="hidden" id="Event" name="Event" value="">
<INPUT type="hidden" id="MAKER" name="MAKER" value="<%= (String)RPT_OUTSTANDING_AMTObj.get("MAKER") %>">
<INPUT type="hidden" id="MAKER_DT" name="MAKER_DT" value="">
<INPUT type="hidden" id="STATUS" name="STATUS" value="<%= (String)RPT_OUTSTANDING_AMTObj.get("STATUS") %>">
<INPUT type="hidden" id="MODE" name="MODE" value="INP">
<INPUT type="hidden" id="ENTITY" name="ENTITY" value="RPT_OUTSTANDING_AMT">
<INPUT type="hidden" id="PARAM" name="PARAM" value="<%= (String)RPT_OUTSTANDING_AMTObj.get("PARAM") %>">
<INPUT type="hidden" id="PARAM1" name="PARAM1" value="<%= (String)RPT_OUTSTANDING_AMTObj.get("PARAM1") %>">
<INPUT type="hidden" id="PARAM2" name="PARAM2" value="<%= (String)RPT_OUTSTANDING_AMTObj.get("PARAM2") %>">
<INPUT type="hidden" id="PRIMARY_KEY" name="PRIMARY_KEY" value="">
<INPUT type="hidden" id="SCREEN_NAME" name="SCREEN_NAME" value="RPT_LINK">
<INPUT type="hidden" id="ERRDESC" name="ERRDESC" value="<%= (String)RPT_OUTSTANDING_AMTObj.get("ERRDESC") %>">
<INPUT type="hidden" id="PROCESS_NAME" name="PROCESS_NAME" value="RPT_OUTSTANDING_AMT">
<INPUT type="hidden" id="RPT_ID" name="RPT_ID" value="RP_OA_001">
<INPUT type="hidden" id="OUTSTANDING_TYPE" name="OUTSTANDING_TYPE" value="CASH">


    <TABLE class="headertable" cellspacing="0" cellpadding="0" width='100%'>
         <TD>&nbsp;</TD>
        <TR> 
           <TD class="heading" nowrap align="center">
            <%= field_labels.getString("RPT_OUTSTANDING_AMT.RPT_OUTSTANDING_AMT") %>
           </TD>
           <TD>&nbsp;</TD>
        </TR>
   </TABLE>
 
 <TABLE class="detailstable" cellspacing="0" cellpadding="0">

	<TR class="ste">
		<TD class="ste" nowrap>   
			<LABEL ID="ASOF_DATE_label" class="userlabel"><%= field_labels.getString("RPT_OUTSTANDING_AMT.DATE") %><SPAN class="instreditalic">*</SPAN></LABEL>
		</TD>
		<TD class="ste" colspan="7" nowrap>
			<INPUT type="text" id="ASOF_DATE" name="ASOF_DATE" class="input" size="10" onblur="FieldValidation(this);" maxLength="10"  value="<%= (String)RPT_OUTSTANDING_AMTObj.get("ASOF_DATE") %>" ><a href="#" onClick="javascript:calendar('ASOF_DATE',event.screenY,event.screenX,null,null,getDatePickerPattern());"
			title="Select Date"><img src="images/calendar.gif" width="16"
			height="16" border="0" /></a>
		</TD>
	</TR>
		<TR class="ste">
		<TD class="ste" nowrap>   
			<LABEL ID="CMP_CODE_label" class="userlabel"><%= field_labels.getString("RPT_OUTSTANDING_AMT.CMP_CODE") %><SPAN class="instreditalic">*</SPAN></LABEL>
		</TD>
		<TD class="ste" colspan="7" nowrap>
			<INPUT type="text" id="CMP_CODE" name="CMP_CODE" class="input" size="10" onChange="FieldValidation(this);getCodeDesc('CMP_CODE','CMP_CODEDESC', 'g_pkl_companyDesc','');" maxLength="10"  value="<%= (String)RPT_OUTSTANDING_AMTObj.get("CMP_CODE") %>" >

	  <INPUT type="text" id="CMP_CODEDESC" name="CMP_CODEDESC" class="input" size="50" readonly  maxLength="50" value="<%= 
	(String)RPT_OUTSTANDING_AMTObj.get("CMP_CODEDESC") %>" >
		<A id="CMP_CODEHLP" name="CMP_CODEHLP"  href="#" onClick="getPicklistValues('g_pkl_company','CMP_CODE','','')" class="linkblue" >?</A> &nbsp;
		</TD>
	</TR>
	</TR>
		<TR class="ste">
		<TD class="ste" nowrap>   
			<LABEL ID="CNT_CODE_label" class="userlabel"><%= field_labels.getString("RPT_OUTSTANDING_AMT.CNT_CODE") %><SPAN class="instreditalic">*</SPAN></LABEL>
		</TD>
		<TD class="ste" colspan="7" nowrap>
			<INPUT type="text" id="CNT_CODE" name="CNT_CODE" class="input" size="10"  onChange="FieldValidation(this);getCodeDesc('CNT_CODE,USER_ID','CNT_NAME', 'g_pkl_centerDesc','MC.CNT_CODE,USER_ID');" maxLength="10"  value="<%= (String)RPT_OUTSTANDING_AMTObj.get("CNT_CODE") %>" >

	  <INPUT type="text" id="CNT_NAME" name="CNT_NAME" class="input" size="50" readonly  maxLength="50" value="<%= 
	(String)RPT_OUTSTANDING_AMTObj.get("CNT_NAME") %>" >
		<A id="CNT_CODEHLP" name="CNT_CODEHLP"  href="#" onClick="getPicklistValues('g_pkl_center','CNT_CODE','USER_ID','')" class="linkblue" >?</A> &nbsp;
		</TD>
	</TR>
	
	<TR class="ste">
		<TD class="ste" nowrap>
			<LABEL ID="OUTSTANDING_TYPE_label" class="userlabel"><%= field_labels.getString("RPT_OUTSTANDING_AMT.OUTSTANDING_TYPE") %><SPAN class="instreditalic">*</SPAN></LABEL>
		</TD>
		<TD class="ste" colspan="2" nowrap>
			<INPUT type="radio" id="OUTSTANDING_TYPE_Y" name="OUTSTANDING_TYPE" onClick="changeValue(this);FieldValidation(this);" value="CASH" accessKey="Y" ><%= field_labels.getString("RPT_OUTSTANDING_AMT.CASH") %>

			<INPUT type="radio" id="OUTSTANDING_TYPE_N" name="OUTSTANDING_TYPE"  onClick="changeValue(this);FieldValidation(this);" value="COUPON" accessKey="N" ><%= field_labels.getString("RPT_OUTSTANDING_AMT.COUPON") %>
		</TD>
	</TR>

	<TR class="ste">
	        <TD class="ste" nowrap>   
				<LABEL ID="AGN_CODE_label" class="userlabel"><%= field_labels.getString("RPT_OUTSTANDING_AMT.AGN_CODE") %></LABEL>
		
		</TD>
		<TD>
				<INPUT type="text" id="AGN_CODE" name="AGN_CODE" class="input" size="10" maxLength="10"  value=""
			onChange="FieldValidation(this);getCodeDesc('AGN_CODE','AGN_NAME', 'g_pkl_agencyDesc','');" >
		  <INPUT type="text" id="AGN_NAME" name="AGN_NAME" class="input" size="50"  readonly maxLength="50" value="" >
			<A id="AGN_CODEHLP" name="AGN_CODEEHLP"  href="#" onClick="getPicklistValues('g_pkl_agency','AGN_CODE','','')" class="linkblue" >?</A> &nbsp;

		</TD>
	</TR>
		<TR class="ste">
	        <TD class="ste" nowrap>   
				<LABEL ID="CATEGORY_CODE_label" class="userlabel"><%= field_labels.getString("RPT_OUTSTANDING_AMT.CATEGORY_CODE") %></LABEL>
		
		</TD>
		<TD>
				<INPUT type="text" id="CATEGORY_CODE" name="CATEGORY_CODE" class="input" size="10" maxLength="10"  value=""
			onChange="FieldValidation(this);getCodeDesc('CATEGORY_CODE','CATEGORY_NAME', 'g_pkl_categoryDesc','CTG_CODE');" >
		  <INPUT type="text" id="CATEGORY_NAME" name="CATEGORY_NAME" class="input" size="50"  readonly maxLength="50" value="" >
			<A id="CATEGORY_CODEHLP" name="CATEGORY_CODEEHLP"  href="#" onClick="getPicklistValues('g_pkl_category','CATEGORY_CODE','','')" class="linkblue" >?</A>
			</TD>
			</TR>
	<TR class="ste">
	        <TD class="ste" nowrap>   
				<LABEL ID="ROUTE_CODE_label" class="userlabel"><%= field_labels.getString("RPT_OUTSTANDING_AMT.ROUTE_CODE") %></LABEL>
		
		</TD>
		<TD>
				<INPUT type="text" id="ROUTE_CODE" name="ROUTE_CODE" class="input" size="10" maxLength="10"  value=""
			onChange="FieldValidation(this);getCodeDesc('ROUTE_CODE','ROUTE_NAME', 'g_pkl_routeDesc','');" >
		  <INPUT type="text" id="ROUTE_NAME" name="ROUTE_NAME" class="input" size="50"  readonly maxLength="50" value="" >
			<A id="ROUTE_CODEHLP" name="ROUTE_CODEEHLP"  href="#" onClick="getPicklistValues('g_pkl_route','ROUTE_CODE','','')" class="linkblue" >?</A> &nbsp;

		</TD>
</TR>
	<TR class="ste">
		<TD class="ste" nowrap>   
			<LABEL ID="DLV_CODE_label" class="userlabel"><%= field_labels.getString("MT_AGENCY.DLV_CODE") %></LABEL>
		</TD>
		<TD class="ste" colspan="2" nowrap>
			<INPUT type="text" id="DLV_CODE" name="DLV_CODE" class="input" size="10" onChange="FieldValidation(this);getCodeDesc('DLV_CODE','DLV_CODEDESC','g_pkl_deliveryDesc','');" 
					maxLength="10" value="<%=(String) RPT_OUTSTANDING_AMTObj.get("DLV_CODE")%>" >
			<INPUT type="text" id="DLV_CODEDESC" name="DLV_CODEDESC" class="input" size="50" readonly  maxLength="50" value="<%=(String) RPT_OUTSTANDING_AMTObj.get("DLV_CODEDESC")%>" />
			<A id="DLV_CODEHLP" name="DLV_CODEHLP"  href="#" onClick="getPicklistValues('g_pkl_delivery','DLV_CODE','','')" class="linkblue" >?</A> &nbsp;
		</TD>
	</TR>
	<TR class="ste">
		<TD class="ste" nowrap>   
			<LABEL ID="BUILD_NO_label" class="userlabel"><%= field_labels.getString("MT_DELIVERY.BUILD_NO") %></LABEL>
		</TD>
		<TD class="ste" colspan="2" nowrap>
			<INPUT type="text" id="BUILD_NO" name="BUILD_NO" class="input" size="10" onChange="FieldValidation(this);" maxLength="10"  value="" >
</TR>
	<TR class="ste">

		<TD class="ste" nowrap>   
			<LABEL ID="WING_NO_label" class="userlabel"><%= field_labels.getString("MT_DELIVERY.WING_NO") %></LABEL>
		</TD>
		<TD class="ste" colspan="2" nowrap>

			<INPUT type="text" id="WING_NO" name="WING_NO" class="input" size="10" onblur="FieldValidation(this);" maxLength="65"  value="" >
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