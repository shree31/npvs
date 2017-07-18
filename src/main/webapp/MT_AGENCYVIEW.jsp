<%@ include file="DISTAPPResourceProvider.jsp" %>
<HTML>
<HEAD>
<% try{
%>
<%@ page contentType="text/html; charset=utf-8" %>
<%
	response.setDateHeader("Expires", 0);
	response.setHeader("Pragma", "no-cache");
	if (request.getProtocol().equals("HTTP/1.1")) {
		response.setHeader("Cache-Control", "no-cache");
	}
%>

<%@ page errorPage="errorpage.jsp" %>
<%@ page import="java.util.*" %>
<%@ page import="javax.servlet.http.*" %>
<%@ page import="org.apache.log4j.Logger" %>

<%
	Logger logger = Logger.getLogger("MT_AGENCYVIEW");

	HashMap MT_AGENCYObj = (HashMap) request.getAttribute("RESPONSE");
	if (MT_AGENCYObj == null)
		MT_AGENCYObj = new HashMap();

	String formName = "MT_AGENCYVIEW";
%>
<TITLE id="MT_AGENCY_title">
	<%=field_labels.getString("MT_AGENCY.MT_AGENCY_title")%>
</TITLE>

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
<%String g_days[] = { "Mon", "Tue", "Wed", "Thu", "Fri", "Sat", "Sun" };
			String optionValue;%>
		
document.onkeypress = checkCR;
// -->
</SCRIPT>
<SCRIPT Language='Javascript' type='text/javascript' src='scripts/CommonFunctions.js'> </SCRIPT>
<SCRIPT Language='Javascript' type='text/javascript' src='scripts/DatePicker.js'> </SCRIPT>

<SCRIPT type="text/javascript" language = "JavaScript">


function preValidateSubmit(as_event_label)
{
	validateSubmit();
	return true;
}

function gotoSuppy() {
	if(document.getElementById("AGN_NAME").value!="" && document.getElementById("AGN_CODE").value!="")
	{
		//if(document.getElementById("ERRDESC").value.toUpperCase().indexOf("SUCCESS")!=-1)
		//{
			var l_agency_code = document.getElementById("AGN_CODE").value==""?"null":document.getElementById("AGN_CODE").value.toUpperCase();
	
		var l_CUST_ADDRESS = getCutAddress();
		
		window.open("MT_AGENCYSUPPLYRPL.jsp?AGN_CODE="+l_agency_code+"&CUST_ADDRESS="+l_CUST_ADDRESS+"","PaperMap");
		//document.forms[0].target="_blank";
		//}
	}
}

function getCutAddress () {

		return document.getElementById("AGN_NAME").value + " - " +
		document.getElementById("BUILD_NO").value + " - " + 
		document.getElementById("WING_NO").value + " - " +
		document.getElementById("FLAT_NO").value + " - " +
		document.getElementById("DLV_CODE").value;
		
}


function gotoSuppyOff() {
	if(document.getElementById("AGN_NAME").value!="" && document.getElementById("AGN_CODE").value!="")
	{
		var l_agency_code = document.getElementById("AGN_CODE").value==""?"null":document.getElementById("AGN_CODE").value.toUpperCase();
		var l_CUST_ADDRESS = getCutAddress();
				
		window.open("MT_BASESUPSEARCHVEWOFF.jsp?AGN_CODE="+l_agency_code+"&CUST_ADDRESS="+l_CUST_ADDRESS+"","PaperMapping");
		//document.location.href="MT_BASESUPSEARCHVEW.jsp?AGN_CODE="+l_agency_code+"&CUST_ADDRESS="+l_CUST_ADDRESS;
		//document.forms[0].target="_blank";
	}
	
}

function gotoSuppyMonthlyView() {
	if(document.getElementById("AGN_NAME").value!="" && document.getElementById("AGN_CODE").value!="")
	{
		var l_agency_code = document.getElementById("AGN_CODE").value==""?"null":document.getElementById("AGN_CODE").value.toUpperCase();
		var l_CUST_ADDRESS = getCutAddress();
				
	window.open("MT_BASESUPSEARCHRES.jsp?AGN_CODE="+l_agency_code+"&AGN_DESC="+document.getElementById("AGN_NAME").value+"&PUB_CODE=null&CUST_ADDRESS="+l_CUST_ADDRESS+"","PaperMapMnth");
		//document.location.href="MT_BASESUPSEARCHVEW.jsp?AGN_CODE="+l_agency_code+"&CUST_ADDRESS="+l_CUST_ADDRESS;
		//document.forms[0].target="_blank";
	}
	
}
function execute_onLoad()
{
	clearNull();
	 var l_valid_flg = "<%=((String)MT_AGENCYObj.get("SEC_DED_FLG"))%>";
	getCodeDesc('AGNORDERBY','AGNORDERBYDESC', 'g_pkl_agencyDesc','');
	if((g_sc_p_flag == "Y") && (g_serv_chrg_flag == "N"))
		document.getElementById("SERV_CHRG").parentElement.parentElement.style.display="none";
	if(g_late_chrg_flag == "N")
		document.getElementById("LATE_CHRG").parentElement.parentElement.style.display="none";
	if(l_valid_flg == "N")
		document.getElementById("SEC_DED_FLG_N").checked=true;
	else 
		document.getElementById("SEC_DED_FLG_Y").checked=true;

//	document.getElementById("SEC_DED_FLG").accessKey =l_valid_flg;
	chkSecDedType(document.getElementById("SEC_DED_FLG"));

	 l_valid_flg = "<%=((String)MT_AGENCYObj.get("SEC_DED_TYPE"))%>";
	if(l_valid_flg == "N")
		document.getElementById("SEC_DED_TYPE_P").checked=true;
	else 
		document.getElementById("SEC_DED_TYPE_A").checked=true;
}

function FieldValidation(as_field_name)
{
	var l_numeric_flds = "SEC_DED_VAL";
	var l_date_flds = "SUS_DT,REOPEN_DT";

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
	if(as_field_name.name == "ROUTE_CODE")
	{
		document.getElementById("DLV_CODE").value="";
		document.getElementById("DLV_CODEDESC").value="";
	}

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
<BODY class="mainbody" onLoad="execute_onLoad()" >

<DIV id="MT_AGENCY_div" >

<FORM name="MT_AGENCY" id="MT_AGENCY" method="post" action="distAppCommonActionServlet.do">
<INPUT type="hidden" id="Event" name="Event" value="">
<INPUT type="hidden" id="CREATION_DT" name="CREATION_DT" value="<%=(java.util.Date) MT_AGENCYObj.get("CREATION_DT")%>">
<INPUT type="hidden" id="MAKER" name="MAKER" value="<%=(String) MT_AGENCYObj.get("MAKER")%>">
<INPUT type="hidden" id="MAKER_DT" name="MAKER_DT" value="<%=(java.util.Date) MT_AGENCYObj.get("MAKER_DT")%>">
<INPUT type="hidden" id="STATUS" name="STATUS" value="<%=(String) MT_AGENCYObj.get("STATUS")%>">
<INPUT type="hidden" id="MODE" name="MODE" value="">
<INPUT type="hidden" id="ENTITY" name="ENTITY" value="MT_AGENCY">
<INPUT type="hidden" id="PARAM" name="PARAM" value="<%=(String) MT_AGENCYObj.get("PARAM")%>">
<INPUT type="hidden" id="PARAM1" name="PARAM1" value="<%=(String) MT_AGENCYObj.get("PARAM1")%>">
<INPUT type="hidden" id="PARAM2" name="PARAM2" value="<%=(String) MT_AGENCYObj.get("PARAM2")%>">
<INPUT type="hidden" id="PRIMARY_KEY" name="PRIMARY_KEY" value="AGN_CODE">
<INPUT type="hidden" id="SCREEN_NAME" name="SCREEN_NAME" value="MT_AGENCYVIEW">
<INPUT type="hidden" id="ERRDESC" name="ERRDESC" value="<%=(String) MT_AGENCYObj.get("ERRDESC")%>">
<INPUT type="hidden" id="AGN_DAYS" name="AGN_DAYS" value="">
<INPUT type="hidden" id="SEC_DED_TYPE" name="SEC_DED_TYPE" value="P">
<INPUT type="hidden" id="SEC_DED_VAL" name="SEC_DED_VAL" value="0">
<INPUT type="hidden" id="SEC_DED_FLG" name="SEC_DED_FLG" value="N">
<INPUT type="hidden" id="AREA_CODE" name="AREA_CODE" value="AREA">
<INPUT type="hidden" id="CITY" name="CITY" value="MU">
<INPUT type="hidden" id="BILL_FREQ" name="BILL_FREQ" value="M">
<INPUT type="hidden" id="RATE_CODE" name="RATE_CODE" value="RATE">
<INPUT type="hidden" id="AGN_OLD_CODE" name="AGN_OLD_CODE" value="">
<INPUT type="hidden" id="TOT_SD_AMT" name="TOT_SD_AMT" value="<%=(String) MT_AGENCYObj.get("TOT_SD_AMT")%>">

<TABLE class="headertable" cellspacing="0" cellpadding="0" width="100%">
	<TR> 
		<TD class="heading" nowrap align="center"> <%=field_labels.getString("MT_AGENCY.MT_AGENCY")%> </TD>
		<TD>&nbsp;</TD>
	</TR>
</TABLE>
 
 <TABLE class="detailstable" cellspacing="0" cellpadding="0">
	
	<TR class="ste">
		<TD class="ste" nowrap>   
			<LABEL ID="CTG_CODE_label" class="userlabel"><%=field_labels.getString("MT_AGENCY.CTG_CODE")%>
			<SPAN class="instreditalic">*</SPAN></LABEL>
		</TD>
		<TD class="ste" colspan="2" nowrap>
			<INPUT type="text" id="CTG_CODE" name="CTG_CODE" class="input" size="10" onChange="FieldValidation(this);getCodeDesc('CTG_CODE','CTG_CODEDESC','g_pkl_categoryDesc','');" 
					maxLength="10" value="<%=(String) MT_AGENCYObj.get("CTG_CODE")%>" />
			<INPUT type="text" id="CTG_CODEDESC" name="CTG_CODEDESC" class="input" size="50" readonly  maxLength="50" value="<%=(String) MT_AGENCYObj.get("CTG_CODEDESC")%>" />
			<A id="CTG_CODEHLP" name="CTG_CODEHLP"  href="#" onClick="getPicklistValues('g_pkl_category','CTG_CODE','','')" class="linkblue" >?</A> &nbsp;
		</TD>
	</TR>

	<TR class="ste">
		<TD class="ste" nowrap>
			<LABEL ID="AGN_CODE_label" class="userlabel"><%=field_labels.getString("MT_AGENCY.AGN_CODE")%>
				<SPAN class="instreditalic">*</SPAN>
			</LABEL>
		</TD>
		<TD class="ste" colspan="2" nowrap>
				<INPUT type="text" id="AGN_CODE" name="AGN_CODE" class="input" size="40" onChange="FieldValidation(this);getCodeDesc('AGN_CODE','AGN_NAME', 'g_pkl_agencyDesc','');" maxLength="50"  value="<%= (String)MT_AGENCYObj.get("AGN_CODE") %>" >
			<A id="AGN_CODEHLP" name="AGN_CODEHLP"  href="#" onClick="getPicklistValues('g_pkl_agency','AGN_CODE','','')" class="linkblue" >?</A> &nbsp;

				</TD>
<!--	
		<TD class="ste" nowrap>   
			<LABEL ID="AGN_OLD_CODE_label" class="userlabel"><%=field_labels.getString("MT_AGENCY.AGN_OLD_CODE")%>
			</LABEL>
		</TD>
		<TD class="ste" colspan="4" nowrap>
			<INPUT type="text" id="AGN_OLD_CODE" name="AGN_OLD_CODE" class="input" size="20" onblur="FieldValidation(this);" maxLength="20"  
				value="<%=(String) MT_AGENCYObj.get("AGN_OLD_CODE")%>" >
		</TD>
		<TD class="ste"></TD> -->
	</TR>

	<TR class="ste">
		<TD class="ste" nowrap>   
			<LABEL ID="AGN_NAME_label" class="userlabel"><%=field_labels.getString("MT_AGENCY.AGN_NAME")%>
			</LABEL>
		</TD>
		<TD class="ste" colspan="1" nowrap>
			<INPUT type="text" id="AGN_NAME" name="AGN_NAME" class="input" size="65" onblur="FieldValidation(this);" maxLength="100"  
				value="<%=(String) MT_AGENCYObj.get("AGN_NAME")%>" >
		</TD>
		<TD class="ste" colspan="5">&nbsp;</TD>
	</TR>
	
	<TR>

	
		<TD class="ste" nowrap>   
			<LABEL ID="ROUTE_CODE_label" class="userlabel"><%=field_labels.getString("MT_AGENCY.ROUTE_CODE")%>
				<SPAN class="instreditalic">*</SPAN>
			</LABEL>
		</TD>
		<TD class="ste" colspan="2" nowrap>
			<INPUT type="text" id="ROUTE_CODE" name="ROUTE_CODE" class="input" size="10" onChange="FieldValidation(this);getCodeDesc('ROUTE_CODE','ROUTE_CODEDESC','g_pkl_routeDesc','');" 
					maxLength="10" value="<%=(String) MT_AGENCYObj.get("ROUTE_CODE")%>" />
			<INPUT type="text" id="ROUTE_CODEDESC" name="ROUTE_CODEDESC" class="input" size="50" readonly  maxLength="50" value="<%=(String) MT_AGENCYObj.get("ROUTE_CODEDESC")%>" />
			<A id="ROUTE_CODEHLP" name="ROUTE_CODEHLP"  href="#" onClick="getPicklistValues('g_pkl_route','ROUTE_CODE','','')" class="linkblue" >?</A> &nbsp;
		</TD>


		<TD class="ste" nowrap>   
			<LABEL ID="DLV_CODE_label" class="userlabel"><%=field_labels.getString("MT_AGENCY.DLV_CODE")%>
				<SPAN class="instreditalic">*</SPAN>
			</LABEL>
		</TD>
		<TD class="ste" colspan="4" nowrap>
			<INPUT type="text" id="DLV_CODE" name="DLV_CODE" class="input" size="10" onChange="FieldValidation(this);getCodeDesc('DLV_CODE,ROUTE_CODE','DLV_CODEDESC','g_pkl_CriDeliveryDesc','');" 
					maxLength="10" value="<%=(String) MT_AGENCYObj.get("DLV_CODE")%>" >
			<INPUT type="text" id="DLV_CODEDESC" name="DLV_CODEDESC" class="input" size="50" readonly  maxLength="50" value="<%=(String) MT_AGENCYObj.get("DLV_CODEDESC")%>" />
			<A id="DLV_CODEHLP" name="DLV_CODEHLP"  href="#" onClick="getPicklistValues('g_pkl_CriDelivery','DLV_CODE','ROUTE_CODE','')" class="linkblue" >?</A> &nbsp;
		</TD>
	</TR>
		<TR class="ste">
		<TD class="ste" nowrap>   
			<LABEL ID="AGNORDERBY_label" class="userlabel"><%=field_labels.getString("MT_AGENCY.AGNORDERBY")%>
			<SPAN class="instreditalic">*</SPAN>
			</LABEL>
		</TD>
	
			<TD class="ste" colspan="2" nowrap>
				<INPUT type="text" id="AGNORDERBY" name="AGNORDERBY" class="input" size="10" onChange="FieldValidation(this);getCodeDesc('AGNORDERBY','AGNORDERBYDESC', 'g_pkl_agencyDesc','AGN_CODE');" maxLength="10"  value="<%= (String)MT_AGENCYObj.get("AGNORDERBY") %>" >
  <INPUT type="text" id="AGNORDERBYDESC" name="AGNORDERBYDESC" class="input" size="50" readonly maxLength="50" value="" >
	 <A id="AGNORDERBYHLP" name="AGNORDERBYEHLP"  href="#" onClick="getPicklistValues('g_pkl_agency','AGNORDERBY','DLV_CODE,ROUTE_CODE','DL.DLV_CODE,RT.ROUTE_CODE')" class="linkblue" >?</A> &nbsp;

</TR>
	
	<TR class="ste">
		<TD class="ste" nowrap>   
			<LABEL ID="BUILD_NO_label" class="userlabel"><%=field_labels.getString("MT_AGENCY.BUILD_NO")%>
			</LABEL>
		</TD>
		<TD class="ste" nowrap>
			<INPUT type="text" id="BUILD_NO" name="BUILD_NO" class="input" size="10" onblur="FieldValidation(this);" maxLength="20"  
				value="<%=(String) MT_AGENCYObj.get("BUILD_NO")%>" >
		</TD>
		<TD class="ste" nowrap>   
			<LABEL ID="WING_NO_label" class="userlabel"><%=field_labels.getString("MT_AGENCY.WING_NO")%>
			</LABEL>
		</TD>
		<TD class="ste" nowrap>
			<INPUT type="text" id="WING_NO" name="WING_NO" class="input" size="10" onblur="FieldValidation(this);" maxLength="20"  
				value="<%=(String) MT_AGENCYObj.get("WING_NO")%>" >
		</TD>
			<TD class="ste" nowrap>   
			<LABEL ID="FLAT_NO_label" class="userlabel"><%=field_labels.getString("MT_AGENCY.FLAT_NO")%>
			</LABEL>
		</TD>
		<TD class="ste" nowrap>
			<INPUT type="text" id="FLAT_NO" name="FLAT_NO" class="input" size="10" onblur="FieldValidation(this);" maxLength="20"  
				value="<%=(String) MT_AGENCYObj.get("FLAT_NO")%>" >
		</TD>
	</TR>
	
	<TR class="ste">
		<TD class="ste" nowrap>   
			<LABEL ID="AGN_ADD1_label" class="userlabel"><%=field_labels.getString("MT_AGENCY.AGN_ADD1")%>
			</LABEL>
		</TD>
		<TD class="ste" colspan="2" nowrap>
			<INPUT type="text" id="AGN_ADD1" name="AGN_ADD1" class="input" size="50" onblur="FieldValidation(this);" maxLength="60"  
				value="<%=(String) MT_AGENCYObj.get("AGN_ADD1")%>" >
		</TD>
		<TD class="ste" nowrap>   
			<LABEL ID="AGN_ADD2_label" class="userlabel"><%=field_labels.getString("MT_AGENCY.AGN_ADD2")%>
			</LABEL>
		</TD>
		<TD class="ste" colspan="2" nowrap>
			<INPUT type="text" id="AGN_ADD2" name="AGN_ADD2" class="input" size="50" onblur="FieldValidation(this);" maxLength="60"  
				value="<%=(String) MT_AGENCYObj.get("AGN_ADD2")%>" >
		</TD>
	</TR>
<!--	
	<TR class="ste">
		<TD class="ste" nowrap>   
			<LABEL ID="AREA_CODE_label" class="userlabel"><%=field_labels.getString("MT_AGENCY.AREA_CODE")%><SPAN class="instreditalic">*</SPAN>
			</LABEL>
		</TD>
		<TD class="ste" colspan="2" nowrap>
			<INPUT type="text" id="AREA_CODE" name="AREA_CODE" class="input" size="10" onChange="FieldValidation(this);getCodeDesc('AREA_CODE','AREA_CODEDESC','g_pkl_areaDesc','');" 
					maxLength="10" value="<%=(String) MT_AGENCYObj.get("AREA_CODE")%>" />
			<INPUT type="text" id="AREA_CODEDESC" name="AREA_CODEDESC" class="input" size="50" readonly  maxLength="50" value="<%=(String) MT_AGENCYObj.get("AREA_CODEDESC")%>" />
			<A id="AREA_CODEHLP" name="AREA_CODEHLP"  href="#" onClick="getPicklistValues('g_pkl_area','AREA_CODE','','')" class="linkblue" >?</A> &nbsp;
		</TD>
		<TD class="ste" nowrap>   
			<LABEL ID="CITY_label" class="userlabel"><%=field_labels.getString("MT_AGENCY.CITY")%><SPAN class="instreditalic">*</SPAN></LABEL>
		</TD>
		<TD class="ste" colspan="2" nowrap>
			<INPUT type="text" id="CITY" name="CITY" class="input" size="10" onChange="FieldValidation(this);getCodeDesc('CITY','CITYDESC','g_pkl_cityDesc','KEY_CODE');" 
					maxLength="10" value="<%=(String) MT_AGENCYObj.get("CITY")%>" >
			<INPUT type="text" id="CITYDESC" name="CITYDESC" class="input" size="50" readonly  maxLength="50" value="<%=(String) MT_AGENCYObj.get("CITYDESC")%>" >
			<A id="CITYHLP" name="CITYHLP"  href="#" onClick="getPicklistValues('g_pkl_city','CITY','','KEY')" class="linkblue" >?</A> &nbsp;
		</TD>
	</TR> -->

	<TR class="ste">
		<TD class="ste" nowrap>   
			<LABEL ID="AGN_ADD_PIN_label" class="userlabel"><%=field_labels.getString("MT_AGENCY.AGN_ADD_PIN")%>
			</LABEL>
		</TD>
		<TD class="ste" colspan="2" nowrap>
			<INPUT type="text" id="AGN_ADD_PIN" name="AGN_ADD_PIN" class="input" size="6" onblur="FieldValidation(this);" maxLength="6"  
				value="<%=(String) MT_AGENCYObj.get("AGN_ADD_PIN")%>" >
		</TD>
		<TD class="ste" nowrap>   
			<LABEL ID="AGN_FAX_label" class="userlabel"><%=field_labels.getString("MT_AGENCY.AGN_FAX")%>
			</LABEL>
		</TD>
		<TD class="ste" colspan="2" nowrap>
			<INPUT type="text" id="AGN_FAX" name="AGN_FAX" class="input" size="8" onblur="FieldValidation(this);" maxLength="8"  
				value="<%=(String) MT_AGENCYObj.get("AGN_FAX")%>" >
		</TD>
	</TR>

	<TR>
		<TD class="ste" nowrap>   
			<LABEL ID="AGN_MAR_NAME_label" class="userlabel"><%=field_labels.getString("MT_AGENCY.AGN_MAR_NAME")%>
			</LABEL>
		</TD>
		<TD class="ste" nowrap>
			<INPUT type="text" id="AGN_MAR_NAME" name="AGN_MAR_NAME" class="input" size="50" onblur="FieldValidation(this);" maxLength="100"  
				value="<%=(String) MT_AGENCYObj.get("AGN_MAR_NAME")%>" >
		</TD>
		<TD class="ste" nowrap>   
			<LABEL ID="AGN_TEL_label" class="userlabel"><%=field_labels.getString("MT_AGENCY.AGN_TEL")%>
			</LABEL>
		</TD>
		<TD class="ste" nowrap>
			<INPUT type="text" id="AGN_TEL" name="AGN_TEL" class="input" size="8" onblur="FieldValidation(this);" maxLength="8"  
				value="<%=(String) MT_AGENCYObj.get("AGN_TEL")%>" >
		</TD>
		<TD class="ste" nowrap>   
			<LABEL ID="AGN_MOB_label" class="userlabel"><%=field_labels.getString("MT_AGENCY.AGN_MOB")%>
			</LABEL>
		</TD>
		<TD class="ste" nowrap>
			<INPUT type="text" id="AGN_MOB" name="AGN_MOB" class="input" size="10" onblur="FieldValidation(this);" maxLength="10"  
				value="<%=(String) MT_AGENCYObj.get("AGN_MOB")%>" >
		</TD>	
	</TR>
<!--
	<TR>
		<TD class="ste" nowrap>   
			<LABEL ID="SUS_DT_label" class="userlabel"><%=field_labels.getString("MT_AGENCY.SUS_DT")%></LABEL>
		</TD>
		<TD class="ste" colspan="2" nowrap>
			<INPUT type="text" id="SUS_DT" name="SUS_DT" class="input" size="10" onblur="FieldValidation(this);" maxLength="10" value="<%=(String)MT_AGENCYObj.get("SUS_DT")%>"/>
			<a id="calImg" href="#" onClick="javascript:calendar('SUS_DT',event.screenY,event.screenX,null,null,getDatePickerPattern());" title="Select Date"><img src="images/calendar.gif" width="16" height="16" border="0"/></a>
		</TD>
		<TD class="ste" nowrap>   
			<LABEL ID="REOPEN_DT_label" class="userlabel"><%=field_labels.getString("MT_AGENCY.REOPEN_DT")%></LABEL>
		</TD>
		<TD>
			<INPUT type="text" id="REOPEN_DT" name="REOPEN_DT" class="input" size="10" onblur="FieldValidation(this);" maxLength="10" value="<%=(String)MT_AGENCYObj.get("REOPEN_DT")%>"/>
			<A id="calImg" href="#" onClick="javascript:calendar('REOPEN_DT',event.screenY,event.screenX,null,null,getDatePickerPattern());" title="Select Date">
				<IMG src="images/calendar.gif" width="16" height="16" border="0"/>
			</a>
		</TD>		
	</TR>
	-->
	<TR class="ste">
	<!--	<TD class="ste" nowrap>   
			<LABEL ID="BILL_FREQ_label" class="userlabel"><%=field_labels.getString("MT_AGENCY.BILL_FREQ")%>
			<SPAN class="instreditalic">*</SPAN>
			</LABEL>
		</TD>
		<TD class="ste" colspan="2" nowrap>
			<INPUT type="text" id="BILL_FREQ" name="BILL_FREQ" class="input" size="10" onChange="FieldValidation(this);getCodeDesc('BILL_FREQ','BILL_FREQDESC','g_pkl_billfreqDesc','KEY_CODE');" 
					maxLength="10" value="<%=(String) MT_AGENCYObj.get("BILL_FREQ")%>" >
			<INPUT type="text" id="BILL_FREQDESC" name="BILL_FREQDESC" class="input" size="50" readonly  maxLength="50" value="<%=(String) MT_AGENCYObj.get("BILL_FREQDESC")%>" >
			<A id="BILL_FREQHLP" name="BILL_FREQHLP"  href="#" onClick="getPicklistValues('g_pkl_billfreq','BILL_FREQ','','')" class="linkblue" >?</A> &nbsp;
		</TD> -->
		<TD class="ste" nowrap>   
			<LABEL ID="AGN_OS_AMT_label" class="userlabel"><%=field_labels.getString("MT_AGENCY.AGN_OS_AMT")%>
			</LABEL>
		</TD>
		<TD class="ste" colspan="2" nowrap>
			<INPUT type="text" id="AGN_OS_AMT" name="AGN_OS_AMT" class="input" size="6" onblur="FieldValidation(this);" maxLength="6"  
				value="<%=MT_AGENCYObj.get("AGN_OS_AMT")==null?"0":(String) MT_AGENCYObj.get("AGN_OS_AMT")%>" >
		</TD>
	</TR>
<!-- 
	<TR class="ste">
		<TD class="ste" nowrap>   
			<LABEL ID="SEC_DED_FLG_label" class="userlabel"><%=field_labels.getString("MT_AGENCY.SEC_DED_FLG")%></LABEL>
		</TD>
		<TD class="ste" colspan="2" nowrap>
		<INPUT type="radio" id="SEC_DED_FLG_Y" name="SEC_DED_FLG" checked onClick="FieldValidation(this);" value="Y" accessKey="Y" ><%=field_labels.getString("radio_yes")%>

		<INPUT type="radio" id="SEC_DED_FLG_N" name="SEC_DED_FLG"  onClick="FieldValidation(this);" value="N" accessKey="N" ><%=field_labels.getString("radio_no")%>
		</TD>
	</TR>

	<TR class="ste">
		<TD class="ste" nowrap>   
			<LABEL ID="SEC_DED_TYPE_label" class="userlabel"><%=field_labels.getString("MT_AGENCY.SEC_DED_TYPE")%></LABEL>
		</TD>
		<TD class="ste" colspan="2" nowrap>
		<INPUT type="radio" id="SEC_DED_TYPE_P" name="SEC_DED_TYPE" checked onClick="FieldValidation(this);" value="P" accessKey="P" ><%=field_labels.getString("MT_AGENCY.SEC_DED_TYPE_Option1")%>

		<INPUT type="radio" id="SEC_DED_TYPE_A" name="SEC_DED_TYPE"  onClick="FieldValidation(this);" value="A" accessKey="A" ><%=field_labels.getString("MT_AGENCY.SEC_DED_TYPE_Option2")%>
		</TD>
		<TD class="ste" nowrap>   
			<LABEL ID="SEC_DED_VAL_label" class="userlabel"><%=field_labels.getString("MT_AGENCY.SEC_DED_VAL")%>
			</LABEL>
		</TD>
		<TD class="ste" colspan="2" nowrap>
			<INPUT type="text" id="SEC_DED_VAL" name="SEC_DED_VAL" class="input" size="6" onblur="FieldValidation(this);" maxLength="6"  
				value="<%=(String) MT_AGENCYObj.get("SEC_DED_VAL")%>" >
		</TD>
	</TR>
	 
	<TR class="ste">
		<TD class="ste" nowrap>   
			<LABEL ID="RATE_CODE_label" class="userlabel"><%=field_labels.getString("MT_AGENCY.RATE_CODE")%>
			<SPAN class="instreditalic">*</SPAN>
			</LABEL>
		</TD>
		<TD class="ste" colspan="2" nowrap>
			<INPUT type="text" id="RATE_CODE" name="RATE_CODE" class="input" size="10" onChange="FieldValidation(this);getCodeDesc('RATE_CODE','RATE_CODEDESC','g_pkl_rateDesc','');" 
					maxLength="10" value="<%=(String) MT_AGENCYObj.get("RATE_CODE")%>" >
			<INPUT type="text" id="RATE_CODEDESC" name="RATE_CODEDESC" class="input" size="50" readonly  maxLength="50" value="<%=(String) MT_AGENCYObj.get("RATE_CODEDESC")%>" >
			<A id="RATE_CODEHLP" name="RATE_CODEHLP"  href="#" onClick="getPicklistValues('g_pkl_rate','RATE_CODE','','')" class="linkblue" >?</A> &nbsp;
		</TD>
		</tr>
		<TD class="ste" nowrap> 
			<LABEL ID="COMM_CODE_label" class="userlabel"><%=field_labels.getString("MT_AGENCY.COMM_CODE")%>
			<SPAN class="instreditalic">*</SPAN>
			</LABEL>
		</TD>
		<TD class="ste" colspan="2" nowrap>
			<INPUT type="text" id="COMM_CODE" name="COMM_CODE" class="input" size="10" onChange="FieldValidation(this);getCodeDesc('COMM_CODE','COMM_CODEDESC','g_pkl_commissionDesc','');" 
					maxLength="10" value="<%=(String) MT_AGENCYObj.get("COMM_CODE")%>" >
			<INPUT type="text" id="COMM_CODEDESC" name="COMM_CODEDESC" class="input" size="50" readonly  maxLength="50" value="<%=(String) MT_AGENCYObj.get("COMM_CODEDESC")%>" >
			<A id="COMM_CODEHLP" name="COMM_CODEHLP"  href="#" onClick="getPicklistValues('g_pkl_commission','COMM_CODE','','')" class="linkblue" >?</A> &nbsp;
		</TD> -->
	<TR class="ste">
		<TD class="ste" nowrap>   
			<LABEL ID="SERV_CHRG_label" class="userlabel"><%=field_labels.getString("SERV_CHRG")%>
			</LABEL>
		</TD>
		<TD class="ste" colspan="2" nowrap>
			<INPUT type="text" id="SERV_CHRG" name="SERV_CHRG" class="input" size="6" onblur="FieldValidation(this);" maxLength="6"  
				value="<%=(String) MT_AGENCYObj.get("SERV_CHRG")%>" >
		</TD>
	</TR>

	<TR class="ste">
		<TD class="ste" nowrap>   
			<LABEL ID="LATE_CHRG_label" class="userlabel"><%=field_labels.getString("LATE_CHRG")%>
			</LABEL>
		</TD>
		<TD class="ste" colspan="2" nowrap>
			<INPUT type="text" id="LATE_CHRG" name="LATE_CHRG" class="input" size="6" onblur="FieldValidation(this);" maxLength="6"  
				value="<%=(String) MT_AGENCYObj.get("LATE_CHRG")%>" >
		</TD>
	</TR>
	<TR class="formrow2" align="left"> 
	  <TD class="buffercol">&nbsp; </TD>
	   <TD class= "formcol" colspan='2'> 
	    <TABLE class="eventstable" cellspacing="0" cellpadding="0">
	     <TR class="eventsrow1"> 
	      <TD class="eventscol" align="left">
	       <LABEL ID="man_label" class="instreditalic">
	        <SPAN class="instreditalic"> &nbsp;&nbsp;<%=field_labels.getString("mandatory_msg")%>&nbsp;</SPAN>
	       </LABEL>
	      </TD>
	     </TR>
	     <TR class="eventsrow2"> 
	      <TD class="eventscol" align="right">
		  
		    <INPUT TYPE="button" value="Submit" name="Submit_label" class="button" onClick="javascript:preValidateSubmit()">
<!--			<INPUT TYPE="button" value="Clear" name="Clear_label" class="button"  onClick="Reset_form()">
			<INPUT TYPE="button" value="Print" name="Print_label" class="button"  onClick="javascript:window.print()">
			<INPUT TYPE="button" value="Back" name="Back_label" class="button"  onClick="javascript:history.go(-1)"> -->
			<INPUT TYPE="button" value="Add/Modify Paper" name="goto_label" class="button"  onClick="gotoSuppy()">
			<INPUT TYPE="button" value="Paper Off" name="goto_label" class="button"  onClick="gotoSuppyOff()">
			<INPUT TYPE="button" value="Copy Change" name="goto_label" class="button"  onClick="gotoSuppyMonthlyView()">

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
<%}
catch(Exception a_ex){
	a_ex.printStackTrace();
}
%>
