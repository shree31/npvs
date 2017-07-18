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
<%@ page import="javax.servlet.http.*" %>
<%@ page import="org.apache.log4j.Logger" %>

<%	
	Logger logger = Logger.getLogger("MT_CENTER");

	HashMap MT_AGENCYObj = (HashMap)request.getAttribute("RESPONSE");
	

if(MT_AGENCYObj == null)
  		MT_AGENCYObj = new HashMap();

	String formName = "MT_AGENCYVIEW";
	
%>
<%@ include file="DISTAPPResourceProvider.jsp" %>

<TITLE id="MT_AGENCY_title"><%= field_labels.getString("MT_AGENCY.MT_AGENCY_title") %></TITLE>

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

var suppress_date_validation = false;
var suppress_number_validation = false;
// -->
</SCRIPT>
<SCRIPT Language='Javascript' type='text/javascript' src='scripts/CommonFunctions.js'> </SCRIPT>
<SCRIPT Language='Javascript' type='text/javascript' src='scripts/DatePicker.js'> </SCRIPT>

<SCRIPT type="text/javascript" language = "JavaScript">
<!--

function execute_onLoad()
{
	clearNull();
}

function FieldValidation(as_field_name)
{
	var l_numeric_flds = "SEC_DED_VAL";
	var l_date_flds = "SUP_ST_DT,SUS_DT,SUP_EN_DT,REOPEN_DT";

	if(l_numeric_flds.indexOf(as_field_name.name)!=-1 && as_field_name.value!="")
	{
		if(IsNumeric(as_field_name)==false) return false;
	}
	if(as_field_name.name == "SEC_DED_FLG")
	{
		chkSecDedType(as_field_name);
		return true;
	}
	
	if(l_date_flds.indexOf(as_field_name.name)!=-1)
	{
		checkdate(as_field_name);
		return true;
	}

	var l_valid_flg = "<%=((String)MT_AGENCYObj.get("AGN_LBL_FLG"))%>";
	if(l_valid_flg == "N")
		document.getElementById("AGN_LBL_FLG_N").checked=true;
	else 
		document.getElementById("AGN_LBL_FLG_Y").checked=true;

	 l_valid_flg = "<%=((String)MT_AGENCYObj.get("BILLABLE_FLG"))%>";
	if(l_valid_flg == "N")
		document.getElementById("BILLABLE_FLG_N").checked=true;
	else 
		document.getElementById("BILLABLE_FLG_Y").checked=true;

	 l_valid_flg = "<%=((String)MT_AGENCYObj.get("SEC_DED_FLG"))%>";
	if(l_valid_flg == "N")
		document.getElementById("SEC_DED_FLG_N").checked=true;
	else 
		document.getElementById("SEC_DED_FLG_Y").checked=true;

	 l_valid_flg = "<%=((String)MT_AGENCYObj.get("SEC_DED_TYPE"))%>";
	if(l_valid_flg == "N")
		document.getElementById("SEC_DED_TYPE_P").checked=true;
	else 
		document.getElementById("SEC_DED_TYPE_A").checked=true;

	return true;
}
function chkSecDedType(as_field_name)
{
	if(as_field_name.accessKey == "Y")
		{
			document.getElementById("SEC_DED_TYPE").parentElement.parentElement.style.display="block";
			setfldNonMandatory("SEC_DED_TYPE,SEC_DED_VAL");
		}
		else
		{
			document.getElementById("SEC_DED_TYPE").parentElement.parentElement.style.display="none";
			setfldMandatory("SEC_DED_TYPE,SEC_DED_VAL");
		}
}

</SCRIPT>
</HEAD>
<BODY class="mainbody" onload="execute_onLoad();" >

<DIV id="MT_AGENCY_div" >

