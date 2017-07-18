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
	
	String l_society_code = request.getParameter("DLV_CODE");
	String l_route_code = request.getParameter("ROUTE_CODE");
	String l_build_no = request.getParameter("BUILD_NO");
	String l_wing_no = request.getParameter("WING_NO");
	String l_flat_no = request.getParameter("FLAT_NO");
	ArrayList l_outer_array = new ArrayList();
	String l_str_query=null;
	String system_date=Common_distAppServlet.getSystemDate();

	logger.debug("customer payment multiple Society "+l_society_code);
	logger.debug("customer payment multiple route "+l_route_code);

	if(l_society_code!=null || l_route_code != null)
	{
		if((!l_society_code.equals("null")) || (!l_route_code.equals("null")))
		{
			l_str_query = obj_fetch_pick_vals.getQuery("MT_MULTICUSTPYMT.1");
			if(!(l_society_code.equals("null")))
				l_str_query = l_str_query + " AND A.DLV_CODE='"+ l_society_code +"'";

			if(!(l_route_code.equals("null")))
				l_str_query = l_str_query + " AND A.ROUTE_CODE='"+ l_route_code +"'";

			if(!(l_build_no.equals("null")))
				l_str_query = l_str_query + " AND A.BUILD_NO='"+ l_build_no +"'";

			if(!(l_wing_no.equals("null")))
				l_str_query = l_str_query + " AND A.WING_NO='"+ l_wing_no +"'";

			if(!(l_flat_no.equals("null")))
				l_str_query = l_str_query + " AND A.FLAT_NO='"+ l_flat_no +"'";
				
			l_str_query = l_str_query + ")";
		
			l_str_query = l_str_query+ obj_fetch_pick_vals.getQuery("MT_MULTICUSTPYMT.2");
			
			if(!(l_society_code.equals("null")))
				l_str_query = l_str_query + " AND A.DLV_CODE='"+ l_society_code +"'";

			if(!(l_route_code.equals("null")))
				l_str_query = l_str_query + " AND A.ROUTE_CODE='"+ l_route_code +"'";

			if(!(l_build_no.equals("null")))
				l_str_query = l_str_query + " AND A.BUILD_NO='"+ l_build_no +"'";

			if(!(l_wing_no.equals("null")))
				l_str_query = l_str_query + " AND A.WING_NO='"+ l_wing_no +"'";

			if(!(l_flat_no.equals("null")))
				l_str_query = l_str_query + " AND A.FLAT_NO='"+ l_flat_no +"'";

			l_str_query = l_str_query + ") order by ROUTE_CODE,priority,agnorderby"; 

			ArrayList<String> replaceValues = new  ArrayList<String>();
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

	return true;
}

function selectDeselect() {
	
	var selectObj = document.forms[0].SELECT;
//	alert(document.getElementById("SELECT_DESELECT").checked);
	var i;
	if(document.getElementById("SELECT_DESELECT").checked==true) {
	for (i=0;i<selectObj.length;i++)
	  {
		selectObj[i].checked=true;
	  }
	}
	else {
		for (i=0;i<selectObj.length;i++)
		  {
			selectObj[i].checked=false;
		  }
	}
		
}

function populatePendAmt(rowid) 
{
	var selectObj = document.forms[0].SELECT;
	if(selectObj[rowid].checked==false) {
		document.getElementById("PEND_AMOUNT"+rowid).value=parseFloat(document.getElementById("REC_AMOUNT"+rowid).value)-parseFloat(document.getElementById("PYMT_AMT"+rowid).value);
		document.getElementById("REC_AMOUNT"+rowid).value=document.getElementById("PYMT_AMT"+rowid).value;
	}
	else {
		document.getElementById("REC_AMOUNT"+rowid).value=parseFloat(document.getElementById("REC_AMOUNT"+rowid).value) + parseFloat(document.getElementById("PEND_AMOUNT"+rowid).value);
		document.getElementById("PEND_AMOUNT"+rowid).value=0;
	}
}

function execute_onLoad()
{
	clearNull();
	if(document.getElementById("DLV_CODE") != null)
		document.getElementById("DLV_CODE").value = "";
	if(document.getElementById("ROUTE_CODE") != null)
		document.getElementById("ROUTE_CODE").value = "";
<%
if(l_outer_array.size()<=0 && ((l_society_code != "null" && l_society_code != null)  || (l_route_code != "null" && l_route_code != null)))	
	{
		if(l_society_code != "null" && l_society_code != null)
		{
%>

		alert("No Pending Payments for Society <%=l_society_code%> !!!");
		<%
		}
		else if(l_route_code != "null" && l_route_code != null)
		{
		%>
		alert("No Pending Payments for Route <%=l_route_code%> !!!");
		<%
		}
		%>
		document.getElementById("DLV_CODE").value = "";
		document.getElementById("ROUTE_CODE").value = "";
	<%
		l_society_code = "null";
		l_route_code = "null";
	}
	%>
}

function validateSubmit(as_field_name)
{
		if("<%=l_society_code%>"=="null" && "<%=l_route_code%>"=="null")
		{
			if(document.getElementById("DLV_CODE").value=="" && document.getElementById("ROUTE_CODE").value=="")
			{
				alert("Society or Route Selection is Mandatory, Please select !!!");
				return false;
			}
			if(chkMandatory()==true)
			{
//				alert(document.getElementById("BUILD_NO").value);
				var l_society_code = document.getElementById("DLV_CODE").value==""?"null":document.getElementById("DLV_CODE").value.toUpperCase();
				var l_route_code = document.getElementById("ROUTE_CODE").value==""?"null":document.getElementById("ROUTE_CODE").value.toUpperCase();
				var l_build_no = document.getElementById("BUILD_NO").value==""?"null":document.getElementById("BUILD_NO").value;
				var l_wing_no = document.getElementById("WING_NO").value==""?"null":document.getElementById("WING_NO").value.toUpperCase();
				var l_flat_no = document.getElementById("FLAT_NO").value==""?"null":document.getElementById("FLAT_NO").value.toUpperCase();
//				alert(1);
				document.location.href="MT_MULTI_CUSTPYMT.jsp?DLV_CODE="+l_society_code+"&ROUTE_CODE="+l_route_code+"&BUILD_NO="+l_build_no+"&WING_NO="+l_wing_no+"&FLAT_NO="+l_flat_no;
				document.forms[0].target="_self";
			}
		}
		else
		{
			//alert(1);
			var l_paramstr="";
			var selectObj = document.forms[0].SELECT;
			var count = selectObj.length;
			for (var i =0; i < parseInt(count); i++) {
				/*if(document.getElementById('PROCESS'+i).value != 'E')
				{
					continue;
				}*/
				if(selectObj[i].checked == true) {
					//var i =0;
					var agn_code = document.getElementById('AGN_CODE'+i).value;
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
				}
			}
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
<INPUT type="hidden" id="SCREEN_NAME" name="SCREEN_NAME" value="MT_MULTI_CUSTPYMT">
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
 			<LABEL ID="hrd" class="instreditalic">* Society or Route Selection is Mandatory.
			</LABEL>
	</tr>
	<TR class="ste">
		<TD class="ste" nowrap>   
			<LABEL ID="DLV_CODE_label" class="userlabel"><%=field_labels.getString("MT_AGENCY.DLV_CODE")%>
			</LABEL>
		</TD>
		<TD class="ste" nowrap>
			<INPUT type="text" id="DLV_CODE" name="DLV_CODE" class="input" size="25" onChange="FieldValidation(this);getCodeDesc('DLV_CODE','DLV_CODEDESC','g_pkl_deliveryDesc','DLV_CODE');" 
					maxLength="100" value="" >
			<INPUT type="text" id="DLV_CODEDESC" name="DLV_CODEDESC" class="input" size="50" readonly  maxLength="50" value="" />
			<A id="DLV_CODEHLP" name="DLV_CODEHLP"  href="#" onClick="getPicklistValues('g_pkl_delivery','DLV_CODE','','')" class="linkblue" >?</A> &nbsp;
		</TD>
        <TD class="ste" nowrap>   
				<LABEL ID="ROUTE_CODE_label" class="userlabel"><%= field_labels.getString("MT_AGENCY.ROUTE_CODE") %></LABEL>
		
		</TD>
		<TD>
				<INPUT type="text" id="ROUTE_CODE" name="ROUTE_CODE" class="input" size="10" maxLength="10"  value=""
			onChange="FieldValidation(this);getCodeDesc('ROUTE_CODE','ROUTE_NAME', 'g_pkl_routeDesc','');" >
		  <INPUT type="text" id="ROUTE_NAME" name="ROUTE_NAME" class="input" size="50"  readonly maxLength="50" value="" >
			<A id="ROUTE_CODEHLP" name="ROUTE_CODEEHLP"  href="#" onClick="getPicklistValues('g_pkl_route','ROUTE_CODE','','')" class="linkblue" >?</A> &nbsp;

		</TD>

	</TR>
	<TR>
	<TD class="ste" nowrap>   
			<LABEL ID="BUILD_NO_label" class="userlabel"><%=field_labels.getString("MT_AGENCY.BUILD_NO")%>
			</LABEL>
		</TD>
		<TD class="ste" colspan= '3' nowrap>
			<INPUT type="text" id="BUILD_NO" name="BUILD_NO" class="input" size="10" onblur="FieldValidation(this);" maxLength="20"  
				value="<%=(String)MT_CUSTPAYMENTObj.get("BUILD_NO") %>" >
		</TD>
	</TR>	
	</TR>	
		<TR class="ste">
		<TD class="ste" nowrap>   
			<LABEL ID="WING_NO_label" class="userlabel"><%=field_labels.getString("MT_AGENCY.WING_NO")%>
			</LABEL>
		</TD>
		<TD class="ste" nowrap>
			<INPUT type="text" id="WING_NO" name="WING_NO" class="input" size="10" onblur="FieldValidation(this);" maxLength="20"  
				value="<%=(String)MT_CUSTPAYMENTObj.get("WING_NO") %>" >
		</TD>
			<TD class="ste" nowrap>   
			<LABEL ID="FLAT_NO_label" class="userlabel"><%=field_labels.getString("MT_AGENCY.FLAT_NO")%>
			</LABEL>
		</TD>
		<TD class="ste" nowrap>
			<INPUT type="text" id="FLAT_NO" name="FLAT_NO" class="input" size="10" onblur="FieldValidation(this);" maxLength="20"  
				value="<%=(String)MT_CUSTPAYMENTObj.get("FLAT_NO") %>" >
		</TD>
	</TR>	

     </TD>
    </TR>
  </TD>
 </TR>

 <TR class="formrow2" align="left"> 
  <TD class="buffercol">&nbsp; </TD>
   <TD class= "formcol" colspan='2'> 
    <TABLE class="eventstable" cellspacing="0" cellpadding="0">
     <TR class="eventsrow2"> 
      <TD class="eventscol" align="right">

		<INPUT TYPE="button" value="Submit" name="Submit_label" class="button" onClick="javascript:validateSubmit()">
		<INPUT TYPE="button" value="Clear" name="Clear_label" class="button"  onClick="reset_field()">
		<INPUT TYPE="button" value="Print" name="Print_label" class="button"  onClick="javascript:window.print()">
		<INPUT TYPE="button" value="Back" name="Back_label" class="button"  onClick="javascript:history.go(-1)">

	 </TABLE>

      </TD>
  <TD class="buffercol">&nbsp; </TD>
     </TR>
    </TABLE>

   </TD>
  </TR>
</TABLE>
<%}%>


<%
if(l_outer_array.size()>0)	
	{
	ArrayList l_inner_arr_dlv_name = (ArrayList)l_outer_array.get(0);
	
	%>
	 <TABLE class="detailstable" cellspacing="0" cellpadding="0">


<TR class="str">
		<TD class="str" nowrap colspan="4">   
			<LABEL ID="DLV_CODE_label" class="userlabel"><%= field_labels.getString("MT_CUSTPAYMENT.DLV_CODE") %><SPAN class="instreditalic"> &nbsp;&nbsp;&nbsp;: &nbsp;&nbsp;&nbsp;</SPAN></LABEL>
			<LABEL ID="DLV_CODE_label" class="userlabel"><B><%=l_inner_arr_dlv_name.get(15)%></B></LABEL>

		</TD>
		<!--  <TD colspan="4">
			<LABEL ID="CMP_CODE_label" class="userlabel"><%= field_labels.getString("MT_CUSTPAYMENT.BUILD_NO") %><SPAN class="instreditalic">&nbsp;&nbsp;&nbsp;: &nbsp;&nbsp;&nbsp;</SPAN></LABEL>
			<LABEL ID="CMP_CODE_label" class="userlabel"><B><%=l_flat_no.equals("null")?"":l_flat_no%></B></LABEL>
		</TD> -->
	</TR>

<TR>&nbsp;</TR> 
	<TR class="str">

		<TR class="str">
		<TD class="ste" nowrap>   
			<input type="checkbox" ID="SELECT_DESELECT" name="SELECT_DESELECT" class="userlabel" onClick="selectDeselect()" >
		</TD>
		<TD class="str" wrap>   
			<LABEL ID="SR_NO_label" class="userlabel"><%= field_labels.getString("MT_CUSTPAYMENT.RECORD_NO") %></LABEL>
		</TD>
		<TD class="str" wrap>   
			<LABEL ID="BILLMONTHYEAR_label" class="userlabel"><%= field_labels.getString("MT_CUSTPAYMENT.AGN_CODE") %></LABEL>
		</TD>
		<TD class="str" wrap>   
			<LABEL ID="CUST_ADDRESS_label" class="userlabel"><%= field_labels.getString("MT_CUSTPAYMENT.CUST_ADDRESS") %></LABEL>
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

	String class_css = "ste";
	String readonly_css = "";

	String l_passs_str = l_inner_arr.get(0) + "@" + l_inner_arr.get(2);

%>
	<TR>
		<TD class="ste" nowrap>   
			<input type="checkbox" ID="SELECT" name="SELECT" class="userlabel" onClick="populatePendAmt('<%=i%>')" >
		</TD>
		<TD class="ste" nowrap>   
			<A href="MT_CUSTPAYMENTDETAILS.jsp?PARAMSTR='<%=l_passs_str%>'" target="Right" alt="Click here to view bill details" id="Link" class="linkblue" ><%=(i+1)%></a>
		</TD>
		<TD class="str" >   
			<input type="text" ID="AGN_CODE<%=i%>" name="AGN_CODE<%=i%>" class="userlabel" size=10   value="<%= (String)l_inner_arr.get(0) %>" >
		</TD>
		<TD class="str" >   
			<input type="text" ID="AGN_ADDRESS<%=i%>" name="AGN_ADDRESS<%=i%>" class="userlabel" size=10   value="<%= (String)l_inner_arr.get(1) %>" >
		</TD>
		<TD class="str" >   
			<input type="text" ID="BILLMONTHYEAR<%=i%>" name="BILLMONTHYEAR<%=i%>" class="userlabel" size=10   value="<%= (String)l_inner_arr.get(2) %>" >
		</TD>

		<TD class="str" >   
			<input type="text" ID="BILL_AMOUNT<%=i%>" name="BILL_AMOUNT<%=i%>" class="userlabel" readOnly size=10 value="<%= (String)l_inner_arr.get(3) %>" >
		</TD>
		<TD class="<%=class_css%>" nowrap>   
			<input type="text" ID="PAY_REC_DT<%=i%>" name="PAY_REC_DT<%=i%>" size=10 <%=readonly_css%> value="<%= (String)l_inner_arr.get(14) %>" >
			<a href="#" id="PAY_REC_DTHLP<%=i%>" onClick="javascript:calendar('PAY_REC_DT<%=i%>',event.screenY,event.screenX,null,null,getDatePickerPattern());"
			title="Select Date"> <img src="images/calendar.gif" width="16" height="16" border="0" <%=readonly_css%> /></a>
		</TD>

		<TD class="<%=class_css%>" >
			<input type="text" ID="REC_AMOUNT<%=i%>" name="REC_AMOUNT<%=i%>" size=10 <%=readonly_css%> onChange="calcPendAmt(<%=i%>)" value="<%= (String)l_inner_arr.get(4) %>" >
		</TD>

		<TD class="<%=class_css%>" >
			<input type="text" ID="ADJUST_AMT<%=i%>" name="ADJUST_AMT<%=i%>" size=10 <%=readonly_css%> onChange="calcPendAmt(<%=i%>)"  value="<%= (String)l_inner_arr.get(5) %>" >
		</TD>

		<TD class="str" >   
			<input type="text" ID="PEND_AMOUNT<%=i%>" name="PEND_AMOUNT<%=i%>" class="userlabel"  size=10 readOnly value="<%= (String)l_inner_arr.get(6) %>" >
		</TD>

		<TD class="<%=class_css%>">   
		<select class="input" name='PYMT_MODE<%=i%>' id="PYMT_MODE<%=i%>" onChange="FieldValidation(this);"  onBlur="FieldValidation(this);">
		<%
			out.println("<option value=''>Select</option>");
			out.println(obj_fetch_pick_vals.createOptionValues("g_pkl_payment",(String)l_inner_arr.get(7),db_name,insstalled_at));
		%>
		</SELECT>
		</TD>
		<TD class="<%=class_css%>" >   
			<input type="text" size=10 ID="CHQ_NO<%=i%>" name="CHQ_NO<%=i%>" <%=readonly_css%> value="<%= (String)l_inner_arr.get(8) %>" >
		</TD>
		<TD class="<%=class_css%>" nowrap>   
			<input type="text" size=10 ID="CHQ_DT<%=i%>" name="CHQ_DT<%=i%>" <%=readonly_css%> value="<%= (String)l_inner_arr.get(9)==null?"":(String)l_inner_arr.get(9) %>" >
			<a href="#" id="CHQ_DATEHLP<%=i%>" onClick="javascript:calendar('CHQ_DT<%=i%>',event.screenY,event.screenX,null,null,getDatePickerPattern());"
			title="Select Date"> <img src="images/calendar.gif" width="16"
			height="16" border="0" /></a>
		
		</TD>
		<TD class="<%=class_css%>" >   
			<input type="text" size=15 ID="BANK_NAME<%=i%>" name="BANK_NAME<%=i%>" <%=readonly_css%> value="<%= (String)l_inner_arr.get(10) %>" >
		</TD>
		<TD class="<%=class_css%>" >   
			<input type="text" size=15 ID="REMARKS<%=i%>" name="REMARKS<%=i%>" <%=readonly_css%> value="<%= (String)l_inner_arr.get(11) %>">
		</TD>
					<input type="hidden" ID="MODE<%=i%>" name="MODE<%=i%>" value="<%= (String)l_inner_arr.get(13) %>">	
					<input type="hidden" ID="PROCESS<%=i%>" name="PROCESS<%=i%>" value="<%= (String)l_inner_arr.get(12) %>">	
					<input type="hidden" ID="PYMT_AMT<%=i%>" name="PYMT_AMT<%=i%>" value="<%= (String)l_inner_arr.get(4) %>">	
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