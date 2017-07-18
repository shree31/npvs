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
<jsp:usebean id="GN_searchDetails" class="com.distapp.beans.GN_searchDetails" scope="request"/>

<%@ page errorPage="errorpage.jsp" %>
<%@ page import="java.util.*" %>
<%@ page import="javax.servlet.http.*" %>
<%@ page import="org.apache.log4j.Logger" %>

<%
	Logger logger = Logger.getLogger("MT_AGENCYSUPPLYMOD");
	HashMap MT_AGENCYSUPPLYMODObj = (HashMap)request.getAttribute("RESPONSE");

	
	if(MT_AGENCYSUPPLYMODObj == null)
  		MT_AGENCYSUPPLYMODObj = new HashMap();

	String formName = "MT_AGENCYSUPPLYMOD";

%>


<TITLE id="MT_AGENCYSUPPLYMOD_title"><%= field_labels.getString("MT_AGENCYSUPPLYMOD.MT_AGENCYSUPPLYMOD_title") %></TITLE>

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
function FieldValidation(as_field_name)
{
		var l_numeric_flds = "AGN_BS,AGN_BS_MON,AGN_BS_TUE,AGN_BS_WED,AGN_BS_THU,AGN_BS_FRI,AGN_BS_SAT,AGN_BS_SUN,AGN_SP_MON,AGN_SP_TUE,AGN_SP_WED,AGN_SP_THU,AGN_SP_FRI,AGN_SP_SAT,AGN_SP_SUN,AGN_SS_MON,AGN_SS_TUE,AGN_SS_WED,AGN_SS_THU,AGN_SS_FRI,AGN_SS_SAT,AGN_SS_SUN,AGN_CS_MON,AGN_CS_TUE,AGN_CS_WED,AGN_CS_THU,AGN_CS_FRI,AGN_CS_SAT,AGN_CS_SUN,AGN_FS_MON,AGN_FS_TUE,AGN_FS_WED,AGN_FS_THU,AGN_FS_FRI,AGN_FS_SAT,AGN_FS_SUN,";

	if(l_numeric_flds.indexOf(as_field_name.name)!=-1 && as_field_name.value!="")
	{
		if(IsNumeric(as_field_name)==false) return false;
	}
//	alert(as_field_name.name);
	if(as_field_name.name=="AGN_BS")
	{
		var l_week_days = getNumber("AGN_BS");
		
		document.getElementById("AGN_BS_MON").value=l_week_days;
		document.getElementById("AGN_BS_TUE").value=l_week_days;
		document.getElementById("AGN_BS_WED").value=l_week_days;
		document.getElementById("AGN_BS_THU").value=l_week_days;
		document.getElementById("AGN_BS_FRI").value=l_week_days;
		document.getElementById("AGN_BS_SAT").value=l_week_days;
		document.getElementById("AGN_SP_MON").value=l_week_days;
		document.getElementById("AGN_SP_TUE").value=l_week_days;
		document.getElementById("AGN_SP_WED").value=l_week_days;
		document.getElementById("AGN_SP_THU").value=l_week_days;
		document.getElementById("AGN_SP_FRI").value=l_week_days;
		document.getElementById("AGN_SP_SAT").value=l_week_days;

		calculateTotal();

	}
	if((l_numeric_flds.indexOf('MON')!= -1)||(l_numeric_flds.indexOf('TUE')!= -1)||(l_numeric_flds.indexOf('WED')!= -1)||(l_numeric_flds.indexOf('THU')!= -1)||(l_numeric_flds.indexOf('FRI')!= -1)||(l_numeric_flds.indexOf('SAT')!= -1)||(l_numeric_flds.indexOf('SUN')!= -1))
		calculateTotal();
	return true;
}


