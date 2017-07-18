<%@ include file="DISTAPPWDResourceProvider.jsp" %>
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
	Logger logger = Logger.getLogger("MT_COMPANY");

	HashMap MT_COMPANYObj = (HashMap)request.getAttribute("RESPONSE");

	
	if(MT_COMPANYObj == null)
  		MT_COMPANYObj = new HashMap();

	String formName = "MT_COMPANYVIEW";

%>




<TITLE id="MT_COMPANY_title"><%= field_labels.getString("MT_COMPANY.MT_COMPANY_title") %></TITLE>

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

function execute_onLoad()
{
		clearNull();
}

function FieldValidation(as_field_name)
{
	return true;
}


</SCRIPT>


<SCRIPT type="text/javascript" language = "JavaScript">
</script>

</HEAD>
<BODY class="mainbody" onLoad="execute_onLoad()" >

<DIV id="MT_COMPANY_div" >

<FORM name="MT_COMPANY" id="MT_COMPANY" method="post" action="distAppCommonActionServlet.do">
<INPUT type="hidden" id="Event" name="Event" value="">
<INPUT type="hidden" id="MAKER" name="MAKER" value="<%= (String)MT_COMPANYObj.get("MAKER") %>">
<INPUT type="hidden" id="MAKER_DT" name="MAKER_DT" value="">
<INPUT type="hidden" id="STATUS" name="STATUS" value="<%= (String)MT_COMPANYObj.get("STATUS") %>">
<INPUT type="hidden" id="MODE" name="MODE" value="">
<INPUT type="hidden" id="PARAM1" name="PARAM1" value="<%= (String)MT_COMPANYObj.get("PARAM1") %>">
<INPUT type="hidden" id="PARAM2" name="PARAM2" value="<%= (String)MT_COMPANYObj.get("PARAM2") %>">
<INPUT type="hidden" id="ENTITY" name="ENTITY" value="MT_COMPANY">
<INPUT type="hidden" id="SCREEN_NAME" name="SCREEN_NAME" value="MT_COMPANYVIEW">
<INPUT type="hidden" id="ERRDESC" name="ERRDESC" value="<%= (String)MT_COMPANYObj.get("ERRDESC") %>">
<INPUT type="hidden" id="PRIMARY_KEY" name="PRIMARY_KEY" value="CMP_CODE">

   <TABLE class="headertable" cellspacing="0" cellpadding="0" width='100%'>
         <TD>&nbsp;</TD>
        <TR> 
           <TD class="heading" nowrap align="center">
            <%= field_labels.getString("MT_COMPANY.MT_COMPANY") %>
           </TD>
           <TD>&nbsp;</TD>
        </TR>
   </TABLE>
 
 <TABLE class="detailstable" cellspacing="0" cellpadding="0">


	<TR class="ste">
		<TD class="ste" nowrap>   
			<LABEL ID="CMP_CODE_label" class="userlabel"><%= field_labels.getString("MT_COMPANY.CMP_CODE") %><SPAN class="instreditalic">*</SPAN></LABEL>
		</TD>
		<TD class="ste" colspan="2" nowrap>
			<INPUT type="text" id="CMP_CODE" name="CMP_CODE" class="input" size="10" onchange="getCodeDesc('CMP_CODE','CMP_NAME','g_pkl_companyDesc','');" maxLength="10"  value="<%= (String)MT_COMPANYObj.get("CMP_CODE") %>" >
				<A id="CMP_CODEHLP" name="CMP_CODEHLP"  href="#" onClick="getPicklistValues('g_pkl_company','CMP_CODE','','')" class="linkblue" >?</A> &nbsp;
	
		</TD>
	</TR>
	<TR class="ste">
		<TD class="ste" nowrap>   
			<LABEL ID="CMP_NAME_label" class="userlabel"><%= field_labels.getString("MT_COMPANY.CMP_NAME") %><SPAN class="instreditalic">*</SPAN></LABEL>
		</TD>
		<TD class="ste" colspan="2" nowrap>
			<INPUT type="text" id="CMP_NAME" name="CMP_NAME" class="input" size="65" onblur="FieldValidation(this);" maxLength="65"  value="<%= (String)MT_COMPANYObj.get("CMP_NAME") %>" >
		</TD>
	</TR>
	<TR class="ste">
		<TD class="ste" nowrap>   
			<LABEL ID="CMP_SHORTNM_label" class="userlabel"><%= field_labels.getString("MT_COMPANY.CMP_SHORTNM") %></LABEL>
		</TD>
		<TD class="ste" colspan="2" nowrap>
			<INPUT type="text" id="CMP_SHORTNM" name="CMP_SHORTNM" class="input" size="12" onblur="FieldValidation(this);" maxLength="12"  value="<%= (String)MT_COMPANYObj.get("CMP_SHORTNM") %>" >
		</TD>
	</TR>
	<TR class="ste">
		<TD class="ste" nowrap>   
			<LABEL ID="CMP_ADD1_label" class="userlabel"><%= field_labels.getString("MT_COMPANY.CMP_ADD1") %></LABEL>
		</TD>
		<TD class="ste" colspan="2" nowrap>
			<INPUT type="text" id="CMP_ADD1" name="CMP_ADD1" class="input" size="60" onblur="FieldValidation(this);" maxLength="60"  value="<%= (String)MT_COMPANYObj.get("CMP_ADD1") %>" >
		</TD>
	</TR>
	<TR class="ste">
		<TD class="ste" nowrap>   
			<LABEL ID="CMP_ADD2_label" class="userlabel"><%= field_labels.getString("MT_COMPANY.CMP_ADD2") %></LABEL>
		</TD>
		<TD class="ste" colspan="2" nowrap>
			<INPUT type="text" id="CMP_ADD2" name="CMP_ADD2" class="input" size="60" onblur="FieldValidation(this);" maxLength="60"  value="<%= (String)MT_COMPANYObj.get("CMP_ADD2") %>" >
		</TD>
	</TR>
	<TR class="ste">
		<TD class="ste" nowrap>   
			<LABEL ID="COUNTRY_label" class="userlabel"><%= field_labels.getString("MT_COMPANY.COUNTRY") %></LABEL>
		</TD>
		<TD class="ste" colspan="2" nowrap>
			<INPUT type="text" id="COUNTRY" name="COUNTRY" class="input" size="10" readonly onChange="FieldValidation(this);getCodeDesc('COUNTRY','COUNTRYDESC','g_pkl_countryDesc','KEY_CODE');" maxLength="10"  value="<%= (String)MT_COMPANYObj.get("COUNTRY") %>" >
	  <INPUT type="text" id="COUNTRYDESC" name="COUNTRYDESC" class="input" size="50" readonly  maxLength="50" value="<%= 
	(String)MT_COMPANYObj.get("COUNTRYDESC") %>" >
			<A id="COUNTRYHLP" name="COUNTRYHLP"  href="#" onClick="getPicklistValues('g_pkl_country','COUNTRY','','')" class="linkblue" >?</A> &nbsp;

			</TD>
	</TR>

	<TR class="ste">
		<TD class="ste" nowrap>   
			<LABEL ID="STATE_label" class="userlabel"><%= field_labels.getString("MT_COMPANY.STATE") %></LABEL>
		</TD>
		<TD class="ste" colspan="2" nowrap>
			<INPUT type="text" id="STATE" name="STATE" class="input" size="10" onChange="FieldValidation(this);getCodeDesc('STATE','STATEDESC','g_pkl_stateDesc','KEY_CODE');" maxLength="10"  value="<%= (String)MT_COMPANYObj.get("STATE") %>" >

	  <INPUT type="text" id="STATEDESC" name="STATEDESC" class="input" size="50" readonly  maxLength="50" value="<%= 
	(String)MT_COMPANYObj.get("STATEDESC") %>" >
		<A id="STATEHLP" name="STATEHLP"  href="#" onClick="getPicklistValues('g_pkl_state','STATE','COUNTRY','KEY')" class="linkblue" >?</A> &nbsp;
			</TD>
	</TR>

	<TR class="ste">
		<TD class="ste" nowrap>   
			<LABEL ID="CITY_label" class="userlabel"><%= field_labels.getString("MT_COMPANY.CITY") %></LABEL>
		</TD>
		<TD class="ste" colspan="2" nowrap>
			<INPUT type="text" id="CITY" name="CITY" class="input" size="10" onChange="FieldValidation(this);getCodeDesc( 'CITY','CITYDESC','g_pkl_cityDesc','KEY_CODE');" maxLength="10"  value="<%= (String)MT_COMPANYObj.get("CITY") %>" >

	  <INPUT type="text" id="CITYDESC" name="CITYDESC" class="input" size="50" readonly  maxLength="50" value="<%= 
	(String)MT_COMPANYObj.get("CITYDESC") %>" >
		<A id="CITYHLP" name="CITYHLP"  href="#" onClick="getPicklistValues('g_pkl_city','CITY','STATE','KEY')" class="linkblue" >?</A> &nbsp;
			</TD>
	</TR>

	<TR class="ste">
		<TD class="ste" nowrap>   
			<LABEL ID="CMP_ADD_PIN_label" class="userlabel"><%= field_labels.getString("MT_COMPANY.CMP_ADD_PIN") %></LABEL>
		</TD>
		<TD class="ste" colspan="2" nowrap>
			<INPUT type="text" id="CMP_ADD_PIN" name="CMP_ADD_PIN" class="input" size="6" onblur="FieldValidation(this);"  value="<%= (String)MT_COMPANYObj.get("CMP_ADD_PIN") %>" >
		</TD>
	</TR>
	<TR class="ste">
		<TD class="ste" nowrap>   
			<LABEL ID="CMP_TEL_label" class="userlabel"><%= field_labels.getString("MT_COMPANY.CMP_TEL") %></LABEL>
		</TD>
		<TD class="ste" colspan="2" nowrap>
			<INPUT type="text" id="CMP_TEL" name="CMP_TEL" class="input" size="20" onblur="FieldValidation(this);" maxLength="20"  value="<%= (String)MT_COMPANYObj.get("CMP_TEL") %>" >
		</TD>
	</TR>
	<TR class="ste">
		<TD class="ste" nowrap>   
			<LABEL ID="CMP_FAX_label" class="userlabel"><%= field_labels.getString("MT_COMPANY.CMP_FAX") %></LABEL>
		</TD>
		<TD class="ste" colspan="2" nowrap>
			<INPUT type="text" id="CMP_FAX" name="CMP_FAX" class="input" size="20" onblur="FieldValidation(this);" maxLength="20"  value="<%= (String)MT_COMPANYObj.get("CMP_FAX") %>" >
		</TD>
	</TR>
	<TR class="ste">
		<TD class="ste" nowrap>   
			<LABEL ID="CMP_WEBADD_label" class="userlabel"><%= field_labels.getString("MT_COMPANY.CMP_WEBADD") %></LABEL>
		</TD>
		<TD class="ste" colspan="2" nowrap>
			<INPUT type="text" id="CMP_WEBADD" name="CMP_WEBADD" class="input" size="60" onblur="FieldValidation(this);" maxLength="60"  value="<%= (String)MT_COMPANYObj.get("CMP_WEBADD") %>" >
		</TD>
	</TR>
	<TR class="ste">
		<TD class="ste" nowrap>   
			<LABEL ID="CMP_CONNM_label" class="userlabel"><%= field_labels.getString("MT_COMPANY.CMP_CONNM") %></LABEL>
		</TD>
		<TD class="ste" colspan="2" nowrap>
			<INPUT type="text" id="CMP_CONNM" name="CMP_CONNM" class="input" size="40" onblur="FieldValidation(this);" maxLength="40"  value="<%= (String)MT_COMPANYObj.get("CMP_CONNM") %>" >
		</TD>
	</TR>
	<TR class="ste">
		<TD class="ste" nowrap>   
			<LABEL ID="CMP_CONTEL_label" class="userlabel"><%= field_labels.getString("MT_COMPANY.CMP_CONTEL") %></LABEL>
		</TD>
		<TD class="ste" colspan="2" nowrap>
			<INPUT type="text" id="CMP_CONTEL" name="CMP_CONTEL" class="input" size="20" onblur="FieldValidation(this);" maxLength="20"  value="<%= (String)MT_COMPANYObj.get("CMP_CONTEL") %>" >
		</TD>
	</TR>
	<TR class="ste">
		<TD class="ste" nowrap>   
			<LABEL ID="CMP_CONEMAIL_label" class="userlabel"><%= field_labels.getString("MT_COMPANY.CMP_CONEMAIL") %></LABEL>
		</TD>
		<TD class="ste" colspan="2" nowrap>
			<INPUT type="text" id="CMP_CONEMAIL" name="CMP_CONEMAIL" class="input" size="60" onblur="FieldValidation(this);" maxLength="60"  value="<%= (String)MT_COMPANYObj.get("CMP_CONEMAIL") %>" >
		</TD>
	</TR>
	<TR class="ste">
		<TD class="ste" nowrap>   
			<LABEL ID="CMP_REMARKS_label" class="userlabel"><%= field_labels.getString("MT_COMPANY.CMP_REMARKS") %></LABEL>
		</TD>
		<TD class="ste" colspan="2" nowrap>
			<INPUT type="text" id="CMP_REMARKS" name="CMP_REMARKS" class="input" size="100" onblur="FieldValidation(this);" maxLength="200"  value="<%= (String)MT_COMPANYObj.get("CMP_REMARKS") %>" >
		</TD>
	</TR>
	<TR class="ste">
		<TD class="ste" nowrap>   
			<LABEL ID="CMP_REMARKS2_label" class="userlabel"><%= field_labels.getString("MT_COMPANY.CMP_REMARKS2") %></LABEL>
		</TD>
		<TD class="ste" colspan="2" nowrap>
			<INPUT type="text" id="CMP_REMARKS2" name="CMP_REMARKS2" class="input" size="100" onblur="FieldValidation(this);" maxLength="200"  value="<%= (String)MT_COMPANYObj.get("CMP_REMARKS2") %>" >
		</TD>
	</TR>
	<TR class="ste">
		<TD class="ste" nowrap>   
			<LABEL ID="CMP_REMARKS3_label" class="userlabel"><%= field_labels.getString("MT_COMPANY.CMP_REMARKS3") %></LABEL>
		</TD>
		<TD class="ste" colspan="2" nowrap>
			<INPUT type="text" id="CMP_REMARKS3" name="CMP_REMARKS3" class="input" size="100" onblur="FieldValidation(this);" maxLength="200"  value="<%= (String)MT_COMPANYObj.get("CMP_REMARKS3") %>" >
		</TD>
	</TR>
	<TR class="ste">
		<TD class="ste" nowrap>   
			<LABEL ID="CMP_REMARKS4_label" class="userlabel"><%= field_labels.getString("MT_COMPANY.CMP_REMARKS4") %></LABEL>
		</TD>
		<TD class="ste" colspan="2" nowrap>
			<INPUT type="text" id="CMP_REMARKS4" name="CMP_REMARKS4" class="input" size="100" onblur="FieldValidation(this);" maxLength="200"  value="<%= (String)MT_COMPANYObj.get("CMP_REMARKS4") %>" >
		</TD>
	</TR>
	<TR class="ste">
		<TD class="ste" nowrap>   
			<LABEL ID="BILL_HEADER_label" class="userlabel"><%= field_labels.getString("MT_COMPANY.BILL_HEADER") %></LABEL>
		</TD>
		<TD class="ste" colspan="2" nowrap>
			<INPUT type="text" id="BILL_HEADER" name="BILL_HEADER" class="input" size="100" onblur="FieldValidation(this);" maxLength="200"  value="<%= (String)MT_COMPANYObj.get("BILL_HEADER") %>" >
		</TD>
	</TR>
	<TR class="ste">
		<TD class="ste" nowrap>   
			<LABEL ID="CMP_BHNM_label" class="userlabel"><%= field_labels.getString("MT_COMPANY.CMP_BHNM") %></LABEL>
		</TD>
		<TD class="ste" colspan="2" nowrap>
			<INPUT type="text" id="CMP_BHNM" name="CMP_BHNM" class="input" size="40" onblur="FieldValidation(this);" maxLength="40"  value="<%= (String)MT_COMPANYObj.get("CMP_BHNM") %>" >
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
     <TR > 
      <TD align="right">


		<INPUT TYPE="button" value="Submit" name="Submit_label" class="button" onClick="javascript:validateSubmit()">
		<INPUT TYPE="button" value="Clear" name="Clear_label" class="button"  onClick="Rest()">
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