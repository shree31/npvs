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

<%	
	Logger logger = Logger.getLogger("MT_COMMISSION");

	HashMap MT_COMMISSIONObj = (HashMap)request.getAttribute("RESPONSE");

	
	if(MT_COMMISSIONObj == null)
  		MT_COMMISSIONObj = new HashMap();

	String formName = "MT_COMMISSION";

%>

<%
	%>
<%
%>
<TITLE id="MT_COMMISSION_title"><%= field_labels.getString("MT_COMMISSION.MT_COMMISSION_title") %></TITLE>

<LINK rel='stylesheet' href='scripts/style.css' type='text/css'>
<SCRIPT Language='Javascript' type='text/javascript' src='scripts/CommonFunctions.js'></SCRIPT>
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
		SubmitForm('Submit');
	}
	*/
}
	
document.onkeypress = checkCR;
// -->
</SCRIPT>

<SCRIPT type="text/javascript" language = "JavaScript">
var ex_dt = 1;
function execute_onLoad()
{
	clearNull();
			document.getElementById("COMM_CODE_NEW").parentElement.parentElement.style.display="none";
			document.getElementById("COMM_NAME_NEW").parentElement.parentElement.style.display="none";
			document.getElementById("COMM_CODE").parentElement.parentElement.style.display="block";
			document.getElementById("COMM_NAME").parentElement.parentElement.style.display="block";
			setfldNonMandatory("COMM_CODE_NEW,COMM_NAME_NEW");
			setfldMandatory("COMM_CODE");
}

function FieldValidation(as_field_name)
{
		var l_numeric_flds = "COMM_MON,COMM_TUE,COMM_WED,COMM_THU,COMM_FRI,COMM_SAT,COMM_SUN,ADD_COMM_MON,ADD_COMM_TUE,ADD_COMM_WED,ADD_COMM_THU,ADD_COMM_FRI,ADD_COMM_SAT,ADD_COMM_SUN,INC_MON,INC_TUE,INC_WED,INC_THU,INC_FRI,INC_SAT,INC_SUN,INS_MON,INS_TUE,INS_WED,INS_THU,INS_FRI,INS_SAT,INS_SUN";

	if(l_numeric_flds.indexOf(as_field_name.name)!=-1 && as_field_name.value!="")
	{
		if(IsNumeric(as_field_name)==false) return false;
	}
	if(as_field_name.name == "EX_COMM")
		chkExRate(as_field_name);
	return true;
}

function chkExRate(as_field_name)
{		
	if(as_field_name.accessKey == "Y")
		{	
			document.getElementById("COMM_CODE_NEW").value ="";
			document.getElementById("COMM_NAME_NEW").value ="";
			document.getElementById("COMM_CODE_NEW").parentElement.parentElement.style.display="none";
			document.getElementById("COMM_NAME_NEW").parentElement.parentElement.style.display="none";
			document.getElementById("COMM_CODE").parentElement.parentElement.style.display="block";
			document.getElementById("COMM_NAME").parentElement.parentElement.style.display="block";
			setfldNonMandatory("COMM_CODE_NEW,COMM_NAME_NEW");
			setfldMandatory("COMM_CODE");
			ex_dt = 1;
		}
		else
		{
			document.getElementById("COMM_CODE").value ="";
			document.getElementById("COMM_NAME").value ="";
			document.getElementById("COMM_CODE_NEW").parentElement.parentElement.style.display="block";
			document.getElementById("COMM_NAME_NEW").parentElement.parentElement.style.display="block";
			document.getElementById("COMM_CODE").parentElement.parentElement.style.display="none";
			document.getElementById("COMM_NAME").parentElement.parentElement.style.display="none";
			setfldMandatory("COMM_CODE_NEW,COMM_NAME_NEW");
			setfldNonMandatory("COMM_CODE");
			ex_dt = 0;
		}
}
function preValidateSubmit()
{
	if(ex_dt ==0 )
	{
		document.getElementById("COMM_CODE").value = document.getElementById("COMM_CODE_NEW").value;
		document.getElementById("COMM_NAME").value = document.getElementById("COMM_NAME_NEW").value;
	}
	validateSubmit();
	return true;
}

</SCRIPT>


<SCRIPT type="text/javascript" language = "JavaScript">
</script>

</HEAD>
<BODY class="mainbody" onLoad="execute_onLoad()" >

