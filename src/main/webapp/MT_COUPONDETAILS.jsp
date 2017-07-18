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
<%@ page import="com.distapp.beans.Common_distAppServlet" %>


<%
	Logger logger = Logger.getLogger("MT_COUPONDETAILS");
	
	String l_agency_code = request.getParameter("AGN_CODE");
	String l_cust_address = request.getParameter("CUST_ADDRESS");
	String l_month = request.getParameter("MONTH");
	String l_year = request.getParameter("YEAR");
	String l_pub_code = request.getParameter("PUB_CODE");

	ArrayList l_outer_array = new ArrayList();
	String l_str_query=null;

	if(l_agency_code!=null)
	{
		if(!(l_agency_code.equals("null")))
		{

		l_str_query = obj_fetch_pick_vals.getQuery("MT_COUPONDETAILS");	

		if(!(l_month.equals("null")))
			l_str_query = l_str_query + " AND MONTHNAME(B.BILL_DATE)='"+l_month+"'";

		if(!(l_year.equals("null")))
			l_str_query = l_str_query + " AND YEAR(B.BILL_DATE)='"+l_year+"'";

		if(!(l_pub_code.equals("null")))
			l_str_query = l_str_query + " AND P.PUB_CODE='"+l_pub_code+"'";

		l_str_query = l_str_query + " ORDER BY B.BILL_DATE DESC";

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
	

	HashMap MT_COUPONDETAILSObj = (HashMap)request.getAttribute("RESPONSE");

	logger.debug("Coupon details query :  "+l_str_query);
	if(MT_COUPONDETAILSObj == null)
  		MT_COUPONDETAILSObj = new HashMap();

	String formName = "MT_COUPONDETAILS";

%>

<TITLE id="MT_COUPONDETAILS_title"><%= field_labels.getString("MT_COUPONDETAILS.MT_COUPONDETAILS_title") %></TITLE>

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
			if(document.getElementById("MARK_COUPON"+i).checked == true && document.getElementById('PROCESS_FLAG'+i).value == "P")
			{
				var pub_code = document.getElementById('PUB_CODE'+i).value;
				var bill_date = document.getElementById('BILL_DATE'+i).value;
				var user = document.getElementById('USER'+i).value;
				var rcd_date = document.getElementById('DATE'+i).value;
				l_paramstr = l_paramstr + <%=l_agency_code%> + "," + pub_code + "," + bill_date+","+user+","+rcd_date+"#";
			}
		}

		if(l_paramstr=="")
			alert("Please select record.");

		///alert(l_paramstr);

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

<DIV id="MT_COUPONDETAILS_div" >

<FORM name="MT_COUPONDETAILS" id="MT_COUPONDETAILS" method="post" action="distAppCommonActionServlet.do">
<INPUT type="hidden" id="Event" name="Event" value="">
<INPUT type="hidden" id="MAKER" name="MAKER" value="<%= (String)MT_COUPONDETAILSObj.get("MAKER") %>">
<INPUT type="hidden" id="MAKER_DT" name="MAKER_DT" value="">
<INPUT type="hidden" id="STATUS" name="STATUS" value="<%= (String)MT_COUPONDETAILSObj.get("STATUS") %>">
<INPUT type="hidden" id="MODE" name="MODE" value="MT_COUPONDET">
<INPUT type="hidden" id="PARAM1" name="PARAM1" value="<%= (String)MT_COUPONDETAILSObj.get("PARAM1") %>">
<INPUT type="hidden" id="PARAM2" name="PARAM2" value="<%= (String)MT_COUPONDETAILSObj.get("PARAM2") %>">
<INPUT type="hidden" id="ENTITY" name="ENTITY" value="TR_PAY_HIS_DETAILS">
<INPUT type="hidden" id="SCREEN_NAME" name="SCREEN_NAME" value="MT_COUPONDETAILS">
<INPUT type="hidden" id="ERRDESC" name="ERRDESC" value="<%= (String)MT_COUPONDETAILSObj.get("ERRDESC") %>">
<INPUT type="hidden" id="PRIMARY_KEY" name="PRIMARY_KEY" value="AGN_CODE#BILL_GEN_DT,DATE">
<INPUT type="hidden" id="AGN_CODE" name="AGN_CODE" value="<%= (String)MT_COUPONDETAILSObj.get("AGN_CODE") %>">
<INPUT type="hidden" id="YEAR" name="YEAR" value="<%= (String)MT_COUPONDETAILSObj.get("YEAR") %>">
<INPUT type="hidden" id="MONTH" name="MONTH" value="<%= (String)MT_COUPONDETAILSObj.get("MONTH") %>">
<INPUT type="hidden" id="CUST_ADDRESS" name="CUST_ADDRESS" value="<%= (String)MT_COUPONDETAILSObj.get("CUST_ADDRESS") %>">
<INPUT type="hidden" id="PUB_CODE" name="PUB_CODE" value="<%= (String)MT_COUPONDETAILSObj.get("PUB_CODE") %>">

  <TABLE class="headertable" cellspacing="0" cellpadding="0" width='100%'>
         <TD>&nbsp;</TD>
        <TR> 
           <TD class="heading" nowrap align="center">
            <%= field_labels.getString("MT_COUPONDETAILS.MT_COUPONDETAILS") %>
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
			<LABEL ID="AGN_CODE_label" class="userlabel"><%= field_labels.getString("MT_COUPONDETAILS.AGN_CODE") %><SPAN class="instreditalic"> &nbsp;&nbsp;&nbsp;: &nbsp;&nbsp;&nbsp;</SPAN></LABEL>
			<LABEL ID="AGN_CODE_label" class="userlabel"><B><%=l_agency_code%></B></LABEL>

		</TD>
		<TD colspan="4">
			<LABEL ID="CUST_ADDRESS_label" class="userlabel"><%= field_labels.getString("MT_COUPONDETAILS.CUST_ADDRESS") %><SPAN class="instreditalic">&nbsp;&nbsp;&nbsp;: &nbsp;&nbsp;&nbsp;</SPAN></LABEL>
			<LABEL ID="CUST_ADDRESS_label" class="userlabel"><B><%=l_cust_address.equals("null")?"":l_cust_address%></B></LABEL>
		</TD>
	</TR>

<TR>&nbsp;</TR> 
	<TR class="str">

		<TR>
		<TD class="str" wrap>   
			<LABEL ID="PUB_NAME_label" class="userlabel"><%= field_labels.getString("MT_COUPONDETAILS.PUB_NAME") %></LABEL>
		</TD>
		<TD class="str" wrap>   
			<LABEL ID="COUPON_NO_label" class="userlabel"><%= field_labels.getString("COUPON_NO") %></LABEL>
		</TD>
		<TD class="str" wrap>   
			<LABEL ID="CPN_ST_DT_label" class="userlabel"><%= field_labels.getString("CPN_ST_DT") %></LABEL>
		</TD>
		<TD class="str" wrap>   
			<LABEL ID="CPN_EN_DT_label" class="userlabel"><%= field_labels.getString("CPN_EN_DT") %></LABEL>
		</TD>
		<TD class="str" wrap>   
			<LABEL ID="MONTH_YEAR_label" class="userlabel"><%= field_labels.getString("MT_COUPONDETAILS.MONTH-YEAR") %></LABEL>
		</TD>
		<TD class="str" wrap>   
			<LABEL ID="USER_label" class="userlabel"><%= field_labels.getString("MT_COUPONDETAILS.USER") %></LABEL>
		</TD>
		<TD class="str" wrap>   
			<LABEL ID="DATE_label" class="userlabel"><%= field_labels.getString("MT_COUPONDETAILS.DATE") %></LABEL>
		</TD>
		<TD class="ste" wrap>   
			<LABEL ID="RECFLAG_label" class="userlabel"><%= field_labels.getString("MT_COUPONDETAILS.RECFLAG") %></LABEL>
		</TD>
<%}
else
	{%>
<TR>&nbsp;</TR> 
	<TR class="str">

		<TR class="str">
		<TD class="str" wrap>   
			<LABEL class="userlabel">No Coupons for Customer <B><%=l_agency_code%></B></LABEL>
		</TD>
	</TR>
<%
	}%>
