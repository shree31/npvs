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

<%@ page errorPage="errorpage.jsp" %>
<%@ page import="java.util.*" %>
<%@ page import="javax.servlet.http.*" %>
<%@ page import="org.apache.log4j.Logger" %>



<%
	Logger logger = Logger.getLogger("MT_MULTI_CUSTPYMT");
	
	String l_dist_code = request.getParameter("DIST_CD");
	String l_sup_dt_from  = request.getParameter("SUP_DT_FROM");
	String l_sup_dt_to = request.getParameter("SUP_DT_TO");
	String l_single = request.getParameter("SINGLE");
%>

<%	
	

	HashMap RPT_ORDERObj = (HashMap)request.getAttribute("RESPONSE");

	if(RPT_ORDERObj == null)
  		RPT_ORDERObj = new HashMap();
%>

<TITLE id="MT_CUSTPAYMENT_title"><%= field_labels.getString("MT_DISTENTRY.MT_CUSTPAYMENT_title") %></TITLE>

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
var l_opensearch_results = true;
// -->
</SCRIPT>
<SCRIPT Language='Javascript' type='text/javascript' src='scripts/CommonFunctions.js'> </SCRIPT>
<SCRIPT type='text/javascript' language = 'JavaScript' src='scripts/DatePicker.js'></SCRIPT>
<SCRIPT type="text/javascript" language = "JavaScript">
	var g_submit_flg = 0;
function FieldValidation(as_field_name)
{
		if(as_field_name.name=="SUP_DT_FROM")
			checkdate(as_field_name);

			if(as_field_name.name=="SUP_DT_TO")
			checkdate(as_field_name);
	return true;
}


function execute_onLoad()
{
	clearNull();
	getQueryResults("g_pkl_sysdate_plus1",'@',"","SUP_DT_FROM");
	getQueryResults("g_pkl_sysdate_plus1",'@',"","SUP_DT_TO");

	if("<%=l_single%>"=="Y") {
		document.getElementById("DIST_CD").value="<%=l_dist_code%>";
		document.getElementById("SUP_DT_FROM").value="<%=l_sup_dt_from%>";
		document.getElementById("SUP_DT_TO").value="<%=l_sup_dt_to%>";
		preSubmit();
	}
}

function preSubmit()
{
	createParamStr('DIST_CD,SUP_DT_FROM,SUP_DT_TO,CMP_CODE');
	validateSubmit();
}

</SCRIPT>

<SCRIPT type="text/javascript" language = "JavaScript">
</script>

</HEAD>
<BODY class="mainbody" onLoad="execute_onLoad()" >

<DIV id="MT_CUSTPAYMENT_div" >

