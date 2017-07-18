<%
String insstalled_at = (String)session.getAttribute("LOGIN_USR_VENDOR_ID");
String db_name = (String)session.getAttribute("DB_NAME");
ResourceBundle field_labels = ResourceBundle.getBundle("FieldLabels");
%>
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
<%@ page import="com.distapp.beans.*" %>
<%@ page errorPage="errorpage.jsp" %>
<%@ page import="java.util.*" %>
<%@ page import="javax.servlet.http.*" %>
<%@ page import="org.apache.log4j.Logger" %>



<%
	GN_searchDetails obj_fetch_pick_vals = new GN_searchDetails();

	Logger logger = Logger.getLogger("MT_CUSTPAYMENTDETAILS");
	
	String l_param_str[] = request.getParameter("PARAMSTR").split("@"); /* param string '1000@2010-12-12' while constructing query first & last ' is not req */
	String l_agency_code = l_param_str[0];
	String l_bill_date = l_param_str[1];

	ArrayList l_outer_array = new ArrayList();
	String l_str_query="";

	if(l_agency_code!=null && l_bill_date!=null)
	{
		ArrayList<String> replaceValues = new  ArrayList<String>();
		replaceValues.add("@AGN_CODE#"+l_agency_code);
		replaceValues.add("@BILL_DT#"+l_bill_date);
		replaceValues.add("@DB_NAME#"+db_name);
		replaceValues.add("@LOGIN_USR_VENDOR_ID#"+insstalled_at);
		l_str_query=obj_fetch_pick_vals.finalQuery(obj_fetch_pick_vals.getQuery("MT_CUSTPAYMENTDETAILS"), replaceValues);
		replaceValues = null;
		l_outer_array = obj_fetch_pick_vals.getQueryResults(l_str_query);

		}
%>

<%	
	

	HashMap MT_CUSTPAYMENTDETAILSObj = (HashMap)request.getAttribute("RESPONSE");

	if(MT_CUSTPAYMENTDETAILSObj == null)
  		MT_CUSTPAYMENTDETAILSObj = new HashMap();

	String formName = "MT_CUSTPAYMENTDETAILS";

%>

<TITLE id="MT_CUSTPAYMENTDETAILS_title"><%= field_labels.getString("MT_CUSTPAYMENTDETAILS.MT_CUSTPAYMENTDETAILS_title") %></TITLE>

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
<SCRIPT type="text/javascript" language = "JavaScript">
function FieldValidation(as_field_name)
{
	if(as_field_name.name == "AGN_CODE")
		chkAgnCode(as_field_name);		

	return true;
}



function execute_onLoad()
{
	//clearNull();

}

function chkAgnCode(as_field_name)
{	
	//getQueryResults('g_pkl_agencyCompany','','AGN_CODE@'+document.getElementById("AGN_CODE").value.toUpperCase(),'AGN_CODEDESC^CMP_CODE^CMP_CODEDESC');
}

function validateSubmit(as_field_name)
{
	if(chkMandatory()==true)
	{
		var l_agency_code = document.getElementById("AGN_CODE").value==""?"null":document.getElementById("AGN_CODE").value.toUpperCase();
		var l_month = document.getElementById("MONTH").value==""?"null":document.getElementById("MONTH").value;
		var l_year = document.getElementById("YEAR").value==""?"null":document.getElementById("YEAR").value.toUpperCase();
		var l_cust_address = document.getElementById("CUST_ADDRESS").value==""?"null":document.getElementById("CUST_ADDRESS").value.toUpperCase();
		
		//document.location.href="MT_CUSTPAYMENTDETAILS.jsp?AGN_CODE="+l_agency_code+"&CMP_CODE="+l_cust_address;
		document.location.href="MT_CUSTPAYMENTDETAILS.jsp?AGN_CODE="+l_agency_code+"&CUST_ADDRESS="+l_cust_address+"&MONTH="+l_month+"&YEAR="+l_year;
		document.forms[0].target="_self";
	}
}

function callDetailsPage(as_param_str)
	{
		//alert(as_param_str);

		document.parent.frames['BASESUPSEARCH'].href="MT_AGNSEARCHRESULTS.jsp?PARAMSTR="+as_param_str;
		document.frames['BASESUPSEARCH'].target="SEARCHDET";
		//window.open("MT_AGNSEARCHRESULTS.jsp?PARAMSTR="+as_param_str,"DetailsPage","status=no,addressbar=no,toolbar=no,menubar=no,resizable=no,scrollbars=yes,left=0,top=0,resizable=yes,width="+ eval(screen.width-10) +",height="+ eval(screen.height-80)+')');
	}
</SCRIPT>


<SCRIPT type="text/javascript" language = "JavaScript">
</script>

</HEAD>
<BODY class="mainbody" onLoad="execute_onLoad()" >

<DIV id="MT_CUSTPAYMENTDETAILS_div" >

