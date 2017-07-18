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
<%@ page import="com.distapp.beans.Common_distAppServlet" %>



<%	
	Logger logger = Logger.getLogger("TR_DAILY_UNSOLD");

	HashMap TR_DAILY_UNSOLDObj = (HashMap)request.getAttribute("RESPONSE");

	String l_param_str = "";
	if(TR_DAILY_UNSOLDObj == null)
	{

		TR_DAILY_UNSOLDObj = new HashMap();
		if(session != null)
		{
			if(session.getAttribute("UCN_CREATION_DT")!=null)
			TR_DAILY_UNSOLDObj.put("UCN_CREATION_DT",session.getAttribute("UCN_CREATION_DT"));
		}
	}
	else
	{
		String l_old_param="";

		if(TR_DAILY_UNSOLDObj.get("ERRDESC").toString().indexOf("SUCCESS")!=-1)
		{
			String supply_date = (String)TR_DAILY_UNSOLDObj.get("SUP_DT");
			String supply_day = (String)TR_DAILY_UNSOLDObj.get("SUP_DAY");
			String pub_code = (String)TR_DAILY_UNSOLDObj.get("PUB_CODE");
//			String edt_code = (String)TR_DAILY_UNSOLDObj.get("EDT_CODE");
			String rate = (String)TR_DAILY_UNSOLDObj.get("RATE");
			String ret_reason = (String)TR_DAILY_UNSOLDObj.get("RETURN_REASON");
			String tot_sup = (String)TR_DAILY_UNSOLDObj.get("TOTAL_SUP");
			String ret_copy = (String)TR_DAILY_UNSOLDObj.get("RETURN_COPY");
			String ret_tot_amt = (String)TR_DAILY_UNSOLDObj.get("RET_TOTAL_AMT");
			String comm = (String)TR_DAILY_UNSOLDObj.get("COMM");
			String ret_comm = (String)TR_DAILY_UNSOLDObj.get("RET_COMM");
			String net_amt = (String)TR_DAILY_UNSOLDObj.get("NET_AMT");
//			String wtype = (String)TR_DAILY_UNSOLDObj.get("W_FLAG");
//			String ret_w_amt = (String)TR_DAILY_UNSOLDObj.get("RET_W_AMT");

			l_param_str = supply_date + "@" + supply_day + "@" + pub_code + "@" +rate+"@"+ret_reason+"@"+tot_sup+"@"+ret_copy+"@"+ret_tot_amt+"@"+comm+"@"+ret_comm+"@"+net_amt;

			if(TR_DAILY_UNSOLDObj.get("PARAMSTR")!=null)
			{
				l_old_param=(String)TR_DAILY_UNSOLDObj.get("PARAMSTR");
				TR_DAILY_UNSOLDObj.put("PARAMSTR",l_old_param+"#"+l_param_str);
				l_param_str = l_old_param+"#"+l_param_str;
			}
			else
			{
				TR_DAILY_UNSOLDObj.put("PARAMSTR",l_param_str);
			}
		}
		else
		{
			if(TR_DAILY_UNSOLDObj.get("PARAMSTR")!=null)
			l_param_str =(String)TR_DAILY_UNSOLDObj.get("PARAMSTR");
		}
		if(session != null)
		{
		if(TR_DAILY_UNSOLDObj.get("UCN_CREATION_DT")!= null)
		session.setAttribute("UCN_CREATION_DT",TR_DAILY_UNSOLDObj.get("UCN_CREATION_DT"));
		}	
	}
	
	String formName = "TR_DAILY_UNSOLD";

%>

<TITLE id="TR_DAILY_UNSOLD_title"><%= field_labels.getString("TR_DAILY_UNSOLD.TR_DAILY_UNSOLD_title") %></TITLE>
<LINK rel='stylesheet' href='scripts/style.css' type='text/css'>
<SCRIPT Language='Javascript' type='text/javascript' src='scripts/CommonFunctions.js'></SCRIPT>
<SCRIPT type='text/javascript' language = 'JavaScript' src='scripts/DatePicker.js'></SCRIPT>
<SCRIPT Language = "JavaScript" type="text/javascript">
<!--
var sys_date = "<%= Common_distAppServlet.getSystemDate()%>";
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
//	alert(1);
	if(document.getElementById("MODE").value == "INP")
		clearNull();
	if(document.getElementById("UCN_CREATION_DT").value=="")
		document.getElementById("UCN_CREATION_DT").value = sys_date;
	document.getElementById("SUP_DT").value = sys_date;
	FieldValidation(document.getElementById("SUP_DT"));
