<%@ include file="DISTAPPResourceProvider.jsp" %>
<%
try
{%>
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
	Logger logger = Logger.getLogger("MT_AREA");

	HashMap MT_AREAObj = (HashMap)request.getAttribute("RESPONSE");

	
	if(MT_AREAObj == null)
  		MT_AREAObj = new HashMap();

	String formName = "MT_AREAVIEW";

%>
<%
	%>
<%
%>
<TITLE id="MT_AREA_title"><%= field_labels.getString("MT_AREA.MT_AREA_title")%> </TITLE>

<LINK rel='stylesheet' href='scripts/style.css' type='text/css'>
<SCRIPT Language='Javascript' type='text/javascript' src='scripts/CommonFunctions.js'></SCRIPT>
<SCRIPT type='text/javascript' language = 'JavaScript' src='DatePicker.js'></SCRIPT>
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
	document.getElementById("ENTITY").value="MT_AREAVIEW";


	if(document.getElementById("MODE").value=="VIEW")
		document.getElementById("ENTITY").value="MT_AREA";
	else
		clearNull();
}

function FieldValidation(as_field_name)
{
	alert(0);
	if(as_field_name.name == "RGN_CODE")
		chkRgnCode(as_field_name);
	return true;
}

function chkRgnCode(as_field_name)
{
	document.getElementById("PRIMARY_KEY").value = "RGN_CODE#USER_ID";
	document.getElementById("MODE").value="VIEW";
	document.getElementById("ENTITY").value="MT_AREA";

	document.forms[0].submit();
}

function preSubmit(as_event_label)
{
	document.getElementById("ENTITY").value="MT_AREA";
	document.getElementById("PRIMARY_KEY").value="AREA_CODE";
	javascript:validateSubmit('Submit');
}

</SCRIPT>


<SCRIPT type="text/javascript" language = "JavaScript">
</script>

</HEAD>
<BODY class="mainbody" onLoad="execute_onLoad()" >

<DIV id="MT_AREA_div" >

