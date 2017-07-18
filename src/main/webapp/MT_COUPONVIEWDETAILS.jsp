<%@ include file="DISTAPPMDResourceProvider.jsp" %>
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
	Logger logger = Logger.getLogger("MT_COUPONVIEWDETAILS");
	
	String l_param_str[] = request.getParameter("PARAMSTR").split("@");

	String l_agency_code = l_param_str[0];
	l_agency_code= l_agency_code.substring(1);
	String l_cust_address = l_param_str[1];
	String l_month = l_param_str[2];
	String l_year = l_param_str[3];
	String l_pub_code = l_param_str[4];
	l_pub_code= l_pub_code.substring(0,l_pub_code.length()-1);

	ArrayList l_outer_array = new ArrayList();
	String l_str_query=null;

	if(l_agency_code!=null)
	{
		if(!(l_agency_code.equals("null")))
		{
			l_str_query = obj_fetch_pick_vals.getQuery("MT_COUPONVIEWDETAILS");

		if(!(l_month.equals("null")))
			l_str_query = l_str_query + " AND MONTHNAME(BILL_GEN_DT)='"+l_month+"'";

		if(!(l_year.equals("null")))
			l_str_query = l_str_query + " AND YEAR(BILL_GEN_DT)='"+l_year+"'";

		if(!(l_pub_code.equals("null")))
			l_str_query = l_str_query + " AND B.PUB_CODE='"+l_pub_code+"'";

		ArrayList<String> replaceValues = new  ArrayList<String>();
		replaceValues.add("@AGN_CODE#"+l_agency_code);
		replaceValues.add("@DB_NAME#"+db_name);
		replaceValues.add("@LOGIN_USR_VENDOR_ID#"+insstalled_at);
		l_str_query=obj_fetch_pick_vals.finalQuery(l_str_query, replaceValues);
		replaceValues = null;
		l_outer_array = obj_fetch_pick_vals.getQueryResults(l_str_query);

		}
	}
%>

<%	
	

	HashMap MT_COUPONVIEWDETAILSObj = (HashMap)request.getAttribute("RESPONSE");

	logger.debug("DAILY SUPPLY QUERY "+l_str_query);
	if(MT_COUPONVIEWDETAILSObj == null)
  		MT_COUPONVIEWDETAILSObj = new HashMap();

	String formName = "MT_COUPONVIEWDETAILS";

%>

<TITLE id="MT_COUPONVIEWDETAILS_title"><%= field_labels.getString("MT_COUPONVIEWDETAILS.MT_COUPONVIEWDETAILS_title") %></TITLE>

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
		if(document.getElementById("ERRDESC").value=="")
		{
			submit();
		}
}

function chkAgnCode(as_field_name)
{	
	//getQueryResults('g_pkl_agencyCompany','','AGN_CODE@'+document.getElementById("AGN_CODE").value.toUpperCase(),'AGN_CODEDESC^CMP_CODE^CMP_CODEDESC');
}

function preSubmit(as_event_label)
{
		var l_paramstr="";
		 var count = document.getElementById("count").value;
		for (var i =0; i < parseInt(count); i++) 
		{
			if(document.getElementById("MARK_COUPON"+i).checked == true)
			{
				var pub_code = document.getElementById('PUB_NAME'+i).value;
				var bill_date = document.getElementById('BILL_DATE'+i).value;
				var agn_code = document.getElementById('AGN_CODE').value;
				l_paramstr = l_paramstr + agn_code + "," + pub_code + "," + bill_date+"#";
			}
		}

		if(l_paramstr=="")
			alert("Please select record.");

		document.getElementById("PARAM2").value=l_paramstr;
		if(chkMandatory()==true)
		{
			document.forms[0].submit();
		}
}

</SCRIPT>


<SCRIPT type="text/javascript" language = "JavaScript">
</script>

</HEAD>
<BODY class="mainbody" onLoad="execute_onLoad()" >