<%
int i=0;
for(i=0;i<l_outer_array.size();i++)
	{

	ArrayList l_inner_arr = (ArrayList)l_outer_array.get(i);

%>
	<TR>

		<TD class="str" >   
			<input type="text" ID="PUB_NAME<%=i%>" name="PUB_NAME<%=i%>" class="userlabel" size=20  readOnly value="<%= (String)l_inner_arr.get(0) %>" >
			<input type="hidden" ID="PUB_CODE<%=i%>" name="PUB_CODE<%=i%>" class="userlabel" size=10  readOnly value="<%= (String)l_inner_arr.get(2) %>" >
		</TD>
		<TD class="str" >   
			<input type="text" ID="COUPON_NO<%=i%>" name="COUPON_NO<%=i%>" size=20 class="userlabel" readOnly value="<%= (String)l_inner_arr.get(4)==null?'-':(String)l_inner_arr.get(4)%>">
		</TD>
		<TD class="str" >   
			<input type="text" ID="CPN_ST_DT<%=i%>" name="CPN_ST_DT<%=i%>" class="userlabel" readOnly size=10 value="<%= (String)l_inner_arr.get(5)==null?'-':(String)l_inner_arr.get(5) %>" >
		</TD>
		<TD class="str" >   
			<input type="text" ID="CPN_EN_DT<%=i%>" name="CPN_EN_DT<%=i%>" class="userlabel" readOnly size=10 value="<%= (String)l_inner_arr.get(6)==null?'-':(String)l_inner_arr.get(6) %>" >
		</TD>
		<TD class="str" >   
			<input type="text" ID="BILL_DATE<%=i%>" name="BILL_DATE<%=i%>" class="userlabel" readOnly size=10 value="<%= (String)l_inner_arr.get(1) %>" >
		</TD>

		<TD class="str" >   
			<input type="text" ID="USER<%=i%>" name="USER<%=i%>" size=10 class="userlabel" readOnly value="<%= session.getAttribute("UserId") %>" >
		</TD>

		<TD class="str" >   
<!-- 			<input type="text" ID="DATE<%=i%>" class="userlabel"  size=10 readOnly value="<%= Common_distAppServlet.getSystemDate() %>" > -->
			<input type="text" ID="DATE<%=i%>" name="DATE<%=i%>" class="userlabel"  size=10 readOnly value="<%= (String)l_inner_arr.get(3)==null?Common_distAppServlet.getSystemDate():(String)l_inner_arr.get(3) %>" >
		</TD>
<%		if((String)l_inner_arr.get(3)==null)
		{ %>
		<TD class="ste">
			<INPUT TYPE="CHECKBOX" class="input" ID="MARK_COUPON<%=i%>" name="MARK_COUPON<%=i%>"  onChange="FieldValidation(this);"  >
		<%}
		else {%>
		<TD class="str">
			<INPUT TYPE="CHECKBOX" class="input" readonly checked ID="MARK_COUPON<%=i%>" name="MARK_COUPON<%=i%>"  onChange="FieldValidation(this);"  >
		<%}%>
		</TD>
		<input type="hidden"  ID="PROCESS_FLAG<%=i%>" name="PROCESS_FLAG<%=i%>" value="<%=(String)l_inner_arr.get(3)==null?'P':'X'%>">	
</TR>
<%
	}
%>
					<input type="hidden" ID="count" name="count" value="<%=i%>">	

		</TABLE>

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
   </TD>
  </TR>
</TABLE>

</FORM>
</DIV>

</BODY>
</HTML>
<%}catch(Exception e){System.out.println("Exception e : "+e);e.printStackTrace();}%>