<%@ include file="DISTAPPMDResourceProvider.jsp" %>
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
	HashMap TR_DAILY_UNSOLDSEARCHObj = (HashMap)request.getAttribute("RESPONSE");
	Logger logger = Logger.getLogger("MT_BASESUPSEARCHRES");

	String l_agency_code = "";
	String l_agency_name = "";
	String l_pub_code = "";
	String l_cust_address = "";
	ArrayList l_outer_array = new ArrayList();

	 l_agency_code = request.getParameter("AGN_CODE");
	 l_agency_name = request.getParameter("AGN_DESC");
	 l_pub_code = request.getParameter("PUB_CODE");
	 l_cust_address = request.getParameter("CUST_ADDRESS");

	 String l_str_query=null;

	logger.debug("AGENCY CODE "+l_agency_code);

	logger.debug("Edition CODE  "+l_pub_code);
	logger.debug("l_cust_address   "+l_cust_address);
	String l_cust_address_arr[] = l_cust_address.split(" - ");
	if(l_agency_code.length()>0)
	{
			l_str_query = obj_fetch_pick_vals.getQuery("MT_BASESUPSEARCHRES");

		if(!request.getParameter("PUB_CODE").equals("null") && request.getParameter("PUB_CODE").length()>0)
			l_str_query = l_str_query + " AND P.PUB_CODE='"+l_pub_code+"'";

		if(!request.getParameter("CUST_ADDRESS").equals("null") && request.getParameter("CUST_ADDRESS").length()>0)
			l_str_query = l_str_query + " AND A.DLV_CODE LIKE '%"+l_cust_address_arr[1]+"%'";

			l_str_query = l_str_query + " ORDER BY 1";
			ArrayList<String> replaceValues = new  ArrayList<String>();
			replaceValues.add("@AGN_CODE#"+l_agency_code);
			replaceValues.add("@DB_NAME#"+db_name);
			replaceValues.add("@LOGIN_USR_VENDOR_ID#"+insstalled_at);
			l_str_query=obj_fetch_pick_vals.finalQuery(l_str_query, replaceValues);
			replaceValues = null;
			l_outer_array = obj_fetch_pick_vals.getQueryResults(l_str_query);

		}
	
	String formName = "TR_DAILY_UNSOLDSEARCH";

%>

<TITLE id="TR_DAILY_UNSOLDSEARCH_title"><%= field_labels.getString("TR_DAILY_UNSOLDSEARCH.TR_DAILY_UNSOLDSEARCH_title") %></TITLE>

<LINK rel='stylesheet' href='scripts/style.css' type='text/css'>
<SCRIPT Language='Javascript' type='text/javascript' src='scripts/CommonFunctions.js'></SCRIPT>
<SCRIPT type='text/javascript' language = 'JavaScript' src='scripts/DatePicker.js'></SCRIPT>
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
	document.getElementById("ENTITY").value="TR_DAILY_UNSOLDSEARCH";
}

function preSubmit()
	{
		validateSubmit();
	}

function FieldValidation(as_field_name)
{

	return true;
}

function validateForm(as_event_label)
{
	return true;
}

</SCRIPT>


<SCRIPT type="text/javascript" language = "JavaScript">
</script>

</HEAD>
<BODY class="mainbody" onLoad="execute_onLoad()" >

<DIV id="TR_DAILY_UNSOLDSEARCH_div" >

<FORM name="TR_DAILY_UNSOLDSEARCH" id="TR_DAILY_UNSOLDSEARCH" method="post" action="distAppCommonActionServlet.do">
<INPUT type="hidden" id="Event" name="Event" value="">
<INPUT type="hidden" id="MAKER" name="MAKER" value="">
<INPUT type="hidden" id="MAKER_DT" name="MAKER_DT" value="">
<INPUT type="hidden" id="STATUS" name="STATUS" value="">
<INPUT type="hidden" id="MODE" name="MODE" value="NONE">
<INPUT type="hidden" id="ENTITY" name="ENTITY" value="TR_DAILY_UNSOLDSEARCH">
<INPUT type="hidden" id="PARAM" name="PARAM" value="">
<INPUT type="hidden" id="PARAM1" name="PARAM1" value="">
<INPUT type="hidden" id="PARAM2" name="PARAM2" value="">
<INPUT type="hidden" id="PRIMARY_KEY" name="PRIMARY_KEY" value="A.AGN_CODE#SUP_DT,DATE#U.PUB_CODE#UCN_CREATION_DT">
<INPUT type="hidden" id="SCREEN_NAME" name="SCREEN_NAME" value="TR_DAILY_UNSOLDSEARCH">
<INPUT type="hidden" id="WASTAGE" name="WASTAGE" value="">
<INPUT type="hidden" id="W_FLAG" name="W_FLAG" value="">
<INPUT type="hidden" id="ERRDESC" name="ERRDESC" value="">
<INPUT type="hidden" id="PARAMSTR" name="PARAMSTR" value="">


   <TABLE class="headertable" cellspacing="0" cellpadding="0" width='100%'>

 <TABLE class="detailstable" cellspacing="0" cellpadding="0">
 <TABLE class="detailstable" cellspacing="0" cellpadding="0">
 	<TR class="str">
		<TD class="str" nowrap>   
			<LABEL ID="AGN_CODE_label" class="userlabel"><%= field_labels.getString("MT_AGNSUPSEARCH.AGN_CODE") %></LABEL>
		</TD>
		<TD class="str" colspan="1" nowrap>
			<LABEL ID="AGN_CODE_label" class="userlabel"><%= l_agency_code %></LABEL>
		</TD>
		<TD class="str" nowrap>   
			<LABEL ID="AGN_DESC_label" class="userlabel"><%= field_labels.getString("MT_AGNSUPSEARCH.AGN_CODE_NAME") %></LABEL>
		</TD>
		<TD class="str" colspan="1" nowrap>
			<LABEL ID="AGN_DESC_label" class="userlabel"><%= l_agency_name %></LABEL>
	</TD>

	</TR>	

<%
if(l_outer_array.size()>0)	
	{
%>

	<TR class="ste">
		<TD class="ste" nowrap>   
			<LABEL ID="RECORD_NO_label" class="userlabel"><%= field_labels.getString("TR_DAILY_UNSOLDSEARCH.RECORD_NO") %></LABEL>
		</TD>
		<TD>
			<LABEL ID="PUB_CODE_label" class="userlabel"><%= field_labels.getString("TR_DAILY_UNSOLD.PUB_CODE") %></LABEL>
		</TD>
	</TR>

<%}
else
	{
		out.println("No Record found");
	}
%>
<%
for(int i=0;i<l_outer_array.size();i++)
	{

	ArrayList l_inner_arr = (ArrayList)l_outer_array.get(i);

	String l_passs_str = "AGN_CODE@" +l_agency_code + "@SEP@PUB_CODE@" + l_inner_arr.get(0)+"@SEP@AGN_NAME@"+l_agency_name; 

%>
	<TR class="str">

		<TD class="ste" nowrap>   
			<A href="MT_BASESUPSEARCHCAL.jsp?PARAMSTR='<%=l_passs_str%>'" target="Right" id="Link" class="linkblue" ><%=(i+1)%></a>
		</TD>

		<TD class="str" nowrap>   
			<LABEL ID="PUB_CODE" class="userlabel"><%= (String)l_inner_arr.get(1) %></LABEL>
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