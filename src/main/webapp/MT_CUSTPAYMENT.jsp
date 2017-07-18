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
	Logger logger = Logger.getLogger("MT_CUSTPAYMENT");
	
	String l_agency_code = request.getParameter("AGN_CODE");
	String l_cust_address = request.getParameter("CUST_ADDRESS");
	String l_month = request.getParameter("MONTH");
	String l_year = request.getParameter("YEAR");

	ArrayList l_outer_array = new ArrayList();
	String l_str_query=null;
	String l_cust_address_arr[]=null;
	String system_date=Common_distAppServlet.getSystemDate();
	if(l_agency_code!=null)
	{
		if(!(l_agency_code.equals("null")))
		{
			l_cust_address_arr = l_cust_address.split(" - ");
			l_str_query = obj_fetch_pick_vals.getQuery("MT_CUSTPAYMENT.1");

		if(!(l_cust_address.equals("null")))
			l_str_query = l_str_query + " AND (A.DLV_CODE like '%"+l_cust_address_arr[1]+"%' )";

		if(!(l_month.equals("null")))
			l_str_query = l_str_query + " AND MONTHNAME(BILL_GEN_DT)='"+l_month+"'";

		if(!(l_year.equals("null")))
			l_str_query = l_str_query + " AND YEAR(BILL_GEN_DT)='"+l_year+"'";

		l_str_query = l_str_query + ")";

		l_str_query = l_str_query+obj_fetch_pick_vals.getQuery("MT_CUSTPAYMENT.2");

		if(!(l_cust_address.equals("null")))
			l_str_query = l_str_query + " AND (A.DLV_CODE like '%"+l_cust_address_arr[1]+"%' )";

		if(!(l_month.equals("null")))
			l_str_query = l_str_query + " AND MONTHNAME(BILL_DATE)='"+l_month+"'";

		if(!(l_year.equals("null")))
			l_str_query = l_str_query + " AND YEAR(BILL_DATE)='"+l_year+"'";

		l_str_query = l_str_query + ") ORDER BY str_to_date( BILL_DATE, '%d/%m/%Y') DESC";

		ArrayList<String> replaceValues = new  ArrayList<String>();
		replaceValues.add("@AGN_CODE#"+l_agency_code);
		replaceValues.add("@SYS_DT#"+system_date);
		replaceValues.add("@DB_NAME#"+db_name);
		replaceValues.add("@LOGIN_USR_VENDOR_ID#"+insstalled_at);
		l_str_query=obj_fetch_pick_vals.finalQuery(l_str_query, replaceValues);
		replaceValues = null;
		l_outer_array = obj_fetch_pick_vals.getQueryResults(l_str_query);

		}
	}
%>

<%	
	HashMap MT_CUSTPAYMENTObj = (HashMap)request.getAttribute("RESPONSE");

	if(MT_CUSTPAYMENTObj == null)
  		MT_CUSTPAYMENTObj = new HashMap();

	String formName = "MT_CUSTPAYMENT";

%>

<TITLE id="MT_CUSTPAYMENT_title"><%= field_labels.getString("MT_CUSTPAYMENT.MT_CUSTPAYMENT_title") %></TITLE>

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
	if(as_field_name.name == "AGN_CODE")
		chkAgnCode(as_field_name);		

	return true;
}



function execute_onLoad()
{
	clearNull();
	if(document.getElementById("AGN_CODE") != null)
		document.getElementById("AGN_CODE").value = "";
<%
if(l_outer_array.size()<=0 && l_agency_code != "null" && l_agency_code != null)	
	{

%>
	alert("No Pending Payments for Agency <%=l_agency_code%> !!!");

document.getElementById("AGN_CODE").value = "";
	<%
		l_agency_code = "null";
	}
	%>
}

function chkAgnCode(as_field_name)
{	
	//getQueryResults('g_pkl_agencyCompany','','AGN_CODE@'+document.getElementById("AGN_CODE").value.toUpperCase(),'AGN_CODEDESC^CMP_CODE^CMP_CODEDESC');
}

