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
	Logger logger = Logger.getLogger("RPT_BILL");

	HashMap RPT_BILLObj = (HashMap)request.getAttribute("RESPONSE");

	
	if(RPT_BILLObj == null)
  		RPT_BILLObj = new HashMap();

	String formName = "RPT_BILL";

%>

<TITLE id="RPT_BILL_title"><%= field_labels.getString("RPT_BILL.RPT_BILL_title") %></TITLE>

<LINK rel='stylesheet' href='scripts/style.css' type='text/css'>
<SCRIPT Language='Javascript' type='text/javascript' src='scripts/CommonFunctions.js'></SCRIPT>
<SCRIPT Language='Javascript' type='text/javascript' src='scripts/DatePicker.js'> </SCRIPT>
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

function execute_onLoad()
{
	clearNull();
	document.getElementById("PUB_CODE").parentElement.parentElement.style.display="none";
	setfldNonMandatory("PUB_CODE");
	document.getElementById("BILL_FREQ").value ="M";
	document.getElementById("BILL_FREQ").onchange();
	chkPrintType("PRINT_TYPE")
}

function FieldValidation(as_field_name)
{
	if(as_field_name.name == "RPT_TYPE")
	{
		chkRptType(as_field_name);
	}
	if(as_field_name.name == "PRINT_TYPE")
	{
		chkPrintType(as_field_name);
	}
	if(as_field_name.name == "BILL_FREQ")
	{
		if(as_field_name.value.toUpperCase()=="M")
		{
//			document.getElementById("PUB_CODE").parentElement.parentElement.style.display="block";
//			setfldMandatory("PUB_CODE");
		}
		else
		{
			document.getElementById("PUB_CODE").parentElement.parentElement.style.display="none";
			setfldNonMandatory("PUB_CODE");
		}
	}
	if(as_field_name.name == "YEAR")
	{
		setCriteriaValue(as_field_name);
	}

	return true;
}

function chkPrintType(as_field_name)
{	
	//alert(as_field_name.accessKey);
	if(as_field_name.accessKey == "A6")
		{
//			document.getElementById("RPT_ID").value="RP_BI_001";
			document.getElementById("PRINT_TYPE").value="A6";
		}
		else
		{
			document.getElementById("PRINT_TYPE").value="A5";
		}
}

function chkRptType(as_field_name)
{	
//	alert(as_field_name.accessKey);
	if(as_field_name.accessKey == "P")
		{
//			document.getElementById("RPT_ID").value="RP_BI_001";
			document.getElementById("PROCESS_NAME").value="BILL_PRINT";
			document.getElementById("PRINT_TYPE").parentElement.parentElement.style.display="block";
		}
		else
		{
			document.getElementById("RPT_ID").value="RP_BR_001";
			document.getElementById("PROCESS_NAME").value="BILL_REG";
			document.getElementById("PRINT_TYPE").parentElement.parentElement.style.display="none";
		}
}
function chkPrintType_Monthly(as_field_name)
{
	//alert("as_field_name.accessKey5 "+document.getElementById("PRINT_TYPE_A5").checked); 
	//alert("as_field_name.accessKey6 "+document.getElementById("PRINT_TYPE_A6").checked); 
	if(document.getElementById("PRINT_TYPE_A6").checked==true)
	{
		if(g_bill_group_flag == "Y")
			document.getElementById("RPT_ID").value="RP_BI_A6G";
		else
				document.getElementById("RPT_ID").value="RP_BI_A6";
	}
	else
	{
		if(g_bill_group_flag == "Y")
			document.getElementById("RPT_ID").value="RP_BI_001G";
		else
				document.getElementById("RPT_ID").value="RP_BI_001";
	}
//if(document.getElementById("RPT_ID").value !="RP_BR_001")
//	{
//	if(document.getElementById(as_field_name+"_S").checked==true)
//			document.getElementById("RPT_ID").value="RP_BI_003";
//		else
//		{
//			if(document.getElementById("COMPANY").value == "RPPL")
//				document.getElementById("RPT_ID").value="RP_BI_004";
//		}
//	}
}

function chkPrintType_Weekly(as_field_name)
{
			document.getElementById("RPT_ID").value="RP_BI_004";
//	if(document.getElementById("RPT_ID").value !="RP_BR_001")
//	{
//	if(document.getElementById(as_field_name+"_S").checked==true)
//			document.getElementById("`").value="RP_BI_001";
//		else
//			document.getElementById("RPT_ID").value="RP_BI_002";
//	}
}