function calculateTotal()
	{
	var val_bs=0;
	var val_ss=0;
	var val_cs=0;
	var val_fs = 0;

		document.getElementById("AGN_SP_MON").value=document.getElementById("AGN_BS_MON").value;
		document.getElementById("AGN_SP_TUE").value=document.getElementById("AGN_BS_TUE").value;
		document.getElementById("AGN_SP_WED").value=document.getElementById("AGN_BS_WED").value;
		document.getElementById("AGN_SP_THU").value=document.getElementById("AGN_BS_THU").value;
		document.getElementById("AGN_SP_FRI").value=document.getElementById("AGN_BS_FRI").value;
		document.getElementById("AGN_SP_SAT").value=document.getElementById("AGN_BS_SAT").value;
		document.getElementById("AGN_SP_SUN").value=document.getElementById("AGN_BS_SUN").value;


	document.getElementById("AGN_TS_MON").value = parseInt(parseInt(getNumber("AGN_BS_MON")) + parseInt(getNumber("AGN_SS_MON")) + parseInt(getNumber("AGN_CS_MON")) + parseInt(getNumber("AGN_FS_MON")));

	document.getElementById("AGN_TS_TUE").value = parseInt(parseInt(getNumber("AGN_BS_TUE")) + parseInt(getNumber("AGN_SS_TUE")) + parseInt(getNumber("AGN_CS_TUE")) + parseInt(getNumber("AGN_FS_TUE")));

	document.getElementById("AGN_TS_WED").value = parseInt(parseInt(getNumber("AGN_BS_WED")) + parseInt(getNumber("AGN_SS_WED")) + parseInt(getNumber("AGN_CS_WED")) + parseInt(getNumber("AGN_FS_WED")));

	document.getElementById("AGN_TS_THU").value = parseInt(parseInt(getNumber("AGN_BS_THU")) + parseInt(getNumber("AGN_SS_THU")) + parseInt(getNumber("AGN_CS_THU")) + parseInt(getNumber("AGN_FS_THU")));

	document.getElementById("AGN_TS_FRI").value = parseInt(parseInt(getNumber("AGN_BS_FRI")) + parseInt(getNumber("AGN_SS_FRI")) + parseInt(getNumber("AGN_CS_FRI")) + parseInt(getNumber("AGN_FS_FRI")));

	document.getElementById("AGN_TS_SAT").value = parseInt(parseInt(getNumber("AGN_BS_SAT")) + parseInt(getNumber("AGN_SS_SAT")) + parseInt(getNumber("AGN_CS_SAT")) + parseInt(getNumber("AGN_FS_SAT")));

	document.getElementById("AGN_TS_SUN").value = parseInt(parseInt(getNumber("AGN_BS_SUN")) + parseInt(getNumber("AGN_SS_SUN")) + parseInt(getNumber("AGN_CS_SUN")) + parseInt(getNumber("AGN_FS_SUN")));

	}

function execute_onLoad()
{
//	alert(1);
	clearNull();

	calculateTotal();

	//setfldreadOnly('AGN_CODE','UCL',true);
	//removeLink("AGN_CODEHLP");
	//setfldreadOnly('CMP_CODE','UCL',true);
	//setfldreadOnly('PUB_CODE','UCL',true);
	//setfldreadOnly('EDT_CODE','UCL',true);
	//setfldreadOnly('DLV_CODE','UCL',true);
	//setfldreadOnly('ROUTE_CODE','UCL',true);

		MT_AGENCYSUPPLYMOD.SUPPLY_FLG[0].disabled="true";

		MT_AGENCYSUPPLYMOD.SUPPLY_FLG[1].disabled="true";
		//document.getElementById("SUPPLY_FLG").parentElement.parentElement.className='str';


	setfldreadOnly('SUS_DT','text',true);
}

function validateSubmit(as_field_name)
{
	document.forms[0].submit();
	//return true;
}


</SCRIPT>


<SCRIPT type="text/javascript" language = "JavaScript">
</script>

</HEAD>
<BODY class="mainbody" onLoad="execute_onLoad()" >

<DIV id="MT_AGENCYSUPPLYMOD_div" >