function validateSubmit(as_field_name)
{
		if("<%=l_agency_code%>"=="null")
		{
			if(chkMandatory()==true)
			{
				var l_agency_code = document.getElementById("AGN_CODE").value==""?"null":document.getElementById("AGN_CODE").value.toUpperCase();
				var l_month = document.getElementById("MONTH").value==""?"null":document.getElementById("MONTH").value;
				var l_year = document.getElementById("YEAR").value==""?"null":document.getElementById("YEAR").value.toUpperCase();
				var l_cust_address = document.getElementById("AGN_CODEDESC").value==""?"null":document.getElementById("AGN_CODEDESC").value.toUpperCase();
				
				//document.location.href="MT_CUSTPAYMENT.jsp?AGN_CODE="+l_agency_code+"&CMP_CODE="+l_cust_address;
				document.location.href="MT_CUSTPAYMENT.jsp?AGN_CODE="+l_agency_code+"&CUST_ADDRESS="+l_cust_address+"&MONTH="+l_month+"&YEAR="+l_year;
				document.forms[0].target="_self";
			}
		}
		else
		{
			var l_paramstr="";
			var count = document.getElementById("count").value;
//			for (var i =0; i < parseInt(count); i++) 
//			{
//				if(document.getElementById('PROCESS'+i).value != 'E')
//				{
//					continue;
//				}
					var i =0;
					var agn_code = "<%=l_agency_code%>";
					var bill_date = document.getElementById('BILLMONTHYEAR'+i).value;
					var bill_amt = document.getElementById('BILL_AMOUNT'+i).value;
					var rec_amt = document.getElementById('REC_AMOUNT'+i).value;
					var pend_amt = document.getElementById('PEND_AMOUNT'+i).value;
					var pymt_mode = document.getElementById('PYMT_MODE'+i).value;
					//alert(pymt_mode);
					if(rec_amt == 0)
					{
						alert('Please enter Received Amount for row '+(i+1));
						return false;
					}
					if(pymt_mode == "")
					{
						alert('Please select Mode of Payment for row '+(i+1));
						return false;
					}
					var chq_no = document.getElementById('CHQ_NO'+i).value;
					var chq_dt = document.getElementById('CHQ_DT'+i).value;
					var bnk_name = document.getElementById('BANK_NAME'+i).value;
					var mode_type = document.getElementById('MODE'+i).value;
					var remarks =  document.getElementById('REMARKS'+i).value;
					var adjust_amt =  document.getElementById('ADJUST_AMT'+i).value;
					var pay_rec_dt =  document.getElementById('PAY_REC_DT'+i).value;

					l_paramstr = l_paramstr + agn_code + "," + bill_date + "," + bill_amt+ "," + rec_amt+ "," + pend_amt+ "," + pymt_mode+ "," + chq_no+ "," + chq_dt+ "," + bnk_name+ "," +remarks+ "," +mode_type+","+adjust_amt+","+pay_rec_dt+"#";
//			}

			if(l_paramstr=="")
				alert("Please select record.");

			document.getElementById("PARAM2").value=l_paramstr;

			//alert(document.getElementById("PARAM2").value);
				document.forms[0].submit();
		}
}

function callDetailsPage(as_param_str)
	{
		//alert(as_param_str);

		document.parent.frames['BASESUPSEARCH'].href="MT_AGNSEARCHRESULTS.jsp?PARAMSTR="+as_param_str;
		document.frames['BASESUPSEARCH'].target="SEARCHDET";
		//window.open("MT_AGNSEARCHRESULTS.jsp?PARAMSTR="+as_param_str,"DetailsPage","status=no,addressbar=no,toolbar=no,menubar=no,resizable=no,scrollbars=yes,left=0,top=0,resizable=yes,width="+ eval(screen.width-10) +",height="+ eval(screen.height-80)+')');
	}