<FORM name="MT_AGENCY" id="MT_AGENCY" method="post" action="distAppCommonActionServlet.do">
<INPUT type="hidden" id="Event" name="Event" value="">
<INPUT type="hidden" id="MAKER" name="MAKER" value="<%= (String)MT_AGENCYObj.get("MAKER") %>">
<INPUT type="hidden" id="MAKER_DT" name="MAKER_DT" value="">
<INPUT type="hidden" id="STATUS" name="STATUS" value="<%= (String)MT_AGENCYObj.get("STATUS") %>">
<INPUT type="hidden" id="MODE" name="MODE" value="">
<INPUT type="hidden" id="PARAM" name="PARAM" value="<%= (String)MT_AGENCYObj.get("PARAM") %>">
<INPUT type="hidden" id="ENTITY" name="ENTITY" value="MT_AGENCY">
<INPUT type="hidden" id="SCREEN_NAME" name="SCREEN_NAME" value="MT_AGENCYVIEW">
<INPUT type="hidden" id="ERRDESC" name="ERRDESC" value="<%=(String)MT_AGENCYObj.get("ERRDESC")%>">
<INPUT type="hidden" id="PARAM1" name="PARAM1" value="<%= (String)MT_AGENCYObj.get("PARAM1") %>">
<INPUT type="hidden" id="PARAM2" name="PARAM2" value="<%= (String)MT_AGENCYObj.get("PARAM2") %>">
<INPUT type="hidden" id="PRIMARY_KEY" name="PRIMARY_KEY" value="A.AGN_CODE">
<INPUT type="hidden" id="DONT_CHANGE" name="DONT_CHANGE" value="AGN_MAR_NAME">


  <TABLE class="headertable" cellspacing="0" cellpadding="0" width='100%'>
         <TD>&nbsp;</TD>
        <TR> 
           <TD class="heading" nowrap align="center">
            <%= field_labels.getString("MT_AGENCY.MT_AGENCY") %>
           </TD>
           <TD>&nbsp;</TD>
        </TR>
   </TABLE>

 <TABLE class="detailstable" cellspacing="0" cellpadding="0">


	<TR class="ste">
		<TD class="ste" nowrap>   
			<LABEL ID="AGN_CODE_label" class="userlabel"><%= field_labels.getString("MT_AGENCY.AGN_CODE") %><SPAN class="instreditalic">*</SPAN></LABEL>
		</TD>
		<TD class="ste" colspan="2" nowrap>
			<INPUT type="text" id="AGN_CODE" name="AGN_CODE" class="input" size="10" onChange="FieldValidation(this);getCodeDesc('AGN_CODE,USER_ID','AGN_NAME', 'g_pkl_agencyDesc','');" maxLength="10"  value="<%= (String)MT_AGENCYObj.get("AGN_CODE") %>" >
					<A id="AGN_CODEHLP" name="AGN_CODEHLP"  href="#" onClick="getPicklistValues('g_pkl_agency','AGN_CODE','USER_ID','')" class="linkblue" >?</A> &nbsp;
		</TD>
	</TR>
	<TR class="ste">
		<TD class="ste" nowrap>   
			<LABEL ID="AGN_NAME_label" class="userlabel"><%= field_labels.getString("MT_AGENCY.AGN_NAME") %><SPAN class="instreditalic">*</SPAN></LABEL>
		</TD>
		<TD class="ste" colspan="2" nowrap>
			<INPUT type="text" id="AGN_NAME" name="AGN_NAME" class="input" size="65" onblur="FieldValidation(this);" maxLength="65"  value="<%= (String)MT_AGENCYObj.get("AGN_NAME") %>" >
		</TD>
	</TR>
	<TR class="ste">
		<TD class="ste" nowrap>   
			<LABEL ID="AGN_MAR_NAME_label" class="userlabel"><%= field_labels.getString("MT_AGENCY.AGN_MAR_NAME") %></LABEL>
		</TD>
		<TD class="ste"  nowrap>
			<INPUT type="text" id="AGN_MAR_NAME" name="AGN_MAR_NAME" class="input" size="65" onblur="FieldValidation(this);" maxLength="65"  value="<%= (String)MT_AGENCYObj.get("AGN_MAR_NAME") %>" >
		</TD>
		<TD class="ste">   
			<LABEL ID="AGN_OLD_CODE_label" class="userlabel"><%= field_labels.getString("MT_AGENCY.AGN_OLD_CODE") %></LABEL>
		</TD>
		<TD class="ste" colspan="2" nowrap>
			<INPUT type="text" id="AGN_OLD_CODE" name="AGN_OLD_CODE" class="input" size="20" onblur="FieldValidation(this);" maxLength="20"  value="<%= (String)MT_AGENCYObj.get("AGN_OLD_CODE") %>" >
		</TD>
	</TR>
	<TR class="ste">
		<TD class="ste" nowrap>   
			<LABEL ID="CMP_CODE_label" class="userlabel"><%= field_labels.getString("MT_AGENCY.CMP_CODE") %><SPAN class="instreditalic">*</SPAN></LABEL>
		</TD>
		<TD class="ste" nowrap>
			<INPUT type="text"  id="CMP_CODE" name="CMP_CODE" class="input" size="10" onChange="FieldValidation(this); getCodeDesc('CMP_CODE','CMP_CODEDESC', 'g_pkl_companyDesc','');" Value= "<%=(String)MT_AGENCYObj.get("CMP_CODE")%>">
           	  <INPUT type="text" id="CMP_CODEDESC" name="CMP_CODEDESC" class="input" size="50" readonly  maxLength="50" value="<%= 
	(String)MT_AGENCYObj.get("CMP_CODEDESC") %>" >
		<A id="CMP_CODEHLP" name="CMP_CODEHLP"  href="#" onClick="getPicklistValues('g_pkl_company','CMP_CODE','','')" class="linkblue" >?</A> &nbsp;</TD>
		<TD class="ste" nowrap>   
			<LABEL ID="AGN_LBL_FLG_label" class="userlabel"><%= field_labels.getString("MT_AGENCY.AGN_LBL_FLG") %></LABEL>
			</TD>
	<TD class="ste" nowrap>

		<INPUT type="radio" id="AGN_LBL_FLG_N" name="AGN_LBL_FLG" checked onClick="FieldValidation(this);" value="Y" accessKey="Y" ><%= field_labels.getString("radio_yes") %>

		<INPUT type="radio" id="AGN_LBL_FLG_Y" name="AGN_LBL_FLG"  onClick="FieldValidation(this);" value="N" accessKey="N" ><%= field_labels.getString("radio_no") %>