<FORM name="MT_AGENCYSUPPLYMOD" id="MT_AGENCYSUPPLYMOD" method="post" action="distAppCommonActionServlet.do">
<INPUT type="hidden" id="Event" name="Event" value="">
<INPUT type="hidden" id="MAKER" name="MAKER" value="<%= (String)MT_AGENCYSUPPLYMODObj.get("MAKER") %>">
<INPUT type="hidden" id="MAKER_DT" name="MAKER_DT" value="">
<INPUT type="hidden" id="STATUS" name="STATUS" value="<%= (String)MT_AGENCYSUPPLYMODObj.get("STATUS") %>">
<INPUT type="hidden" id="MODE" name="MODE" value="MOD">
<INPUT type="hidden" id="PARAM1" name="PARAM1" value="<%= (String)MT_AGENCYSUPPLYMODObj.get("PARAM1") %>">
<INPUT type="hidden" id="PARAM2" name="PARAM2" value="<%= (String)MT_AGENCYSUPPLYMODObj.get("PARAM2") %>">
<INPUT type="hidden" id="ENTITY" name="ENTITY" value="MT_AGENCY_SUPPLY">
<INPUT type="hidden" id="SCREEN_NAME" name="SCREEN_NAME" value="MT_AGENCYSUPPLYMOD">
<INPUT type="hidden" id="ERRDESC" name="ERRDESC" value="<%= (String)MT_AGENCYSUPPLYMODObj.get("ERRDESC") %>">
<INPUT type="hidden" id="PRIMARY_KEY" name="PRIMARY_KEY" value="AGN_CODE#PUB_CODE#EDT_CODE">
<INPUT type="hidden" id="PARAMSTR" name="PARAMSTR" value="<%=(String)MT_AGENCYSUPPLYMODObj.get("PARAMSTR") %>">

  <TABLE class="headertable" cellspacing="0" cellpadding="0" width='100%'>
         <TD>&nbsp;</TD>
        <TR> 
           <TD class="heading" nowrap align="center">
            <%= field_labels.getString("MT_AGENCYSUPPLYMOD.MT_AGENCYSUPPLYMOD") %>
           </TD>
           <TD>&nbsp;</TD>
        </TR>
   </TABLE>

 <TABLE class="detailstable" cellspacing="0" cellpadding="0">


	<TR class="str">
		<TD class="str" nowrap>   
			<LABEL ID="AGN_CODE_label" class="userlabel"><%= field_labels.getString("MT_AGENCYSUPPLYMOD.AGN_CODE") %></LABEL>
		</TD>
		<TD class="str" colspan="7" nowrap>
			<INPUT type="text" id="AGN_CODE" name="AGN_CODE" class="input" size="10" readOnly onblur="FieldValidation(this);" maxLength="10"  value="<%= (String)MT_AGENCYSUPPLYMODObj.get("AGN_CODE") %>" >
	  <INPUT type="text" id="AGN_CODEDESC" name="AGN_CODEDESC" class="input" size="50" readonly  maxLength="50" value="<%= 
	(String)MT_AGENCYSUPPLYMODObj.get("AGN_CODEDESC") %>" >
			</TD>
	</TR>	
		<TR class="str">
		<TD class="str" nowrap>   
			<LABEL ID="CMP_CODE_label" class="userlabel"><%= field_labels.getString("MT_AGENCYSUPPLYMOD.CMP_CODE") %></LABEL>
		</TD>
		<TD class="str" colspan="7" nowrap>
			<INPUT type="text" id="CMP_CODE" name="CMP_CODE" class="input" size="10" readonly onChange="FieldValidation(this);" maxLength="10"  value="<%= (String)MT_AGENCYSUPPLYMODObj.get("CMP_CODE") %>" >
	  <INPUT type="text" id="CMP_CODEDESC" name="CMP_CODEDESC" class="input" size="50" readonly  maxLength="50" value="<%= 
	(String)MT_AGENCYSUPPLYMODObj.get("CMP_CODEDESC") %>" >

			</TD>
	</TR>	

		<TR class="str">
		<TD class="str" nowrap>   
			<LABEL ID="PUB_CODE_label" class="userlabel"><%= field_labels.getString("MT_AGENCYSUPPLYMOD.PUB_CODE") %></LABEL>
		</TD>
		<TD class="str" colspan="3" nowrap>
			<INPUT type="text" id="PUB_CODE" name="PUB_CODE" class="input" size="10" readOnly  onblur="FieldValidation(this);" maxLength="10"  value="<%= (String)MT_AGENCYSUPPLYMODObj.get("PUB_CODE") %>" >
	  <INPUT type="text" id="PUB_CODEDESC" name="PUB_CODEDESC" class="input" size="50" readonly  maxLength="50" value="<%= 
	(String)MT_AGENCYSUPPLYMODObj.get("PUB_CODEDESC") %>" >

			</TD>

		<TD class="str" nowrap>   
			<LABEL ID="EDT_CODE_label" class="userlabel"><%= field_labels.getString("MT_AGENCYSUPPLYMOD.EDT_CODE") %></LABEL>
		</TD>
		<TD class="str" colspan="3" nowrap>
			<INPUT type="text" id="EDT_CODE" name="EDT_CODE" class="input" size="21" readOnly  onblur="FieldValidation(this);" maxLength="21"  value="<%= (String)MT_AGENCYSUPPLYMODObj.get("EDT_CODE") %>" >
	  <INPUT type="text" id="EDT_CODEDESC" name="EDT_CODEDESC" class="input" size="50" readonly  maxLength="50" value="<%= 
	(String)MT_AGENCYSUPPLYMODObj.get("EDT_CODEDESC") %>" >

			</TD>
	</TR>	
		<TR class="str">
		<TD class="str" nowrap>   
			<LABEL ID="DLV_CODE_label" class="userlabel"><%= field_labels.getString("MT_AGENCYSUPPLYMOD.DLV_CODE") %></LABEL>
		</TD>
		<TD class="str" colspan="3" nowrap>
			<INPUT type="text" id="DLV_CODE" name="DLV_CODE" class="input" size="10" readonly onblur="FieldValidation(this);" maxLength="10"  value="<%= (String)MT_AGENCYSUPPLYMODObj.get("DLV_CODE") %>" >
	  <INPUT type="text" id="DLV_CODEDESC" name="DLV_CODEDESC" class="input" size="50" readonly  maxLength="50" value="<%= 
	(String)MT_AGENCYSUPPLYMODObj.get("DLV_CODEDESC") %>" >

			</TD>
		<TD class="str" nowrap>   
			<LABEL ID="ROUTE_CODE_label" class="userlabel"><%= field_labels.getString("MT_AGENCYSUPPLYMOD.ROUTE_CODE") %></LABEL>
		</TD>
		<TD class="str" colspan="3" nowrap>
			<INPUT type="text" id="ROUTE_CODE" name="ROUTE_CODE" class="input" size="10" readonly onblur="FieldValidation(this);" maxLength="10"  value="<%= (String)MT_AGENCYSUPPLYMODObj.get("ROUTE_CODE") %>" >
	  <INPUT type="text" id="ROUTE_CODEDESC" name="ROUTE_CODEDESC" class="input" size="50" readonly  maxLength="50" value="<%= 
	(String)MT_AGENCYSUPPLYMODObj.get("ROUTE_CODEDESC") %>" >

			</TD>
	</TR>	