//
//	if(<%=TR_DAILY_UNSOLDObj.get("ERRDESC")!=""%>)
//		document.getElementById("Submit_button").disabled=false;
}
function FieldValidation(as_field_name)
{
	var l_numeric_flds = "TOTAL_SUP,RETURN_COPY,RATE,RET_TOTAL_AMT,COMM,NET_AMT,RET_COMM";

	if(l_numeric_flds.indexOf(as_field_name.name)!=-1 && as_field_name.value!="")
	{
		if(IsNumeric(as_field_name)==false) return false;
	}
	if(as_field_name.name=="UCN_CREATION_DT")
	{
		if(checkdate(as_field_name)== false)
			return false;

	}
	if(as_field_name.name=="SUP_DT")
	{
			if(checkdate(as_field_name)== false)
				return false;

		if(checkHoliday("SUP_DT","PUB_CODE") == false)
			return false;
		getDay("SUP_DT","SUP_DAY");
		
		getRateDays();
		//getQueryResults("g_pkl_dayRate",document.getElementById("SUP_DAY").value+'@',"A.AGN_CODE@"+document.getElementById("AGN_CODE").value.toUpperCase(),"RATE^COMM");


		getTotalSupply();
	}
	if (as_field_name.name =="AGN_CODEDESC" && document.getElementById("AGN_CODEDESC").value!="")
	{
		document.getElementById("PRIMARY_KEY").value = "AGN_CODE";
		document.getElementById("PARAMSTR").value = "";
		document.getElementById("MODE").value="VIEW";
		document.forms[0].submit();
	}
//	if((as_field_name.name=="PUB_CODE")||(as_field_name.name=="EDT_CODE"))
	if(as_field_name.name=="PUB_CODE")
	{
		getTotalSupply();
	}
	if(as_field_name.name=="PUB_CODE")
	{
		if(checkHoliday("SUP_DT","PUB_CODE") == false)
			return false;
		return true;
	}
	if(as_field_name.name=="RETURN_COPY")
	{
		if(as_field_name.value !="")
		{
			document.getElementById("RET_TOTAL_AMT").value=parseFloat(parseFloat(document.getElementById("RATE").value)*parseInt(document.getElementById("RETURN_COPY").value));
			
			document.getElementById("RET_COMM").value=parseFloat(parseFloat(document.getElementById("RET_TOTAL_AMT").value)*parseFloat((parseInt(document.getElementById("COMM").value)/100)));

			document.getElementById("NET_AMT").value = parseFloat(parseFloat(document.getElementById("RET_TOTAL_AMT").value)-parseFloat(document.getElementById("RET_COMM").value));
		}
		return true;	
	}

}

function getRateDays()
{
	getQueryResults("getRSCdays",document.getElementById("SUP_DT").value+'@','',"FLD1^FLD2^FLD3");
}

function getTotalSupply()
{

//	if((document.getElementById("SUP_DAY").value != "")&&(document.getElementById("PUB_CODE").value != "") && (document.getElementById("EDT_CODE").value != ""))

	if((document.getElementById("SUP_DAY").value != "")&&(document.getElementById("PUB_CODE").value != ""))

	//getQueryResults("g_pkl_totSupply",document.getElementById("SUP_DT").value+'@',"S.AGN_CODE@"+document.getElementById("AGN_CODE").value.toUpperCase()+"^S.PUB_CODE@"+document.getElementById("PUB_CODE").value.toUpperCase()+"^S.EDT_CODE@"+document.getElementById("EDT_CODE").value.toUpperCase(),"TOTAL_SUP^RATE^COMM^WASTAGE^W_TYPE");

	getQueryResults("g_pkl_totSupply",document.getElementById("FLD1").value+'@'+document.getElementById("FLD2").value+'@'+document.getElementById("FLD3").value+'@',"S.AGN_CODE@"+document.getElementById("AGN_CODE").value.toUpperCase()+"^S.PUB_CODE@"+document.getElementById("PUB_CODE").value.toUpperCase(),"TOTAL_SUP^RATE^COMM");
}