</TD>

	</TR>
	<TR class="ste">
		<TD class="ste" nowrap>   
			<LABEL ID="CTG_CODE_label" class="userlabel"><%= field_labels.getString("MT_AGENCY.CTG_CODE") %><SPAN class="instreditalic">*</SPAN></LABEL>
		</TD>
		<TD class="ste" nowrap>
			<INPUT type="text"  id="CTG_CODE" name="CTG_CODE" class="input" size="10" onChange="FieldValidation(this); getCodeDesc('CTG_CODE','CTG_CODEDESC', 'g_pkl_category','')" value="<%=(String)MT_AGENCYObj.get("CTG_CODE")%>">
           	  <INPUT type="text" id="CTG_CODEDESC" name="CTG_CODEDESC" class="input" size="50" readonly  maxLength="50" value="<%= 
	(String)MT_AGENCYObj.get("CTG_CODEDESC") %>" >
		<A id="CTG_CODEHLP" name="CTG_CODEHLP"  href="#" onClick="getPicklistValues('g_pkl_category','CTG_CODE','','')" class="linkblue" >?</A> &nbsp;
			</TD>
		<TD class="ste" nowrap>   
			<LABEL ID="DIST_CODE_label" class="userlabel"><%= field_labels.getString("MT_AGENCY.DIST_CODE") %></LABEL>
		</TD>
		<TD class="ste" nowrap>
			<INPUT type="text"  id="DIST_CODE" name="DIST_CODE" class="input" size="10" onChange="FieldValidation(this); getCodeDesc('DIST_CODE','DIST_CODEDESC', 'g_pkl_agencyDesc','AGN_CODE')" value="<%= (String)MT_AGENCYObj.get("DIST_CODE")%>">
           	  <INPUT type="text" id="DIST_CODEDESC" name="DIST_CODEDESC" class="input" size="50" readonly  maxLength="50" value="<%= 
	(String)MT_AGENCYObj.get("DIST_CODEDESC") %>" >
		<A id="DIST_CODEHLP" name="DIST_CODEHLP"  href="#" onClick="getPicklistValues('g_pkl_distributor','DIST_CODE','','')" class="linkblue">?</A> &nbsp;
			</TD>
	</TR>
	<TR class="ste">
		<TD class="ste" nowrap>   
			<LABEL ID="CNT_CODE_label" class="userlabel"><%= field_labels.getString("MT_AGENCY.CNT_CODE") %><SPAN class="instreditalic">*</SPAN></LABEL>
		</TD>
		<TD class="ste" nowrap>
			<INPUT type="text"  id="CNT_CODE" name="CNT_CODE" class="input" size="10" onChange="FieldValidation(this); getCodeDesc('CNT_CODE,USER_ID','CNT_CODEDESC', 'g_pkl_centerDesc','MC.CNT_CODE,USER_ID');" value="<%=(String)MT_AGENCYObj.get("CNT_CODE")%>">
	  <INPUT type="text" id="CNT_CODEDESC" name="CNT_CODEDESC" class="input" size="50" readonly  maxLength="50" value="<%= 
	(String)MT_AGENCYObj.get("CNT_CODEDESC") %>" >
		<A id="CNT_CODEHLP" name="CNT_CODEHLP"  href="#" onClick="getPicklistValues('g_pkl_center','CNT_CODE','USER_ID','')" class="linkblue" >?</A> &nbsp;
			</TD>
		<TD class="ste" nowrap>   
			<LABEL ID="AREA_CODE_label" class="userlabel"><%= field_labels.getString("MT_AGENCY.AREA_CODE") %></LABEL>
		</TD>
		<TD class="ste" nowrap>
			<INPUT type="text"  id="AREA_CODE" name="AREA_CODE" class="input" size="10" onChange="FieldValidation(this); getCodeDesc('AREA_CODE','AREA_CODEDESC', 'g_pkl_area','')" value="<%=(String)MT_AGENCYObj.get("AREA_CODE")%>">
	  <INPUT type="text" id="AREA_CODEDESC" name="AREA_CODEDESC" class="input" size="50" readonly  maxLength="50" value="<%= 
	(String)MT_AGENCYObj.get("AREA_CODEDESC") %>" >
		<A id="AREA_CODEHLP" name="AREA_CODEHLP"  href="#" onClick="getPicklistValues('g_pkl_area','AREA_CODE','','')" class="linkblue" >?</A> &nbsp;
			</TD>
	</TR>
	<TR class="ste">
		<TD class="ste" nowrap>   
			<LABEL ID="ROUTE_CODE_label" class="userlabel"><%= field_labels.getString("MT_AGENCY.RT_CODE") %><SPAN class="instreditalic">*</SPAN></LABEL>
		</TD>
		<TD class="ste" nowrap>
			<INPUT type="text"  id="ROUTE_CODE" name="ROUTE_CODE" class="input" size="10" onChange="FieldValidation(this);getCodeDesc('ROUTE_CODE','ROUTE_CODEDESC', 'g_pkl_routeDesc','')" value="<%=(String)MT_AGENCYObj.get("ROUTE_CODE")%>">
           	  <INPUT type="text" id="ROUTE_CODEDESC" name="ROUTE_CODEDESC" class="input" size="50" readonly  maxLength="50" value="<%= 
	(String)MT_AGENCYObj.get("ROUTE_CODEDESC") %>" >
		<A id="ROUTE_CODEHLP" name="ROUTE_CODEHLP"  href="#" onClick="getPicklistValues('g_pkl_route','ROUTE_CODE','','')" class="linkblue" >?</A> &nbsp;
			</TD>
		<TD class="ste" nowrap>   
			<LABEL ID="DLV_CODE_label" class="userlabel"><%= field_labels.getString("MT_AGENCY.DLV_CODE") %><SPAN class="instreditalic">*</SPAN></LABEL>
		</TD>
		<TD class="ste" nowrap>
			<INPUT type="text"  id="DLV_CODE" name="DLV_CODE" class="input" size="10" onChange="FieldValidation(this); getCodeDesc('DLV_CODE,ROUTE_CODE','DLV_CODEDESC', 'g_pkl_deliveryDesc','')" value="<%=(String)MT_AGENCYObj.get("DLV_CODE")%>">
	  <INPUT type="text" id="DLV_CODEDESC" name="DLV_CODEDESC" class="input" size="50" readonly  maxLength="50" value="<%= 
	(String)MT_AGENCYObj.get("DLV_CODEDESC") %>" >
		<A id="DLV_CODEHLP" name="DLV_CODEHLP"  href="#" onClick="getPicklistValues('g_pkl_delivery','DLV_CODE','ROUTE_CODE','')" class="linkblue" >?</A> &nbsp;
			</TD>
	</TR>

	<TR class="ste">
		<TD class="ste" nowrap>   
			<LABEL ID="SUP_ST_DT_label" class="userlabel"><%= field_labels.getString("MT_AGENCY.SUP_ST_DT") %><SPAN class="instreditalic">*</SPAN></LABEL>
		</TD>
		<TD class="ste" nowrap>
			<INPUT type="text" id="SUP_ST_DT" name="SUP_ST_DT" class="input" size="10" onblur="FieldValidation(this);" maxLength="10"  value="<%= (String)MT_AGENCYObj.get("SUP_ST_DT") %>" >	<a id="SUP_ST_DTHLP" href="#" onClick="javascript:calendar('SUP_ST_DT',event.screenY,event.screenX,null,null,getDatePickerPattern());"
			title="Select Date"> <img src="images/calendar.gif" width="16"
			height="16" border="0" /></a>
		</TD>
		<TD class="ste" nowrap>   
			<LABEL ID="SUS_DT_label" class="userlabel"><%= field_labels.getString("MT_AGENCY.SUS_DT") %></LABEL>
		</TD>
		<TD class="ste" nowrap>
			<INPUT type="text" id="SUS_DT" name="SUS_DT" class="input" size="10" onblur="FieldValidation(this);" maxLength="10"  value="<%= (String)MT_AGENCYObj.get("SUS_DT") %>" > <a id="SUS_DTHLP" href="#" onClick="javascript:calendar('SUS_DT',event.screenY,event.screenX,null,null,getDatePickerPattern());"
			title="Select Date"> <img src="images/calendar.gif" width="16"
			height="16" border="0" /></a>
		</TD>
	</TR>
	<TR class="ste">
		<TD class="ste" nowrap>   
			<LABEL ID="SUP_EN_DT_label" class="userlabel"><%= field_labels.getString("MT_AGENCY.SUP_EN_DT") %></LABEL>
		</TD>
		<TD class="ste" nowrap>
			<INPUT type="text" id="SUP_EN_DT" name="SUP_EN_DT" class="input" size="10" onblur="FieldValidation(this);" maxLength="10"  value="<%= (String)MT_AGENCYObj.get("SUP_EN_DT") %>" > <a id="SUP_EN_DTHLP" href="#" onClick="javascript:calendar('SUP_EN_DT',event.screenY,event.screenX,null,null,getDatePickerPattern());"
			title="Select Date"> <img src="images/calendar.gif" width="16"
			height="16" border="0" /></a>
		</TD>
		<TD class="ste" nowrap>   
			<LABEL ID="REOPEN_DT_label" class="userlabel"><%= field_labels.getString("MT_AGENCY.REOPEN_DT") %></LABEL>
		</TD>
		<TD class="ste" nowrap>
			<INPUT type="text" id="REOPEN_DT" name="REOPEN_DT" class="input" size="10" onblur="FieldValidation(this);" maxLength="10"  value="<%= (String)MT_AGENCYObj.get("REOPEN_DT") %>" > <a id="REOPEN_DTHLP" href="#" onClick="javascript:calendar('REOPEN_DT',event.screenY,event.screenX,null,null,getDatePickerPattern());"
			title="Select Date"> <img src="images/calendar.gif" width="16"
			height="16" border="0" /></a>
		</TD>
	</TR>
	<TR>
		<TD class="titlehead" colspan="8" nowrap>   
			<LABEL ID="HEADER1_label"><%= field_labels.getString("MT_AGENCY.HEADER1") %></LABEL>
		</TD>
	</TR>
	<TR class="ste">
		<TD class="ste" nowrap>   
			<LABEL ID="AGN_ADD1_label" class="userlabel"><%= field_labels.getString("MT_AGENCY.AGN_ADD1") %></LABEL>
		</TD>
		<TD class="ste" nowrap>
			<INPUT type="text" id="AGN_ADD1" name="AGN_ADD1" class="input" size="60" onblur="FieldValidation(this);" maxLength="60"  value="<%= (String)MT_AGENCYObj.get("AGN_ADD1") %>" >
		</TD>
		<TD class="ste" nowrap>   
			<LABEL ID="AGN_MAR_ADD1_label" class="userlabel"><%= field_labels.getString("MT_AGENCY.AGN_MAR_ADD1") %></LABEL>
		</TD>
		<TD class="ste" nowrap>
			<INPUT type="text" id="AGN_MAR_ADD1" name="AGN_MAR_ADD1" class="input" size="60" onblur="FieldValidation(this);" maxLength="60"  value="<%= (String)MT_AGENCYObj.get("AGN_MAR_ADD1") %>" >
		</TD>
	</TR>
	<TR class="ste">
		<TD class="ste" nowrap>   
			<LABEL ID="AGN_ADD2_label" class="userlabel"><%= field_labels.getString("MT_AGENCY.AGN_ADD2") %></LABEL>
		</TD>
		<TD class="ste" nowrap>
			<INPUT type="text" id="AGN_ADD2" name="AGN_ADD2" class="input" size="60" onblur="FieldValidation(this);" maxLength="60"  value="<%= (String)MT_AGENCYObj.get("AGN_ADD2") %>" >
		</TD>
		<TD class="ste" nowrap>   
			<LABEL ID="AGN_MAR_ADD2_label" class="userlabel"><%= field_labels.getString("MT_AGENCY.AGN_MAR_ADD2") %></LABEL>
		</TD>
		<TD class="ste" nowrap>
			<INPUT type="text" id="AGN_MAR_ADD2" name="AGN_MAR_ADD2" class="input" size="60" onblur="FieldValidation(this);" maxLength="60"  value="<%= (String)MT_AGENCYObj.get("AGN_MAR_ADD2") %>" >
		</TD>
	</TR>
	<TR class="ste">
		<TD class="ste" nowrap>   
			<LABEL ID="COUNTRY_label" class="userlabel"><%= field_labels.getString("MT_AGENCY.COUNTRY") %></LABEL>
		</TD>
		<TD class="ste" colspan="7" nowrap>
			<INPUT type="text"  id="COUNTRY" name="COUNTRY" class="input" size="10" readonly onChange="FieldValidation(this); getCodeDesc('COUNTRY','COUNTRYDESC', 'g_pkl_country','KEY_CODE')" value="<%=(String)MT_AGENCYObj.get("COUNTRY")%>">
           	  <INPUT type="text" id="COUNTRYDESC" name="COUNTRYDESC" class="input" size="50" readonly  maxLength="50" value="<%= 
	(String)MT_AGENCYObj.get("COUNTRYDESC")%>" >
			<A id="COUNTRYHLP" name="COUNTRYHLP"  href="#" onClick="getPicklistValues('g_pkl_country','COUNTRY','','')" class="linkblue" >?</A> &nbsp;
			</TD>
	</TR>
	<TR class="ste">
		<TD class="ste" nowrap>   
			<LABEL ID="STATE_label" class="userlabel"><%= field_labels.getString("MT_AGENCY.STATE") %></LABEL>
		</TD>
		<TD class="ste" colspan="7" nowrap>
			<INPUT type="text"  id="STATE" name="STATE" class="input" size="10" onChange="FieldValidation(this); getCodeDesc('STATE','STATEDESC', 'g_pkl_stateDesc','KEY_CODE')" value="<%=(String)MT_AGENCYObj.get("STATE")%>">
	  <INPUT type="text" id="STATEDESC" name="STATEDESC" class="input" size="50" readonly  maxLength="50" value="<%= 
	(String)MT_AGENCYObj.get("STATEDESC") %>" >
		<A id="STATEHLP" name="STATEHLP"  href="#" onClick="getPicklistValues('g_pkl_state','STATE','COUNTRY','KEY')" class="linkblue" >?</A> &nbsp;
			</TD>
	</TR>
	<TR class="ste">
		<TD class="ste" nowrap>   
			<LABEL ID="CITY_label" class="userlabel"><%= field_labels.getString("MT_AGENCY.CITY") %></LABEL>
		</TD>
		<TD class="ste" colspan="7" nowrap>
			<INPUT type="text"  id="CITY" name="CITY" class="input" size="10" onChange="FieldValidation(this); getCodeDesc('CITY','CITYDESC', 'g_pkl_cityDesc','KEY_CODE')" value="<%=(String)MT_AGENCYObj.get("CITY")%>">
           	  <INPUT type="text" id="CITYDESC" name="CITYDESC" class="input" size="50" readonly  maxLength="50" value="<%= 
	(String)MT_AGENCYObj.get("CITYDESC") %>" >
		<A id="CITYHLP" name="CITYHLP"  href="#" onClick="getPicklistValues('g_pkl_city','CITY','STATE','KEY')" class="linkblue" >?</A> &nbsp;
			</TD>
		<TD class="ste"></TD>
	</TR>

	<TR class="ste">
		<TD class="ste" nowrap>   
			<LABEL ID="AGN_ADD_PIN_label" class="userlabel"><%= field_labels.getString("MT_AGENCY.AGN_ADD_PIN") %></LABEL>
		</TD>
		<TD class="ste" nowrap>
			<INPUT type="text" id="AGN_ADD_PIN" name="AGN_ADD_PIN" class="input" size="6" onblur="FieldValidation(this);" maxLength="6"  value="<%= (String)MT_AGENCYObj.get("AGN_ADD_PIN") %>" >
		</TD>
		<TD class="ste" nowrap>   
			<LABEL ID="AGN_TEL_label" class="userlabel"><%= field_labels.getString("MT_AGENCY.AGN_TEL") %></LABEL>
		</TD>
		<TD class="ste" nowrap>
			<INPUT type="text" id="AGN_TEL" name="AGN_TEL" class="input" size="20" onblur="FieldValidation(this);" maxLength="20"  value="<%= (String)MT_AGENCYObj.get("AGN_TEL") %>" >
		</TD>
		</TR>
	<TR class="ste">
		<TD class="ste" nowrap>   
			<LABEL ID="AGN_FAX_label" class="userlabel"><%= field_labels.getString("MT_AGENCY.AGN_FAX") %></LABEL>
		</TD>
		<TD class="ste" nowrap>
			<INPUT type="text" id="AGN_FAX" name="AGN_FAX" class="input" size="20" onblur="FieldValidation(this);" maxLength="20"  value="<%= (String)MT_AGENCYObj.get("AGN_FAX") %>" >
		</TD>
		<TD class="ste" nowrap>   
			<LABEL ID="AGN_MOB_label" class="userlabel"><%= field_labels.getString("MT_AGENCY.AGN_MOB") %></LABEL>
		</TD>
		<TD class="ste" nowrap>
			<INPUT type="text" id="AGN_MOB" name="AGN_MOB" class="input" size="20" onblur="FieldValidation(this);" maxLength="20"  value="<%= (String)MT_AGENCYObj.get("AGN_MOB") %>" >
		</TD>
	</TR>
	<TR>
		<TD colspan="8"  class="titlehead" nowrap>   
			<LABEL ID="HEADER2_label"><%= field_labels.getString("MT_AGENCY.HEADER2") %></LABEL>
		</TD>
	</TR>
	<TR class="ste">
		<TD class="ste" nowrap>   
			<LABEL ID="BILLABLE_FLG_label" class="userlabel"><%= field_labels.getString("MT_AGENCY.BILLABLE_FLG") %></LABEL>
			</TD>
	<TD class="ste" nowrap>

		<INPUT type="radio" id="BILLABLE_FLG_Y" name="BILLABLE_FLG" class="userlabel" checked onClick="FieldValidation(this);" value="Y" accessKey="Y" ><%= field_labels.getString("radio_yes") %>

		<INPUT type="radio" id="BILLABLE_FLG_Y" name="BILLABLE_FLG"  class="input" onClick="FieldValidation(this);" value="N" accessKey="N" ><%= field_labels.getString("radio_no") %>

