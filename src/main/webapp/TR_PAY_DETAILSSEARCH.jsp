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
	HashMap TR_PAY_DETAILSSEARCHObj = (HashMap)request.getAttribute("RESPONSE");
	Logger logger = Logger.getLogger("TR_PAY_DETAILSSEARCH");
//	System.out.println(TR_PAY_DETAILSSEARCHObj);

	String l_agency_code = "";
	String l_v_type = "";
	String l_rcd_dt = "";
	String l_ent_dt = "";
	String l_ent_no = "";
	ArrayList l_outer_array = new ArrayList();

	if(TR_PAY_DETAILSSEARCHObj == null)
	{
  		TR_PAY_DETAILSSEARCHObj = new HashMap();
	}
	else
	{
	 l_agency_code = (String)TR_PAY_DETAILSSEARCHObj.get("AGN_CODE");
	 l_v_type = (String)TR_PAY_DETAILSSEARCHObj.get("VOU_TYPE");
	 l_rcd_dt = (String)TR_PAY_DETAILSSEARCHObj.get("RCD_DATE");
	 l_ent_dt = (String)TR_PAY_DETAILSSEARCHObj.get("ENT_DATE");
	 l_ent_no = (String)TR_PAY_DETAILSSEARCHObj.get("ENT_NO");

	 StringBuffer l_str_query=new StringBuffer();

	logger.debug("AGENCY CODE "+l_agency_code);

	logger.debug("Edition CODE  "+l_ent_no);
	if(TR_PAY_DETAILSSEARCHObj.get("AGN_CODE")!=null)
	{

		l_str_query.append("SELECT RCD_NO,date_format(RCD_DATE,'%d%m%Y'),date_format(ENT_DATE,'%d%m%Y'),ENT_NO,");
		l_str_query.append("V.KEY_NAME AS VOU_TYPEDESC,T.KEY_NAME AS PYMT_TYPEDESC,");
		l_str_query.append("M.KEY_NAME AS PYMT_MODEDECS, REC_AMOUNT ");
		l_str_query.append("FROM @DB_NAME.TR_PAY_DETAILS S, ST_MAPPINGS V, ST_MAPPINGS T, ST_MAPPINGS M ");
		l_str_query.append("WHERE V.KEY_TYPE= 'VOU_TYPE' ");
		l_str_query.append("AND V.KEY_CODE = VOU_TYPE ");
		l_str_query.append("AND T.KEY_TYPE= 'PYMT_TYPE' ");
		l_str_query.append("AND T.KEY_CODE = PYMT_TYPE ");
		l_str_query.append("AND M.KEY_TYPE= 'PYMT_MODE' ");
		l_str_query.append("AND M.KEY_CODE = PYMT_MODE ");
		l_str_query.append("AND S.LOGIN_USR_VENDOR_ID='@LOGIN_USR_VENDOR_ID' ");
		l_str_query.append("AND S.agn_CODE = '");
		l_str_query.append(l_agency_code).append("'");

		if(TR_PAY_DETAILSSEARCHObj.get("VOU_TYPE")!=null)
			l_str_query.append(" AND S.VOU_TYPE='").append(l_v_type).append("'");

		if(TR_PAY_DETAILSSEARCHObj.get("ENT_NO")!=null)
			l_str_query.append(" AND S.ENT_NO='").append(l_ent_no).append("'");

		if(TR_PAY_DETAILSSEARCHObj.get("RCD_DATE")!=null)
			l_str_query.append(" and S.RCD_DATE = str_to_date('").append(l_rcd_dt).append("','%d/%m/%Y')");

		if(TR_PAY_DETAILSSEARCHObj.get("ENT_DATE")!=null)
			l_str_query.append(" and S.ENT_DATE = str_to_date('").append(l_ent_dt).append("','%d/%m/%Y')");

			l_str_query.append(" order by RCD_DATE,ENT_DATE desc,ENT_NO");
			l_outer_array = obj_fetch_pick_vals.getQueryResults(obj_fetch_pick_vals.finalQuery(l_str_query.toString(),db_name,insstalled_at));

		}
	}

	
	String formName = "TR_PAY_DETAILSSEARCH";

%>

<TITLE id="TR_PAY_DETAILSSEARCH_title"><%= field_labels.getString("TR_PAY_DETAILSSEARCH.TR_PAY_DETAILSSEARCH_title") %></TITLE>

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
	document.getElementById("ENTITY").value="TR_PAY_DETAILSSEARCH";
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

<DIV id="TR_PAY_DETAILSSEARCH_div" >

