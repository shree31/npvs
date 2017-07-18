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
	Logger logger = Logger.getLogger("MT_DELIVERY");

	HashMap MT_DELIVERYObj = (HashMap)request.getAttribute("RESPONSE");

	
	if(MT_DELIVERYObj == null)
  		MT_DELIVERYObj = new HashMap();

	String formName = "MT_DELIVERY";

%>

<TITLE id="MT_DELIVERY_title"><%= field_labels.getString("MT_DELIVERY.MT_DELIVERY_title") %></TITLE>

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
		SaveForm('Save');
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
	if(document.getElementById("MODE").value == "INP")
		clearNull();
}

function FieldValidation(as_field_name)
{
//	if(as_field_name.name == "AREA_CODE")
//		chkAreaCode(as_field_name);		
	return true;
}

function chkAreaCode(as_field_name)
{
	document.getElementById("PRIMARY_KEY").value = "AREA_CODE";
	document.getElementById("MODE").value="VIEW";
//	document.getElementById("ENTITY").value="MT_AREAVIEW";
	document.forms[0].submit();
}

</SCRIPT>

</HEAD>
<BODY class="mainbody" onLoad="execute_onLoad()" >

<DIV id="MT_DELIVERY_div" >

<FORM name="MT_DELIVERY" id="MT_DELIVERY" method="post" action="distAppCommonActionServlet.do">
<INPUT type="hidden" id="Event" name="Event" value="">
<INPUT type="hidden" id="MAKER" name="MAKER" value="<%= (String)MT_DELIVERYObj.get("MAKER") %>">
<INPUT type="hidden" id="MAKER_DT" name="MAKER_DT" value="<%= (String)MT_DELIVERYObj.get("MAKER_DT")%>">
<INPUT type="hidden" id="STATUS" name="STATUS" value="<%= (String)MT_DELIVERYObj.get("STATUS") %>">
<INPUT type="hidden" id="MODE" name="MODE" value="INP">
<INPUT type="hidden" id="ENTITY" name="ENTITY" value="MT_DELIVERY">
<INPUT type="hidden" id="PARAM" name="PARAM" value="<%= (String)MT_DELIVERYObj.get("PARAM") %>">
<INPUT type="hidden" id="PRIMARY_KEY" name="PRIMARY_KEY" value="DLV_CODE">
<INPUT type="hidden" id="PARAM1" name="PARAM1" value="<%= (String)MT_DELIVERYObj.get("PARAM1") %>">
<INPUT type="hidden" id="PARAM2" name="PARAM2" value="<%= (String)MT_DELIVERYObj.get("PARAM2") %>">
<INPUT type="hidden" id="ERRDESC" name="ERRDESC" value="<%=(String)MT_DELIVERYObj.get("ERRDESC")%>">
<INPUT type="hidden" id="SCREEN_NAME" name="SCREEN_NAME" value="MT_DELIVERY">
<INPUT type="hidden" id="DONT_CHANGE" name="DONT_CHANGE" value="MAR_NAME">
<INPUT type="hidden" id="USER_ID" name="USER_ID" value="<%= session.getAttribute("UserId") %>">
<INPUT type="hidden" id="REMARKS" name="REMARKS" value="">
<INPUT type="hidden" id="AREA_CODE" name="AREA_CODE" value="AREA">
<INPUT type="hidden" id="CITY" name="CITY" value="MU">
<INPUT type="hidden" id="MAR_NAME" name="MAR_NAME" value="">
<INPUT type="hidden" id="OLD_CODE" name="OLD_CODE" value="">
<INPUT type="hidden" id="TYPE" name="TYPE" value="SUP">

   <TABLE class="headertable" cellspacing="0" cellpadding="0" width='100%'>
         <TD>&nbsp;</TD>
        <TR> 
           <TD class="heading" nowrap align="center">
            <%= field_labels.getString("MT_DELIVERY.MT_DELIVERY") %>
           </TD>
           <TD>&nbsp;</TD>
        </TR>
   </TABLE>
 
 <TABLE class="detailstable" cellspacing="0" cellpadding="0">

	<TR class="ste">
		<TD class="ste" nowrap>   
			<LABEL ID="DLV_CODE_label" class="userlabel"><%= field_labels.getString("MT_DELIVERY.DLV_CODE") %><SPAN class="instreditalic">*</SPAN></LABEL>
		</TD>
		<TD class="ste" colspan="2" nowrap>
			<INPUT type="text" id="DLV_CODE" name="DLV_CODE" class="input" size="10" onblur="FieldValidation(this);" maxLength="10"  value="<%= (String)MT_DELIVERYObj.get("DLV_CODE") %>" >
		</TD>
	</TR>
	<TR class="ste">
		<TD class="ste" nowrap>   
			<LABEL ID="NAME_label" class="userlabel"><%= field_labels.getString("MT_DELIVERY.NAME") %><SPAN class="instreditalic">*</SPAN></LABEL>
		</TD>
		<TD class="ste" colspan="2" nowrap>
			<INPUT type="text" id="NAME" name="NAME" class="input" size="65" onblur="FieldValidation(this);" maxLength="65"  value="<%= (String)MT_DELIVERYObj.get("NAME") %>" >
		</TD>
	</TR>
