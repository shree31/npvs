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
	Logger logger = Logger.getLogger("MT_CENTER");

	HashMap MT_CENTERObj = (HashMap)request.getAttribute("RESPONSE");
	if(MT_CENTERObj == null)
  		MT_CENTERObj = new HashMap();

	String formName = "MT_CENTER";
%>

<TITLE id="MT_CENTER_title"><%= field_labels.getString("MT_CENTER.MT_CENTER_title") %></TITLE>

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
<SCRIPT type='text/javascript' language ='JavaScript' src='scripts/DatePicker.js'></SCRIPT>
<SCRIPT type="text/javascript" language ="JavaScript">
<!--

function execute_onLoad()
{
	clearNull();
}

function FieldValidation(as_field_name)
{
	return true;
}

// -->
</SCRIPT>


</HEAD>
<BODY class="mainbody" onLoad="execute_onLoad();">

<DIV id="MT_CENTER_div" >

<FORM name="MT_CENTER" id="MT_CENTER" method="post" action="distAppCommonActionServlet.do">
<INPUT type="hidden" id="Event" name="Event" value="">
<INPUT type="hidden" id="MAKER" name="MAKER" value="<%= (String)MT_CENTERObj.get("MAKER") %>">
<INPUT type="hidden" id="MAKER_DT" name="MAKER_DT" value="">
<INPUT type="hidden" id="STATUS" name="STATUS" value="<%= (String)MT_CENTERObj.get("STATUS") %>">
<INPUT type="hidden" id="MODE" name="MODE" value="INP">
<INPUT type="hidden" id="ENTITY" name="ENTITY" value="MT_CENTER">
<INPUT type="hidden" id="SCREEN_NAME" name="SCREEN_NAME" value="MT_CENTER">
<INPUT type="hidden" id="PARAM" name="PARAM" value="<%= (String)MT_CENTERObj.get("PARAM") %>">
<INPUT type="hidden" id="PARAM1" name="PARAM1" value="<%= (String)MT_CENTERObj.get("PARAM1") %>">
<INPUT type="hidden" id="PARAM2" name="PARAM2" value="<%= (String)MT_CENTERObj.get("PARAM2") %>">
<INPUT type="hidden" id="PRIMARY_KEY" name="PRIMARY_KEY" value="CNT_CODE">
<INPUT type="hidden" id="ERRDESC" name="ERRDESC" value="<%=(String)MT_CENTERObj.get("ERRDESC")%>">


  <TABLE class="headertable" cellspacing="0" cellpadding="0" width='100%'>
         <TD>&nbsp;</TD>
        <TR> 
           <TD class="heading" nowrap align="center">
            <%= field_labels.getString("MT_CENTER.MT_CENTER") %>
           </TD>
           <TD>&nbsp;</TD>
        </TR>
   </TABLE>

 <TABLE class="detailstable" cellspacing="0" cellpadding="0">

	<TR class="ste">
		<TD class="ste" nowrap>   
			<LABEL ID="CNT_CODE_label" class="userlabel"><%= field_labels.getString("MT_CENTER.CNT_CODE") %><SPAN class="instreditalic">*</SPAN></LABEL>
		</TD>
		<TD class="ste" colspan="2" nowrap>
			<INPUT type="text" id="CNT_CODE" name="CNT_CODE" class="input" size="10" onblur="FieldValidation(this);" maxLength="10"  value="<%= (String)MT_CENTERObj.get("CNT_CODE") %>" >
		</TD>
		</TR>
		<TR class="ste">
		<TD class="ste" nowrap>   
			<LABEL ID="CNT_NAME_label" class="userlabel"><%= field_labels.getString("MT_CENTER.CNT_NAME") %><SPAN class="instreditalic">*</SPAN></LABEL>
		</TD>
		<TD class="ste" colspan="2" nowrap>
			<INPUT type="text" id="CNT_NAME" name="CNT_NAME" class="input" size="65" onblur="FieldValidation(this);" maxLength="65"  value="<%= (String)MT_CENTERObj.get("CNT_NAME") %>" >
		</TD>
	</TR>
	<TR class="ste">
		<TD class="ste" nowrap>   
			<LABEL ID="CNT_OLD_CODE_label" class="userlabel"><%= field_labels.getString("MT_CENTER.CNT_OLD_CODE") %></LABEL>
		</TD>
		<TD class="ste" colspan="2" nowrap>
			<INPUT type="text" id="CNT_OLD_CODE" name="CNT_OLD_CODE" class="input" size="20" onblur="FieldValidation(this);" maxLength="20"  value="<%= (String)MT_CENTERObj.get("CNT_OLD_CODE") %>" >
		</TD>
	</TR>
	<TR class="ste">
		<TD class="ste" nowrap>   
			<LABEL ID="CMP_CODE_label" class="userlabel"><%= field_labels.getString("MT_CENTER.CMP_CODE") %><SPAN class="instreditalic">*</SPAN></LABEL>
		</TD>
		<TD class="ste" colspan="2" nowrap>
