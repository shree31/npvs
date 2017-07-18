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
	Logger logger = Logger.getLogger("MT_COUPONVIEW");
	
%>

<%	
	

	HashMap MT_COUPONVIEWObj = (HashMap)request.getAttribute("RESPONSE");

	if(MT_COUPONVIEWObj == null)
  		MT_COUPONVIEWObj = new HashMap();

	String formName = "MT_COUPONVIEW";

	String l_agency_code = request.getParameter("AGN_CODE");
	String l_cust_address = request.getParameter("CUST_ADDRESS");
	String l_month = request.getParameter("MONTH");
	String l_year = request.getParameter("YEAR");
	String l_pub_code = request.getParameter("PUB_CODE");

	ArrayList l_outer_array = new ArrayList();
	String l_str_query="";

	if(l_agency_code!=null)
	{
		l_str_query = obj_fetch_pick_vals.getQuery("MT_COUPONVIEW");		

		if(!(l_month.equals("null")))
			l_str_query = l_str_query + " AND MONTHNAME(BILL_GEN_DT)='"+l_month+"'";

		if(!(l_year.equals("null")))
			l_str_query = l_str_query + " AND YEAR(BILL_GEN_DT)='"+l_year+"'";

		if(!(l_pub_code.equals("null")))
			l_str_query = l_str_query + " AND PUB_CODE='"+l_pub_code+"'";


		l_str_query = l_str_query + " ORDER BY PUB_CODE";
		ArrayList<String> replaceValues = new  ArrayList<String>();
		replaceValues.add("@AGN_CODE#"+l_agency_code);
		replaceValues.add("@DB_NAME#"+db_name);
		replaceValues.add("@LOGIN_USR_VENDOR_ID#"+insstalled_at);
		l_str_query=obj_fetch_pick_vals.finalQuery(l_str_query, replaceValues);
		replaceValues = null;
		l_outer_array = obj_fetch_pick_vals.getQueryResults(l_str_query);

	}
%>

<TITLE id="MT_COUPONVIEW_title"><%= field_labels.getString("MT_COUPONVIEW.MT_COUPONVIEW_title") %></TITLE>

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
		var l_pub_code = document.getElementById("PUB_CODE").value==""?"null":document.getElementById("PUB_CODE").value.toUpperCase();
		var l_cust_address = document.getElementById("AGN_CODEDESC").value==""?"null":document.getElementById("AGN_CODEDESC").value.toUpperCase();
		
		document.location.href="MT_COUPONVIEW.jsp?AGN_CODE="+l_agency_code+"&PUB_CODE="+l_pub_code+"&CUST_ADDRESS="+l_cust_address+"&MONTH="+l_month+"&YEAR="+l_year;
//		document.parent.frames['COUPONADD'].href="MT_COUPONDETAILS.jsp";
//		document.frames['COUPONADD'].target="SEARCHDET";

//		document.location.href="MT_COUPONVIEW.jsp;
//		document.forms[0].target="_self";
	}
}

function OpenWindow(url) {
	window.open("MT_COUPONVIEWDETAILS.jsp?PARAMSTR='"+url+"'","_blank","height=600,width=700");
}


function callDetailsPage(as_param_str)
	{
		document.parent.frames['BASESUPSEARCH'].href="MT_AGNSEARCHRESULTS.jsp?PARAMSTR="+as_param_str;
		document.frames['BASESUPSEARCH'].target="SEARCHDET";
	}
</SCRIPT>


<SCRIPT type="text/javascript" language = "JavaScript">
</script>

</HEAD>
<BODY class="mainbody" onLoad="execute_onLoad()" >

<DIV id="MT_COUPONVIEW_div" >

