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
	Logger logger = Logger.getLogger("MT_AGNSUPSEARCH");
	
	String l_agency_code = request.getParameter("AGN_CODE");
	String l_cmp_code = request.getParameter("CMP_CODE");

	ArrayList l_outer_array = new ArrayList();
	String l_str_query=null;

	if(l_agency_code!=null)
	{
		if(!(l_agency_code.equals("null")))
		{
			l_str_query = obj_fetch_pick_vals.getQuery("MT_AGNSUPSEARCH");

		if(!(l_cmp_code.equals("null")))
			l_str_query = l_str_query + " AND a.cmp_code='"+l_cmp_code+"'";

			l_str_query = l_str_query + " order by 1,3";

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
	

	HashMap MT_AGNSUPSEARCHObj = (HashMap)request.getAttribute("RESPONSE");

	logger.debug("DAILY SUPPLY QUERY "+l_str_query);
	if(MT_AGNSUPSEARCHObj == null)
  		MT_AGNSUPSEARCHObj = new HashMap();

	String formName = "MT_AGNSUPSEARCH";

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
	getQueryResults('g_pkl_agencyCompany','','AGN_CODE@'+document.getElementById("AGN_CODE").value.toUpperCase(),'AGN_CODEDESC^CMP_CODE^CMP_CODEDESC');
}

function validateSubmit(as_field_name)
{
	if(chkMandatory()==true)
	{
		var l_agency_code = document.getElementById("AGN_CODE").value==""?"null":document.getElementById("AGN_CODE").value.toUpperCase();
		var l_cmp_code = document.getElementById("CMP_CODE").value==""?"null":document.getElementById("CMP_CODE").value.toUpperCase();
		
		//document.location.href="MT_AGNSUPSEARCH.jsp?AGN_CODE="+l_agency_code+"&CMP_CODE="+l_cmp_code;
		document.location.href="BaseSupSearchFrames.jsp?AGN_CODE="+l_agency_code+"&CMP_CODE="+l_cmp_code;
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
<INPUT type="hidden" id="PRIMARY_KEY" name="PRIMARY_KEY" value="MS.AGN_CODE#MS.PUB_CODE#MS.EDT_CODE">
<INPUT type="hidden" id="PARAMSTR" name="PARAMSTR" value="<%=(String)MT_AGNSUPSEARCHObj.get("PARAMSTR") %>">

  <TABLE class="headertable" cellspacing="0" cellpadding="0" width='100%'>
         <TD>&nbsp;</TD>
        <TR> 
           <TD class="heading" nowrap align="center">
            <%= field_labels.getString("MT_AGNSUPSEARCH.MT_AGNSUPSEARCH") %>
           </TD>
        </TR>
   </TABLE>
<%
if(l_outer_array.size()==0)	
	{
%>

 <TABLE class="detailstable" cellspacing="0" cellpadding="0">



	<TR class="ste">
		<TD class="ste" nowrap>   
			<LABEL ID="AGN_CODE_label" class="userlabel"><%= field_labels.getString("MT_AGNSUPSEARCH.AGN_CODE") %><SPAN class="instreditalic">*</SPAN></LABEL>
		</TD>
		<TD class="ste" colspan="7" nowrap>
			  <INPUT type="text" id="AGN_CODE" name="AGN_CODE" class="input" size="10" onChange="FieldValidation(this);getCodeDesc('AGN_CODE,USER_ID','AGN_CODEDESC', 'g_pkl_agencyDesc','AGN_CODE,USER_ID');"  maxLength="10" value="" >

<!--		<select class="input"name='AGN_CODE' id="AGN_CODE" onChange="FieldValidation(this);"  onBlur="FieldValidation(this);">
		<%
			out.println("<option value=''>Select</option>");
			out.println(obj_fetch_pick_vals.createOptionValues("g_pkl_agency",""));
		%>
	</SELECT> -->
	  <INPUT type="text" id="AGN_CODEDESC" name="AGN_CODEDESC" class="input" size="50" readonly maxLength="50" value="" >
	 <A id="AGN_CODEHLP" name="AGN_CODEEHLP"  href="#" onClick="getPicklistValues('g_pkl_agency','AGN_CODE','USER_ID','')" class="linkblue" >?</A> &nbsp;

	</TD>
	</TR>	
		<TR class="str">
		<TD class="str" nowrap>   
			<LABEL ID="CMP_CODE_label" class="userlabel"><%= field_labels.getString("MT_AGNSUPSEARCH.CMP_CODE") %></LABEL>
		</TD>
		<TD class="str" colspan="7" nowrap>
			<INPUT type="text" id="CMP_CODE" name="CMP_CODE" class="input" size="10" readOnly onChange="FieldValidation(this);" maxLength="10"  value="" >
	  <INPUT type="text" id="CMP_CODEDESC" name="CMP_CODEDESC" class="input" size="50" readonly  maxLength="50" value="" >
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
 <TABLE class="detailstable" cellspacing="0" cellpadding="0">
<%
if(l_outer_array.size()>0)	
	{
%>
<TR class="str">
		<TD class="str" nowrap colspan="2">   
			<LABEL ID="AGN_CODE_label" class="userlabel"><%= field_labels.getString("MT_AGENCYSUPPLY.AGN_CODE") %><SPAN class="instreditalic"> &nbsp;&nbsp;&nbsp;: &nbsp;&nbsp;&nbsp;</SPAN></LABEL>
			<LABEL ID="AGN_CODE_label" class="userlabel"><B><%=l_agency_code%></B></LABEL>

		</TD>
		<TD colspan="4">
			<LABEL ID="CMP_CODE_label" class="userlabel"><%= field_labels.getString("MT_AGENCYSUPPLY.CMP_CODE") %><SPAN class="instreditalic">&nbsp;&nbsp;&nbsp;: &nbsp;&nbsp;&nbsp;</SPAN></LABEL>
			<LABEL ID="CMP_CODE_label" class="userlabel"><B><%=l_cmp_code.equals("null")?"":l_cmp_code%></B></LABEL>
		</TD>
	</TR>

<TR>&nbsp;</TR>
	<TR class="str">

		<TR class="str">
		<TD class="ste" nowrap>   
			<LABEL ID="CMP_CODE_label" class="userlabel"><%= field_labels.getString("MT_AGNSUPSEARCH.RECORD_NO") %></LABEL>
		</TD>
		<TD class="str" nowrap>   
			<LABEL ID="CMP_CODE_label" class="userlabel"><%= field_labels.getString("MT_AGNSUPSEARCH.PUB_CODE") %></LABEL>
		</TD>
		<TD class="str" nowrap>   
			<LABEL ID="CMP_CODE_label" class="userlabel"><%= field_labels.getString("MT_AGNSUPSEARCH.PUB_NAME") %></LABEL>
		</TD>
		<TD class="str" nowrap>   
			<LABEL ID="CMP_CODE_label" class="userlabel"><%= field_labels.getString("MT_AGNSUPSEARCH.EDT_CODE") %></LABEL>
		</TD>
		<TD class="str" nowrap>   
			<LABEL ID="CMP_CODE_label" class="userlabel"><%= field_labels.getString("MT_AGNSUPSEARCH.EDT_NAME") %></LABEL>
		</TD>
		<TD class="str" nowrap>   
			<LABEL ID="CMP_CODE_label" class="userlabel"><%= field_labels.getString("MT_AGNSUPSEARCH.STATUS") %></LABEL>
		</TD>

<%}%>
<%
for(int i=0;i<l_outer_array.size();i++)
	{

	ArrayList l_inner_arr = (ArrayList)l_outer_array.get(i);

	String l_passs_str = "AGN_CODE@" +l_agency_code + "@SEP@PUB_CODE@" + l_inner_arr.get(0) + "@SEP@EDT_CODE@" + l_inner_arr.get(2) ; 

%>
	<TR class="str">

		<TD class="ste" nowrap>   
			<A href="MT_AGNSEARCHRESULTS.jsp?PARAMSTR='<%=l_passs_str%>'" target="SEARCHDET" id="Link" class="linkblue" ><%=(i+1)%></a>
		</TD>

		<TD class="str" nowrap>   
			<input type="text" ID="PUB_CODE" class="userlabel"  readOnly value="<%= (String)l_inner_arr.get(0) %>" >
		</TD>

		<TD class="str" nowrap>   
			<input type="text" ID="PUB_NAME" class="userlabel" readOnly value="<%= (String)l_inner_arr.get(1) %>" >
		</TD>

		<TD class="str" nowrap>   
			<input type="text" ID="EDT_CODE" class="userlabel" readOnly value="<%= (String)l_inner_arr.get(2) %>" >
		</TD>

		<TD class="str" nowrap>   
			<input type="text" ID="EDT_NAME" class="userlabel" readOnly value="<%= (String)l_inner_arr.get(3) %>" >
		</TD>

		<TD class="str" nowrap>   
			<input type="text" ID="STATUS" class="userlabel" readOnly value="<%= (String)l_inner_arr.get(4) %>" >
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