<%@ include file="DISTAPPINPResourceProvider.jsp" %>
<HTML>
<HEAD>
<% try{
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
	Logger logger = Logger.getLogger("MT_CATEGORY");

        HashMap MT_CATEGORYObj = (HashMap)request.getAttribute("RESPONSE");
	if(MT_CATEGORYObj == null)
  		MT_CATEGORYObj = new HashMap();

	String formName = "MT_CATEGORY";
	%>
<%
%>
<%
%>
<TITLE id="MT_CATEGORY_title"><%= field_labels.getString("MT_CATEGORY.MT_CATEGORY_title") %></TITLE>

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
<SCRIPT Language='Javascript' type='text/javascript' src='scripts/DatePicker.js'> </SCRIPT>

<SCRIPT type="text/javascript" language = "JavaScript">

function preValidateSubmit(as_event_label)
{
	validateSubmit();
	return true;
}
function execute_onLoad()
{
	clearNull();
	if(g_serv_chrg_flag == "N")
		document.getElementById("SERV_CHRG").parentElement.parentElement.style.display="none";
	if(g_comm_per_flag == "N")
		document.getElementById("COMM_PER").parentElement.parentElement.style.display="none";
}


function FieldValidation(as_field_name)
{
	return true;
}


</SCRIPT>


</HEAD>
<BODY class="mainbody" onLoad="execute_onLoad()" >

<DIV id="MT_CATEGORY_div" >

<FORM name="MT_CATEGORY" id="MT_CATEGORY" method="post" action="distAppCommonActionServlet.do">
<INPUT type="hidden" id="Event" name="Event" value="">
<INPUT type="hidden" id="CREATION_DT" name="CREATION_DT" value="<%= (java.util.Date)MT_CATEGORYObj.get("CREATION_DT") %>">
<INPUT type="hidden" id="MAKER" name="MAKER" value="<%= (String)MT_CATEGORYObj.get("MAKER") %>">
<INPUT type="hidden" id="MAKER_DT" name="MAKER_DT" value="<%= (java.util.Date)MT_CATEGORYObj.get("MAKER_DT")%>">
<INPUT type="hidden" id="STATUS" name="STATUS" value="<%=(String)MT_CATEGORYObj.get("STATUS") %>">
<INPUT type="hidden" id="MODE" name="MODE" value="INP">
<INPUT type="hidden" id="ENTITY" name="ENTITY" value="MT_CATEGORY">
<INPUT type="hidden" id="PARAM" name="PARAM" value="<%= (String)MT_CATEGORYObj.get("PARAM") %>">
<INPUT type="hidden" id="PARAM1" name="PARAM1" value="<%= (String)MT_CATEGORYObj.get("PARAM1") %>">
<INPUT type="hidden" id="PARAM2" name="PARAM2" value="<%= (String)MT_CATEGORYObj.get("PARAM2") %>">
<INPUT type="hidden" id="PRIMARY_KEY" name="PRIMARY_KEY" value="CTG_CODE">
<INPUT type="hidden" id="SCREEN_NAME" name="SCREEN_NAME" value="MT_CATEGORY">
<INPUT type="hidden" id="ERRDESC" name="ERRDESC" value="<%=(String)MT_CATEGORYObj.get("ERRDESC")%>">


    <TABLE class="headertable" cellspacing="0" cellpadding="0" width='100%'>
         <TD>&nbsp;</TD>
        <TR> 
           <TD class="heading" nowrap align="center">
            <%= field_labels.getString("MT_CATEGORY.MT_CATEGORY") %>
           </TD>
           <TD>&nbsp;</TD>
        </TR>
   </TABLE>
 
 <TABLE class="detailstable" cellspacing="0" cellpadding="0">

	<TR class="ste">
		<TD class="ste" nowrap>   
			<LABEL ID="CTG_CODE_label" class="userlabel"><%= field_labels.getString("MT_CATEGORY.CTG_CODE") %><SPAN class="instreditalic">*</SPAN></LABEL>
		</TD>
		<TD class="ste" colspan="6" nowrap>
			<INPUT type="text" id="CTG_CODE" name="CTG_CODE" class="input" size="60" onblur="FieldValidation(this);" maxLength="60"  value="<%= (String)MT_CATEGORYObj.get("CTG_CODE") %>" >
		</TD>
			</TR>
	<TR class="ste">
		<TD class="ste" nowrap>   
			<LABEL ID="CTG_NAME_label" class="userlabel"><%= field_labels.getString("MT_CATEGORY.CTG_NAME") %><SPAN class="instreditalic">*</SPAN></LABEL>
		</TD>
		<TD class="ste" colspan="4" nowrap>
			<INPUT type="text" id="CTG_NAME" name="CTG_NAME" class="input" size="65" onblur="FieldValidation(this);" maxLength="100"  value="<%= (String)MT_CATEGORYObj.get("CTG_NAME") %>" >
		</TD>
	</TR>
	<TR class="ste">
		<TD class="ste" nowrap>   
			<LABEL ID="SERV_CHRG_label" class="userlabel"><%= field_labels.getString("SERV_CHRG") %></LABEL>
		</TD>
		<TD class="ste" colspan="4" nowrap>
			<INPUT type="text" id="SERV_CHRG" name="SERV_CHRG" class="input" size="6" onblur="FieldValidation(this);" maxLength="6"  value="<%= (String)MT_CATEGORYObj.get("SERV_CHRG") %>" >
		</TD>
	</TR>
	<TR class="ste">
		<TD class="ste" nowrap>   
			<LABEL ID="COMM_PER_label" class="userlabel"><%= field_labels.getString("COMM_PER") %></LABEL>
		</TD>
		<TD class="ste" colspan="4" nowrap>
			<INPUT type="text" id="COMM_PER" name="COMM_PER" class="input" size="6" onblur="FieldValidation(this);" maxLength="6"  value="<%= (String)MT_CATEGORYObj.get("COMM_PER") %>" >
		</TD>
	</TR>
	<TR class="ste">
		
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
	  
	     <INPUT TYPE="button" value="Submit" name="Submit_label" class="button" onClick="javascript:preValidateSubmit()">
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

<%
}
		catch(Exception e)
		{
			e.printStackTrace();
		}
%>