function createParamString()
{
		var supply_date = document.getElementById("SUP_DT").value;
		var supply_day = document.getElementById("SUP_DAY").value;
		var pub_code = document.getElementById("PUB_CODE").value;
//		var edt_code = document.getElementById("EDT_CODE").value;
		var rate = document.getElementById("RATE").value;
		var ret_reason = document.getElementById("RETURN_REASON").value;
		var tot_sup = document.getElementById("TOTAL_SUP").value;
		var ret_copy = document.getElementById("RETURN_COPY").value;
		var ret_tot_amt = document.getElementById("RET_TOTAL_AMT").value;
		var comm = document.getElementById("COMM").value;
		var ret_comm = document.getElementById("RET_COMM").value;
		var net_amt = document.getElementById("NET_AMT").value;
		if(l_param_str!="")
			l_param_str = l_param_str + "#" + supply_date + "@" + supply_day + "@" + pub_code + "@" +rate+"@"+ret_reason+"@"+tot_sup+"@"+ret_copy+"@"+ret_tot_amt+"@"+comm+"@"+ret_comm+"@"+net_amt;
		else
			l_param_str = supply_date + "@" + supply_day + "@" + pub_code + "@" +rate+"@"+ret_reason+"@"+tot_sup+"@"+ret_copy+"@"+ret_tot_amt+"@"+comm+"@"+ret_comm+"@"+net_amt;

	return l_param_str;

}

function validateForm(as_event_label)
{
	document.getElementById("PARAMSTR").value = createParamString();
	document.forms[0].submit();
	//return true;

	return true;
}

function preSubmit()
{
	document.getElementById("Submit_button").disabled=true;
	validateSubmit();
}


</script>

<SCRIPT type="text/javascript" language = "JavaScript">
</script>

</HEAD>
<BODY class="mainbody" onLoad="execute_onLoad()" >

<DIV id="TR_DAILY_UNSOLD_div" >