<FORM name="MT_COUPONVIEW" id="MT_COUPONVIEW" method="post" action="distAppCommonActionServlet.do">
<INPUT type="hidden" id="Event" name="Event" value="">
<INPUT type="hidden" id="MAKER" name="MAKER" value="<%= (String)MT_COUPONVIEWObj.get("MAKER") %>">
<INPUT type="hidden" id="MAKER_DT" name="MAKER_DT" value="">
<INPUT type="hidden" id="STATUS" name="STATUS" value="<%= (String)MT_COUPONVIEWObj.get("STATUS") %>">
<INPUT type="hidden" id="MODE" name="MODE" value="MOD">
<INPUT type="hidden" id="PARAM1" name="PARAM1" value="<%= (String)MT_COUPONVIEWObj.get("PARAM1") %>">
<INPUT type="hidden" id="PARAM2" name="PARAM2" value="<%= (String)MT_COUPONVIEWObj.get("PARAM2") %>">
<INPUT type="hidden" id="ENTITY" name="ENTITY" value="TR_PAY_HIS_DETAILS">
<INPUT type="hidden" id="SCREEN_NAME" name="SCREEN_NAME" value="MT_COUPONVIEW">
<INPUT type="hidden" id="ERRDESC" name="ERRDESC" value="<%= (String)MT_COUPONVIEWObj.get("ERRDESC") %>">
<INPUT type="hidden" id="PRIMARY_KEY" name="PRIMARY_KEY" value="AGN_CODE#BILL_GEN_DT,DATE">
<INPUT type="hidden" id="PARAMSTR" name="PARAMSTR" value="<%=(String)MT_COUPONVIEWObj.get("PARAMSTR") %>">

  <TABLE class="headertable" cellspacing="0" cellpadding="0" width='100%'>
         <TD>&nbsp;</TD>
        <TR> 
           <TD class="heading" nowrap align="center">
            <%= field_labels.getString("MT_COUPONVIEW.MT_COUPONVIEW") %>
           </TD>
        </TR>
   </TABLE>

 <TABLE class="detailstable" cellspacing="0" cellpadding="0">

	<TR class="ste">
		<TD class="ste" nowrap>   
			<LABEL ID="AGN_CODE_label" class="userlabel"><%= field_labels.getString("MT_COUPONVIEW.AGN_CODE") %><SPAN class="instreditalic">*</SPAN></LABEL>
		</TD>
		<TD class="ste" colspan="3" nowrap>

	  <INPUT type="text" id="AGN_CODE" name="AGN_CODE" class="input" size="10" onChange="FieldValidation(this);getCodeDesc('AGN_CODE','AGN_CODEDESC', 'g_pkl_agencyDesc','AGN_CODE');"  maxLength="10" value="" >

	  <INPUT type="text" id="AGN_CODEDESC" name="AGN_CODEDESC" class="input" size="50" readonly  maxLength="50" value="" >
	<A id="AGN_CODEHLP" name="AGN_CODEEHLP"  href="#" onClick="getPicklistValues('g_pkl_agency','AGN_CODE','','')" class="linkblue" >?</A> &nbsp;

	</TR>	
	
		<TR class="ste">
		<TD class="ste" nowrap>   
			<LABEL ID="YEAR_label" class="userlabel"><%= field_labels.getString("MT_COUPONVIEW.YEAR") %></LABEL>
		</TD>
		<TD class="ste" colspan="1" nowrap>
			<INPUT type="text" id="YEAR" name="YEAR" class="input" size="10" onChange="FieldValidation(this);" maxLength="4"  value="" >
		</TD>
		<TD class="ste" nowrap>   
			<LABEL ID="MONTH_label" class="userlabel"><%= field_labels.getString("MT_COUPONVIEW.MONTH") %></LABEL>
		</TD>
		<TD class="ste" colspan="1" nowrap>
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
	<TR>
		<TD class="ste" nowrap>   
			<LABEL ID="PUB_CODE_label" class="userlabel"><%= field_labels.getString("MT_COUPONVIEW.PUB_CODE") %></LABEL>
		</TD>

		<TD class="ste" nowrap>
		<select class="input"name='PUB_CODE' id="PUB_CODE" onChange="FieldValidation(this);getCodeDesc('PUB_CODE','PUB_NAME','g_pkl_publicationDesc','');"  onBlur="FieldValidation(this);">
		<%
			out.println("<option value=''>Select</option>");
			out.println(obj_fetch_pick_vals.createOptionValues("g_pkl_publication","",db_name,insstalled_at));
		%>
	</SELECT>

		  <INPUT type="text" id="PUB_NAME" name="PUB_NAME" class="input" size="50" readonly  maxLength="50" value="" >
		</TD>
</TR>


 <TR class="formrow2" align="left"> 
  <TD class="buffercol" colspan=4>&nbsp; </TD>
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
<%
if(l_outer_array.size()>0)	
	{
%>
 <TABLE class="detailstable" cellspacing="0" cellpadding="0">

<TR>&nbsp;</TR> 

		<TR class="str">
		<TD class="str" wrap>   
			<LABEL ID="SR_NO_label" class="userlabel"><%= field_labels.getString("MT_COUPONDETAILS.RECORD_NO") %></LABEL>
		</TD>

		<TD class="str" wrap>   
			<LABEL ID="PUBNAME_label" class="userlabel"><%= field_labels.getString("MT_COUPONDETAILS.PUB_NAME") %></LABEL>
		</TD>
		</TR>
<%
for(int i=0;i<l_outer_array.size();i++)
	{

	ArrayList l_inner_arr = (ArrayList)l_outer_array.get(i);

	String l_passs_str = l_agency_code+"@"+l_cust_address+"@"+l_month+"@"+l_year+"@"+l_inner_arr.get(0);

%>
	<TR class="str">

		<TD class="ste" nowrap>   
			<A href="#" id="Link" class="linkblue" onClick="OpenWindow('<%=l_passs_str%>')" ><%=(i+1)%></a>
		</TD>

		<TD class="str" >   
			<input type="text" ID="PUB_NAME<%=i%>" class="userlabel" size=10  readOnly value="<%= (String)l_inner_arr.get(0) %>" >
		</TD>

	</TR>
<%
	}
}

else if (l_agency_code != null){%>
	<TR>&nbsp;</TR> 
	<TR class="str">

		<TR class="str">
		<TD class="str" wrap>   
			<LABEL class="userlabel">No Coupons for Customer <B><%=l_agency_code%></B></LABEL>
		</TD>
	</TR>		
<%}%>

</TABLE>
</BODY>
</HTML>
<%}catch(Exception e){System.out.println("Exception e : "+e);e.printStackTrace();}%>