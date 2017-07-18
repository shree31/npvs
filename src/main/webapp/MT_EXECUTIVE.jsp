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
	Logger logger = Logger.getLogger("MT_EXECUTIVE");

	HashMap MT_EXECUTIVEObj = (HashMap)request.getAttribute("RESPONSE");

	
	if(MT_EXECUTIVEObj == null)
  		MT_EXECUTIVEObj = new HashMap();

	String formName = "MT_EXECUTIVE";

%>

<TITLE id="MT_EXECUTIVE_title"><%= field_labels.getString("MT_EXECUTIVE.MT_EXECUTIVE_title") %></TITLE>

<LINK rel='stylesheet' href='scripts/style.css' type='text/css'>
<SCRIPT Language='Javascript' type='text/javascript' src='scripts/CommonFunctions.js'></SCRIPT>
<SCRIPT Language='Javascript' type='text/javascript' src='scripts/DatePicker.js'></SCRIPT>
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
		SaveForm('Save');
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
		var l_numeric_flds = "TRGT,TRGT_ACH";

	if(l_numeric_flds.indexOf(as_field_name.name)!=-1 && as_field_name.value!="")
	{
		if(IsNumeric(as_field_name)==false) return false;
	}
	return true;
}

function validateForm(as_event_label)
{
	return true;
}

</SCRIPT>


<SCRIPT type="text/javascript" language = "JavaScript">
</script>

</HEAD>
<BODY class="mainbody" onLoad="execute_onLoad()" >
<DIV id="MT_EXECUTIVE_div" >

<FORM name="MT_EXECUTIVE" id="MT_EXECUTIVE" method="post" action="distAppCommonActionServlet.do">
<INPUT type="hidden" id="Event" name="Event" value="">
<INPUT type="hidden" id="MAKER" name="MAKER" value="<%= (String)MT_EXECUTIVEObj.get("MAKER") %>">
<INPUT type="hidden" id="MAKER_DT" name="MAKER_DT" value="">
<INPUT type="hidden" id="STATUS" name="STATUS" value="<%= (String)MT_EXECUTIVEObj.get("STATUS") %>">
<INPUT type="hidden" id="MODE" name="MODE" value="INP">
<INPUT type="hidden" id="ENTITY" name="ENTITY" value="MT_EXECUTIVE">
<INPUT type="hidden" id="PARAM" name="PARAM" value="<%= (String)MT_EXECUTIVEObj.get("PARAM") %>">
<INPUT type="hidden" id="PRIMARY_KEY" name="PRIMARY_KEY" value="EXEC_CODE">
<INPUT type="hidden" id="PARAM1" name="PARAM1" value="<%= (String)MT_EXECUTIVEObj.get("PARAM1") %>">
<INPUT type="hidden" id="PARAM2" name="PARAM2" value="<%= (String)MT_EXECUTIVEObj.get("PARAM2") %>">
<INPUT type="hidden" id="SCREEN_NAME" name="SCREEN_NAME" value="MT_EXECUTIVE">
<INPUT type="hidden" id="ERRDESC" name="ERRDESC" value="<%=(String)MT_EXECUTIVEObj.get("ERRDESC")%>">

   <TABLE class="headertable" cellspacing="0" cellpadding="0" width='100%'>
         <TD>&nbsp;</TD>
        <TR> 
           <TD class="heading" nowrap align="center">
            <%= field_labels.getString("MT_EXECUTIVE.MT_EXECUTIVE") %>
           </TD>
           <TD>&nbsp;</TD>
        </TR>
   </TABLE>
 
 <TABLE class="detailstable" cellspacing="0" cellpadding="0">

	<TR class="ste">
		<TD class="ste" nowrap>   
			<LABEL ID="EXEC_CODE_label" class="userlabel"><%= field_labels.getString("MT_EXECUTIVE.EXEC_CODE") %><SPAN class="instreditalic">*</SPAN></LABEL>
		</TD>
		<TD class="ste" colspan="2" nowrap>
			<INPUT type="text" id="EXEC_CODE" name="EXEC_CODE" class="input" size="10" onblur="FieldValidation(this);" maxLength="10"  value="<%= (String)MT_EXECUTIVEObj.get("EXEC_CODE") %>" >
		</TD>
	</TR>
	<TR class="ste">
		<TD class="ste" nowrap>   
			<LABEL ID="NAME_label" class="userlabel"><%= field_labels.getString("MT_EXECUTIVE.NAME") %><SPAN class="instreditalic">*</SPAN></LABEL>
		</TD>
		<TD class="ste" colspan="2" nowrap>
			<INPUT type="text" id="NAME" name="NAME" class="input" size="65" onblur="FieldValidation(this);" maxLength="65"  value="<%= (String)MT_EXECUTIVEObj.get("NAME") %>" >
		</TD>
	</TR>