<FORM name="TR_DAILY_UNSOLD" id="TR_DAILY_UNSOLD" method="post" action="distAppCommonActionServlet.do">
<INPUT type="hidden" id="Event" name="Event" value="">
<INPUT type="hidden" id="MAKER" name="MAKER" value="<%= (String)TR_DAILY_UNSOLDObj.get("MAKER") %>">
<INPUT type="hidden" id="MAKER_DT" name="MAKER_DT" value="">
<INPUT type="hidden" id="STATUS" name="STATUS" value="<%= (String)TR_DAILY_UNSOLDObj.get("STATUS") %>">
<INPUT type="hidden" id="MODE" name="MODE" value="INP">
<INPUT type="hidden" id="ENTITY" name="ENTITY" value="TR_DAILY_UNSOLD">
<INPUT type="hidden" id="PARAM" name="PARAM" value="<%= (String)TR_DAILY_UNSOLDObj.get("PARAM") %>">
<INPUT type="hidden" id="PARAM1" name="PARAM1" value="<%= (String)TR_DAILY_UNSOLDObj.get("PARAM1") %>">
<INPUT type="hidden" id="PARAM2" name="PARAM2" value="<%= (String)TR_DAILY_UNSOLDObj.get("PARAM2") %>">
<INPUT type="hidden" id="PRIMARY_KEY" name="PRIMARY_KEY" value="AGN_CODE">
<INPUT type="hidden" id="WASTAGE" name="WASTAGE" value="">
<INPUT type="hidden" id="W_TYPE" name="W_TYPE" value="">
<INPUT type="hidden" id="SCREEN_NAME" name="SCREEN_NAME" value="TR_DAILY_UNSOLD">
<INPUT type="hidden" id="ERRDESC" name="ERRDESC" value="<%= (String)TR_DAILY_UNSOLDObj.get("ERRDESC") %>">
<INPUT type="hidden" id="PARAMSTR" name="PARAMSTR" value="<%=(String)TR_DAILY_UNSOLDObj.get("PARAMSTR") %>">
<INPUT type="hidden" id="FLD1" name="FLD1" value="">
<INPUT type="hidden" id="FLD2" name="FLD2" value="">
<INPUT type="hidden" id="FLD3" name="FLD3" value="">

  <TABLE class="headertable" cellspacing="0" cellpadding="0" width='100%'>
         <TD>&nbsp;</TD>
        <TR> 
           <TD class="heading" nowrap align="center">
            <%= field_labels.getString("TR_DAILY_UNSOLD.TR_DAILY_UNSOLD") %>
           </TD>
           <TD>&nbsp;</TD>
        </TR>
   </TABLE>
 
 <TABLE class="detailstable" cellspacing="0" cellpadding="0">


	<TR class="ste">
	<TD class="ste" nowrap>   
			<LABEL ID="AGN_CODE_label" class="userlabel"><%= field_labels.getString("TR_DAILY_UNSOLD.AGN_CODE") %><SPAN class="instreditalic">*</SPAN></LABEL>
		</TD>
		<TD class="ste" colspan="11" nowrap>
			<INPUT type="text" id="AGN_CODE" name="AGN_CODE" class="input" size="10" onChange="FieldValidation(this);getCodeDesc('AGN_CODE','AGN_CODEDESC', 'g_pkl_agencyDesc','');" maxLength="10"  value="<%= (String)TR_DAILY_UNSOLDObj.get("AGN_CODE") %>" >
           	  <INPUT type="text" id="AGN_CODEDESC" name="AGN_CODEDESC" class="input" onBlur="FieldValidation(this);" size="50" maxLength="50" value="<%= 
	(String)TR_DAILY_UNSOLDObj.get("AGN_CODEDESC") %>" >
		<A id="AGN_CODEHLP" name="AGN_CODEHLP"  href="#" onClick="getPicklistValues('g_pkl_agency','AGN_CODE','','')" class="linkblue" >?</A> &nbsp;
		</TD>
	</TR>
	<!--<TR class="str">
		<TD class="str" nowrap>   
			<LABEL ID="CMP_CODE_label" class="userlabel"><%= field_labels.getString("TR_DAILY_UNSOLD.CMP_CODE") %></LABEL>
		</TD>
		<TD class="str" colspan="11" nowrap>
			<INPUT type="text"  id="CMP_CODE" name="CMP_CODE" class="input" size="10" readonly maxlength="10" onChange="FieldValidation(this); getCodeDesc('CMP_CODE','CMP_CODEDESC', 'g_pkl_companyDesc','');"  value="<%= (String)TR_DAILY_UNSOLDObj.get("CMP_CODE")%>">
           	  <INPUT type="text" id="CMP_CODEDESC" name="CMP_CODEDESC" class="input" size="50" readonly  maxLength="50" value="<%= 
	(String)TR_DAILY_UNSOLDObj.get("CMP_CODEDESC") %>" >
			</TD>
	</TR>
	<TR class="str">
		<TD class="str" nowrap>   
			<LABEL ID="DROP_POINT_label" class="userlabel"><%= field_labels.getString("TR_DAILY_UNSOLD.DROP_POINT") %></LABEL>
		</TD>
		<TD class="str" colspan="11" nowrap>
			<INPUT type="text"  id="DROP_POINT" name="DROP_POINT" class="input" size="10" readonly maxlength="10" onChange="FieldValidation(this);"  value="<%= (String)TR_DAILY_UNSOLDObj.get("DROP_POINT")%>">
        <INPUT type="text" id="DROP_POINTDESC" name="DROP_POINTDESC" class="input" size="50" readonly  maxLength="50" value="<%= 
	(String)TR_DAILY_UNSOLDObj.get("DROP_POINTDESC") %>" >
			</TD>
	</TR>
    <TR class="ste"> -->
	<TD class="ste" nowrap>   
			<LABEL ID="UCN_CREATION_DT_label" class="userlabel"><%= field_labels.getString("TR_DAILY_UNSOLD.UCN_CREATION_DT") %></LABEL>
		</TD>
		<TD class="ste" colspan="11" nowrap>
			<INPUT type="text" id="UCN_DT" name="UCN_CREATION_DT" class="input" size="10"  onblur="FieldValidation(this);" maxLength="10"  value="<%=(String)TR_DAILY_UNSOLDObj.get("UCN_CREATION_DT") %>" >
		</TD>
	</TR>
	<TR class="str">
	<TD class="str" nowrap>   
			<LABEL ID="UCN_CNNO_label" class="userlabel"><%= field_labels.getString("TR_DAILY_UNSOLD.UCN_CNNO") %></LABEL>
		</TD>
		<TD class="str" colspan="11" nowrap>
			<INPUT type="text" id="UCN_CNNO" name="UCN_CNNO" class="input" size="20" readonly onblur="FieldValidation(this);" maxLength="20"  value="<%=(String)TR_DAILY_UNSOLDObj.get("UCN_CNNO") %>" >
		</TD>
	</TR>
	<TR>&nbsp;</TR>
	<TR>&nbsp;</TR>

	<TR class="ste">
		<TD class="ste" nowrap>   
			<LABEL ID="SUP_DT_label" class="userlabel"><%= field_labels.getString("TR_DAILY_UNSOLD.SUP_DT") %><SPAN class="instreditalic">*</SPAN></LABEL>
		</TD>
		<TD class="str">
			<LABEL ID="SUP_DAY_label" class="userlabel"><%= field_labels.getString("TR_DAILY_UNSOLD.SUP_DAY") %><SPAN class="instreditalic">*</SPAN></LABEL>
		</TD>
		<TD>
			<LABEL ID="PUB_CODE_label" class="userlabel"><%= field_labels.getString("TR_DAILY_UNSOLD.PUB_CODE") %><SPAN class="instreditalic">*</SPAN></LABEL>
		</TD>