function calcPendAmt(i)
	{
		if( parseFloat(document.getElementById("REC_AMOUNT"+i).value) > parseFloat(document.getElementById("BILL_AMOUNT"+i).value) )
		{
			alert("Recieved amount should not be grater than bill amount");
			//return false;
		}
		
		if(parseFloat(document.getElementById("ADJUST_AMT"+i).value)  > parseFloat(document.getElementById("BILL_AMOUNT"+i).value))
		{
			alert("Adjusted amount should not be grater than bill amount");
			//return false;
		}

		if(parseFloat(document.getElementById("REC_AMOUNT"+i).value) + parseFloat(document.getElementById("ADJUST_AMT"+i).value)  > parseFloat(document.getElementById("BILL_AMOUNT"+i).value))
		{
			alert("Sum of Adjusted amount and Recived amout should not be grater than bill amount");
			//return false;
		}

		document.getElementById("PEND_AMOUNT"+i).value = parseFloat(document.getElementById("BILL_AMOUNT"+i).value) - parseFloat(document.getElementById("REC_AMOUNT"+i).value)- parseFloat(document.getElementById("ADJUST_AMT"+i).value);

	}
</SCRIPT>

<SCRIPT type="text/javascript" language = "JavaScript">
</script>

</HEAD>
<BODY class="mainbody" onLoad="execute_onLoad()" >

<DIV id="MT_CUSTPAYMENT_div" >

<FORM name="MT_CUSTPAYMENT" id="MT_CUSTPAYMENT" method="post" action="distAppCommonActionServlet.do">
<INPUT type="hidden" id="Event" name="Event" value="">
<INPUT type="hidden" id="MAKER" name="MAKER" value="<%= (String)MT_CUSTPAYMENTObj.get("MAKER") %>">
<INPUT type="hidden" id="MAKER_DT" name="MAKER_DT" value="">
<INPUT type="hidden" id="STATUS" name="STATUS" value="<%= (String)MT_CUSTPAYMENTObj.get("STATUS") %>">
<INPUT type="hidden" id="MODE" name="MODE" value="MT_CUSTPAY">
<INPUT type="hidden" id="PARAM1" name="PARAM1" value="<%= (String)MT_CUSTPAYMENTObj.get("PARAM1") %>">
<INPUT type="hidden" id="PARAM2" name="PARAM2" value="<%= (String)MT_CUSTPAYMENTObj.get("PARAM2") %>">
<INPUT type="hidden" id="ENTITY" name="ENTITY" value="TR_PAY_HIS_DETAILS">
<INPUT type="hidden" id="SCREEN_NAME" name="SCREEN_NAME" value="MT_CUSTPAYMENT">
<INPUT type="hidden" id="ERRDESC" name="ERRDESC" value="<%= (String)MT_CUSTPAYMENTObj.get("ERRDESC") %>">
<INPUT type="hidden" id="PRIMARY_KEY" name="PRIMARY_KEY" value="AGN_CODE#BILL_GEN_DT,DATE">
<INPUT type="hidden" id="PARAMSTR" name="PARAMSTR" value="<%=(String)MT_CUSTPAYMENTObj.get("PARAMSTR") %>">

  <TABLE class="headertable" cellspacing="0" cellpadding="0" width='100%'>
         <TD>&nbsp;</TD>
        <TR> 
           <TD class="heading" nowrap align="center">
            <%= field_labels.getString("MT_CUSTPAYMENT.MT_CUSTPAYMENT") %>
           </TD>
        </TR>
   </TABLE>