<FORM name="MT_AREA" id="MT_AREA" method="post" action="distAppCommonActionServlet.do">
<INPUT type="hidden" id="MAKER" name="MAKER" value="<%= (String)MT_AREAObj.get("MAKER") %>">
<INPUT type="hidden" id="MAKER_DT" name="MAKER_DT" value="">
<INPUT type="hidden" id="STATUS" name="STATUS" value="<%= (String)MT_AREAObj.get("STATUS") %>">
<INPUT type="hidden" id="MODE" name="MODE" value="">
<INPUT type="hidden" id="ENTITY" name="ENTITY" value="MT_AREAVIEW">
<INPUT type="hidden" id="PARAM" name="PARAM" value="<%= (String)MT_AREAObj.get("PARAM") %>">
<INPUT type="hidden" id="PRIMARY_KEY" name="PRIMARY_KEY" value="AREA_CODE">
<INPUT type="hidden" id="PARAM1" name="PARAM1" value="<%= (String)MT_AREAObj.get("PARAM1") %>">
<INPUT type="hidden" id="PARAM2" name="PARAM2" value="<%= (String)MT_AREAObj.get("PARAM2") %>">
<INPUT type="hidden" id="SCREEN_NAME" name="SCREEN_NAME" value="MT_AREAVIEW">
<INPUT type="hidden" id="ERRDESC" name="ERRDESC" value="<%= (String)MT_AREAObj.get("ERRDESC") %>">
<INPUT type="hidden" id="DONT_CHANGE" name="DONT_CHANGE" value="AREA_MAR_NAME">
<INPUT type="hidden" id="USER_ID" name="USER_ID" value="<%= session.getAttribute("UserId") %>">

  <TABLE class="headertable" cellspacing="0" cellpadding="0" width='100%'>
         <TD>&nbsp;</TD>
        <TR> 
           <TD class="heading" nowrap align="center">
            <%= field_labels.getString("MT_AREA.MT_AREA") %>
           </TD>
           <TD>&nbsp;</TD>
        </TR>
   </TABLE>

 <TABLE class="detailstable" cellspacing="0" cellpadding="0">


	<TR class="ste">
		<TD class="ste" nowrap>   
			<LABEL ID="AREA_CODE_label" class="userlabel"><%= field_labels.getString("MT_AREA.AREA_CODE") %><SPAN class="instreditalic">*</SPAN></LABEL>
		</TD>
		<TD class="ste" colspan="2" nowrap>
			<INPUT type="text" id="AREA_CODE" name="AREA_CODE" class="input" size="10" onChange="getCodeDesc('AREA_CODE','AREA_NAME','g_pkl_areaDesc','');" maxLength="10"  value="<%= (String)MT_AREAObj.get("AREA_CODE") %>" >
			<A id="AREA_CODEHLP" name="AREA_CODEHLP"  href="#" onClick="getPicklistValues('g_pkl_area','AREA_CODE','','')" class="linkblue" >?</A> 
		</TD>
	</TR>
	<TR class="ste">
		<TD class="ste" nowrap>   
			<LABEL ID="AREA_NAME_label" class="userlabel"><%= field_labels.getString("MT_AREA.AREA_NAME") %><SPAN class="instreditalic">*</SPAN></LABEL>
		</TD>
		<TD class="ste" colspan="2" nowrap>
			<INPUT type="text" id="AREA_NAME" name="AREA_NAME" class="input" size="65" onblur="FieldValidation(this);" maxLength="65"  value="<%= (String)MT_AREAObj.get("AREA_NAME") %>" >
		</TD>
	</TR>
	<TR class="ste">
		<TD class="ste" nowrap>   
			<LABEL ID="OLD_CODE_label" class="userlabel"><%= field_labels.getString("MT_AREA.OLD_CODE") %></LABEL>
		</TD>
		<TD class="ste" colspan="2" nowrap>
			<INPUT type="text" id="OLD_CODE" name="OLD_CODE" class="input" size="20" onblur="FieldValidation(this);" maxLength="20"  value="<%= (String)MT_AREAObj.get("OLD_CODE") %>" >
		</TD>
	</TR>
	<TR class="ste">
		<TD class="ste" nowrap>   
			<LABEL ID="AREA_MAR_NAME_label" class="userlabel"><%= field_labels.getString("MT_AREA.MAR_NAME") %></LABEL>
		</TD>
		<TD class="ste" colspan="2" nowrap>
			<INPUT type="text" id="AREA_MAR_NAME" name="AREA_MAR_NAME" class="input" size="60" onblur="FieldValidation(this);" maxLength="60"  value="<%= (String)MT_AREAObj.get("AREA_MAR_NAME") %>" >
		</TD>
	</TR>