<FORM name="RPT_ORDER" id="RPT_ORDER" method="post" action="reortGenToolActionServlet.do">
<INPUT type="hidden" id="Event" name="Event" value="">
<INPUT type="hidden" id="MAKER" name="MAKER" value="<%= (String)RPT_ORDERObj.get("MAKER") %>">
<INPUT type="hidden" id="MAKER_DT" name="MAKER_DT" value="">
<INPUT type="hidden" id="STATUS" name="STATUS" value="<%= (String)RPT_ORDERObj.get("STATUS") %>">
<INPUT type="hidden" id="MODE" name="MODE" value="INP">
<INPUT type="hidden" id="ENTITY" name="ENTITY" value="RPT_ORDER">
<INPUT type="hidden" id="PARAM" name="PARAM" value="<%= (String)RPT_ORDERObj.get("PARAM") %>">
<INPUT type="hidden" id="PARAM1" name="PARAM1" value="<%= (String)RPT_ORDERObj.get("PARAM1") %>">
<INPUT type="hidden" id="PARAM2" name="PARAM2" value="<%= (String)RPT_ORDERObj.get("PARAM2") %>">
<INPUT type="hidden" id="PRIMARY_KEY" name="PRIMARY_KEY" value="">
<INPUT type="hidden" id="SCREEN_NAME" name="SCREEN_NAME" value="RPT_LINK">
<INPUT type="hidden" id="ERRDESC" name="ERRDESC" value="<%= (String)RPT_ORDERObj.get("ERRDESC") %>">
<INPUT type="hidden" id="PROCESS_NAME" name="PROCESS_NAME" value="RPT_DISTENTRY">
<INPUT type="hidden" id="RPT_ID" name="RPT_ID" value="RP_DR_001">


  <TABLE class="headertable" cellspacing="0" cellpadding="0" width='100%'>
         <TD>&nbsp;</TD>
        <TR> 
           <TD class="heading" nowrap align="center">
            <%= field_labels.getString("MT_DISTENTRY.MT_CUSTPAYMENT") %>
           </TD>
        </TR>
   </TABLE>

 <TABLE class="detailstable" cellspacing="0" cellpadding="0">
 	<TR class="ste">
		<TD class="ste" nowrap>   
			<LABEL ID="CMP_CODE_label" class="userlabel"><%= field_labels.getString("MT_COMPANY.CMP_CODE") %><SPAN class="instreditalic">*</SPAN></LABEL>
		</TD>
		<TD class="ste" colspan="2" nowrap>
			<INPUT type="text" id="CMP_CODE" name="CMP_CODE" class="input" size="10" onblur="FieldValidation(this);" maxLength="10"  value="<%= (String)RPT_ORDERObj.get("CMP_CODE") %>" >
		</TD>
	</TR>

	<TR class="ste">
		<TD class="ste" nowrap>   
			<LABEL ID="DIST_CD_label" class="userlabel"><%= field_labels.getString("MT_PUBLICATION.DIST_CD") %></LABEL>
		</TD>
		<TD class="ste" nowrap>
	<SELECT class="input"name='DIST_CD' id="DIST_CD" onChange="FieldValidation(this);getCodeDesc('DIST_CD','DIST_CDDESC', 'g_pkl_DistDesc','');"  onBlur="FieldValidation(this);">
		<%
			out.println("<option value=''>Select</option>");
			out.println(obj_fetch_pick_vals.createOptionValues("g_pkl_Dist","",db_name,insstalled_at));
		%>
	</SELECT>

           	  <INPUT type="text" id="DIST_CDDESC" name="DIST_CDDESC" class="input" size="50" readonly  maxLength="50" value="<%=	(String)RPT_ORDERObj.get("DIST_CDDESC")%>">
			</TD>
	</TR>
	<TR class="ste">
		<TD class="ste" nowrap>   
			<LABEL ID="SUP_DT_FROM_label" class="userlabel"><%= field_labels.getString("RPT_ORDER.SUP_DT_FROM") %><SPAN class="instreditalic">*</SPAN></LABEL>
		</TD>
		<TD class="ste" colspan="7" nowrap>
			<INPUT type="text" id="SUP_DT_FROM" name="SUP_DT_FROM" class="input" size="10" onblur="FieldValidation(this);" maxLength="10"  value="<%= (String)RPT_ORDERObj.get("SUP_DT_FROM") %>" ><a href="#" onClick="javascript:calendar('SUP_DT_FROM',event.screenY,event.screenX,null,null,getDatePickerPattern());"
			title="Select Date"><img src="images/calendar.gif" width="16"
			height="16" border="0" /></a>
		</TD>
	</TR>

	<TR class="ste">
		<TD class="ste" nowrap>   
			<LABEL ID="SUP_DT_TO_label" class="userlabel"><%= field_labels.getString("RPT_ORDER.SUP_DT_TO") %><SPAN class="instreditalic">*</SPAN></LABEL>
		</TD>
		<TD class="ste" colspan="7" nowrap>
			<INPUT type="text" id="SUP_DT_TO" name="SUP_DT_TO" class="input" size="10" onblur="FieldValidation(this);" maxLength="10"  value="<%= (String)RPT_ORDERObj.get("SUP_DT_TO") %>" ><a href="#" onClick="javascript:calendar('SUP_DT_TO',event.screenY,event.screenX,null,null,getDatePickerPattern());"
			title="Select Date"><img src="images/calendar.gif" width="16"
			height="16" border="0" /></a>
		</TD>
	</TR>

 <TR class="formrow2" align="left"> 
  <TD class="buffercol">&nbsp; </TD>
   <TD class= "formcol"> 
    <TABLE class="eventstable" cellspacing="0" cellpadding="0">
     <TR class="eventsrow2"> 
      <TD class="eventscol" align="right">

		<INPUT TYPE="button" value="Submit" name="Submit_label" class="button" onClick="javascript:preSubmit()">
		<INPUT TYPE="button" value="Clear" name="Clear_label" class="button"  onClick="reset_field()">
		<INPUT TYPE="button" value="Print" name="Print_label" class="button"  onClick="javascript:window.print()">
		<INPUT TYPE="button" value="Back" name="Back_label" class="button"  onClick="javascript:history.go(-1)">

   </TABLE>

      </TD>
     </TR>
    </TABLE>
</FORM>
</DIV>

</BODY>
</HTML>
<%}catch(Exception e){System.out.println("Exception e : "+e);e.printStackTrace();}%>