<FORM name="TR_PAY_DETAILSSEARCH" id="TR_PAY_DETAILSSEARCH" method="post" action="distAppCommonActionServlet.do">
<INPUT type="hidden" id="Event" name="Event" value="">
<INPUT type="hidden" id="MAKER" name="MAKER" value="<%= (String)TR_PAY_DETAILSSEARCHObj.get("MAKER") %>">
<INPUT type="hidden" id="MAKER_DT" name="MAKER_DT" value="">
<INPUT type="hidden" id="STATUS" name="STATUS" value="<%= (String)TR_PAY_DETAILSSEARCHObj.get("STATUS") %>">
<INPUT type="hidden" id="MODE" name="MODE" value="NONE">
<INPUT type="hidden" id="ENTITY" name="ENTITY" value="TR_PAY_DETAILSSEARCH">
<INPUT type="hidden" id="PARAM" name="PARAM" value="<%= (String)TR_PAY_DETAILSSEARCHObj.get("PARAM") %>">
<INPUT type="hidden" id="PARAM1" name="PARAM1" value="<%= (String)TR_PAY_DETAILSSEARCHObj.get("PARAM1") %>">
<INPUT type="hidden" id="PARAM2" name="PARAM2" value="<%= (String)TR_PAY_DETAILSSEARCHObj.get("PARAM2") %>">
<INPUT type="hidden" id="PRIMARY_KEY" name="PRIMARY_KEY" value="A.AGN_CODE#SUP_DT,DATE#E.EDT_CODE#UCN_CREATION_DT">
<INPUT type="hidden" id="SCREEN_NAME" name="SCREEN_NAME" value="TR_PAY_DETAILSSEARCH">
<INPUT type="hidden" id="WASTAGE" name="WASTAGE" value="<%= (String)TR_PAY_DETAILSSEARCHObj.get("WASTAGE") %>">
<INPUT type="hidden" id="W_FLAG" name="W_FLAG" value="<%= (String)TR_PAY_DETAILSSEARCHObj.get("W_FLAG") %>">
<INPUT type="hidden" id="ERRDESC" name="ERRDESC" value="<%= (String)TR_PAY_DETAILSSEARCHObj.get("ERRDESC") %>">
<INPUT type="hidden" id="PARAMSTR" name="PARAMSTR" value="<%=(String)TR_PAY_DETAILSSEARCHObj.get("PARAMSTR") %>">


   <TABLE class="headertable" cellspacing="0" cellpadding="0" width='100%'>
         <TD>&nbsp;</TD>
        <TR> 
           <TD class="heading" nowrap align="center">
            <%= field_labels.getString("TR_PAY_DETAILSSEARCH.TR_PAY_DETAILSSEARCH") %>
           </TD>
           <TD>&nbsp;</TD>
        </TR>
   </TABLE>
 
 <TABLE class="detailstable" cellspacing="0" cellpadding="0">
	<TR class="ste">
	        <TD class="ste" nowrap>   
				<LABEL ID="AGN_CODE_label" class="userlabel"><%= field_labels.getString("TR_PAY_DETAILS.AGN_CODE") %><SPAN class="instreditalic"> *</SPAN></LABEL>
		
		</TD>
		<TD>
				<INPUT type="text" id="AGN_CODE" name="AGN_CODE" class="input" size="10" maxLength="10" 
			onChange="FieldValidation(this);getCodeDesc('AGN_CODE','AGN_CODEDESC', 'g_pkl_agencyDesc','');" value="<%= (String)TR_PAY_DETAILSSEARCHObj.get("AGN_CODE")%>" >
		  <INPUT type="text" id="AGN_CODEDESC" name="AGN_CODEDESC" readonly class="input" size="50"   maxLength="50"  value="<%= (String)TR_PAY_DETAILSSEARCHObj.get("AGN_CODEDESC") %>">
			<A id="AGN_CODEHLP" name="AGN_CODEEHLP"  href="#" onClick="getPicklistValues('g_pkl_agency','AGN_CODE','','')" class="linkblue" >?</A> &nbsp;

		</TD>
	        <TD class="ste" nowrap>   
				<LABEL ID="VOU_TYPE_label" class="userlabel"><%= field_labels.getString("TR_PAY_DETAILS.VOU_TYPE") %></LABEL>
		
		</TD>
		<TD>
				<INPUT type="text" id="VOU_TYPE" name="VOU_TYPE" class="input" size="10" maxLength="10"  value="<%= (String)TR_PAY_DETAILSSEARCHObj.get("VOU_TYPE") %>"
			onChange="FieldValidation(this);getCodeDesc('VOU_TYPE','VOU_TYPEDESC', 'g_pkl_voucherDesc','KEY_CODE');" >
		  <INPUT type="text" id="VOU_TYPEDESC" name="VOU_TYPEDESC" readonly class="input" size="50"  readonly maxLength="50" value="<%= (String)TR_PAY_DETAILSSEARCHObj.get("VOU_TYPEDESC") %>" >
			<A id="VOU_TYPEHLP" name="VOU_TYPEHLP"  href="#" onClick="getPicklistValues('g_pkl_voucher','VOU_TYPE','','')" class="linkblue" >?</A> &nbsp;

		</TD>

	</TR>
	<TR class="ste">
	   <TD class="ste" nowrap>   
			<LABEL ID="RCD_DATE_label" class="userlabel"><%= field_labels.getString("TR_PAY_DETAILS.RCD_DATE")%></LABEL>
		</TD>
		<TD class="ste" nowrap>
		<INPUT type="text" id="RCD_DATE" name="RCD_DATE" CLASS="input" size="10" maxlength="10" value="<%= (String)TR_PAY_DETAILSSEARCHObj.get("RCD_DATE") %>"><a id="RCD_DATEHLP" href="#" onClick="javascript:calendar('RCD_DATE',event.screenY,event.screenX,null,null,getDatePickerPattern());"
			title="Select Date"> <img src="images/calendar.gif" width="16"
			height="16" border="0" /></a>
		</TD>
	   <TD class="ste" nowrap>   
			<LABEL ID="ENT_DATE_label" class="userlabel"><%= field_labels.getString("TR_PAY_DETAILS.ENT_DATE")%></LABEL>
		</TD>
		<TD class="ste" nowrap>
		<INPUT type="text" id="ENT_DATE" name="ENT_DATE" CLASS="input" size="10" maxlength="10" value="<%= (String)TR_PAY_DETAILSSEARCHObj.get("ENT_DATE") %>"> <a id="ENT_DATEHLP" href="#" onClick="javascript:calendar('ENT_DATE',event.screenY,event.screenX,null,null,getDatePickerPattern());"
			title="Select Date"> <img src="images/calendar.gif" width="16"
			height="16" border="0" /></a>
		</TD>
	</TR>
	<TR class="ste">
	   <TD class="ste" nowrap>   
			<LABEL ID="ENT_NO_label" class="userlabel"><%= field_labels.getString("TR_PAY_DETAILS.ENT_NO") %></LABEL>
		</TD>
		<TD class="ste" nowrap>
		<INPUT type="text" id="ENT_NO" name="ENT_NO" CLASS="input" size="25" maxlength="25" value="<%= (String)TR_PAY_DETAILSSEARCHObj.get("ENT_NO") %>">
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
			<LABEL ID="RECORD_NO_label" class="userlabel"><%= field_labels.getString("TR_PAY_DETAILSSEARCH.RECORD_NO") %></LABEL>
		</TD>
		<TD class="ste" nowrap>   
			<LABEL ID="RCD_DATE_label" class="userlabel"><%= field_labels.getString("TR_PAY_DETAILS.RCD_DATE") %></LABEL>
		</TD>
		<TD class="ste" nowrap>   
			<LABEL ID="ENT_DATE_label" class="userlabel"><%= field_labels.getString("TR_PAY_DETAILS.ENT_DATE") %></LABEL>
		</TD>
		<TD class="ste" nowrap>   
			<LABEL ID="ENT_NO_label" class="userlabel"><%= field_labels.getString("TR_PAY_DETAILS.ENT_NO") %></LABEL>
		</TD>
		<TD>
			<LABEL ID="VOU_TYPE_label" class="userlabel"><%= field_labels.getString("TR_PAY_DETAILS.VOU_TYPE") %></LABEL>
		</TD>
		<TD class="ste">
			<LABEL ID="PYMT_TYPE_label" class="userlabel"><%= field_labels.getString("TR_PAY_DETAILS.PYMT_TYPE") %></LABEL>
		</TD>
		<TD>
			<LABEL ID="PYMT_MODE_label" class="userlabel"><%= field_labels.getString("TR_PAY_DETAILS.PYMT_MODE") %></LABEL>
		</TD>
		<TD class="ste">
			<LABEL ID="REC_AMOUNT_label" class="userlabel"><%= field_labels.getString("TR_PAY_DETAILS.REC_AMOUNT") %></LABEL>
		</TD>
		</TR>