function setCriteriaValue(as_field_name)
{
		if(document.getElementById("BILL_FREQ").value!="" && document.getElementById("MONTH").value!="" && document.getElementById("YEAR").value!="" )
		{
			var l_criteria=document.getElementById("BILL_FREQ").value +'@'+ document.getElementById("MONTH").value +'@'+ document.getElementById("YEAR").value;
			populateDropDownVals('g_pkl_billDates','BILL_DATE',l_criteria);

	//		if(document.RPT_BILL.BILL_DATE.options[1] != null)
	//			document.RPT_BILL.BILL_DATE.options[1].selected = true;
		}
}

function preSubmit()
{
	if(document.getElementById("BILL_FREQ").value.toUpperCase()=="M")
	{
		chkPrintType_Monthly("PRINT_TYPE");
//		createParamStr('BILL_FREQ,BILL_DATE,AGN_CODE,AREA_CODE,ROUTE_CODE,PUB_CODE,PUB_CODEDESC,CATEGORY_CODE,DELIVERY_CODE');
		createParamStr('BILL_FREQ,BILL_DATE,AGN_CODE,ROUTE_CODE,CATEGORY_CODE,DLV_CODE');
	}
	else 
	{
		chkPrintType_Weekly("PRINT_TYPE");
		createParamStr('BILL_FREQ,BILL_DATE,AGN_CODE,ROUTE_CODE,CATEGORY_CODE,DLV_CODE');
	}
//	document.getElementById("RPT_ID").value="RP_BI_001";

	validateSubmit();
}

</SCRIPT>


<SCRIPT type="text/javascript" language = "JavaScript">
</script>

</HEAD>
<BODY class="mainbody" onLoad="execute_onLoad()" >

<DIV id="RPT_BILL_div" >