<TR class="str">
	<TD class="str" nowrap>   
			<LABEL ID="SUPPLY_FLG_label" class="userlabel"><%= field_labels.getString("MT_AGENCYSUPPLYMOD.SUPPLY_FLG") %></LABEL>
			</TD>
	<TD class="str" colspan="3" nowrap>

		<INPUT type="radio" id="SUPPLY_FLG" name="SUPPLY_FLG" checked onClick="FieldValidation(this);" value="Y" accessKey="Y" ><%= field_labels.getString("radio_yes") %>

		<INPUT type="radio" id="SUPPLY_FLG" name="SUPPLY_FLG"  onClick="FieldValidation(this);" value="N" accessKey="N" ><%= field_labels.getString("radio_no") %>
			</TD>

		<TD class="str" nowrap>   
			<LABEL ID="SUS_DT_label" class="userlabel"><%= field_labels.getString("MT_AGENCYSUPPLYMOD.SUS_DT") %></LABEL>
		</TD>
		<TD class="str" colspan="3" nowrap>
			<INPUT type="text" id="SUS_DT" name="SUS_DT" class="input" size="10" readonly maxLength="10"  value="<%= (String)MT_AGENCYSUPPLYMODObj.get("SUS_DT") %>">
			</TD>
	</TR>	


		<TR class="str">
		<TD class="str" nowrap>   
			<LABEL ID="AGN_BS_label" class="userlabel"><%= field_labels.getString("MT_AGENCYSUPPLYMOD.AGN_BS") %></LABEL>
		</TD>
		<TD class="str" colspan="7" nowrap>
			<INPUT type="text" id="AGN_BS" name="AGN_BS" class="input" size="10" maxLength="10" onBlur="FieldValidation(this);"  value="<%= (String)MT_AGENCYSUPPLYMODObj.get("AGN_BS") %>">
			</TD>
	</TR>	

	
	<TR class="ste">
		<TD class="ste" nowrap>   
			<LABEL ID="DAY_label" class="userlabel"><%= field_labels.getString("DAY") %></LABEL>
		</TD>
		<TD class="ste" nowrap>   
			<LABEL ID="MONDAY_label" class="userlabel"><%= field_labels.getString("MONDAY") %><SPAN class="instreditalic">*</SPAN></LABEL>
		</TD>
		<TD class="ste" nowrap>   
			<LABEL ID="TUESDAY_label" class="userlabel"><%= field_labels.getString("TUESDAY") %><SPAN class="instreditalic">*</SPAN></LABEL>
		</TD>
		<TD class="ste" nowrap>   
			<LABEL ID="WEDNESDAY_label" class="userlabel"><%= field_labels.getString("WEDNESDAY") %><SPAN class="instreditalic">*</SPAN></LABEL>
		</TD>
		<TD class="ste" nowrap>   
			<LABEL ID="THURSDAY_label" class="userlabel"><%= field_labels.getString("THURSDAY") %><SPAN class="instreditalic">*</SPAN></LABEL>
		</TD>
		<TD class="ste" nowrap>   
			<LABEL ID="FRIDAY_label" class="userlabel"><%= field_labels.getString("FRIDAY") %><SPAN class="instreditalic">*</SPAN></LABEL>
		</TD>
		<TD class="ste" nowrap>   
			<LABEL ID="SATURDAY_label" class="userlabel"><%= field_labels.getString("SATURDAY") %><SPAN class="instreditalic">*</SPAN></LABEL>
		</TD>
		<TD class="ste" nowrap>   
			<LABEL ID="SUNDAY_label" class="userlabel"><%= field_labels.getString("SUNDAY") %><SPAN class="instreditalic">*</SPAN></LABEL>
		</TD>
	</TR>
	<TR class="ste">
		<TD class="ste" nowrap>   
			<LABEL ID="AGN_BS_label" class="userlabel"><%= field_labels.getString("MT_AGENCYSUPPLYMOD.AGN_BSL") %></LABEL>
		</TD>
		<TD class="ste" nowrap>
			<INPUT type="text" id="AGN_BS_MON" name="AGN_BS_MON" class="input" size="6" onblur="FieldValidation(this);" maxLength="6"  value="<%= (String)MT_AGENCYSUPPLYMODObj.get("AGN_BS_MON") %>" >
		</TD>
		<TD class="ste" nowrap>
			<INPUT type="text" id="AGN_BS_TUE" name="AGN_BS_TUE" class="input" size="6" onblur="FieldValidation(this);" maxLength="6"  value="<%= (String)MT_AGENCYSUPPLYMODObj.get("AGN_BS_TUE") %>" >
		</TD>
		<TD class="ste" nowrap>
			<INPUT type="text" id="AGN_BS_WED" name="AGN_BS_WED" class="input" size="6" onblur="FieldValidation(this);" maxLength="6"  value="<%= (String)MT_AGENCYSUPPLYMODObj.get("AGN_BS_WED") %>" >
		</TD>
		<TD class="ste" nowrap>
			<INPUT type="text" id="AGN_BS_THU" name="AGN_BS_THU" class="input" size="6" onblur="FieldValidation(this);" maxLength="6"  value="<%= (String)MT_AGENCYSUPPLYMODObj.get("AGN_BS_THU") %>" >
		</TD>
		<TD class="ste" nowrap>
			<INPUT type="text" id="AGN_BS_FRI" name="AGN_BS_FRI" class="input" size="6" onblur="FieldValidation(this);" maxLength="6"  value="<%= (String)MT_AGENCYSUPPLYMODObj.get("AGN_BS_FRI") %>" >
		</TD>
		<TD class="ste" nowrap>
			<INPUT type="text" id="AGN_BS_SAT" name="AGN_BS_SAT" class="input" size="6" onblur="FieldValidation(this);" maxLength="6"  value="<%= (String)MT_AGENCYSUPPLYMODObj.get("AGN_BS_SAT") %>" >
		</TD>
		<TD class="ste" nowrap>
			<INPUT type="text" id="AGN_BS_SUN" name="AGN_BS_SUN" class="input" size="6" onblur="FieldValidation(this);" maxLength="6"  value="<%= (String)MT_AGENCYSUPPLYMODObj.get("AGN_BS_SUN") %>" >
		</TD>
	</TR>

	<TR class="ste">
		<TD class="ste" nowrap>   
			<LABEL ID="AGN_SP_label" class="userlabel"><%= field_labels.getString("MT_AGENCYSUPPLYMOD.AGN_SP") %></LABEL>
		</TD>
		<TD class="ste" nowrap>
			<INPUT type="text" id="AGN_SP_MON" name="AGN_SP_MON" class="input" size="6" onblur="FieldValidation(this);" maxLength="6"  value="<%= (String)MT_AGENCYSUPPLYMODObj.get("AGN_SP_MON") %>" >
		</TD>
		<TD class="ste" nowrap>
			<INPUT type="text" id="AGN_SP_TUE" name="AGN_SP_TUE" class="input" size="6" onblur="FieldValidation(this);" maxLength="6"  value="<%= (String)MT_AGENCYSUPPLYMODObj.get("AGN_SP_TUE") %>" >
		</TD>
		<TD class="ste" nowrap>
			<INPUT type="text" id="AGN_SP_WED" name="AGN_SP_WED" class="input" size="6" onblur="FieldValidation(this);" maxLength="6"  value="<%= (String)MT_AGENCYSUPPLYMODObj.get("AGN_SP_WED") %>" >
		</TD>
		<TD class="ste" nowrap>
			<INPUT type="text" id="AGN_SP_THU" name="AGN_SP_THU" class="input" size="6" onblur="FieldValidation(this);" maxLength="6"  value="<%= (String)MT_AGENCYSUPPLYMODObj.get("AGN_SP_THU") %>" >
		</TD>
		<TD class="ste" nowrap>
			<INPUT type="text" id="AGN_SP_FRI" name="AGN_SP_FRI" class="input" size="6" onblur="FieldValidation(this);" maxLength="6"  value="<%= (String)MT_AGENCYSUPPLYMODObj.get("AGN_SP_FRI") %>" >
		</TD>
		<TD class="ste" nowrap>
			<INPUT type="text" id="AGN_SP_SAT" name="AGN_SP_SAT" class="input" size="6" onblur="FieldValidation(this);" maxLength="6"  value="<%= (String)MT_AGENCYSUPPLYMODObj.get("AGN_SP_SAT") %>" >
		</TD>
		<TD class="ste" nowrap>
			<INPUT type="text" id="AGN_SP_SUN" name="AGN_SP_SUN" class="input" size="6" onblur="FieldValidation(this);" maxLength="6"  value="<%= (String)MT_AGENCYSUPPLYMODObj.get("AGN_SP_SUN") %>" >
		</TD>
	</TR>

	<TR class="ste">
		<TD class="ste" nowrap>   
			<LABEL ID="AGN_SS_label" class="userlabel"><%= field_labels.getString("MT_AGENCYSUPPLYMOD.AGN_SS") %></LABEL>
		</TD>
		<TD class="ste" nowrap>
			<INPUT type="text" id="AGN_SS_MON" name="AGN_SS_MON" class="input" size="6" onblur="FieldValidation(this);" maxLength="6"  value="<%= (String)MT_AGENCYSUPPLYMODObj.get("AGN_SS_MON") %>" >
		</TD>
		<TD class="ste" nowrap>
			<INPUT type="text" id="AGN_SS_TUE" name="AGN_SS_TUE" class="input" size="6" onblur="FieldValidation(this);" maxLength="6"  value="<%= (String)MT_AGENCYSUPPLYMODObj.get("AGN_SS_TUE") %>" >
		</TD>
		<TD class="ste" nowrap>
			<INPUT type="text" id="AGN_SS_WED" name="AGN_SS_WED" class="input" size="6" onblur="FieldValidation(this);" maxLength="6"  value="<%= (String)MT_AGENCYSUPPLYMODObj.get("AGN_SS_WED") %>" >
		</TD>
		<TD class="ste" nowrap>
			<INPUT type="text" id="AGN_SS_THU" name="AGN_SS_THU" class="input" size="6" onblur="FieldValidation(this);" maxLength="6"  value="<%= (String)MT_AGENCYSUPPLYMODObj.get("AGN_SS_THU") %>" >
		</TD>
		<TD class="ste" nowrap>
			<INPUT type="text" id="AGN_SS_FRI" name="AGN_SS_FRI" class="input" size="6" onblur="FieldValidation(this);" maxLength="6"  value="<%= (String)MT_AGENCYSUPPLYMODObj.get("AGN_SS_FRI") %>" >
		</TD>
		<TD class="ste" nowrap>
			<INPUT type="text" id="AGN_SS_SAT" name="AGN_SS_SAT" class="input" size="6" onblur="FieldValidation(this);" maxLength="6"  value="<%= (String)MT_AGENCYSUPPLYMODObj.get("AGN_SS_SAT") %>" >
		</TD>
		<TD class="ste" nowrap>
			<INPUT type="text" id="AGN_SS_SUN" name="AGN_SS_SUN" class="input" size="6" onblur="FieldValidation(this);" maxLength="6"  value="<%= (String)MT_AGENCYSUPPLYMODObj.get("AGN_SS_SUN") %>" >
		</TD>
	</TR>


	<TR class="ste">
		<TD class="ste" nowrap>   
			<LABEL ID="AGN_CS_label" class="userlabel"><%= field_labels.getString("MT_AGENCYSUPPLYMOD.AGN_CS") %></LABEL>
		</TD>
		<TD class="ste" nowrap>
			<INPUT type="text" id="AGN_CS_MON" name="AGN_CS_MON" class="input" size="6" onblur="FieldValidation(this);" maxLength="6"  value="<%= (String)MT_AGENCYSUPPLYMODObj.get("AGN_CS_MON") %>" >
		</TD>
		<TD class="ste" nowrap>
			<INPUT type="text" id="AGN_CS_TUE" name="AGN_CS_TUE" class="input" size="6" onblur="FieldValidation(this);" maxLength="6"  value="<%= (String)MT_AGENCYSUPPLYMODObj.get("AGN_CS_TUE") %>" >
		</TD>
		<TD class="ste" nowrap>
			<INPUT type="text" id="AGN_CS_WED" name="AGN_CS_WED" class="input" size="6" onblur="FieldValidation(this);" maxLength="6"  value="<%= (String)MT_AGENCYSUPPLYMODObj.get("AGN_CS_WED") %>" >
		</TD>
		<TD class="ste" nowrap>
			<INPUT type="text" id="AGN_CS_THU" name="AGN_CS_THU" class="input" size="6" onblur="FieldValidation(this);" maxLength="6"  value="<%= (String)MT_AGENCYSUPPLYMODObj.get("AGN_CS_THU") %>" >
		</TD>
		<TD class="ste" nowrap>
			<INPUT type="text" id="AGN_CS_FRI" name="AGN_CS_FRI" class="input" size="6" onblur="FieldValidation(this);" maxLength="6"  value="<%= (String)MT_AGENCYSUPPLYMODObj.get("AGN_CS_FRI") %>" >
		</TD>
		<TD class="ste" nowrap>
			<INPUT type="text" id="AGN_CS_SAT" name="AGN_CS_SAT" class="input" size="6" onblur="FieldValidation(this);" maxLength="6"  value="<%= (String)MT_AGENCYSUPPLYMODObj.get("AGN_CS_SAT") %>" >
		</TD>
		<TD class="ste" nowrap>
			<INPUT type="text" id="AGN_CS_SUN" name="AGN_CS_SUN" class="input" size="6" onblur="FieldValidation(this);" maxLength="6"  value="<%= (String)MT_AGENCYSUPPLYMODObj.get("AGN_CS_SUN") %>" >
		</TD>
	</TR>

	<TR class="ste">
		<TD class="ste" nowrap>   
			<LABEL ID="AGN_FS_label" class="userlabel"><%= field_labels.getString("MT_AGENCYSUPPLYMOD.AGN_FS") %></LABEL>
		</TD>
		<TD class="ste" nowrap>
			<INPUT type="text" id="AGN_FS_MON" name="AGN_FS_MON" class="input" size="6" onblur="FieldValidation(this);" maxLength="6"  value="<%= (String)MT_AGENCYSUPPLYMODObj.get("AGN_FS_MON") %>" >
		</TD>
		<TD class="ste" nowrap>
			<INPUT type="text" id="AGN_FS_TUE" name="AGN_FS_TUE" class="input" size="6" onblur="FieldValidation(this);" maxLength="6"  value="<%= (String)MT_AGENCYSUPPLYMODObj.get("AGN_FS_TUE") %>" >
		</TD>
		<TD class="ste" nowrap>
			<INPUT type="text" id="AGN_FS_WED" name="AGN_FS_WED" class="input" size="6" onblur="FieldValidation(this);" maxLength="6"  value="<%= (String)MT_AGENCYSUPPLYMODObj.get("AGN_FS_WED") %>" >
		</TD>
		<TD class="ste" nowrap>
			<INPUT type="text" id="AGN_FS_THU" name="AGN_FS_THU" class="input" size="6" onblur="FieldValidation(this);" maxLength="6"  value="<%= (String)MT_AGENCYSUPPLYMODObj.get("AGN_FS_THU") %>" >
		</TD>
		<TD class="ste" nowrap>
			<INPUT type="text" id="AGN_FS_FRI" name="AGN_FS_FRI" class="input" size="6" onblur="FieldValidation(this);" maxLength="6"  value="<%= (String)MT_AGENCYSUPPLYMODObj.get("AGN_FS_FRI") %>" >
		</TD>
		<TD class="ste" nowrap>
			<INPUT type="text" id="AGN_FS_SAT" name="AGN_FS_SAT" class="input" size="6" onblur="FieldValidation(this);" maxLength="6"  value="<%= (String)MT_AGENCYSUPPLYMODObj.get("AGN_FS_SAT") %>" >
		</TD>
		<TD class="ste" nowrap>
			<INPUT type="text" id="AGN_FS_SUN" name="AGN_FS_SUN" class="input" size="6" onblur="FieldValidation(this);" maxLength="6"  value="<%= (String)MT_AGENCYSUPPLYMODObj.get("AGN_FS_SUN") %>" >
		</TD>
	</TR>

	<TR class="ste">
		<TD class="ste" nowrap>   
			<LABEL ID="AGN_TS_label" class="userlabel"><%= field_labels.getString("MT_AGENCYSUPPLYMOD.AGN_TS") %></LABEL>
		</TD>
		<TD class="ste" nowrap>
			<INPUT type="text" id="AGN_TS_MON" name="AGN_TS_MON" class="input" size="6" onblur="FieldValidation(this);" maxLength="6"  value="<%= (String)MT_AGENCYSUPPLYMODObj.get("AGN_TS_MON") %>" >
		</TD>
		<TD class="ste" nowrap>
			<INPUT type="text" id="AGN_TS_TUE" name="AGN_TS_TUE" class="input" size="6" onblur="FieldValidation(this);" maxLength="6"  value="<%= (String)MT_AGENCYSUPPLYMODObj.get("AGN_TS_TUE") %>" >
		</TD>
		<TD class="ste" nowrap>
			<INPUT type="text" id="AGN_TS_WED" name="AGN_TS_WED" class="input" size="6" onblur="FieldValidation(this);" maxLength="6"  value="<%= (String)MT_AGENCYSUPPLYMODObj.get("AGN_TS_WED") %>" >
		</TD>
		<TD class="ste" nowrap>
			<INPUT type="text" id="AGN_TS_THU" name="AGN_TS_THU" class="input" size="6" onblur="FieldValidation(this);" maxLength="6"  value="<%= (String)MT_AGENCYSUPPLYMODObj.get("AGN_TS_THU") %>" >
		</TD>
		<TD class="ste" nowrap>
			<INPUT type="text" id="AGN_TS_FRI" name="AGN_TS_FRI" class="input" size="6" onblur="FieldValidation(this);" maxLength="6"  value="<%= (String)MT_AGENCYSUPPLYMODObj.get("AGN_TS_FRI") %>" >
		</TD>
		<TD class="ste" nowrap>
			<INPUT type="text" id="AGN_TS_SAT" name="AGN_TS_SAT" class="input" size="6" onblur="FieldValidation(this);" maxLength="6"  value="<%= (String)MT_AGENCYSUPPLYMODObj.get("AGN_TS_SAT") %>" >
		</TD>
		<TD class="ste" nowrap>
			<INPUT type="text" id="AGN_TS_SUN" name="AGN_TS_SUN" class="input" size="6" onblur="FieldValidation(this);" maxLength="6"  value="<%= (String)MT_AGENCYSUPPLYMODObj.get("AGN_TS_SUN") %>" >
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
     <TR class="eventsrow2"> 
      <TD class="eventscol" align="right">


 		<INPUT TYPE="button" value="Submit" name="Submit_label" class="button" onClick="javascript:validateSubmit()">
		<INPUT TYPE="button" value="Clear" name="Clear_label" class="button"  onClick="reset_field()">
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