<%}%>
<%
for(int i=0;i<l_outer_array.size();i++)
	{

	ArrayList l_inner_arr = (ArrayList)l_outer_array.get(i);

	String l_passs_str = "RCD_NO@" +l_inner_arr.get(0).toString(); 

%>
	<TR class="str">

		<TD class="ste" nowrap>   
			<A href="TR_PAY_DETAILSRESULTS.jsp?PARAMSTR='<%=l_passs_str%>'" target="SEARCHDET" id="Link" class="linkblue" ><%=(String)l_inner_arr.get(0)%></a>
		</TD>

		<TD class="str" nowrap>   
			<LABEL ID="RCD_DATE" class="userlabel"><%= (String)l_inner_arr.get(1) %></LABEL>
		</TD>

		<TD class="str" nowrap>   
			<LABEL ID="ENT_DATE" class="userlabel"><%= (String)l_inner_arr.get(2) %></LABEL>
		</TD>

		<TD class="str" nowrap>   
			<LABEL ID="ENT_NO" class="userlabel"><%= (String)l_inner_arr.get(3) %></LABEL>
		</TD>

		<TD class="str" nowrap>   
			<LABEL ID="VOU_TYPE" class="userlabel"><%=l_inner_arr.get(4)==null?"":(String)l_inner_arr.get(4) %></LABEL>
		</TD>
		<TD class="str" nowrap>   
			<LABEL ID="PYMT_TYPE" class="userlabel"><%= (String)l_inner_arr.get(5) %></LABEL>
		</TD>
		<TD class="str" nowrap>   
			<LABEL ID="PYMT_MODE" class="userlabel"><%= (String)l_inner_arr.get(6) %></LABEL>
		</TD>
		<TD class="str" nowrap>   
			<LABEL ID="REC_AMOUNT" class="userlabel"><%= (String)l_inner_arr.get(7) %></LABEL>
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