<FORM name="RPT_BILL" id="RPT_BILL" method="post" action="reortGenToolActionServlet.do">
<INPUT type="hidden" id="Event" name="Event" value="">
<INPUT type="hidden" id="MAKER" name="MAKER" value="<%= (String)RPT_BILLObj.get("MAKER") %>">
<INPUT type="hidden" id="MAKER_DT" name="MAKER_DT" value="">
<INPUT type="hidden" id="STATUS" name="STATUS" value="<%= (String)RPT_BILLObj.get("STATUS") %>">
<INPUT type="hidden" id="MODE" name="MODE" value="INP">
<INPUT type="hidden" id="ENTITY" name="ENTITY" value="RPT_BILL">
<INPUT type="hidden" id="PARAM" name="PARAM" value="<%= (String)RPT_BILLObj.get("PARAM") %>">
<INPUT type="hidden" id="PARAM1" name="PARAM1" value="<%= (String)RPT_BILLObj.get("PARAM1") %>">
<INPUT type="hidden" id="PARAM2" name="PARAM2" value="<%= (String)RPT_BILLObj.get("PARAM2") %>">
<INPUT type="hidden" id="PRIMARY_KEY" name="PRIMARY_KEY" value="">
<INPUT type="hidden" id="SCREEN_NAME" name="SCREEN_NAME" value="RPT_LINK">
<INPUT type="hidden" id="ERRDESC" name="ERRDESC" value="<%= (String)RPT_BILLObj.get("ERRDESC") %>">
<INPUT type="hidden" id="PROCESS_NAME" name="PROCESS_NAME" value="BILL_PRINT">
<INPUT type="hidden" id="RPT_ID" name="RPT_ID" value="RP_BI_001">


    <TABLE class="headertable" cellspacing="0" cellpadding="0" width='100%'>
         <TD>&nbsp;</TD>
        <TR> 
           <TD class="heading" nowrap align="center">
            <%= field_labels.getString("RPT_BILL.RPT_BILL") %>
           </TD>
           <TD>&nbsp;</TD>
        </TR>
   </TABLE>
 
 <TABLE class="detailstable" cellspacing="0" cellpadding="0">



	<TR class="ste">
		<TD class="ste" nowrap>   
			<LABEL ID="PRINT_TYPE_label" class="userlabel"><%= field_labels.getString("RPT_BILL.PRINT_TYPE") %></LABEL>
		</TD>
		<TD class="ste" colspan="2" nowrap>

		<INPUT type="radio" id="PRINT_TYPE_A5" name="PRINT_TYPE" checked onClick="FieldValidation(this);" value="A5" accessKey="A5" ><%= field_labels.getString("RPT_BILL.PRINT_TYPE_Option1") %>

		<INPUT type="radio" id="PRINT_TYPE_A6" name="PRINT_TYPE"  onClick="FieldValidation(this);" value="A6" accessKey="A6" ><%= field_labels.getString("RPT_BILL.PRINT_TYPE_Option2") %>

		</TD>
	</TR>

			<TR class="ste">
		<TD class="ste" nowrap>   
			<LABEL ID="CMP_CODE_label" class="userlabel"><%= field_labels.getString("RPT_BILL.CMP_CODE") %><SPAN class="instreditalic">*</SPAN></LABEL>
		</TD>
		<TD class="ste" colspan="7" nowrap>
			<INPUT type="text" id="CMP_CODE" name="CMP_CODE" class="input" size="10" onChange="FieldValidation(this);getCodeDesc('CMP_CODE','CMP_CODEDESC', 'g_pkl_companyDesc','');" maxLength="10"  value="<%= (String)RPT_BILLObj.get("CMP_CODE") %>" >

	  <INPUT type="text" id="CMP_CODEDESC" name="CMP_CODEDESC" class="input" size="50" readonly  maxLength="50" value="<%= 
	(String)RPT_BILLObj.get("CMP_CODEDESC") %>" >
		<A id="CMP_CODEHLP" name="CMP_CODEHLP"  href="#" onClick="getPicklistValues('g_pkl_company','CMP_CODE','','')" class="linkblue" >?</A> &nbsp;
		</TD>
	</TR>
		<TR class="ste">
		<TD class="ste" nowrap>   
			<LABEL ID="BILL_FREQ_label" class="userlabel"><%= field_labels.getString("RPT_BILL.BILL_FREQ") %><SPAN class="instreditalic">*</SPAN></LABEL>
		</TD>
		<TD class="ste" colspan="7" nowrap>
			<INPUT type="text" id="BILL_FREQ" name="BILL_FREQ" class="input" size="1"  onChange="FieldValidation(this);getCodeDesc('BILL_FREQ','BILL_FREQDESC', 'g_pkl_billfreqDesc','KEY_CODE');" maxLength="1"  value="<%= (String)RPT_BILLObj.get("BILL_FREQ") %>" >
	  <INPUT type="text" id="BILL_FREQDESC" name="BILL_FREQDESC" class="input" size="30" maxLength="30" value="<%= 
	(String)RPT_BILLObj.get("BILL_FREQDESC") %>" >
		<A id="BILL_FREQHLP" name="BILL_FREQHLP"  href="#" onClick="getPicklistValues('g_pkl_billProcfreq','BILL_FREQ','','')" class="linkblue" >?</A> &nbsp;
		</TD>
	</TR>
	<TR class="ste">
		<TD class="ste" nowrap>   
			<LABEL ID="PUB_CODE_label" class="userlabel"><%= field_labels.getString("RPT_BILL.PUB_CODE") %><SPAN class="instreditalic">*</SPAN></LABEL>
		</TD>
		<TD class="ste" colspan="7" nowrap>
			<INPUT type="text" id="PUB_CODE" name="PUB_CODE" class="input" size="10"  onChange="FieldValidation(this);getCodeDesc('PUB_CODE,CMP_CODE','PUB_CODEDESC', 'g_pkl_publicationDesc','');" maxLength="10"  value="<%= (String)RPT_BILLObj.get("PUB_CODE") %>" >

	  <INPUT type="text" id="PUB_CODEDESC" name="PUB_CODEDESC" class="input" size="50" readonly  maxLength="50" value="<%= 
	(String)RPT_BILLObj.get("PUB_CODEDESC") %>" >
		<A id="PUB_CODEHLP" name="PUB_CODEHLP"  href="#" onClick="getPicklistValues('g_pkl_publication','PUB_CODE','CMP_CODE','')" class="linkblue" >?</A> &nbsp;
		</TD>
	</TR>

	<TR class="ste">
		<TD class="ste" nowrap>   
			<LABEL ID="MONTH_label" class="userlabel"><%= field_labels.getString("RPT_BILL.MONTH") %><SPAN class="instreditalic">*</SPAN></LABEL>
		</TD>
		<TD class="ste" colspan="7" nowrap>
		<select class="input"name='MONTH' id="MONTH" onChange="FieldValidation(this);"  onBlur="FieldValidation(this);">
		<%
			out.println("<option value=''>Select</option>");
			out.println("<option value='January'>January</option>");
			out.println("<option value='February'>February</option>");
			out.println("<option value='March'>March</option>");
			out.println("<option value='April'>April</option>");
			out.println("<option value='May'>May</option>");
			out.println("<option value='June'>June</option>");
			out.println("<option value='July'>July</option>");
			out.println("<option value='August'>August</option>");
			out.println("<option value='September'>September</option>");
			out.println("<option value='October'>October</option>");
			out.println("<option value='November'>November</option>");
			out.println("<option value='December'>December</option>");
		%>
	</SELECT>
		</TD>
	</TR>

	<TR class="ste">
		<TD class="ste" nowrap>   
			<LABEL ID="YEAR_label" class="userlabel"><%= field_labels.getString("RPT_BILL.YEAR") %><SPAN class="instreditalic">*</SPAN></LABEL>
		</TD>
		<TD class="ste" colspan="7" nowrap>
			<INPUT type="text" id="YEAR" name="YEAR" class="input" size="4" onblur="FieldValidation(this);" maxLength="4"  value="<%= (String)RPT_BILLObj.get("YEAR") %>" >
		</TD>
	</TR>

		<TR class="ste">
		<TD class="ste" nowrap>   
			<LABEL ID="BILL_DATE_label" class="userlabel"><%= field_labels.getString("RPT_BILL.BILL_DATE") %><SPAN class="instreditalic">*</SPAN></LABEL>
		</TD>
		<TD>
		<SELECT id="BILL_DATE" name="BILL_DATE" class="input" onChange="FieldValidation(this);" >
           <OPTION value="">Select</OPTION>
		   </SELECT>

		</TD>
	</TR>

	<TR class="ste">
	        <TD class="ste" nowrap>   
				<LABEL ID="AGN_CODE_label" class="userlabel"><%= field_labels.getString("RPT_BILL.AGN_CODE") %></LABEL>
		
		</TD>
		<TD>
				<INPUT type="text" id="AGN_CODE" name="AGN_CODE" class="input" size="10" maxLength="10"  value=""
			onChange="FieldValidation(this);getCodeDesc('AGN_CODE','AGN_NAME', 'g_pkl_agencyDesc','');" >
		  <INPUT type="text" id="AGN_NAME" name="AGN_NAME" class="input" size="50"  readonly maxLength="50" value="" >
			<A id="AGN_CODEHLP" name="AGN_CODEEHLP"  href="#" onClick="getPicklistValues('g_pkl_agency','AGN_CODE','','')" class="linkblue" >?</A> &nbsp;

		</TD>