<DIV id="MT_COMMISSION_div" >

<FORM name="MT_COMMISSION" id="MT_COMMISSION" method="post" action="distAppCommonActionServlet.do">
<INPUT type="hidden" id="Event" name="Event" value="">
<INPUT type="hidden" id="MAKER" name="MAKER" value="<%= (String)MT_COMMISSIONObj.get("MAKER") %>">
<INPUT type="hidden" id="MAKER_DT" name="MAKER_DT" value="">
<INPUT type="hidden" id="STATUS" name="STATUS" value="<%= (String)MT_COMMISSIONObj.get("STATUS") %>">
<INPUT type="hidden" id="MODE" name="MODE" value="INP">
<INPUT type="hidden" id="ENTITY" name="ENTITY" value="MT_COMMISSION">
<INPUT type="hidden" id="PARAM" name="PARAM" value="<%= (String)MT_COMMISSIONObj.get("PARAM") %>">
<INPUT type="hidden" id="PARAM1" name="PARAM1" value="<%= (String)MT_COMMISSIONObj.get("PARAM1") %>">
<INPUT type="hidden" id="PARAM2" name="PARAM2" value="<%= (String)MT_COMMISSIONObj.get("PARAM2") %>">
<INPUT type="hidden" id="PRIMARY_KEY" name="PRIMARY_KEY" value="CMP_CODE#PUB_CODE#COMM_CODE">
<INPUT type="hidden" id="SCREEN_NAME" name="SCREEN_NAME" value="MT_COMMISSION">
<INPUT type="hidden" id="ERRDESC" name="ERRDESC" value="<%= (String)MT_COMMISSIONObj.get("ERRDESC") %>">



   <TABLE class="headertable" cellspacing="0" cellpadding="0" width='100%'>
         <TD>&nbsp;</TD>
        <TR> 
           <TD class="heading" nowrap align="center">
            <%= field_labels.getString("MT_COMMISSION.MT_COMMISSION") %>
           </TD>
           <TD>&nbsp;</TD>
        </TR>
   </TABLE>
 <TABLE class="detailstable" cellspacing="0" cellpadding="0">

	<TR class="ste">
		<TD class="ste" nowrap>   
			<LABEL ID="CMP_CODE_label" class="userlabel"><%= field_labels.getString("MT_COMMISSION.CMP_CODE") %><SPAN class="instreditalic">*</SPAN></LABEL>
		</TD>
		<TD class="ste" colspan="7" nowrap>
			<INPUT type="text" id="CMP_CODE" name="CMP_CODE" class="input" size="10" onChange="FieldValidation(this);getCodeDesc('CMP_CODE','CMP_CODEDESC', 'g_pkl_companyDesc','');" maxLength="10"  value="<%= (String)MT_COMMISSIONObj.get("CMP_CODE") %>" >

	  <INPUT type="text" id="CMP_CODEDESC" name="CMP_CODEDESC" class="input" size="50" readonly  maxLength="50" value="<%= 
	(String)MT_COMMISSIONObj.get("CMP_CODEDESC") %>" >
		<A id="CMP_CODEHLP" name="CMP_CODEHLP"  href="#" onClick="getPicklistValues('g_pkl_company','CMP_CODE','','')" class="linkblue" >?</A> &nbsp;
		</TD>
	</TR>

	<TR class="ste">
		<TD class="ste" nowrap>   
			<LABEL ID="PUB_CODE_label" class="userlabel"><%= field_labels.getString("MT_COMMISSION.PUB_CODE") %><SPAN class="instreditalic">*</SPAN></LABEL>
		</TD>
		<TD class="ste" colspan="7" nowrap>
			<INPUT type="text" id="PUB_CODE" name="PUB_CODE" class="input" size="10"  onChange="FieldValidation(this);getCodeDesc('PUB_CODE,CMP_CODE','PUB_CODEDESC', 'g_pkl_publicationDesc','');" maxLength="10"  value="<%= (String)MT_COMMISSIONObj.get("PUB_CODE") %>" >

	  <INPUT type="text" id="PUB_CODEDESC" name="PUB_CODEDESC" class="input" size="50" readonly  maxLength="50" value="<%= 
	(String)MT_COMMISSIONObj.get("PUB_CODEDESC") %>" >
		<A id="PUB_CODEHLP" name="PUB_CODEHLP"  href="#" onClick="getPicklistValues('g_pkl_publication','PUB_CODE','CMP_CODE','')" class="linkblue" >?</A> &nbsp;
		</TD>
	</TR>