<!--	<TR class="ste">
		<TD class="ste" nowrap>   
			<LABEL ID="RGN_CODE_label" class="userlabel"><%= field_labels.getString("MT_AREA.RGN_CODE") %><SPAN class="instreditalic">*</SPAN></LABEL>
		</TD>
		<TD class="ste" colspan="2" nowrap>
			<INPUT type="text" id="RGN_CODE" name="RGN_CODE" class="input" size="10" onChange="FieldValidation(this);" onBlur="FieldValidation(this);"  maxLength="10"  value="<%= (String)MT_AREAObj.get("RGN_CODE") %>" >

	  <INPUT type="text" id="RGN_CODEDESC" name="RGN_CODEDESC" class="input" size="50" readonly  maxLength="50" value="<%= 
	(String)MT_AREAObj.get("RGN_CODEDESC") %>" >
		<A id="RGN_CODEHLP" name="RGN_CODEHLP"  href="#" onClick="getPicklistValues('g_pkl_region','RGN_CODE','USER_ID','')" class="linkblue" >?</A> &nbsp;
		</TD>
	</TR> -->
	<!-- <TR class="ste">
		<TD class="ste" nowrap>   
			<LABEL ID="CNT_CODE_label" class="userlabel"><%= field_labels.getString("MT_AREA.CNT_CODE") %></LABEL>
		</TD>
		<TD class="ste" colspan="2" nowrap>
			<INPUT type="text" id="CNT_CODE" name="CNT_CODE" class="input" size="10" readonly   maxLength="10" onChange="FieldValidation(this);getCodeDesc('CNT_CODE,USER_ID','CNT_CODEDESC', 'g_pkl_centerDesc','MC.CNT_CODE,USER_ID');" value="<%= (String)MT_AREAObj.get("CNT_CODE") %>" >

	  <INPUT type="text" id="CNT_CODEDESC" name="CNT_CODEDESC" class="input" size="50" readonly  maxLength="50" value="<%= 
	(String)MT_AREAObj.get("CNT_CODEDESC") %>" >

		</TD>
	</TR>
 -->
	<TR class="ste">
		<TD class="ste" nowrap>   
			<LABEL ID="CITY_label" class="userlabel"><%= field_labels.getString("MT_AREA.CITY") %></LABEL>
		</TD>
		<TD class="ste" colspan="2" nowrap>
			<INPUT type="text" id="CITY" name="CITY" class="input" size="10" readonly onChange="FieldValidation(this);" maxLength="10"  value="<%= (String)MT_AREAObj.get("CITY") %>" >

	  <INPUT type="text" id="CITYDESC" name="CITYDESC" class="input" size="50" readonly  maxLength="50" value="<%= 
	(String)MT_AREAObj.get("CITYDESC") %>" >

		</TD>
	</TR>
		<TR class="ste">
		<TD class="ste" nowrap>   
			<LABEL ID="AREA_ADD_PIN_label" class="userlabel"><%= field_labels.getString("MT_CENTER.CNT_ADD_PIN") %></LABEL>
		</TD>
		<TD class="ste" colspan="2" nowrap>
			<INPUT type="text" id="AREA_ADD_PIN" name="AREA_ADD_PIN" class="input" size="6" onblur="FieldValidation(this);" maxLength="6"  value="<%= (String)MT_AREAObj.get("AREA_ADD_PIN") %>" >
		</TD>
	</TR>

	<TR class="ste">
		<TD class="ste" nowrap>   
			<LABEL ID="AREA_MNGR_label" class="userlabel"><%= field_labels.getString("MT_AREA.AM_CODE") %></LABEL>
		</TD>
		<TD class="ste" colspan="2" nowrap>
			<INPUT type="text" id="AREA_MNGR" name="AREA_MNGR" class="input" size="10" onChange="FieldValidation(this);getCodeDesc('AREA_MNGR','AM_CODEDESC', 'g_pkl_AreaMngr','');" maxLength="10"  value="<%= (String)MT_AREAObj.get("AREA_MNGR") %>" >

	  <INPUT type="text" id="AM_CODEDESC" name="AM_CODEDESC" class="input" size="50" readonly  maxLength="50" value="<%= 
	(String)MT_AREAObj.get("AM_CODEDESC") %>" >
		<A id="AREA_MNGRHLP" name="AREA_MNGRHLP"  href="#" onClick="getPicklistValues('g_pkl_AreaMngr',AREA_MNGR,'','')" class="linkblue" >?</A> &nbsp;
		</TD>
	</TR>
	<TR class="ste">
		<TD class="ste" nowrap>   
			<LABEL ID="AREA_MGRTEL_label" class="userlabel"><%= field_labels.getString("MT_AREA.AM_TELE") %></LABEL>
		</TD>
		<TD class="ste" colspan="2" nowrap>
			<INPUT type="text" id="AREA_MGRTEL" name="AREA_MGRTEL" class="input" size="20" onblur="FieldValidation(this);" maxLength="20"  value="<%= (String)MT_AREAObj.get("AREA_MGRTEL") %>" >
		</TD>
	</TR>
	<TR class="ste">
		<TD class="ste" nowrap>   
			<LABEL ID="REMARKS_label" class="userlabel"><%= field_labels.getString("MT_AREA.REMARKS") %></LABEL>
		</TD>
		<TD class="ste" colspan="2" nowrap>
			<INPUT type="text" id="REMARKS" name="REMARKS" class="input" size="100" onblur="FieldValidation(this);" maxLength="200"  value="<%= (String)MT_AREAObj.get("REMARKS") %>" >


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