</TD>
		<TD class="ste" nowrap>   
			<LABEL ID="AGN_OS_AMT_label" class="userlabel"><%= field_labels.getString("MT_AGENCY.AGN_OS_AMT") %></LABEL>
		</TD>
		<TD class="ste" nowrap>
			<INPUT type="text" id="AGN_OS_AMT" name="AGN_OS_AMT" class="input" size="10"  maxLength="10"  value="<%= (String)MT_AGENCYObj.get("AGN_OS_AMT") %>" >
		</TD>
	</TR>
	<TR class="ste">
		<TD class="ste" nowrap>   
			<LABEL ID="BILL_AGN_CODE_label" class="userlabel"><%= field_labels.getString("MT_AGENCY.BILL_AGN_CODE") %></LABEL>
		</TD>
		<TD class="ste" nowrap>
			<INPUT type="text"  id="BILL_AGN_CODE" name="BILL_AGN_CODE" class="input" size="10" readonly onChange="FieldValidation(this); getCodeDesc('BILL_AGN_CODE','BILL_AGN_CODEDESC', 'g_pkl_agencyDesc','AGN_CODE')" value="<%= (String)MT_AGENCYObj.get("BILL_AGN_CODE")%>">
           	  <INPUT type="text" id="BILL_AGN_CODEDESC" name="BILL_AGN_CODEDESC" class="input" size="50" readonly  maxLength="50" value="<%= 
	(String)MT_AGENCYObj.get("BILL_AGN_CODEDESC") %>" >
		<A id="BILL_AGN_CODEHLP" name="BILL_AGN_CODEHLP"  href="#" onClick="getPicklistValues('g_pkl_agency','BILL_AGN_CODE','','')" class="linkblue" >?</A> &nbsp;
			</TD>
		<TD class="ste" nowrap>   
			<LABEL ID="RATE_CODE_label" class="userlabel"><%= field_labels.getString("MT_AGENCY.RATE_CODE") %></LABEL>
		</TD>
		<TD class="ste" nowrap>
			<INPUT type="text"  id="RATE_CODE" name="RATE_CODE" class="input" onChange="FieldValidation(this); getCodeDesc('RATE_CODE','RATE_CODEDESC', 'g_pkl_rate','')" value="<%=(String)MT_AGENCYObj.get("RATE_CODE")%>">
           	  <INPUT type="text" id="RATE_CODEDESC" name="RATE_CODEDESC" class="input" size="50" readonly  maxLength="50" value="<%= 
	(String)MT_AGENCYObj.get("RATE_CODEDESC") %>" >
		<A id="RATE_CODEHLP" name="RATE_CODEHLP"  href="#" onClick="getPicklistValues('g_pkl_rate','RATE_CODE','','')" class="linkblue" >?</A> &nbsp;
			</TD>
	</TR>
	<TR class="ste">
		<TD class="ste" nowrap>   
			<LABEL ID="BILL_FREQ_label" class="userlabel"><%= field_labels.getString("MT_AGENCY.BILL_FREQ") %></LABEL>
		</TD>
		<TD class="ste" nowrap>
			<INPUT type="text"  id="BILL_FREQ" name="BILL_FREQ" class="input" size="10"  onChange="FieldValidation(this); getCodeDesc('BILL_FREQ','BILL_FREQDESC', 'g_pkl_billfreqDesc','KEY_CODE ')" value="<%= (String)MT_AGENCYObj.get("BILL_FREQ")%>">
           	  <INPUT type="text" id="BILL_FREQDESC" name="BILL_FREQDESC" class="input" size="50" readonly  maxLength="50" value="<%= 
	(String)MT_AGENCYObj.get("BILL_FREQDESC") %>" >
		<A id="BILL_FREQHLP" name="BILL_FREQHLP"  href="#" onClick="getPicklistValues('g_pkl_billfreq','BILL_FREQ','','')" class="linkblue" >?</A> &nbsp;
			</TD>
		<TD class="ste" nowrap>   
			<LABEL ID="COMM_CODE_label" class="userlabel"><%= field_labels.getString("MT_AGENCY.COMM_CODE") %></LABEL>
		</TD>
		<TD class="ste" nowrap>
			<INPUT type="text"  id="COMM_CODE" name="COMM_CODE" class="input" onChange="FieldValidation(this); getCodeDesc('COMM_CODE','COMM_CODEDESC', 'g_pkl_commission','')" value="<%=(String)MT_AGENCYObj.get("COMM_CODE")%>">
           	  <INPUT type="text" id="COMM_CODEDESC" name="COMM_CODEDESC" class="input" size="50" readonly  maxLength="50" value="<%= 
	(String)MT_AGENCYObj.get("COMM_CODEDESC") %>" >
		<A id="COMM_CODEHLP" name="COMM_CODEHLP"  href="#" onClick="getPicklistValues('g_pkl_commission','COMM_CODE','','')" class="linkblue" >?</A> &nbsp;
			</TD>
	</TR>
	<TR class="ste">
	<TD class="ste" nowrap>   
			<LABEL ID="SEC_DED_FLG_label" class="userlabel"><%= field_labels.getString("MT_AGENCY.SEC_DED_FLG") %><SPAN class="instreditalic">*</SPAN></LABEL>
			</TD>
	<TD class="ste" colspan="4" nowrap>

		<INPUT type="radio" id="SEC_DED_FLG_N" name="SEC_DED_FLG" class="userlabel" onClick="FieldValidation(this);" value="Y" accessKey="Y" ><%= field_labels.getString("radio_yes") %>

		<INPUT type="radio" id="SEC_DED_FLG_Y" name="SEC_DED_FLG"  class="input" checked onClick="FieldValidation(this);" value="N" accessKey="N" ><%= field_labels.getString("radio_no") %>