</TR>
		<TR class="ste">
	        <TD class="ste" nowrap>   
				<LABEL ID="CATEGORY_CODE_label" class="userlabel"><%= field_labels.getString("RPT_BILL.CATEGORY_CODE") %></LABEL>
		
		</TD>
		<TD>
				<INPUT type="text" id="CATEGORY_CODE" name="CATEGORY_CODE" class="input" size="10" maxLength="10"  value=""
			onChange="FieldValidation(this);getCodeDesc('CATEGORY_CODE','CATEGORY_NAME', 'g_pkl_categoryDesc','CTG_CODE');" >
		  <INPUT type="text" id="CATEGORY_NAME" name="CATEGORY_NAME" class="input" size="50"  readonly maxLength="50" value="" >
			<A id="CATEGORY_CODEHLP" name="CATEGORY_CODEHLP"  href="#" onClick="getPicklistValues('g_pkl_category','CATEGORY_CODE','','')" class="linkblue" >?</A>
			</TD>
			</TR>

	<!--<TR class="ste">
	        <TD class="ste" nowrap>   
				<LABEL ID="AREA_CODE_label" class="userlabel"><%= field_labels.getString("RPT_BILL.AREA_CODE") %></LABEL>
		
		</TD>
		<TD>
				<INPUT type="text" id="AREA_CODE" name="AREA_CODE" class="input" size="10" maxLength="10"  value=""
			onChange="FieldValidation(this);getCodeDesc('AREA_CODE','AREA_NAME', 'g_pkl_areaDesc','');" >
		  <INPUT type="text" id="AREA_NAME" name="AREA_NAME" class="input" size="50"  readonly maxLength="50" value="" >
			<A id="AREA_CODEHLP" name="AREA_CODEEHLP"  href="#" onClick="getPicklistValues('g_pkl_area','AREA_CODE','','')" class="linkblue" >?</A> &nbsp;

		</TD>