<FORM name="MT_CUSTPAYMENTDETAILS" id="MT_CUSTPAYMENTDETAILS" method="post" action="distAppCommonActionServlet.do">
<INPUT type="hidden" id="Event" name="Event" value="">
<INPUT type="hidden" id="MAKER" name="MAKER" value="<%= (String)MT_CUSTPAYMENTDETAILSObj.get("MAKER") %>">
<INPUT type="hidden" id="MAKER_DT" name="MAKER_DT" value="">
<INPUT type="hidden" id="STATUS" name="STATUS" value="<%= (String)MT_CUSTPAYMENTDETAILSObj.get("STATUS") %>">
<INPUT type="hidden" id="MODE" name="MODE" value="MOD">
<INPUT type="hidden" id="PARAM1" name="PARAM1" value="<%= (String)MT_CUSTPAYMENTDETAILSObj.get("PARAM1") %>">
<INPUT type="hidden" id="PARAM2" name="PARAM2" value="<%= (String)MT_CUSTPAYMENTDETAILSObj.get("PARAM2") %>">
<INPUT type="hidden" id="ENTITY" name="ENTITY" value="TR_PAY_HIS_DETAILS">
<INPUT type="hidden" id="SCREEN_NAME" name="SCREEN_NAME" value="MT_CUSTPAYMENTDETAILS">
<INPUT type="hidden" id="ERRDESC" name="ERRDESC" value="<%= (String)MT_CUSTPAYMENTDETAILSObj.get("ERRDESC") %>">
<INPUT type="hidden" id="PRIMARY_KEY" name="PRIMARY_KEY" value="AGN_CODE#BILL_GEN_DT,DATE">
<INPUT type="hidden" id="PARAMSTR" name="PARAMSTR" value="<%=(String)MT_CUSTPAYMENTDETAILSObj.get("PARAMSTR") %>">

  <TABLE class="headertable" cellspacing="0" cellpadding="0" width='100%'>
         <TD>&nbsp;</TD>
        <TR> 
           <TD class="heading" nowrap align="center">
            <%= field_labels.getString("MT_CUSTPAYMENTDETAILS.MT_CUSTPAYMENTDETAILS") %>
           </TD>
        </TR>
   </TABLE>


 <TABLE class="detailstable" cellspacing="0" cellpadding="0">
<%
if(l_outer_array.size()>0)	
	{
%>
<TR class="str">
		<TD class="str" nowrap colspan="2">   
			<LABEL ID="AGN_CODE_label" class="userlabel"><%= field_labels.getString("MT_CUSTPAYMENTDETAILS.AGN_CODE") %><SPAN class="instreditalic"> &nbsp;&nbsp;&nbsp;: &nbsp;&nbsp;&nbsp;</SPAN></LABEL>
			<LABEL ID="AGN_CODE_label" class="userlabel"><B><%=l_agency_code%></B></LABEL>

		</TD>
		<TD colspan="4">
			<LABEL ID="Month_label" class="userlabel"><%= field_labels.getString("MT_CUSTPAYMENTDETAILS.BILL_DATE") %><SPAN class="instreditalic">&nbsp;&nbsp;&nbsp;: &nbsp;&nbsp;&nbsp;</SPAN></LABEL>
			<LABEL ID="Month_label" class="userlabel"><B><%=l_bill_date%></B></LABEL>
		</TD>
	</TR>

<TR>&nbsp;</TR> 
	<TR class="str">

		<TR class="str">
		<TD class="str" wrap>   
			<LABEL ID="BILLMONTHYEAR_label" class="userlabel"><%= field_labels.getString("MT_CUSTPAYMENTDETAILS.BILL_NO") %></LABEL>
		</TD>
		<TD class="str" wrap>   
			<LABEL ID="BILL_AMOUNT_label" class="userlabel"><%= field_labels.getString("MT_CUSTPAYMENTDETAILS.PUB_CODE") %></LABEL>
		</TD>
<!-- 		<TD class="str" wrap>   
			<LABEL ID="REC_AMOUNT_label" class="userlabel"><%= field_labels.getString("MT_CUSTPAYMENTDETAILS.PYMT_MODE") %></LABEL>
		</TD>
 -->		<TD class="str" wrap>   
			<LABEL ID="PEND_AMOUNT_label" class="userlabel"><%= field_labels.getString("MT_CUSTPAYMENTDETAILS.TOTAL_AMT") %></LABEL>
		</TD>
		</TR>
<%}%>
<%
for(int i=0;i<l_outer_array.size();i++)
	{

	ArrayList l_inner_arr = (ArrayList)l_outer_array.get(i);

%>
	<TR class="str">

		<TD class="str" >   
			<input type="text" ID="BILLNO" class="userlabel" size=10  readOnly value="<%= (String)l_inner_arr.get(0) %>" >
		</TD>

		<TD class="str" >   
			<input type="text" ID="PUB_CODE" class="userlabel" readOnly size=10 value="<%= (String)l_inner_arr.get(1) %>" >
		</TD>
<!-- 
		<TD class="userlabel" >   
			<input type="text" ID="PYMT_MODE" size=10  class="userlabel" value="<%= (String)l_inner_arr.get(2) %>" >
		</TD>
 -->
		<TD class="str" >   
			<input type="text" ID="TOTAL_AMOUNT" class="userlabel"  size=10 readOnly value="<%= (String)l_inner_arr.get(2) %>" >
		</TD>

</TR>
<%
	}
%>

		</TABLE>

</FORM>
</DIV>

</BODY>
</HTML>
<%}catch(Exception e){System.out.println("Exception e : "+e);e.printStackTrace();}%>