<DIV id="MT_COUPONVIEWDETAILS_div" >

<FORM name="MT_COUPONVIEWDETAILS" id="MT_COUPONVIEWDETAILS" method="post" action="distAppCommonActionServlet.do">
<INPUT type="hidden" id="Event" name="Event" value="">
<INPUT type="hidden" id="MAKER" name="MAKER" value="<%= (String)MT_COUPONVIEWDETAILSObj.get("MAKER") %>">
<INPUT type="hidden" id="MAKER_DT" name="MAKER_DT" value="">
<INPUT type="hidden" id="STATUS" name="STATUS" value="<%= (String)MT_COUPONVIEWDETAILSObj.get("STATUS") %>">
<INPUT type="hidden" id="MODE" name="MODE" value="NONE">
<INPUT type="hidden" id="PARAM1" name="PARAM1" value="<%= (String)MT_COUPONVIEWDETAILSObj.get("PARAM1") %>">
<INPUT type="hidden" id="PARAM2" name="PARAM2" value="<%= (String)MT_COUPONVIEWDETAILSObj.get("PARAM2") %>">
<INPUT type="hidden" id="ENTITY" name="ENTITY" value="TR_PAY_HIS_DETAILS">
<INPUT type="hidden" id="SCREEN_NAME" name="SCREEN_NAME" value="MT_COUPONVIEWDETAILS">
<INPUT type="hidden" id="ERRDESC" name="ERRDESC" value="<%= (String)MT_COUPONVIEWDETAILSObj.get("ERRDESC") %>">
<INPUT type="hidden" id="PRIMARY_KEY" name="PRIMARY_KEY" value="AGN_CODE#BILL_GEN_DT,DATE">
<INPUT type="hidden" id="AGN_CODE" name="AGN_CODE" value="<%= (String)MT_COUPONVIEWDETAILSObj.get("AGN_CODE") %>">
<INPUT type="hidden" id="YEAR" name="YEAR" value="<%= (String)MT_COUPONVIEWDETAILSObj.get("YEAR") %>">
<INPUT type="hidden" id="MONTH" name="MONTH" value="<%= (String)MT_COUPONVIEWDETAILSObj.get("MONTH") %>">
<INPUT type="hidden" id="CUST_ADDRESS" name="CUST_ADDRESS" value="<%= (String)MT_COUPONVIEWDETAILSObj.get("CUST_ADDRESS") %>">
<INPUT type="hidden" id="PUB_CODE" name="PUB_CODE" value="<%= (String)MT_COUPONVIEWDETAILSObj.get("PUB_CODE") %>">

  <TABLE class="headertable" cellspacing="0" cellpadding="0" width='100%'>
         <TD>&nbsp;</TD>
        <TR> 
           <TD class="heading" nowrap align="center">
            <%= field_labels.getString("MT_COUPONVIEWDETAILS.MT_COUPONVIEWDETAILS") %>
           </TD>
        </TR>
   </TABLE>