<!-- 		<TD>
			<LABEL ID="EDT_CODE_label" class="userlabel"><%= field_labels.getString("TR_DAILY_UNSOLD.EDT_CODE") %><SPAN class="instreditalic">*</SPAN></LABEL>
		</TD> -->
		<TD class="str">
			<LABEL ID="RATE_label" class="userlabel"><%= field_labels.getString("TR_DAILY_UNSOLD.RATE") %><SPAN class="instreditalic">*</SPAN></LABEL>
		</TD>
		<TD>
			<LABEL ID="RETURN_REASON_label" class="userlabel"><%= field_labels.getString("TR_DAILY_UNSOLD.RETURN_REASON") %></LABEL>
		</TD>
		<TD class="str">
			<LABEL ID="TOTAL_SUP_label" class="userlabel"><%= field_labels.getString("TR_DAILY_UNSOLD.TOTAL_SUP") %><SPAN class="instreditalic">*</SPAN></LABEL>
		</TD>
<!--		<TD>
			<LABEL ID="W_FLAG_label" class="userlabel"><%= field_labels.getString("TR_DAILY_UNSOLD.W_FLAG") %></LABEL>
		</TD> -->

		<TD>
			<LABEL ID="RETURN_COPY_label" class="userlabel"><%= field_labels.getString("TR_DAILY_UNSOLD.RETURN_COPY") %><SPAN class="instreditalic">*</SPAN></LABEL>
		</TD>
		<TD class="str">
			<LABEL ID="RET_TOTAL_AMT_label" class="userlabel"><%= field_labels.getString("TR_DAILY_UNSOLD.RET_TOTAL_AMT") %><SPAN class="instreditalic">*</SPAN></LABEL>
		</TD>
<!--		<TD class="str">
			<LABEL ID="RET_W_AMT_label" class="userlabel"><%= field_labels.getString("TR_DAILY_UNSOLD.RET_W_AMT") %><SPAN class="instreditalic">*</SPAN></LABEL>
		</TD> -->

		<TD class="str">
			<LABEL ID="COMM_label" class="userlabel"><%= field_labels.getString("TR_DAILY_UNSOLD.COMM") %></LABEL>
		</TD>
		<TD>
			<LABEL ID="RET_COMM_label" class="userlabel"><%= field_labels.getString("TR_DAILY_UNSOLD.RET_COMM") %><SPAN class="instreditalic">*</SPAN></LABEL>
		</TD>

		<TD>
			<LABEL ID="NET_AMT_label" class="userlabel"><%= field_labels.getString("TR_DAILY_UNSOLD.NET_AMT") %><SPAN class="instreditalic">*</SPAN></LABEL>
		</TD>
		</TR>