<%
if(l_outer_array.size()<=0)	
	{
%>

 <TABLE class="detailstable" cellspacing="0" cellpadding="0">
	<TR class="ste">
		<TD class="ste" nowrap>   
			<LABEL ID="AGN_CODE_label" class="userlabel"><%= field_labels.getString("MT_CUSTPAYMENT.AGN_CODE") %><SPAN class="instreditalic">*</SPAN></LABEL>
		</TD>
		<TD class="ste" colspan="1" nowrap>

	  <INPUT type="text" id="AGN_CODE" name="AGN_CODE" class="input" size="10" onChange="FieldValidation(this);getCodeDesc('AGN_CODE','AGN_CODEDESC', 'g_pkl_agencyDesc','');"  maxLength="10" value="<%=l_agency_code%>" >

	  <INPUT type="text" id="AGN_CODEDESC" name="AGN_CODEDESC" class="input" size="50" readonly  maxLength="50" value="" >
	<A id="AGN_CODEHLP" name="AGN_CODEEHLP"  href="#" onClick="getPicklistValues('g_pkl_agency','AGN_CODE','','')" class="linkblue" >?</A> &nbsp;

	</TR>	
	</TR>	
		<TR class="ste">
		<TD class="ste" nowrap>   
			<LABEL ID="YEAR_label" class="userlabel"><%= field_labels.getString("MT_CUSTPAYMENT.YEAR") %></LABEL>
		</TD>
		<TD class="ste" colspan="1" nowrap>
			<INPUT type="text" id="YEAR" name="YEAR" class="input" size="10" onChange="FieldValidation(this);" maxLength="4"  value="" >
			<LABEL ID="MONTH_label" class="userlabel"><%= field_labels.getString("MT_CUSTPAYMENT.MONTH") %></LABEL>
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
<%}%>


<%
if(l_outer_array.size()>0)	
	{
	%>
	<TR class="str">
		<TD class="str" nowrap colspan="2">   
			<LABEL ID="AGN_CODE_label" class="userlabel"><%= field_labels.getString("MT_CUSTPAYMENT.AGN_CODE") %><SPAN class="instreditalic"> &nbsp;&nbsp;&nbsp;: &nbsp;&nbsp;&nbsp;</SPAN></LABEL>
			<LABEL ID="AGN_CODE_label" class="userlabel"><B><%=l_agency_code%></B></LABEL>

		</TD>
			<TD class="str" nowrap colspan="2">   
			<LABEL ID="CUST_ADDRESS_label" class="userlabel"><%= field_labels.getString("MT_CUSTPAYMENT.CUST_ADDRESS") %><SPAN class="instreditalic"> &nbsp;&nbsp;&nbsp;: &nbsp;&nbsp;&nbsp;</SPAN></LABEL>
			<LABEL ID="CUST_ADDRESS_label" class="userlabel"><B><%=l_cust_address%></B></LABEL>

		</TD>

<!--		<TD colspan="4">
			<LABEL ID="CMP_CODE_label" class="userlabel"><%= field_labels.getString("MT_CUSTPAYMENT.MONTH") %><SPAN class="instreditalic">&nbsp;&nbsp;&nbsp;: &nbsp;&nbsp;&nbsp;</SPAN></LABEL>
			<LABEL ID="CMP_CODE_label" class="userlabel"><B><%=l_cust_address.equals("null")?"":l_cust_address%></B></LABEL>
		</TD>
	</TR>  -->
</TR>
<TR>&nbsp;</TR>

	 <TABLE class="detailstable" cellspacing="0" cellpadding="0">


	<TR class="str">

		<TR class="str">
		<TD class="str" wrap>   
			<LABEL ID="SR_NO_label" class="userlabel"><%= field_labels.getString("MT_CUSTPAYMENT.RECORD_NO") %></LABEL>
		</TD>
		<TD class="str" wrap>   
			<LABEL ID="BILLMONTHYEAR_label" class="userlabel"><%= field_labels.getString("MT_CUSTPAYMENT.BILLMONTHYEAR") %></LABEL>
		</TD>
		<TD class="str" wrap>   
			<LABEL ID="BILL_AMOUNT_label" class="userlabel"><%= field_labels.getString("MT_CUSTPAYMENT.BILL_AMOUNT") %></LABEL>
		</TD>
		<TD class="str" wrap>   
			<LABEL ID="PAY_REC_DT_label" class="userlabel"><%= field_labels.getString("MT_CUSTPAYMENT.PAY_REC_DT") %></LABEL>
		</TD>

		<TD class="ste" wrap>   
			<LABEL ID="REC_AMOUNT_label" class="userlabel"><%= field_labels.getString("MT_CUSTPAYMENT.REC_AMOUNT") %></LABEL>
		</TD>
		<TD class="str" wrap>   
			<LABEL ID="ADJUST_AMT_label" class="userlabel"><%= field_labels.getString("MT_CUSTPAYMENT.ADJUST_AMT") %></LABEL>
		</TD>
		<TD class="str" wrap>   
			<LABEL ID="PEND_AMOUNT_label" class="userlabel"><%= field_labels.getString("MT_CUSTPAYMENT.PEND_AMOUNT") %></LABEL>
		</TD>
		<TD class="ste" wrap>   
			<LABEL ID="PYMT_MODE_label" class="userlabel"><%= field_labels.getString("MT_CUSTPAYMENT.PYMT_MODE") %><SPAN class="instreditalic">*</SPAN>	</LABEL>
		</TD>
		<TD class="ste" wrap>   
			<LABEL ID="CHQ_NO_label" class="userlabel"><%= field_labels.getString("MT_CUSTPAYMENT.CHQ_NO") %></LABEL>
		</TD>
		<TD class="ste" wrap>   
			<LABEL ID="CHQ_DT_label" class="userlabel"><%= field_labels.getString("MT_CUSTPAYMENT.CHQ_DT") %></LABEL>
		</TD>
		<TD class="ste" wrap>   
			<LABEL ID="BANK_NAME_label" class="userlabel"><%= field_labels.getString("MT_CUSTPAYMENT.BANK_NAME") %></LABEL>
		</TD>
		<TD class="str" wrap>   
			<LABEL ID="REMARKS_label" class="userlabel"><%= field_labels.getString("MT_CUSTPAYMENT.REMARKS") %></LABEL>
		</TD>

<%}%>
<%
	int i=0;
