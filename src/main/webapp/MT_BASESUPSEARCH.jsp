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
<%@ page import="com.distapp.beans.*" %>

<%
	Logger logger = Logger.getLogger("MT_BASESUPSEARCH");

	HashMap MT_AGNSUPSEARCHObj = (HashMap)request.getAttribute("RESPONSE");

	if(MT_AGNSUPSEARCHObj == null)
  		MT_AGNSUPSEARCHObj = new HashMap();

	String formName = "MT_BASESUPSEARCH";

%>




<TITLE id="MT_AGNSUPSEARCH_title"><%= field_labels.getString("MT_AGNSUPSEARCH.MT_AGNSUPSEARCH_title") %></TITLE>

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
	//clearNull();

}

function FieldValidation(as_field_name)
{
	if(as_field_name.name == "AGN_CODE")
		chkAgnCode(as_field_name);		
	return true;
}

function chkAgnCode(as_field_name)
{
		//getQueryResults('g_pkl_agencyCompany','','AGN_CODE@'+document.getElementById("AGN_CODE").value.toUpperCase(),'AGN_CODEDESC^CUST_ADDRESS^CUST_ADDRESSDESC');
}

function validateSubmit(as_field_name)
{
	if(chkMandatory()==true)
	{
		var l_agency_code = document.getElementById("AGN_CODE").value==""?"null":document.getElementById("AGN_CODE").value.toUpperCase();
		var l_CUST_ADDRESS = document.getElementById("AGN_CODEDESC").value==""?"null":document.getElementById("AGN_CODEDESC").value.toUpperCase();
		
		document.location.href="MT_AGENCYSUPPLY.jsp?AGN_CODE="+l_agency_code+"&CUST_ADDRESS="+l_CUST_ADDRESS;
		document.forms[0].target="_self";
	}
}
</SCRIPT>


<SCRIPT type="text/javascript" language = "JavaScript">
</script>

</HEAD>
<BODY class="mainbody" onLoad="execute_onLoad()" >

<DIV id="MT_AGNSUPSEARCH_div" >

<FORM name="MT_AGNSUPSEARCH" id="MT_AGNSUPSEARCH" method="post" action="distAppCommonActionServlet.do">
<INPUT type="hidden" id="Event" name="Event" value="">
<INPUT type="hidden" id="MAKER" name="MAKER" value="<%= (String)MT_AGNSUPSEARCHObj.get("MAKER") %>">
<INPUT type="hidden" id="MAKER_DT" name="MAKER_DT" value="">
<INPUT type="hidden" id="STATUS" name="STATUS" value="<%= (String)MT_AGNSUPSEARCHObj.get("STATUS") %>">
<INPUT type="hidden" id="MODE" name="MODE" value="MOD">
<INPUT type="hidden" id="PARAM1" name="PARAM1" value="<%= (String)MT_AGNSUPSEARCHObj.get("PARAM1") %>">
<INPUT type="hidden" id="PARAM2" name="PARAM2" value="<%= (String)MT_AGNSUPSEARCHObj.get("PARAM2") %>">
<INPUT type="hidden" id="ENTITY" name="ENTITY" value="MT_AGENCY_SUPPLY">
<INPUT type="hidden" id="SCREEN_NAME" name="SCREEN_NAME" value="MT_AGNSUPSEARCH">
<INPUT type="hidden" id="ERRDESC" name="ERRDESC" value="<%= (String)MT_AGNSUPSEARCHObj.get("ERRDESC") %>">
<INPUT type="hidden" id="PRIMARY_KEY" name="PRIMARY_KEY" value="AGN_CODE#PUB_CODE">
<INPUT type="hidden" id="PARAMSTR" name="PARAMSTR" value="<%=(String)MT_AGNSUPSEARCHObj.get("PARAMSTR") %>">


  <TABLE class="headertable" cellspacing="0" cellpadding="0" width='100%'>
         <TD>&nbsp;</TD>
        <TR> 
           <TD class="heading" nowrap align="center">
            <%= field_labels.getString("MT_AGNSUPSEARCH.MT_AGNSUPSEARCH") %>
           </TD>
           <TD>&nbsp;</TD>
        </TR>
   </TABLE>

 <TABLE class="detailstable" cellspacing="0" cellpadding="0">

	<TR class="ste">
		<TD class="ste" nowrap>   
			<LABEL ID="AGN_CODE_label" class="userlabel"><%= field_labels.getString("MT_AGNSUPSEARCH.AGN_CODE") %><SPAN class="instreditalic">*</SPAN></LABEL>
		</TD>
		<TD class="ste" colspan="7" nowrap>

	  <INPUT type="text" id="AGN_CODE" name="AGN_CODE" class="input" size="10" onChange="FieldValidation(this);getCodeDesc('AGN_CODE','AGN_CODEDESC', 'g_pkl_agencyDesc','AGN_CODE');"  maxLength="10" value="" >

	<!--	<select class="input"name='AGN_CODE' id="AGN_CODE" onChange="FieldValidation(this);"  onBlur="FieldValidation(this);">
		<%
			out.println("<option value=''>Select</option>");
			out.println(obj_fetch_pick_vals.createOptionValues("g_pkl_agency",""));
		%>
	</SELECT>
-->
	  <INPUT type="text" id="AGN_CODEDESC" name="AGN_CODEDESC" class="input" size="50" readonly  maxLength="50" value="" >
	<A id="AGN_CODEHLP" name="AGN_CODEEHLP"  href="#" onClick="getPicklistValues('g_pkl_agency','AGN_CODE','','')" class="linkblue" >?</A> &nbsp;

	</TD>
	</TR>	
		<!--  <TR class="ste">
		<TD class="ste" nowrap>   
			<LABEL ID="CUST_ADDRESS_label" class="userlabel"><%= field_labels.getString("MT_AGNSUPSEARCH.CUST_ADDRESS") %></LABEL>
		</TD>
		<TD class="ste" colspan="7" nowrap>
			<INPUT type="text" id="CUST_ADDRESS" name="CUST_ADDRESS" class="input" size="10" readonly onChange="FieldValidation(this);getCodeDesc('CUST_ADDRESS','CUST_ADDRESSDESC','g_pkl_Address','CUST_ADDRESS');" maxLength="10"  value="" >
	  <INPUT type="text" id="CUST_ADDRESSDESC" name="CUST_ADDRESSDESC" class="input" size="50" readonly  maxLength="50" value="" >
		<A id="CUST_ADDRESSHLP" name="CUST_ADDRESSHLP"  href="#" onClick="getPicklistValues('g_pkl_Address','CUST_ADDRESS','','')" class="linkblue" >?</A> &nbsp;

	</TR>	-->

     </TD>
    </TR>
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
   </TABLE>


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