<!--	<TR class="ste">
		<TD class="ste" nowrap>   
			<LABEL ID="OLD_CODE_label" class="userlabel"><%= field_labels.getString("MT_EXECUTIVE.OLD_CODE") %></LABEL>
		</TD>
		<TD class="ste" colspan="2" nowrap>
			<INPUT type="text" id="OLD_CODE" name="OLD_CODE" class="input" size="20" onblur="FieldValidation(this);" maxLength="20"  value="<%= (String)MT_EXECUTIVEObj.get("OLD_CODE") %>" >
		</TD>
	</TR>
	<TR class="ste">
		<TD class="ste" nowrap>   
			<LABEL ID="TYPE_label" class="userlabel"><%= field_labels.getString("MT_EXECUTIVE.TYPE") %><SPAN class="instreditalic">*</SPAN></LABEL>
		</TD>
		<TD class="ste" colspan="2" nowrap>

			<INPUT type="text" id="TYPE" name="TYPE" class="input" size="10" onChange="FieldValidation(this);getCodeDesc('TYPE','TYPEDESC', 'g_pkl_exectypeDesc','KEY_CODE');" maxLength="10"  value="<%= (String)MT_EXECUTIVEObj.get("TYPE") %>" >

	  <INPUT type="text" id="TYPEDESC" name="TYPEDESC" class="input" size="50" readonly  maxLength="50" value="<%= 
	(String)MT_EXECUTIVEObj.get("TYPEDESC") %>" >
	<A id="TYPEHLP" name="TYPEHLP"  href="#" onClick="getPicklistValues('g_pkl_exectype','TYPE','','')" class="linkblue" >?</A> &nbsp;

		</TD>
	</TR>
	<TR class="ste">
		<TD class="ste" nowrap>   
			<LABEL ID="ADD1_label" class="userlabel"><%= field_labels.getString("MT_EXECUTIVE.ADD1") %></LABEL>
		</TD>
		<TD class="ste" colspan="2" nowrap>
			<INPUT type="text" id="ADD1" name="ADD1" class="input" size="60" onblur="FieldValidation(this);" maxLength="60"  value="<%= (String)MT_EXECUTIVEObj.get("ADD1") %>" >
		</TD>
	</TR>
	<TR class="ste">
		<TD class="ste" nowrap>   
			<LABEL ID="ADD2_label" class="userlabel"><%= field_labels.getString("MT_EXECUTIVE.ADD2") %></LABEL>
		</TD>
		<TD class="ste" colspan="2" nowrap>
			<INPUT type="text" id="ADD2" name="ADD2" class="input" size="60" onblur="FieldValidation(this);" maxLength="60"  value="<%= (String)MT_EXECUTIVEObj.get("ADD2") %>" >
		</TD>
	</TR>
	<TR class="ste">
		<TD class="ste" nowrap>   
			<LABEL ID="TELE_label" class="userlabel"><%= field_labels.getString("MT_EXECUTIVE.TELE") %></LABEL>
		</TD>
		<TD class="ste" colspan="2" nowrap>
			<INPUT type="text" id="TELE" name="TELE" class="input" size="20" onblur="FieldValidation(this);" maxLength="20"  value="<%= (String)MT_EXECUTIVEObj.get("TELE") %>" >
		</TD>
	</TR>
	<TR class="ste">
		<TD class="ste" nowrap>   
			<LABEL ID="MOB_label" class="userlabel"><%= field_labels.getString("MT_EXECUTIVE.MOB") %></LABEL>
		</TD>
		<TD class="ste" colspan="2" nowrap>
			<INPUT type="text" id="MOB" name="MOB" class="input" size="20" onblur="FieldValidation(this);" maxLength="20"  value="<%= (String)MT_EXECUTIVEObj.get("MOB") %>" >
		</TD>
	</TR>
	<TR class="ste">
		<TD class="ste" nowrap>   
			<LABEL ID="AREA_label" class="userlabel"><%= field_labels.getString("MT_EXECUTIVE.AREA") %><SPAN class="instreditalic">*</SPAN></LABEL>
		</TD>
		<TD class="ste" colspan="2" nowrap>
			<INPUT type="text" id="AREA" name="AREA" class="input" size="10" onChange="FieldValidation(this);getCodeDesc('AREA,USER_ID','AREADESC', 'g_pkl_areaDesc','AREA_CODE,USER_ID');" maxLength="10"  value="<%= (String)MT_EXECUTIVEObj.get("AREA") %>" >

	  <INPUT type="text" id="AREADESC" name="AREADESC" class="input" size="50" readonly  maxLength="50" value="<%= 
	(String)MT_EXECUTIVEObj.get("AREADESC") %>" >
	<A id="AREAHLP" name="AREAHLP"  href="#" onClick="getPicklistValues('g_pkl_area','AREA','USER_ID','')" class="linkblue" >?</A> &nbsp;

		</TD>
	</TR>
	<TR class="ste">
		<TD class="ste" nowrap>   
			<LABEL ID="AM_CODE_label" class="userlabel"><%=field_labels.getString("MT_EXECUTIVE.AM_CODE")%></LABEL>
		</TD>
		<TD class="ste" colspan="2" nowrap>
			<INPUT type="text" id="AM_CODE" name="AM_CODE" class="input" size="10" onblur="FieldValidation(this);getCodeDesc('AM_CODE','AM_CODEDESC', 'g_pkl_AreaMngrDesc','EXEC_CODE');" maxLength="10"  value="<%= (String)MT_EXECUTIVEObj.get("AM_CODE") %>" >

	  <INPUT type="text" id="AM_CODEDESC" name="AM_CODEDESC" class="input" size="50" readonly  maxLength="50" value="<%= 
	(String)MT_EXECUTIVEObj.get("AM_CODEDESC") %>" >
		<A id="AM_CODEHLP" name="AM_CODEHLP"  href="#" onClick="getPicklistValues('g_pkl_AreaMngr','AM_CODE','','')" class="linkblue" >?</A> &nbsp;
		</TD>
	</TR>