<!--
	<TR class="ste">
		<TD class="ste" nowrap>   
			<LABEL ID="EDT_CODE_label" class="userlabel"><%= field_labels.getString("MT_COMMISSION.EDT_CODE") %><SPAN class="instreditalic">*</SPAN></LABEL>
		</TD>
		<TD class="ste" colspan="7" nowrap>
			<INPUT type="text" id="EDT_CODE" name="EDT_CODE" class="input" size="30"  onChange="FieldValidation(this);getCodeDesc('EDT_CODE,CMP_CODE,PUB_CODE,USER_ID','EDT_CODEDESC', 'g_pkl_editionDesc','');" maxLength="30"  value="<%= (String)MT_COMMISSIONObj.get("EDT_CODE") %>" >
	  <INPUT type="text" id="EDT_CODEDESC" name="EDT_CODEDESC" class="input" size="50" readonly  maxLength="50" value="<%= 
	(String)MT_COMMISSIONObj.get("EDT_CODEDESC") %>" >
		<A id="EDT_CODEHLP" name="EDT_CODEHLP"  href="#" onClick="getPicklistValues('g_pkl_edition','EDT_CODE','CMP_CODE,PUB_CODE,USER_ID','')" class="linkblue" >?</A> &nbsp;
		</TD>
	</TR> -->
	<TR class="ste">
		<TD class="ste" nowrap>   
			<LABEL ID="EX_COMM_label" class="userlabel"><%= field_labels.getString("MT_RATE.EX_RATE") %><SPAN class="instreditalic">*</SPAN></LABEL>
		</TD>
		<TD class="ste" colspan="7" nowrap>

		<INPUT type="radio" id="EX_COMM" name="EX_COMM" checked onClick="FieldValidation(this);" value="Y" accessKey="Y" ><%= field_labels.getString("radio_yes") %>

		<INPUT type="radio" id="EX_COMM_NO" name="EX_COMM"  onClick="FieldValidation(this);" value="N" accessKey="N" ><%= field_labels.getString("radio_no") %>

		</TD>
	</TR>

	<TR class="ste">
		<TD class="ste" nowrap>   
			<LABEL ID="COMM_CODE_label" class="userlabel"><%= field_labels.getString("MT_COMMISSION.COMM_CODE") %><SPAN class="instreditalic">*</SPAN></LABEL>
		</TD>
		<TD class="ste" colspan="7" nowrap>
			<INPUT type="text" id="COMM_CODE" name="COMM_CODE" class="input" size="10" onChange="FieldValidation(this);getCodeDesc('COMM_CODE','COMM_NAME', 'g_pkl_commissionDesc','');"
			 maxLength="10"  value="<%= (String)MT_COMMISSIONObj.get("COMM_CODE") %>" >
			<INPUT type="text" id="COMM_NAME" name="COMM_NAME" class="input" size="65" onblur="FieldValidation(this);" maxLength="65"  value="<%= (String)MT_COMMISSIONObj.get("COMM_NAME") %>" >
		<A id="COMM_CODEHLP" name="COMM_CODEHLP"  href="#" onClick="getPicklistValues('g_pkl_commission','COMM_CODE','','')" class="linkblue" >?</A> &nbsp;
		</TD>
	</TR>
	<TR class="ste">
		<TD class="ste" nowrap>   
			<LABEL ID="COMM_CODE_NEW_label" class="userlabel"><%= field_labels.getString("MT_COMMISSION.COMM_CODE") %><SPAN class="instreditalic">*</SPAN></LABEL>
		</TD>
		<TD class="ste" colspan="7" nowrap>
			<INPUT type="text" id="COMM_CODE_NEW" name="COMM_CODE_NEW" class="input" size="10" onChange="FieldValidation(this);"
			 maxLength="10"  value="<%= (String)MT_COMMISSIONObj.get("COMM_CODE") %>" >
		</TD>
	</TR>

	<TR class="ste">
		<TD class="ste" nowrap>   
			<LABEL ID="COMM_NAME_NEW_label" class="userlabel"><%= field_labels.getString("MT_COMMISSION.NAME") %><SPAN class="instreditalic">*</SPAN></LABEL>
		</TD>
		<TD class="ste" colspan="7" nowrap>
			<INPUT type="text" id="COMM_NAME_NEW" name="COMM_NAME_NEW" class="input" size="65" onblur="FieldValidation(this);" maxLength="65"  value="<%= (String)MT_COMMISSIONObj.get("COMM_NAME") %>" >
		</TD>
	</TR>
	<TR class="ste">
		<TD class="ste" nowrap>   
			<LABEL ID="OLD_CODE_label" class="userlabel"><%= field_labels.getString("MT_COMMISSION.OLD_CODE") %></LABEL>
		</TD>
		<TD class="ste" colspan="7" nowrap>
			<INPUT type="text" id="OLD_CODE" name="OLD_CODE" class="input" size="20" onblur="FieldValidation(this);" maxLength="20"  value="<%= (String)MT_COMMISSIONObj.get("OLD_CODE") %>" >
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
			<LABEL ID="COMM_label" class="userlabel"><%= field_labels.getString("MT_COMMISSION.COMM") %></LABEL>
		</TD>
		<TD class="ste" nowrap>
			<INPUT type="text" id="COMM_MON" name="COMM_MON" class="input" size="6" onblur="FieldValidation(this);" maxLength="6"  value="0" >
		</TD>
		<TD class="ste" nowrap>
			<INPUT type="text" id="COMM_TUE" name="COMM_TUE" class="input" size="6" onblur="FieldValidation(this);" maxLength="6"  value="0" >
		</TD>
		<TD class="ste" nowrap>
			<INPUT type="text" id="COMM_WED" name="COMM_WED" class="input" size="6" onblur="FieldValidation(this);" maxLength="6"  value="0" >
		</TD>
		<TD class="ste" nowrap>
			<INPUT type="text" id="COMM_THU" name="COMM_THU" class="input" size="6" onblur="FieldValidation(this);" maxLength="6"  value="0" >
		</TD>
		<TD class="ste" nowrap>
			<INPUT type="text" id="COMM_FRI" name="COMM_FRI" class="input" size="6" onblur="FieldValidation(this);" maxLength="6"  value="0" >
		</TD>
		<TD class="ste" nowrap>
			<INPUT type="text" id="COMM_SAT" name="COMM_SAT" class="input" size="6" onblur="FieldValidation(this);" maxLength="6"  value="0" >
		</TD>
		<TD class="ste" nowrap>
			<INPUT type="text" id="COMM_SUN" name="COMM_SUN" class="input" size="6" onblur="FieldValidation(this);" maxLength="6"  value="0" >
		</TD>
	</TR>
	<TR class="ste">
		<TD class="ste" nowrap>   
			<LABEL ID="ADD_COMM_label" class="userlabel"><%= field_labels.getString("MT_COMMISSION.ADD_COMM") %></LABEL>
		</TD>
		<TD class="ste" nowrap>
			<INPUT type="text" id="ADD_COMM_MON" name="ADD_COMM_MON" class="input" size="6" onblur="FieldValidation(this);" maxLength="6"  value="0" >
		</TD>
		<TD class="ste" nowrap>
			<INPUT type="text" id="ADD_COMM_TUE" name="ADD_COMM_TUE" class="input" size="6" onblur="FieldValidation(this);" maxLength="6"  value="0" >
		</TD>
		<TD class="ste" nowrap>
			<INPUT type="text" id="ADD_COMM_WED" name="ADD_COMM_WED" class="input" size="6" onblur="FieldValidation(this);" maxLength="6"  value="0" >
		</TD>
		<TD class="ste" nowrap>
			<INPUT type="text" id="ADD_COMM_THU" name="ADD_COMM_THU" class="input" size="6" onblur="FieldValidation(this);" maxLength="6"  value="0" >
		</TD>
		<TD class="ste" nowrap>
			<INPUT type="text" id="ADD_COMM_FRI" name="ADD_COMM_FRI" class="input" size="6" onblur="FieldValidation(this);" maxLength="6"  value="0" >
		</TD>
		<TD class="ste" nowrap>
			<INPUT type="text" id="ADD_COMM_SAT" name="ADD_COMM_SAT" class="input" size="6" onblur="FieldValidation(this);" maxLength="6"  value="0" >
		</TD>
		<TD class="ste" nowrap>
			<INPUT type="text" id="ADD_COMM_SUN" name="ADD_COMM_SUN" class="input" size="6" onblur="FieldValidation(this);" maxLength="6"  value="0" >
		</TD>
	</TR>
	<TR class="ste">
		<TD class="ste" nowrap>   
			<LABEL ID="INC_label" class="userlabel"><%= field_labels.getString("MT_COMMISSION.INC") %></LABEL>
		</TD>
		<TD class="ste" nowrap>
			<INPUT type="text" id="INC_MON" name="INC_MON" class="input" size="6" onblur="FieldValidation(this);" maxLength="6"  value="0" >
		</TD>
		<TD class="ste" nowrap>
			<INPUT type="text" id="INC_TUE" name="INC_TUE" class="input" size="6" onblur="FieldValidation(this);" maxLength="6"  value="0" >
		</TD>
		<TD class="ste" nowrap>
			<INPUT type="text" id="INC_WED" name="INC_WED" class="input" size="6" onblur="FieldValidation(this);" maxLength="6"  value="0" >
		</TD>
		<TD class="ste" nowrap>
			<INPUT type="text" id="INC_THU" name="INC_THU" class="input" size="6" onblur="FieldValidation(this);" maxLength="6"  value="0" >
		</TD>
		<TD class="ste" nowrap>
			<INPUT type="text" id="INC_FRI" name="INC_FRI" class="input" size="6" onblur="FieldValidation(this);" maxLength="6"  value="0" >
		</TD>
		<TD class="ste" nowrap>
			<INPUT type="text" id="INC_SAT" name="INC_SAT" class="input" size="6" onblur="FieldValidation(this);" maxLength="6"  value="0" >
		</TD>
		<TD class="ste" nowrap>
			<INPUT type="text" id="INC_SUN" name="INC_SUN" class="input" size="6" onblur="FieldValidation(this);" maxLength="6"  value="0" >
		</TD>
	</TR>
	<TR class="ste">
		<TD class="ste" nowrap>   
			<LABEL ID="INS_label" class="userlabel"><%= field_labels.getString("MT_COMMISSION.INS") %></LABEL>
		</TD>
		<TD class="ste" nowrap>
			<INPUT type="text" id="INS_MON" name="INS_MON" class="input" size="6" onblur="FieldValidation(this);" maxLength="6"  value="0" >
		</TD>
		<TD class="ste" nowrap>
			<INPUT type="text" id="INS_TUE" name="INS_TUE" class="input" size="6" onblur="FieldValidation(this);" maxLength="6"  value="0" >
		</TD>
		<TD class="ste" nowrap>
			<INPUT type="text" id="INS_WED" name="INS_WED" class="input" size="6" onblur="FieldValidation(this);" maxLength="6"  value="0" >
		</TD>
		<TD class="ste" nowrap>
			<INPUT type="text" id="INS_THU" name="INS_THU" class="input" size="6" onblur="FieldValidation(this);" maxLength="6"  value="0" >
		</TD>
		<TD class="ste" nowrap>
			<INPUT type="text" id="INS_FRI" name="INS_FRI" class="input" size="6" onblur="FieldValidation(this);" maxLength="6"  value="0" >
		</TD>
		<TD class="ste" nowrap>
			<INPUT type="text" id="INS_SAT" name="INS_SAT" class="input" size="6" onblur="FieldValidation(this);" maxLength="6"  value="0" >
		</TD>
		<TD class="ste" nowrap>
			<INPUT type="text" id="INS_SUN" name="INS_SUN" class="input" size="6" onblur="FieldValidation(this);" maxLength="6"  value="0" >
		</TD>
	</TR>
	<TR class="ste">
		<TD class="ste" nowrap>   
			<LABEL ID="REMARKS_label" class="userlabel"><%= field_labels.getString("MT_COMMISSION.REMARKS") %></LABEL>
		</TD>
		<TD class="ste" colspan="7" nowrap>
			<INPUT type="text" id="REMARKS" name="REMARKS" class="input" size="100" onblur="FieldValidation(this);" maxLength="200"  value="<%= (String)MT_COMMISSIONObj.get("REMARKS") %>" >

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
<%}catch(Exception e){System.out.println("Exception e : "+e);e.printStackTrace();}%>