<!-- 	<TR class="ste">
		<TD class="ste" nowrap>   
			<LABEL ID="OLD_CODE_label" class="userlabel"><%= field_labels.getString("MT_DELIVERY.OLD_CODE") %></LABEL>
		</TD>
		<TD class="ste" colspan="2" nowrap>
			<INPUT type="text" id="OLD_CODE" name="OLD_CODE" class="input" size="20" onblur="FieldValidation(this);" maxLength="20"  value="<%= (String)MT_DELIVERYObj.get("OLD_CODE") %>" >
		</TD>
	</TR>
	<TR class="ste">
		<TD class="ste" nowrap>   
			<LABEL ID="MAR_NAME_label" class="userlabel"><%= field_labels.getString("MT_DELIVERY.MAR_NAME") %></LABEL>
		</TD>
		<TD class="ste" colspan="2" nowrap>
			<INPUT type="text" id="MAR_NAME" name="MAR_NAME" class="input" size="60" onblur="FieldValidation(this);" maxLength="60"  value="<%= (String)MT_DELIVERYObj.get("MAR_NAME") %>" >
		</TD>
	</TR>
	<TR class="ste">
	<TD class="ste" nowrap>   
			<LABEL ID="TYPE_label" class="userlabel"><%= field_labels.getString("MT_DELIVERY.TYPE") %><SPAN class="instreditalic">*</SPAN></LABEL>
		</TD>
		<TD class="ste" colspan="2" nowrap>
			<INPUT type="text" id="TYPE" name="TYPE" class="input" size="10" onChange="FieldValidation(this);getCodeDesc('TYPE','TYPEDESC','g_pkl_dlvtypeDesc','KEY_CODE');" maxLength="10"  value="<%= (String)MT_DELIVERYObj.get("TYPE") %>" >
	  <INPUT type="text" id="TYPEDESC" name="TYPEDESC" class="input" size="50" readonly  maxLength="50" value="<%= 
	(String)MT_DELIVERYObj.get("TYPEDESC") %>" >
			<A id="TYPEHLP" name="TYPEHLP"  href="#" onClick="getPicklistValues('g_pkl_dlvtype','TYPE','','')" class="linkblue" >?</A> &nbsp;

			</TD>
	</TR>
	<TR class="ste">
		<TD class="ste" nowrap>   
			<LABEL ID="AREA_CODE_label" class="userlabel"><%= field_labels.getString("MT_DELIVERY.AREA_CODE") %><SPAN class="instreditalic">*</SPAN></LABEL>
		</TD>
		<TD class="ste" colspan="2" nowrap>
			<INPUT type="text" id="AREA_CODE" name="AREA_CODE" class="input" size="10" onChange="FieldValidation(this);" onBlur="FieldValidation(this);getCodeDesc('AREA_CODE','AREA_CODEDESC','g_pkl_areaDesc','');"  maxLength="10"  value="<%= (String)MT_DELIVERYObj.get("AREA_CODE") %>" >

	  <INPUT type="text" id="AREA_CODEDESC" name="AREA_CODEDESC" class="input" size="50" readonly  maxLength="50" value="<%= 
	(String)MT_DELIVERYObj.get("AREA_CODEDESC") %>" >
		<A id="AREA_CODEHLP" name="AREA_CODEHLP"  href="#" onClick="getPicklistValues('g_pkl_area','AREA_CODE','','')" class="linkblue" >?</A> &nbsp;
			</TD>
	</TR>

	<TR class="ste">
		<TD class="ste" nowrap>   
			<LABEL ID="CITY_label" class="userlabel"><%= field_labels.getString("MT_DELIVERY.CITY") %><SPAN class="instreditalic">*</SPAN></LABEL>
		</TD>
		<TD class="ste" colspan="2" nowrap>
			<INPUT type="text" id="CITY" name="CITY" class="input" size="10" onChange="FieldValidation(this);getCodeDesc('CITY','CITYDESC','g_pkl_cityDesc','');" maxLength="10"  value="<%= (String)MT_DELIVERYObj.get("CITY") %>" >

	  <INPUT type="text" id="CITYDESC" name="CITYDESC" class="input" size="50" maxLength="50" value="<%= 
	(String)MT_DELIVERYObj.get("CITYDESC") %>" >
		<A id="CITYHLP" name="CITYHLP"  href="#" onClick="getPicklistValues('g_pkl_city','CITY','','')" class="linkblue" >?</A> &nbsp;
			</TD>
	</TR>  -->
	<TR class="ste">
		<TD class="ste" nowrap>   
			<LABEL ID="ROUTE_CODE_label" class="userlabel"><%= field_labels.getString("MT_DELIVERY.ROUTE_CODE") %><SPAN class="instreditalic">*</SPAN></LABEL>
		</TD>
		<TD class="ste" colspan="2" nowrap>
			<INPUT type="text" id="ROUTE_CODE" name="ROUTE_CODE" class="input" size="10" onChange="FieldValidation(this);getCodeDesc('ROUTE_CODE','ROUTE_CODEDESC','g_pkl_routeDesc','');" maxLength="10"  value="<%= (String)MT_DELIVERYObj.get("ROUTE_CODE") %>" >

	  <INPUT type="text" id="ROUTE_CODEDESC" name="ROUTE_CODEDESC" class="input" size="50" readonly  maxLength="50" value="<%= 
	(String)MT_DELIVERYObj.get("ROUTE_CODEDESC") %>" >
		<A id="ROUTE_CODEHLP" name="ROUTE_CODEHLP"  href="#" onClick="getPicklistValues('g_pkl_route','ROUTE_CODE','','')" class="linkblue" >?</A> &nbsp;
			</TD>
	</TR>

	<TR class="ste">
		<TD class="ste" nowrap>   
			<LABEL ID="PRIORITY_label" class="userlabel"><%=field_labels.getString("MT_DELIVERY.PRIORITY")%>
			</LABEL>
		</TD>
		<TD class="ste" nowrap>
			<INPUT type="text" id="PRIORITY" name="PRIORITY" class="input" size="10" onblur="FieldValidation(this);" maxLength="20"  
				value="<%=(String) MT_DELIVERYObj.get("PRIORITY")%>" >
		</TD>
	</TR>
	<!-- <TR class="ste">
		<TD class="ste" nowrap>   
			<LABEL ID="PRIORITY_label" class="userlabel"><%= field_labels.getString("MT_DELIVERY.PRIORITY") %></LABEL>
		</TD>
		<TD class="ste" colspan="2" nowrap>
			<INPUT type="text" id="PRIORITY" name="PRIORITY" class="input" size="5" maxlength = "5"  onblur="FieldValidation(this);"  value="<%= (String)MT_DELIVERYObj.get("PRIORITY") %>" >
		</TD>
	</TR>
	<TR class="ste">
		<TD class="ste" nowrap>   
			<LABEL ID="REMARKS_label" class="userlabel"><%= field_labels.getString("MT_DELIVERY.REMARKS") %></LABEL>
		</TD>
		<TD class="ste" colspan="2" nowrap>
			<INPUT type="text" id="REMARKS" name="REMARKS" class="input" size="100" onblur="FieldValidation(this);" maxLength="200"  value="<%= (String)MT_DELIVERYObj.get("REMARKS") %>" >
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