</TD>
	</TR>

	<TR class="ste">
	<TD class="ste" nowrap>   
			<LABEL ID="SEC_DED_TYPE_label" class="userlabel"><%= field_labels.getString("MT_AGENCY.SEC_DED_TYPE") %><SPAN class="instreditalic">*</SPAN></LABEL>
			</TD>
	<TD class="ste" nowrap>

		<INPUT type="radio" id="SEC_DED_TYPE_P" name="SEC_DED_TYPE" class="userlabel" checked onClick="FieldValidation(this);" value="P" accessKey="P" ><%= field_labels.getString("MT_AGENCY.SEC_DED_TYPE_Option1") %>

		<INPUT type="radio" id="SEC_DED_TYPE_A" name="SEC_DED_TYPE"  class="input" onClick="FieldValidation(this);" value="A" accessKey="A" ><%= field_labels.getString("MT_AGENCY.SEC_DED_TYPE_Option2") %>

</TD>

		<TD class="ste" nowrap>   
			<LABEL ID="SEC_DED_VAL_label" class="userlabel"><%= field_labels.getString("MT_AGENCY.SEC_DED_VAL") %><SPAN class="instreditalic">*</SPAN></LABEL>
		</TD>
		<TD class="ste" colspan="2" nowrap>
			<INPUT type="text" id="SEC_DED_VAL" name="SEC_DED_VAL" class="input" size="10" onblur="FieldValidation(this);" maxLength="10"  value="<%= (String)MT_AGENCYObj.get("SEC_DED_VAL") %>" >
			</TD>

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
		<INPUT TYPE="button" value="Submit" name="Submit_label" class="button" onClick="javascript:validateSubmit()">
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