<%
if(!l_param_str.equals(""))	
	{

String l_param_vals[] = l_param_str.split("#");
for(int i=0;i<l_param_vals.length;i++)
{
	String l_param_fld_vals[]=l_param_vals[i].split("@");
	%>
	<TR>
		<TD class="ste" nowrap>
			<INPUT type="text" id="SUP_DATE<%=i%>" name="SUP_DATE<%=i%>" class="input" size="10" readonly value="<%= l_param_fld_vals[0].trim() %>" >
		</TD>
		<TD class="str" nowrap>
			<INPUT type="text" id="SUP_DAY<%=i%>" name="SUP_DAY<%=i%>" class="input" size="3" readonly value="<%= l_param_fld_vals[1].trim() %>" >
		<TD class="ste" nowrap>
			<INPUT type="text" id="PUB_CODE<%=i%>" name="PUB_CODE<%=i%>" class="input" size="10" value="<%= l_param_fld_vals[2].trim() %>" >
		</TD>
	<!--	<TD class="ste" nowrap>
			<INPUT type="text" id="EDT_CODE<%=i%>" name="EDT_CODE<%=i%>" class="input" size="15" value="<%= l_param_fld_vals[3].trim() %>" >
		</TD> -->
		<TD class="ste" nowrap>
			<INPUT type="text" id="RATE<%=i%>" name="RATE<%=i%>" class="input" size="6" value="<%= l_param_fld_vals[3] %>" >
		</TD>
		<TD class="ste">
			<INPUT type="text" id="REASON<%=i%>" name="REASON<%=i%>" class="input" size="10" value="<%= l_param_fld_vals[4] %>" >
		</TD>
		<TD class="ste" nowrap>
			<INPUT type="text" id="TOT_SUP<%=i%>" name="TOT_SUP<%=i%>" class="input" size="6" value="<%= l_param_fld_vals[5] %>" >
		</TD>
<!--		<TD class="ste" nowrap>
			<INPUT type="text" id="W_FLAG<%=i%>" name="W_FLAG<%=i%>" class="input" size="6" value="<%= l_param_fld_vals[7] %>" >
		</TD>
-->
		<TD class="ste" nowrap>
			<INPUT type="text" id="RET_COPY<%=i%>" name="RET_COPY<%=i%>" class="input" size="6" value="<%= l_param_fld_vals[6] %>" >
		</TD>

		<TD class="ste" nowrap>
			<INPUT type="text" id="RET_AMT<%=i%>" name="RET_AMT<%=i%>" class="input" size="6" value="<%= l_param_fld_vals[7] %>" >
		</TD>
<!--		<TD class="ste" nowrap>
			<INPUT type="text" id="RET_W_AMT<%=i%>" name="RET_W_AMT<%=i%>" class="input" size="6" value="<%= l_param_fld_vals[10] %>" >
		</TD> -->
		<TD class="ste" nowrap>
			<INPUT type="text" id="COMM<%=i%>" name="COMM<%=i%>" class="input" size="6" value="<%= l_param_fld_vals[8] %>" >
		</TD>
		<TD class="ste" nowrap>
			<INPUT type="text" id="RET_COMM<%=i%>" name="RET_COMM<%=i%>" class="input" size="6" value="<%= l_param_fld_vals[9] %>" >
		</TD>

		<TD class="ste" nowrap>
			<INPUT type="text" id="NET_AMT<%=i%>" name="NET_AMT<%=i%>" class="input" size="10" value="<%= l_param_fld_vals[10] %>" >
		</TD>

	</TR>

<%
		}
	}
%>
	<TR class="ste">
		<TD class="ste" nowrap>   
		<INPUT type="text" id="SUP_DT" name="SUP_DT" class="input" size="10" onblur="FieldValidation(this);" maxLength="10"  value="" >
		<a id="SUP_DTHLP" href="#" onClick="javascript:calendar('SUP_DT',event.screenY,event.screenX,null,null,getDatePickerPattern());"
			title="Select Date"> <img src="images/calendar.gif" width="16"
			height="16" border="0" /></a>
		</TD>
		<TD class="ste" nowrap>
			<INPUT type="text" id="SUP_DAY" name="SUP_DAY" readOnly class="input" size="3" onblur="FieldValidation(this);" maxLength="3"  value="" >
		</TD>
		<TD class="ste" nowrap>
		<select class="input"name='PUB_CODE' id="PUB_CODE" onChange="FieldValidation(this);"  onBlur="FieldValidation(this);">
		<%
			out.println("<option value=''>Select</option>");
			out.println(obj_fetch_pick_vals.createOptionValues("g_pkl_publication","",db_name,insstalled_at));
		%>
	</SELECT>