</TR>-->
<TR class="ste">
	        <TD class="ste" nowrap>   
				<LABEL ID="ROUTE_CODE_label" class="userlabel"><%= field_labels.getString("RPT_BILL.ROUTE_CODE") %></LABEL>
		
		</TD>
		<TD>
				<INPUT type="text" id="ROUTE_CODE" name="ROUTE_CODE" class="input" size="10" maxLength="10"  value=""
			onChange="FieldValidation(this);getCodeDesc('ROUTE_CODE','ROUTE_NAME', 'g_pkl_routeDesc','');" >
		  <INPUT type="text" id="ROUTE_NAME" name="ROUTE_NAME" class="input" size="50"  readonly maxLength="50" value="" >
			<A id="ROUTE_CODEHLP" name="ROUTE_CODEEHLP"  href="#" onClick="getPicklistValues('g_pkl_route','ROUTE_CODE','','')" class="linkblue" >?</A> &nbsp;

		</TD>
</TR>
		<TR class="ste">
	        <TD class="ste" nowrap>   
				<LABEL ID="DLV_CODE_label" class="userlabel"><%= field_labels.getString("RPT_BILL.DELIVERY_CODE") %></LABEL>
		
			</TD>
			<TD>
			<INPUT type="text" id="DLV_CODE" name="DLV_CODE" class="input" size="10" onChange="FieldValidation(this);getCodeDesc('DLV_CODE','DLV_CODEDESC','g_pkl_deliveryDesc','');" 
					maxLength="10" value="<%=(String) RPT_BILLObj.get("DLV_CODE")%>" >
			<INPUT type="text" id="DLV_CODEDESC" name="DLV_CODEDESC" class="input" size="50" readonly  maxLength="50" value="<%=(String) RPT_BILLObj.get("DLV_CODEDESC")%>" />
			<A id="DLV_CODEHLP" name="DLV_CODEHLP"  href="#" onClick="getPicklistValues('g_pkl_delivery','DLV_CODE','','')" class="linkblue" >?</A> &nbsp;
			</TD>
		</TR>

<!-- 	<TR class="ste">
		<TD class="ste" nowrap>   
			<LABEL ID="BILL_SDATE_label" class="userlabel"><%= field_labels.getString("RPT_BILL.BILL_SDATE") %><SPAN class="instreditalic">*</SPAN></LABEL>
		</TD>
		<TD class="ste" colspan="7" nowrap>
			<INPUT type="text" id="BILL_SDATE" name="BILL_SDATE" class="input" size="10" onblur="FieldValidation(this);" maxLength="10"  value="<%= (String)RPT_BILLObj.get("BILL_SDATE") %>" > <a id="BILL_SDATEHLP" href="#" onClick="javascript:calendar('BILL_SDATE',event.screenY,event.screenX,null,null,getDatePickerPattern());"
			title="Select Date"> <img src="images/calendar.gif" width="16"
			height="16" border="0" /></a>
		</TD>
	</TR>
	<TR class="ste">
		<TD class="ste" nowrap>   
			<LABEL ID="BILL_EDATE_label" class="userlabel"><%= field_labels.getString("RPT_BILL.BILL_EDATE") %><SPAN class="instreditalic">*</SPAN></LABEL>
		</TD>
		<TD class="ste" colspan="7" nowrap>
			<INPUT type="text" id="BILL_EDATE" name="BILL_EDATE" class="input" size="10" onblur="FieldValidation(this);" maxLength="10"  value="<%= (String)RPT_BILLObj.get("BILL_EDATE") %>" > <a id="BILL_EDATEHLP" href="#" onClick="javascript:calendar('BILL_EDATE',event.screenY,event.screenX,null,null,getDatePickerPattern());"
			title="Select Date"> <img src="images/calendar.gif" width="16"
			height="16" border="0" /></a>
		</TD>
	</TR> -->

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