<!--			<INPUT type="text"  id="CMP_CODE" name="CMP_CODE" class="input" size="10" maxlength="10" onChange="FieldValidation(this); getCodeDesc('CMP_CODE','CMP_CODEDESC', 'g_pkl_companyDesc','')"  value="<%= (String)MT_CENTERObj.get("CMP_CODE")%>"> -->

	<SELECT class="input"name='CMP_CODE' id="CMP_CODE" onChange="FieldValidation(this);getCodeDesc('CMP_CODE','CMP_CODEDESC', 'g_pkl_companyDesc','');"  onBlur="FieldValidation(this);" >
		<%
			out.println("<option value=''>Select</option>");
			out.println(obj_fetch_pick_vals.createOptionValues("g_pkl_company","",db_name,insstalled_at));
		%>
	</SELECT>

           	  <INPUT type="text" id="CMP_CODEDESC" name="CMP_CODEDESC" class="input" size="50" readonly  maxLength="50" value="<%= 
	(String)MT_CENTERObj.get("CMP_CODEDESC") %>" >
<!--		<A id="CMP_CODEHLP" name="CMP_CODEHLP"  href="#" onClick="getPicklistValues('g_pkl_company','CMP_CODE','','')" class="linkblue" >?</A> &nbsp; -->
			</TD>
	</TR>
	<TR class="ste">
		<TD class="ste" nowrap>   
			<LABEL ID="CNT_ADD1_label" class="userlabel"><%= field_labels.getString("MT_CENTER.CNT_ADD1") %></LABEL>
		</TD>
		<TD class="ste" colspan="2" nowrap>
			<INPUT type="text" id="CNT_ADD1" name="CNT_ADD1" class="input" size="60" onblur="FieldValidation(this);" maxLength="60"  value="<%= (String)MT_CENTERObj.get("CNT_ADD1") %>" >
		</TD>
	</TR>
	<TR class="ste">
		<TD class="ste" nowrap>   
			<LABEL ID="CNT_ADD2_label" class="userlabel"><%= field_labels.getString("MT_CENTER.CNT_ADD2") %></LABEL>
		</TD>
		<TD class="ste" colspan="2" nowrap>
			<INPUT type="text" id="CNT_ADD2" name="CNT_ADD2" class="input" size="60" onblur="FieldValidation(this);" maxLength="60"  value="<%=(String)MT_CENTERObj.get("CNT_ADD2")%>" >
		</TD>
	</TR>

	<TR class="ste">
		<TD class="ste" nowrap>   
			<LABEL ID="COUNTRY_label" class="userlabel"><%= field_labels.getString("MT_CENTER.COUNTRY") %></LABEL>
		</TD>
		<TD class="ste" colspan="2" nowrap>
			<INPUT type="text" id="COUNTRY" name="COUNTRY" class="input" size="10" readonly onChange="FieldValidation(this);getCodeDesc('COUNTRY','COUNTRYDESC','g_pkl_countryDesc','KEY_CODE');" maxLength="10"  value="<%= (String)MT_CENTERObj.get("COUNTRY") %>" >
	  <INPUT type="text" id="COUNTRYDESC" name="COUNTRYDESC" class="input" size="50" readonly  maxLength="50" value="<%= 
	(String)MT_CENTERObj.get("COUNTRYDESC") %>" >
			<A id="COUNTRYHLP" name="COUNTRYHLP"  href="#" onClick="getPicklistValues('g_pkl_country','COUNTRY','','')" class="linkblue" >?</A> &nbsp;

			</TD>
	</TR>

	<TR class="ste">
		<TD class="ste" nowrap>   
			<LABEL ID="STATE_label" class="userlabel"><%= field_labels.getString("MT_CENTER.STATE") %></LABEL>
		</TD>
		<TD class="ste" colspan="2" nowrap>
			<INPUT type="text" id="STATE" name="STATE" class="input" size="10" onChange="FieldValidation(this);getCodeDesc('STATE','STATEDESC','g_pkl_stateDesc','KEY_CODE');" maxLength="10"  value="<%= (String)MT_CENTERObj.get("STATE") %>" >

	  <INPUT type="text" id="STATEDESC" name="STATEDESC" class="input" size="50" readonly  maxLength="50" value="<%= 
	(String)MT_CENTERObj.get("STATEDESC") %>" >
		<A id="STATEHLP" name="STATEHLP"  href="#" onClick="getPicklistValues('g_pkl_state','STATE','COUNTRY','KEY_TYPE')" class="linkblue" >?</A> &nbsp;
			</TD>
	</TR>

	<TR class="ste">
		<TD class="ste" nowrap>   
			<LABEL ID="CITY_label" class="userlabel"><%= field_labels.getString("MT_CENTER.CITY") %><SPAN class="instreditalic">*</SPAN></LABEL>
		</TD>
		<TD class="ste" colspan="2" nowrap>
			<INPUT type="text" id="CITY" name="CITY" class="input" size="10" onChange="FieldValidation(this);getCodeDesc( 'CITY','CITYDESC','g_pkl_cityDesc','KEY_CODE');" maxLength="10"  value="<%= (String)MT_CENTERObj.get("CITY") %>" >

	  <INPUT type="text" id="CITYDESC" name="CITYDESC" class="input" size="50" readonly  maxLength="50" value="<%= 
	(String)MT_CENTERObj.get("CITYDESC") %>" >
		<A id="CITYHLP" name="CITYHLP"  href="#" onClick="getPicklistValues('g_pkl_city','CITY','STATE','KEY_TYPE')" class="linkblue" >?</A> &nbsp;
			</TD>
	</TR>
	<TR class="ste">
		<TD class="ste" nowrap>   
			<LABEL ID="CNT_ADD_PIN_label" class="userlabel"><%= field_labels.getString("MT_CENTER.CNT_ADD_PIN") %></LABEL>
		</TD>
		<TD class="ste" colspan="2" nowrap>
			<INPUT type="text" id="CNT_ADD_PIN" name="CNT_ADD_PIN" class="input" size="6" onblur="FieldValidation(this);" maxLength="6"  value="<%= (String)MT_CENTERObj.get("CNT_ADD_PIN") %>" >
		</TD>
	</TR>
	<TR class="ste">
		<TD class="ste" nowrap>   
			<LABEL ID="CNT_TEL_label" class="userlabel"><%= field_labels.getString("MT_CENTER.CNT_TEL") %></LABEL>
		</TD>
		<TD class="ste" colspan="2" nowrap>
			<INPUT type="text" id="CNT_TEL" name="CNT_TEL" class="input" size="20" onblur="FieldValidation(this);" maxLength="20"  value="<%= (String)MT_CENTERObj.get("CNT_TEL") %>" >
		</TD>
	</TR>
	<TR class="ste">
		<TD class="ste" nowrap>   
			<LABEL ID="CNT_FAX_label" class="userlabel"><%= field_labels.getString("MT_CENTER.CNT_FAX") %></LABEL>
		</TD>
		<TD class="ste" colspan="2" nowrap>
			<INPUT type="text" id="CNT_FAX" name="CNT_FAX" class="input" size="20" onblur="FieldValidation(this);" maxLength="20"  value="<%= (String)MT_CENTERObj.get("CNT_FAX") %>" >
		</TD>
	</TR>
	<TR class="ste">
		<TD class="ste" nowrap>   
			<LABEL ID="CNT_VALID_FLG_label" class="userlabel"><%= field_labels.getString("MT_CENTER.CNT_VALID_FLG") %><SPAN class="instreditalic">*</SPAN></LABEL>
		</TD>
		<TD class="ste" colspan="2" nowrap>

		<INPUT type="radio" id="CNT_VALID_FLG" name="CNT_VALID_FLG" checked onClick="FieldValidation(this);" value="Y" accessKey="Y" ><%= field_labels.getString("radio_yes") %>

		<INPUT type="radio" id="CNT_VALID_FLG" name="CNT_VALID_FLG"  onClick="FieldValidation(this);" value="N" accessKey="N" ><%= field_labels.getString("radio_no") %>

	</TD>	
	</TR>
	<TR class="ste">
		<TD class="ste" nowrap>   
			<LABEL ID="CNT_DISTR_FLG_label" class="userlabel"><%= field_labels.getString("MT_CENTER.CNT_DISTR_FLG") %><SPAN class="instreditalic">*</SPAN></LABEL>
		</TD>
		<TD class="ste" colspan="2" nowrap>

		<INPUT type="radio" id="CNT_DISTR_FLG" name="CNT_DISTR_FLG" checked onClick="FieldValidation(this);" value="Y" accessKey="Y" ><%= field_labels.getString("radio_yes") %>

		<INPUT type="radio" id="CNT_DISTR_FLG" name="CNT_DISTR_FLG"  onClick="FieldValidation(this);" value="N" accessKey="N" ><%= field_labels.getString("radio_no") %>

	</TD>	
	</TR>
		<TR class="ste">
		<TD class="ste" nowrap>   
			<LABEL ID="CNT_EDITN_FLG_label" class="userlabel"><%= field_labels.getString("MT_CENTER.CNT_EDITN_FLG") %><SPAN class="instreditalic">*</SPAN></LABEL>
		</TD>
		<TD class="ste" colspan="2" nowrap>

		<INPUT type="radio" id="CNT_EDITN_FLG" name="CNT_EDITN_FLG" checked onClick="FieldValidation(this);" value="Y" accessKey="Y" ><%= field_labels.getString("radio_yes") %>

		<INPUT type="radio" id="CNT_EDITN_FLG" name="CNT_EDITN_FLG"  onClick="FieldValidation(this);" value="N" accessKey="N" ><%= field_labels.getString("radio_no") %>

	</TD>	
	</TR>

	<TR class="ste">
		<TD class="ste" nowrap>   
			<LABEL ID="CNT_REMARKS_label" class="userlabel"><%= field_labels.getString("MT_CENTER.CNT_REMARKS") %></LABEL>
		</TD>
		<TD class="ste" colspan="2" nowrap>
			<INPUT type="text" id="CNT_REMARKS" name="CNT_REMARKS" class="input" size="100" onblur="FieldValidation(this);" maxLength="200"  value="<%= (String)MT_CENTERObj.get("CNT_REMARKS") %>" >

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