<!--
 		<INPUT type="text" id="PUB_CODE" name="PUB_CODE" class="input" size="10" maxLength="10"  value=""
			onBlur="FieldValidation(this);">
			<A id="PUB_CODEHLP" name="PUB_CODEEHLP"  href="#" onClick="getPicklistValues('g_pkl_publication','PUB_CODE','CMP_CODE','')" class="linkblue" >?</A> &nbsp;
 		</TD>
		<TD class="ste" nowrap>
		<select class="input"name='EDT_CODE' id="EDT_CODE" onChange="FieldValidation(this);"  onBlur="FieldValidation(this);">
		<%
			out.println("<option value=''>Select</option>");
			out.println(obj_fetch_pick_vals.createOptionValues("g_pkl_edition",""));
		%>
	</SELECT>

 		<INPUT type="text" id="EDT_CODE" name="EDT_CODE" class="input" size="21" maxLength="21"  value=""
			onBlur="FieldValidation(this);">
			<A id="EDT_CODEHLP" name="EDT_CODEEHLP"  href="#" onClick="getPicklistValues('g_pkl_edition','EDT_CODE','PUB_CODE,USER_ID','')" class="linkblue" >?</A> &nbsp; -->
		</TD>
		<TD class="ste" nowrap>
		<INPUT type="text" id="RATE" name="RATE" class="input" readOnly size="6" maxLength="6"  value=""
			onBlur="FieldValidation(this);">
		</TD>
		<TD class="ste">
		<INPUT type="text" id="RETURN_REASON" name="RETURN_REASON" class="input" size="10" maxLength="50"  value=""
			onBlur="FieldValidation(this);">
		</TD>
		<TD class="ste" nowrap>
		<INPUT type="text" id="TOTAL_SUP" name="TOTAL_SUP" readOnly class="input" size="6" maxLength="8"  value=""
			onBlur="FieldValidation(this);">
		</TD>
<!--
		<TD class="ste" nowrap>
		<SELECT id="W_FLAG" name="W_FLAG" class="input" 
			onBlur="FieldValidation(this);">
			<option value="Y">Yes</option>
			<option value="N" selected>No</option>
		</SELECT>
		</TD>
-->
		<TD class="ste" nowrap>
		<INPUT type="text" id="RETURN_COPY" name="RETURN_COPY" class="input" size="6" maxLength="8"  value=""
			onBlur="FieldValidation(this);">
		</TD>
		<TD class="ste" nowrap>
		<INPUT type="text" id="RET_TOTAL_AMT" name="RET_TOTAL_AMT" readOnly class="input" size="10" maxLength="10"  value=""
			onBlur="FieldValidation(this);">
		</TD>
<!--		<TD class="ste" nowrap>
		<INPUT type="text" id="RET_W_AMT" name="RET_W_AMT" readOnly class="input" size="10" maxLength="10"  value=""
			onBlur="FieldValidation(this);">
		</TD>
-->
		<TD class="ste" nowrap>
		<INPUT type="text" id="COMM" name="COMM" class="input" readOnly size="6" maxLength="8"  value=""
			onBlur="FieldValidation(this);">
		</TD>
	<TD class="ste" nowrap>
		<INPUT type="text" id="RET_COMM" name="RET_COMM" readOnly class="input" size="6" maxLength="8"  value=""
			onBlur="FieldValidation(this);">
		</TD>

		<TD class="ste" nowrap>
		<INPUT type="text" id="NET_AMT" name="NET_AMT" readOnly class="input" size="10" maxLength="10"  value=""
			onBlur="FieldValidation(this);">
		</TD>
		</TR>

 <TR class="formrow2" align="left"> 
  <TD class="buffercol" colspan="11">&nbsp; </TD>
   <TD class= "formcol"> 
    <TABLE class="eventstable" cellspacing="0" cellpadding="0">
     <TR class="eventsrow2"> 
      <TD class="eventscol" align="right">

		<INPUT TYPE="button" id='Submit_button' value="Save" name="Submit_label" class="button" onClick="javascript:preSubmit()">
</TABLE>		
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