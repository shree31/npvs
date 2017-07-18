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
	HashMap TR_DAILY_UNSOLDSEARCHObj = (HashMap)request.getAttribute("RESPONSE");
	Logger logger = Logger.getLogger("TR_DAILY_UNSOLDSEARCH");
//	System.out.println(TR_DAILY_UNSOLDSEARCHObj);

	String l_agency_code = "";
	String l_pub_code = "";
	String l_sup_dt = "";
	String l_ucn_creation_dt = "";
	ArrayList l_outer_array = new ArrayList();

	if(TR_DAILY_UNSOLDSEARCHObj == null)
	{
  		TR_DAILY_UNSOLDSEARCHObj = new HashMap();
	}
	else
	{
	 l_agency_code = (String)TR_DAILY_UNSOLDSEARCHObj.get("AGN_CODE");
	 l_pub_code = (String)TR_DAILY_UNSOLDSEARCHObj.get("PUB_CODE");
	 l_sup_dt = (String)TR_DAILY_UNSOLDSEARCHObj.get("SUP_DT");
	 l_ucn_creation_dt = (String)TR_DAILY_UNSOLDSEARCHObj.get("UCN_CREATION_DT");

	 String l_str_query=null;

	logger.debug("AGENCY CODE "+l_agency_code);

	logger.debug("Edition CODE  "+l_pub_code);
	if(TR_DAILY_UNSOLDSEARCHObj.get("AGN_CODE")!=null)
	{
			l_str_query = "SELECT date_format(U.SUP_DT,'%d/%m/%Y'), U.SUP_DAY, U.RATE, IFNULL(U.RETURN_REASON,''), U.TOTAL_SUP, U.RETURN_COPY, U.RET_TOTAL_AMT, U.COMM, U.RET_COMM, U.NET_AMT, U.PUB_CODE FROM @DB_NAME.TR_DAILY_UNSOLD U WHERE U.AGN_CODE ='"+ l_agency_code  +"'";
		
		l_str_query = l_str_query + " AND u.LOGIN_USR_VENDOR_ID='@LOGIN_USR_VENDOR_ID'";

		if(TR_DAILY_UNSOLDSEARCHObj.get("PUB_CODE")!=null)
			l_str_query = l_str_query + " AND u.PUB_CODE='"+l_pub_code+"'";

		if(TR_DAILY_UNSOLDSEARCHObj.get("SUP_DT")!=null)
			l_str_query = l_str_query + " AND U.SUP_DT = str_to_date('"+l_sup_dt+"','%d/%m/%Y')";

		if(TR_DAILY_UNSOLDSEARCHObj.get("UCN_CREATION_DT")!=null)
			l_str_query = l_str_query + " AND U.UCN_CREATION_DT = str_to_date('"+l_ucn_creation_dt+"','%d/%m/%Y')";

			l_str_query = l_str_query + " ORDER BY U.SUP_DT DESC, 3";
			l_outer_array = obj_fetch_pick_vals.getQueryResults(obj_fetch_pick_vals.finalQuery(l_str_query,db_name,insstalled_at));

		}
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
<INPUT type="hidden" id="MAKER" name="MAKER" value="<%= (String)TR_DAILY_UNSOLDSEARCHObj.get("MAKER") %>">
<INPUT type="hidden" id="MAKER_DT" name="MAKER_DT" value="">
<INPUT type="hidden" id="STATUS" name="STATUS" value="<%= (String)TR_DAILY_UNSOLDSEARCHObj.get("STATUS") %>">
<INPUT type="hidden" id="MODE" name="MODE" value="NONE">
<INPUT type="hidden" id="ENTITY" name="ENTITY" value="TR_DAILY_UNSOLDSEARCH">
<INPUT type="hidden" id="PARAM" name="PARAM" value="<%= (String)TR_DAILY_UNSOLDSEARCHObj.get("PARAM") %>">
<INPUT type="hidden" id="PARAM1" name="PARAM1" value="<%= (String)TR_DAILY_UNSOLDSEARCHObj.get("PARAM1") %>">
<INPUT type="hidden" id="PARAM2" name="PARAM2" value="<%= (String)TR_DAILY_UNSOLDSEARCHObj.get("PARAM2") %>">
<INPUT type="hidden" id="PRIMARY_KEY" name="PRIMARY_KEY" value="A.AGN_CODE#SUP_DT,DATE#U.PUB_CODE#UCN_CREATION_DT">
<INPUT type="hidden" id="SCREEN_NAME" name="SCREEN_NAME" value="TR_DAILY_UNSOLDSEARCH">
<INPUT type="hidden" id="WASTAGE" name="WASTAGE" value="<%= (String)TR_DAILY_UNSOLDSEARCHObj.get("WASTAGE") %>">
<INPUT type="hidden" id="W_FLAG" name="W_FLAG" value="<%= (String)TR_DAILY_UNSOLDSEARCHObj.get("W_FLAG") %>">
<INPUT type="hidden" id="ERRDESC" name="ERRDESC" value="<%= (String)TR_DAILY_UNSOLDSEARCHObj.get("ERRDESC") %>">
<INPUT type="hidden" id="PARAMSTR" name="PARAMSTR" value="<%=(String)TR_DAILY_UNSOLDSEARCHObj.get("PARAMSTR") %>">


   <TABLE class="headertable" cellspacing="0" cellpadding="0" width='100%'>
         <TD>&nbsp;</TD>
        <TR> 
           <TD class="heading" nowrap align="center">
            <%= field_labels.getString("TR_DAILY_UNSOLDSEARCH.TR_DAILY_UNSOLDSEARCH") %>
           </TD>
           <TD>&nbsp;</TD>
        </TR>
   </TABLE>
 
 <TABLE class="detailstable" cellspacing="0" cellpadding="0">
	<TR class="ste">
	<TD class="ste" nowrap>   
			<LABEL ID="AGN_CODE_label" class="userlabel"><%= field_labels.getString("TR_DAILY_UNSOLDSEARCH.AGN_CODE") %><SPAN class="instreditalic">*</SPAN></LABEL>
		</TD>
		<TD class="ste" colspan="3" nowrap>
			<INPUT type="text" id="AGN_CODE" name="AGN_CODE" class="input" size="10" onChange="FieldValidation(this);getCodeDesc('AGN_CODE','AGN_CODEDESC', 'g_pkl_agencyDesc','');" maxLength="10"  value="<%= (String)TR_DAILY_UNSOLDSEARCHObj.get("AGN_CODE") %>" >
           	  <INPUT type="text" id="AGN_CODEDESC" name="AGN_CODEDESC" readOnly class="input" size="50" maxLength="50" value="<%= 
	(String)TR_DAILY_UNSOLDSEARCHObj.get("AGN_CODEDESC") %>" >
		<A id="AGN_CODEHLP" name="AGN_CODEHLP"  href="#" onClick="getPicklistValues('g_pkl_agency','AGN_CODE','','')" class="linkblue" >?</A> &nbsp;
		</TD>
		<TD>
			<LABEL ID="PUB_CODE_label" class="userlabel"><%= field_labels.getString("TR_DAILY_UNSOLDSEARCH.PUB_CODE") %></LABEL>
		</TD>
		<TD class="ste" colspan="3" nowrap>
		<INPUT type="text" id="PUB_CODE" name="PUB_CODE" class="input" size="21" maxLength="21" onChange="FieldValidation(this);getCodeDesc('PUB_CODE','PUB_NAME', 'g_pkl_publicationDesc','');" value="<%= (String)TR_DAILY_UNSOLDSEARCHObj.get("PUB_CODE") %>">
		  <INPUT type="text" id="PUB_NAME" name="PUB_NAME" class="input" size="50" readonly  maxLength="50" value="<%= (String)TR_DAILY_UNSOLDSEARCHObj.get("PUB_NAME") %>" >
			<A id="PUB_CODEHLP" name="PUB_CODEEHLP"  href="#" onClick="getPicklistValues('g_pkl_publication','PUB_CODE','','')" class="linkblue" >?</A> &nbsp;
		</TD>

	</TR>

	<TR class="ste">
		<TD class="ste" colspan="1" nowrap>   
			<LABEL ID="SUP_DT_label" class="userlabel"><%= field_labels.getString("TR_DAILY_UNSOLDSEARCH.SUP_DT") %></LABEL>
		</TD>
		<TD class="ste" nowrap>   
		<INPUT type="text" id="SUP_DT" name="SUP_DT" class="input" size="10" onblur="FieldValidation(this);" maxLength="10"  value="<%= (String)TR_DAILY_UNSOLDSEARCHObj.get("SUP_DT") %>" >
		<a id="SUP_DTHLP" href="#" onClick="javascript:calendar('SUP_DT',event.screenY,event.screenX,null,null,getDatePickerPattern());" title="Select Date"> <img src="images/calendar.gif" width="16" height="16" border="0" /></a>
		</TD>
		<TD class="ste" nowrap>   
			<LABEL ID="UCN_CREATION_DT_label" class="userlabel"><%= field_labels.getString("TR_DAILY_UNSOLDSEARCH.UCN_CREATION_DT") %></LABEL>
		</TD>
		<TD class="ste" colspan="3" nowrap>
			<INPUT type="text" id="UCN_CREATION_DT" name="UCN_CREATION_DT" class="input" size="10" onblur="FieldValidation(this);" maxLength="10"  value="<%= (String)TR_DAILY_UNSOLDSEARCHObj.get("UCN_CREATION_DT")%>" >
			<a id="UCN_CREATION_DTHLP" href="#" onClick="javascript:calendar('UCN_CREATION_DT',event.screenY,event.screenX,null,null,getDatePickerPattern());" title="Select Date"> <img src="images/calendar.gif" width="16" height="16" border="0" /></a>
		</TD>
	</TR>
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
     <TR class="eventsrow2"> 
      <TD class="eventscol" align="right">

		<INPUT TYPE="button" value="Submit" name="Submit_label" class="button" onClick="preSubmit()">

      </TD>
     </TR>
    </TABLE>
   </TD>
  </TR>
</TABLE>
 <TABLE class="detailstable" cellspacing="0" cellpadding="0">
<%
if(l_outer_array.size()>0)	
	{
%>

	<TR class="ste">
		<TD class="ste" nowrap>   
			<LABEL ID="RECORD_NO_label" class="userlabel"><%= field_labels.getString("TR_DAILY_UNSOLDSEARCH.RECORD_NO") %></LABEL>
		</TD>
		<TD class="ste" nowrap>   
			<LABEL ID="SUP_DT_label" class="userlabel"><%= field_labels.getString("TR_DAILY_UNSOLD.SUP_DT") %></LABEL>
		</TD>
		<TD class="ste">
			<LABEL ID="SUP_DAY_label" class="userlabel"><%= field_labels.getString("TR_DAILY_UNSOLD.SUP_DAY") %></LABEL>
		</TD>
		<TD>
			<LABEL ID="PUB_CODE_label" class="userlabel"><%= field_labels.getString("TR_DAILY_UNSOLD.PUB_CODE") %></LABEL>
		</TD>
		<TD class="ste">
			<LABEL ID="RATE_label" class="userlabel"><%= field_labels.getString("TR_DAILY_UNSOLD.RATE") %></LABEL>
		</TD>
		<TD>
			<LABEL ID="RETURN_REASON_label" class="userlabel"><%= field_labels.getString("TR_DAILY_UNSOLD.RETURN_REASON") %></LABEL>
		</TD>
		<TD class="ste">
			<LABEL ID="TOTAL_SUP_label" class="userlabel"><%= field_labels.getString("TR_DAILY_UNSOLD.TOTAL_SUP") %></LABEL>
		</TD>
<!--		<TD>
			<LABEL ID="W_FLAG_label" class="userlabel"><%= field_labels.getString("TR_DAILY_UNSOLD.W_FLAG") %></LABEL>
		</TD>
-->
		<TD>
			<LABEL ID="RETURN_COPY_label" class="userlabel"><%= field_labels.getString("TR_DAILY_UNSOLD.RETURN_COPY") %></LABEL>
		</TD>
		<TD class="ste">
			<LABEL ID="RET_TOTAL_AMT_label" class="userlabel"><%= field_labels.getString("TR_DAILY_UNSOLD.RET_TOTAL_AMT") %></LABEL>
		</TD>
	<!--	<TD class="ste">
			<LABEL ID="RET_W_AMT_label" class="userlabel"><%= field_labels.getString("TR_DAILY_UNSOLD.RET_W_AMT") %></LABEL>
		</TD>
-->
		<TD class="ste">
			<LABEL ID="COMM_label" class="userlabel"><%= field_labels.getString("TR_DAILY_UNSOLD.COMM") %></LABEL>
		</TD>
		<TD>
			<LABEL ID="RET_COMM_label" class="userlabel"><%= field_labels.getString("TR_DAILY_UNSOLD.RET_COMM") %></LABEL>
		</TD>

		<TD>
			<LABEL ID="NET_AMT_label" class="userlabel"><%= field_labels.getString("TR_DAILY_UNSOLD.NET_AMT") %></LABEL>
		</TD>
		</TR>

<%}%>
<%
for(int i=0;i<l_outer_array.size();i++)
	{

	ArrayList l_inner_arr = (ArrayList)l_outer_array.get(i);

	String l_passs_str = "AGN_CODE@" +l_agency_code + "@SEP@SUP_DT@" + l_inner_arr.get(0) + "@SEP@PUB_CODE@" + l_inner_arr.get(10); 

%>
	<TR class="str">

		<TD class="ste" nowrap>   
			<A href="TR_DAILY_UNSOLDRESULTS.jsp?PARAMSTR='<%=l_passs_str%>'" target="SEARCHDET" id="Link" class="linkblue" ><%=(i+1)%></a>
		</TD>

		<TD class="str" nowrap>   
			<LABEL ID="SUP_DT" class="userlabel"><%= (String)l_inner_arr.get(0) %></LABEL>
		</TD>

		<TD class="str" nowrap>   
			<LABEL ID="SUP_DAY" class="userlabel"><%= (String)l_inner_arr.get(1) %></LABEL>
		</TD>

		<TD class="str" nowrap>   
			<LABEL ID="PUB_CODE" class="userlabel"><%= (String)l_inner_arr.get(2) %></LABEL>
		</TD>

		<TD class="str" nowrap>   
			<LABEL ID="RATE" class="userlabel"><%= (String)l_inner_arr.get(3) %></LABEL>
		</TD>

		<TD class="str" nowrap>   
			<LABEL ID="RETURN_REASON" class="userlabel"><%=l_inner_arr.get(4)==null?"":(String)l_inner_arr.get(4) %></LABEL>
		</TD>
		<TD class="str" nowrap>   
			<LABEL ID="TOTAL_SUP" class="userlabel"><%= (String)l_inner_arr.get(5) %></LABEL>
		</TD>
	<!--	<TD class="str" nowrap>   
			<LABEL ID="W_FLAG" class="userlabel"><%= (String)l_inner_arr.get(6) %></LABEL>
		</TD> -->
		<TD class="str" nowrap>   
			<LABEL ID="RETURN_COPY" class="userlabel"><%= (String)l_inner_arr.get(6) %></LABEL>
		</TD>
		<TD class="str" nowrap>   
			<LABEL ID="RET_TOTAL_AMT" class="userlabel"><%= (String)l_inner_arr.get(7) %></LABEL>
		</TD>
<!--		<TD class="str" nowrap>   
			<LABEL ID="RET_W_AMT" class="userlabel"><%= (String)l_inner_arr.get(9) %></LABEL>
		</TD> -->
		<TD class="str" nowrap>   
			<LABEL ID="COMM" class="userlabel"><%= (String)l_inner_arr.get(8) %></LABEL>
		</TD>
		<TD class="str" nowrap>   
			<LABEL ID="RET_COMM" class="userlabel"><%= (String)l_inner_arr.get(9) %></LABEL>
		</TD>
		<TD class="str" nowrap>   
			<LABEL ID="NET_AMT" class="userlabel"><%= (String)l_inner_arr.get(10) %></LABEL>
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