for(i=0;i<l_outer_array.size();i++)
	{

	ArrayList l_inner_arr = (ArrayList)l_outer_array.get(i);

//	String l_passs_str = "AGN_CODE@" +l_agency_code + "@SEP@PUB_CODE@" + l_inner_arr.get(0) + "@SEP@EDT_CODE@" + l_inner_arr.get(2) ; 
//	String class_css = l_inner_arr.get(8).toString().equals("E")?"ste":"str";
	String class_css = i == 0?"ste":"str";
//	String readonly_css = l_inner_arr.get(8).toString().equals("E")?"":"class='userlabel' readOnly";
	String readonly_css = i == 0?"":"class='userlabel' readOnly";

	String l_passs_str = l_agency_code + "@" + l_inner_arr.get(0);

//	System.out.println("|"+(String)l_inner_arr.get(4)+"|");
%>
	<TR>

		<TD class="ste" nowrap>   
			<A href="MT_CUSTPAYMENTDETAILS.jsp?PARAMSTR='<%=l_passs_str%>'" target="Right" alt="Click here to view bill details" id="Link" class="linkblue" ><%=(i+1)%></a>
<!-- 			<LABEL ID="BANK_NAME_label" class="userlabel"><%=(i+1)%></LABEL>
 -->
		</TD>

		<TD class="str" >   
			<input type="text" ID="BILLMONTHYEAR<%=i%>" name="BILLMONTHYEAR<%=i%>" class="userlabel" size=10  readOnly value="<%= (String)l_inner_arr.get(0) %>" >
		</TD>

		<TD class="str" >   
			<input type="text" ID="BILL_AMOUNT<%=i%>" name="BILL_AMOUNT<%=i%>" class="userlabel" readOnly size=10 value="<%= (String)l_inner_arr.get(1) %>" >
		</TD>
		<%
if(i==0) {
		%>
		<TD class="<%=class_css%>" nowrap>   
			<input type="text" ID="PAY_REC_DT<%=i%>" name="PAY_REC_DT<%=i%>"  onBlur="checkdate(this);" size=10 <%=readonly_css%> value="<%= (String)l_inner_arr.get(12) %>" >
			<a href="#" id="PAY_REC_DTHLP<%=i%>" onClick="javascript:calendar('PAY_REC_DT<%=i%>',event.screenY,event.screenX,null,null,getDatePickerPattern());"
			title="Select Date"> <img src="images/calendar.gif" width="16" height="16" border="0" <%=readonly_css%> /></a>
		</TD>
<%}else { if(l_inner_arr.get(11).toString().equals("MOD")) {%>
		
		<TD class="str" nowrap>   
			<input type="text" ID="PAY_REC_DT<%=i%>" name="PAY_REC_DT<%=i%>" class="userlabel" size=10 <%=readonly_css%> value="<%= (String)l_inner_arr.get(12) %>" />
		</TD>
<%} else{%>
		<TD class="str" nowrap>   
			<input type="text" ID="PAY_REC_DT<%=i%>" name="PAY_REC_DT<%=i%>" class="userlabel" size=10 <%=readonly_css%> value="" />

<%}}%>
		<TD class="<%=class_css%>" >
			<input type="text" ID="REC_AMOUNT<%=i%>" name="REC_AMOUNT<%=i%>" size=10 <%=readonly_css%> onChange="calcPendAmt(<%=i%>)" value="<%= (String)l_inner_arr.get(2) %>" >
		</TD>

		<TD class="<%=class_css%>" >
			<input type="text" ID="ADJUST_AMT<%=i%>" name="ADJUST_AMT<%=i%>" size=10 <%=readonly_css%> onChange="calcPendAmt(<%=i%>)"  value="<%= (String)l_inner_arr.get(3) %>" >
		</TD>

		<TD class="str" >   
			<input type="text" ID="PEND_AMOUNT<%=i%>" name="PEND_AMOUNT<%=i%>" class="userlabel"  size=10 readOnly value="<%= (String)l_inner_arr.get(4) %>" >
		</TD>

		<TD class="<%=class_css%>">   
		<select class="input" name='PYMT_MODE<%=i%>' id="PYMT_MODE<%=i%>" onChange="FieldValidation(this);"  onBlur="FieldValidation(this);">
		<%
			out.println("<option value=''>Select</option>");
			out.println(obj_fetch_pick_vals.createOptionValues("g_pkl_payment",(String)l_inner_arr.get(5),db_name,insstalled_at));
		%>
		</SELECT>
		</TD>
		<TD class="<%=class_css%>" >   
			<input type="text" size=10 ID="CHQ_NO<%=i%>" name="CHQ_NO<%=i%>" <%=readonly_css%> value="<%= (String)l_inner_arr.get(6) %>" >
		</TD>
		<TD class="<%=class_css%>" nowrap>   
			<input type="text" size=10 ID="CHQ_DT<%=i%>" name="CHQ_DT<%=i%>"  onBlur="checkdate(this);" <%=readonly_css%> value="<%= (String)l_inner_arr.get(7)==null?"":(String)l_inner_arr.get(7) %>" >
			<a href="#" id="CHQ_DATEHLP<%=i%>" onClick="javascript:calendar('CHQ_DT<%=i%>',event.screenY,event.screenX,null,null,getDatePickerPattern());"
			title="Select Date"> <img src="images/calendar.gif" width="16"
			height="16" border="0" /></a>
		
		</TD>
		<TD class="<%=class_css%>" >   
			<input type="text" size=15 ID="BANK_NAME<%=i%>" name="BANK_NAME<%=i%>" <%=readonly_css%> value="<%= (String)l_inner_arr.get(8) %>" >
		</TD>
		<TD class="<%=class_css%>" >   
			<input type="text" size=15 ID="REMARKS<%=i%>" name="REMARKS<%=i%>" <%=readonly_css%> value="<%= (String)l_inner_arr.get(9) %>">
		</TD>
					<input type="hidden" ID="MODE<%=i%>" name="MODE<%=i%>" value="<%= (String)l_inner_arr.get(11) %>">	
					<input type="hidden" ID="PROCESS<%=i%>" name="PROCESS<%=i%>" value="<%= (String)l_inner_arr.get(10) %>">	
</TR>
<%
	}
%>
					<input type="hidden" ID="count" name="count" value="<%=i%>">	
		</TABLE>
<%
if(l_outer_array.size()>0)	
	{
	%>

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
	<%}%>
   </TD>
  </TR>
</TABLE>

</FORM>
</DIV>

</BODY>
</HTML>
<%}catch(Exception e){System.out.println("Exception e : "+e);e.printStackTrace();}%>