<%
if(l_outer_array.size()>0)	
	{
%>
 <TABLE class="detailstable" cellspacing="0" cellpadding="0">
<TR class="str">
		<TD class="str" nowrap colspan="2">   
			<LABEL ID="AGN_CODE_label" class="userlabel"><%= field_labels.getString("MT_COUPONVIEWDETAILS.AGN_CODE") %><SPAN class="instreditalic"> </SPAN></LABEL>
			<LABEL ID="AGN_CODE_label" class="userlabel"><B><%=l_agency_code%></B></LABEL>

		</TD>
		<TD class="str" nowrap colspan="2">   
			<LABEL ID="CUST_ADDRESS_label" class="userlabel"><%= field_labels.getString("MT_COUPONVIEWDETAILS.CUST_ADDRESS") %><SPAN class="instreditalic"></SPAN></LABEL>
			<LABEL ID="CUST_ADDRESS_label" class="userlabel"><B><%=l_cust_address.equals("null")?"":l_cust_address%></B></LABEL>
		</TD>

		<TD class="str" nowrap colspan="2">   
			<LABEL ID="PUB_CODE_label" class="userlabel"><%= field_labels.getString("MT_COUPONVIEWDETAILS.PUB_CODE") %><SPAN class="instreditalic"></SPAN></LABEL>
			<LABEL ID="PUB_CODE_label" class="userlabel"><B><%=l_pub_code%></B></LABEL>
		</TD>

	</TR>
<TR>&nbsp;</TR>
</TABLE>
 <TABLE class="detailstable" cellspacing="0" cellpadding="0">

	<TR class="str">

		<TR class="str">
		<TD class="str" wrap>   
			<LABEL ID="SR_NO_label" class="userlabel"><%= field_labels.getString("MT_COUPONVIEWDETAILS.SR_NO") %></LABEL>
		</TD>
		<TD class="str" wrap>   
			<LABEL ID="COUPON_NO_label" class="userlabel"><%= field_labels.getString("COUPON_NO") %></LABEL>
		</TD>
		<TD class="str" wrap>   
			<LABEL ID="COUPONDT_label" class="userlabel"><%= field_labels.getString("MT_COUPONVIEWDETAILS.COUPONDT") %></LABEL>
		</TD>
		<TD class="str" wrap>   
			<LABEL ID="DATE_label" class="userlabel"><%= field_labels.getString("MT_COUPONVIEWDETAILS.DATE") %></LABEL>
		</TD>
		<TD class="ste" wrap>   
			<LABEL ID="ADJUST_DT_label" class="userlabel"><%= field_labels.getString("MT_COUPONVIEWDETAILS.ADJUST_DT") %></LABEL>
		</TD>
		<TD class="ste" wrap>   
			<LABEL ID="ADJUST_DT_label" class="userlabel"><%= field_labels.getString("MT_COUPONVIEWDETAILS.ADJUST_FLAG") %></LABEL>
		</TD>

<%}%>

<%
int i=0;
for(i=0;i<l_outer_array.size();i++)
	{

	ArrayList l_inner_arr = (ArrayList)l_outer_array.get(i);

%>
	<TR class="str">

		<TD class="str" >   
			<LABEL ID="PUB_NAME<%=i%>" class="userlabel"><%=(i+1)%></LABEL>
		</TD>
		<TD class="str" >   
			<input type="text" ID="COUPON_NO<%=i%>" class="userlabel" readOnly size=20 value="<%= (String)l_inner_arr.get(3)==null?'-':(String)l_inner_arr.get(3)%>" >
		</TD>
		<TD class="str" >   
			<input type="text" ID="BILL_DATE<%=i%>" class="userlabel" readOnly size=10 value="<%= (String)l_inner_arr.get(0) %>" >
		</TD>

		<TD class="str" >   
			<input type="text" ID="DATE<%=i%>" size=10 class="userlabel" value="<%= (String)l_inner_arr.get(1) %>" >
		</TD>

		<TD class="str" >   
			<input type="text" ID="ADJUST_DT<%=i%>" class="userlabel"  size=10 readOnly value="<%= l_inner_arr.get(4)==null?"":(String)l_inner_arr.get(4) %>" >
		</TD>
<%if(l_inner_arr.get(4)!=null) {%>
		<TD class="str" >   
			<input type="checkbox" ID="ADJUST_FLAG<%=i%>" class="userlabel"  size=10 disabled checked >
		</TD>
<%}else {%>
		<TD class="str" >   
			<input type="hidden" ID="ADJUST_FLAG<%=i%>" class="userlabel"  size=10 >
		</TD>
<%}%>
</TR>
<%
	}
%>
					<input type="hidden" ID="count" value="<%=i%>">	

		</TABLE>

</TABLE>

</FORM>
</DIV>

</BODY>
</HTML>
<%}catch(Exception e){System.out.println("Exception e : "+e);e.printStackTrace();}%>