<TR class="ste">
		<TD class="ste" nowrap>   
			<LABEL ID="RM_CODE_label" class="userlabel"><%= field_labels.getString("MT_EXECUTIVE.RM_CODE")%></LABEL>
		</TD>
		<TD class="ste" colspan="2" nowrap>
			<INPUT type="text" id="RM_CODE" name="RM_CODE" class="input" size="10" onChange="FieldValidation(this);getCodeDesc('RM_CODE','RM_CODEDESC', 'g_pkl_RegionMngrDesc','EXEC_CODE');" maxLength="10"  value="<%= (String)MT_EXECUTIVEObj.get("RM_CODE") %>" >

	  <INPUT type="text" id="RM_CODEDESC" name="RM_CODEDESC" class="input" size="50" readonly  maxLength="50" value="<%= 
	(String)MT_EXECUTIVEObj.get("RM_CODEDESC") %>" >
		<A id="RM_CODEHLP" name="RM_CODEHLP"  href="#" onClick="getPicklistValues('g_pkl_RegionMngr','RM_CODE','','')" class="linkblue" >?</A> &nbsp;
		</TD>
	</TR>

<TR class="ste">
		<TD class="ste" nowrap>   
			<LABEL ID="ZM_CODE_label" class="userlabel"><%= field_labels.getString("MT_EXECUTIVE.ZM_CODE")%></LABEL>
		</TD>
		<TD class="ste" colspan="2" nowrap>
			<INPUT type="text" id="ZM_CODE" name="ZM_CODE" class="input" size="10" onChange="FieldValidation(this);getCodeDesc('ZM_CODE','ZM_CODEDESC', 'g_pkl_ZoneMngrDesc','EXEC_CODE');" maxLength="10"  value="<%=(String)MT_EXECUTIVEObj.get("ZM_CODE")%>">

	  <INPUT type="text" id="ZM_CODEDESC" name="ZM_CODEDESC" class="input" size="50" readonly  maxLength="50" value="<%=(String)MT_EXECUTIVEObj.get("ZM_CODEDESC") %>">
		<A id="ZM_CODEHLP" name="ZM_CODEHLP"  href="#" onClick="getPicklistValues('g_pkl_ZoneMngr','ZM_CODE','','')" class="linkblue" >?</A> &nbsp;
		</TD>
	</TR>

<TR class="ste">
		<TD class="ste" nowrap>   
			<LABEL ID="TRGT_label" class="userlabel"><%=field_labels.getString("MT_EXECUTIVE.TRGT")%></LABEL>
		</TD>
		<TD class="ste" colspan="2" nowrap>
			<INPUT type="text" id="TRGT" name="TRGT" class="input" size="10" onblur="FieldValidation(this);" maxLength="10" value="<%=(String)MT_EXECUTIVEObj.get("TRGT")%>">
		</TD>
	</TR>


<TR class="ste">
		<TD class="ste" nowrap>   
			<LABEL ID="TRGT_ACH_label" class="userlabel"><%= field_labels.getString("MT_EXECUTIVE.TRGT_ACH") %></LABEL>
		</TD>
		<TD class="ste" colspan="2" nowrap>
			<INPUT type="text" id="TRGT_ACH" name="TRGT_ACH" class="input" size="10" onblur="FieldValidation(this);" maxLength="10"  value="<%=(String)MT_EXECUTIVEObj.get("TRGT_ACH")%>">


-->
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

  		<INPUT TYPE="button" value="Submit" name="Submit_label" class="button" onClick="javascript:validateSubmit()" >
		<INPUT TYPE="button" value="Clear" name="Clear_label" class="button"  onClick="javascript:Reset_form()">
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
