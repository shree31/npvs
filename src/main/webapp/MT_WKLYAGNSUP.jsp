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
<%@ page import="com.distapp.beans.*" %>

<%	
	Logger logger = Logger.getLogger("MT_WKLYAGNSUP");

	HashMap MT_AGENCYSUPPLYObj = (HashMap)request.getAttribute("RESPONSE");

	String paramstr = "";	
	if(MT_AGENCYSUPPLYObj == null)
  		MT_AGENCYSUPPLYObj = new HashMap();

	String l_agency_code = null;
	String l_CUST_ADDRESS = "";
	String l_new_entry = request.getParameter("NEW_ENTRY")==null?"N":"Y";
	String l_from_popup = "N";
	ArrayList l_outer_array = new ArrayList();
	String l_str_query=null;
	
	if(MT_AGENCYSUPPLYObj.get("AGN_CODE")!=null)
			l_agency_code = (String)MT_AGENCYSUPPLYObj.get("AGN_CODE");
	else
			l_agency_code = request.getParameter("AGN_CODE");

	if(MT_AGENCYSUPPLYObj.get("CUST_ADDRESS")!=null)
			l_CUST_ADDRESS = (String)MT_AGENCYSUPPLYObj.get("CUST_ADDRESS");
	else
			l_CUST_ADDRESS = request.getParameter("CUST_ADDRESS");

	if(l_CUST_ADDRESS.equals("null"))
		l_CUST_ADDRESS = "";

	if(MT_AGENCYSUPPLYObj.get("FROM_POPUP")!=null)
		l_from_popup = (String)MT_AGENCYSUPPLYObj.get("FROM_POPUP");
	else
		l_from_popup = request.getParameter("FROM_POPUP");
	
	String l_CUST_ADDRESS_arr[]=l_CUST_ADDRESS.split(" - ");
	if(l_agency_code!=null && l_new_entry.equals("N"))
	{
		if(!(l_agency_code.equals("null")))
		{
			ArrayList<String> replaceValues = new  ArrayList<String>();
			replaceValues.add("@AGN_CODE#"+l_agency_code);
			replaceValues.add("@DB_NAME#"+db_name);
			replaceValues.add("@LOGIN_USR_VENDOR_ID#"+insstalled_at);
			l_str_query=obj_fetch_pick_vals.finalQuery(GN_searchDetails.getQuery("MT_WKLYAGNSUP"), replaceValues);
			replaceValues = null;
			l_outer_array = obj_fetch_pick_vals.getQueryResults(l_str_query);
			
			ArrayList arr_outer_param = null;
			String inner_param = "";

			for(int i=0;i<l_outer_array.size();i++)
			{
				arr_outer_param = (ArrayList)l_outer_array.get(i);

				for(int j=0;j<arr_outer_param.size();j++)
				{
					inner_param = (String)arr_outer_param.get(j);
					paramstr = paramstr + inner_param +"@";
				}
				paramstr = paramstr + "#";
			}
			if(!paramstr.equals(""))
			paramstr = paramstr.substring(0,paramstr.length()-1);
			//MT_AGENCYSUPPLYObj.put("PARAMSTR",paramstr);
			logger.debug("paramstr : "+paramstr);

			if(l_CUST_ADDRESS==null)
				l_CUST_ADDRESS="";
		}
	}


	String formName = "MT_AGENCYSUPPLY";
	String g_days[]={"All","Mon","Tue","Wed","Thu","Fri","Sat","Sun"};
%>




<TITLE id="MT_AGENCYSUPPLY_title"><%= field_labels.getString("MT_AGENCYSUPPLY.MT_AGENCYSUPPLY_title") %></TITLE>

<LINK rel='stylesheet' href='scripts/style.css' type='text/css'>
<SCRIPT Language='Javascript' type='text/javascript' src='scripts/CommonFunctions.js'></SCRIPT>
<SCRIPT type='text/javascript' language = 'JavaScript' src='scripts/DatePicker.js'></SCRIPT>


<SCRIPT Language = "JavaScript" type="text/javascript">
<!--

var sys_date = "<%= Common_distAppServlet.getSystemDate() %>";

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
// -->
</SCRIPT>
<SCRIPT Language='Javascript' type='text/javascript' src='scripts/CommonFunctions.js'> </SCRIPT>
<SCRIPT type="text/javascript" language = "JavaScript">
function FieldValidation(as_field_name)
{
		//alert(as_field_name.name);
		var l_numeric_flds = "COPY,AVD_COUPON";

	if(l_numeric_flds.indexOf(as_field_name.name)!=-1 && as_field_name.value!="")
	{
		if(IsNumeric(as_field_name)==false) return false;
	}
	//alert(as_field_name);
	if(as_field_name.name=="PUB_DAYS0")
	{
		//alert(document.getElementById("PUB_DAYS0").checked);
		if(document.getElementById("PUB_DAYS0").checked == true)
		{
			document.getElementById("PUB_DAYS1").checked = true;
			document.getElementById("PUB_DAYS2").checked = true;
			document.getElementById("PUB_DAYS3").checked = true;
			document.getElementById("PUB_DAYS4").checked = true;
			document.getElementById("PUB_DAYS5").checked = true;
			document.getElementById("PUB_DAYS6").checked = true;
			document.getElementById("PUB_DAYS7").checked = true;
		}
		else
		{
			document.getElementById("PUB_DAYS1").checked = false;
			document.getElementById("PUB_DAYS2").checked = false;
			document.getElementById("PUB_DAYS3").checked = false;
			document.getElementById("PUB_DAYS4").checked = false;
			document.getElementById("PUB_DAYS5").checked = false;
			document.getElementById("PUB_DAYS6").checked = false;
			document.getElementById("PUB_DAYS7").checked = false;
		}
	}
	if(as_field_name.name=="PYMT_MODE")
	{
		if(as_field_name.value == "COUPON")
		{
			setfldMandatory("COUPON_NO,CPN_ST_DT,CPN_EN_DT,AVD_COUPON");
			setfldreadOnly("COUPON_NO",'text',false);
			setfldreadOnly("CPN_ST_DT",'text',false);
			setfldreadOnly("CPN_EN_DT",'text',false);
			setfldreadOnly("AVD_COUPON",'text',false);
		}
		else
		{
			setfldNonMandatory("COUPON_NO,CPN_ST_DT,CPN_EN_DT,AVD_COUPON");
			setfldreadOnly("COUPON_NO",'text',true);
			setfldreadOnly("CPN_ST_DT",'text',true);
			setfldreadOnly("CPN_EN_DT",'text',true);
			setfldreadOnly("AVD_COUPON",'text',true);
		}
	}
	if(as_field_name.name=="CPN_ST_DT" || as_field_name.name=="CPN_EN_DT")
	{
		checkdate(as_field_name);
		if(intcompareDate(document.getElementById("CPN_EN_DT").value,document.getElementById("CPN_ST_DT").value)<0)
		{
				alert(document.getElementById("CPN_EN_DT_label").innerText +" should be greater than "+document.getElementById("CPN_ST_DT_label").innerText);
				return false;

		}
	}
	return true;
}
function execute_onLoad()
{
	clearNull();
//	document.getElementById("MAKER_DT").value  = sys_date;

//	getQueryResults("SELECT DATE_FORMAT(CURDATE(),'%d/%m/%Y')",'',"","MAKER_DT");
//	document.getElementById("COPY_START_DATE").value = getQyeryResults("SELECT DATE_FORMAT(DATE_ADD(CURDATE(),INTERVAL 1 DAY),'%d/%m/%Y')");
	if((document.getElementById("ERRDESC").value!="")&&(document.getElementById("ERRDESC").value!="null")&& document.getElementById("ERRDESC").value=="SUCCESS"
	&& '<%=l_from_popup%>' == 'Y')
	{

		window.opener.location.reload();
		window.close();
	}
}

function validateSubmit(as_field_name)
{
	//var l_param_str = document.getElementById("PARAMSTR").value;
	var l_pub_val = document.getElementById("PUB_CODE").value;
	var l_pub_name = document.getElementById("PUB_NAME").value;
	var copy_start_date = document.getElementById("COPY_START_DATE").value;
	
	//alert(copy_start_date);

	var pay_mode = document.getElementById("PYMT_MODE").value;

	//alert(pay_mode);
//	var l_edit_val = document.getElementById("EDT_CODE").value;
//	var l_edit_name = document.getElementById("EDT_NAME").value;
	var l_base_val = document.getElementById("COPY").value;

	if(l_pub_val!="" && copy_start_date!="" && l_base_val!="" && pay_mode!="")
	{
		if(document.getElementById("AVD_COUPON").value !="" && document.getElementById("AVD_COUPON").value !="0")
		{
			if(document.getElementById("CPN_ST_DT").value =="")
			{
				alert("Please enter "+document.getElementById("CPN_ST_DT_label").innerText +" and submit.");
				return false;
			}

			if(document.getElementById("CPN_EN_DT").value =="")
			{
				alert("Please enter "+document.getElementById("CPN_EN_DT_label").innerText +" and submit.");
				return false;
			}
			getQueryResultsSync('g_pkl_getBillDate',document.getElementById("CPN_ST_DT").value+'@'+document.getElementById("CPN_EN_DT").value,'','BILL_DATE^FLAG^MNTH_DIFF');
//			document.getElementById("BILL_DATE").value="30/09/2014";
//		if(intcompareDate(document.getElementById("CPN_ST_DT").value,document.getElementById("BILL_DATE").value)<=0)
//	{
//				alert(document.getElementById("CPN_ST_DT_label").innerText +" should be greater than Last Billing date"+document.getElementById("BILL_DATE").value);
//				return false;
//	}


			if(parseInt(document.getElementById("AVD_COUPON").value) > parseInt(document.getElementById("MNTH_DIFF").value))
			{
				alert(document.getElementById("AVD_COUPON_label").innerText +" can not be greater than month differece between "+document.getElementById("CPN_ST_DT_label").innerText+" and "+document.getElementById("CPN_EN_DT_label").innerText);
				return false;
			}
		}

//			return false;
	/*if(l_param_str!="")
		l_param_str = l_param_str + "#" + l_pub_val + "@" + l_pub_name + "@" + l_edit_val + "@" + l_edit_name + "@" +l_base_val;
	else
		l_param_str = l_pub_val + "@" + l_pub_name + "@" + l_edit_val + "@" + l_edit_name + "@" +l_base_val;
*/
//	document.getElementById("PARAMSTR").value = l_param_str;
	document.getElementById("AGN_CODE").value = "<%=l_agency_code%>";
	document.getElementById("CUST_ADDRESS").value = "<%=l_CUST_ADDRESS%>";
	
	//	alert(document.getElementById("PARAMSTR").value);
	//alert(document.getElementById("PARAMSTR").value);
	//alert(document.getElementById("AGN_CODE").value);
	//alert(document.getElementById("CUST_ADDRESS").value);

	var wk_sup_str = "";
	var str_temp= "";
		<%
		for(int k=1;k<g_days.length;k++)
		{
		%>
			str_temp = "PUB_DAYS"+<%=k%>;
//			alert((document.getElementById(str_temp).checked==true?"Y":"N"));
			wk_sup_str = wk_sup_str + (document.getElementById(str_temp).checked==true?"Y":"N");			
//			alert(wk_sup_str);

		<%
		}
		%>

	document.getElementById("WK_SUP").value = wk_sup_str;
//	document.getElementById("MODE").value = "MT_AGN_NEWS_PAPER_MAP";

	document.forms[0].submit();
	}
	else
	{
		alert("Please enter mandatory details and submit.");
	}
	//return true;
}

function displayDet(l_sr_param)
{
		document.location.href="MT_WKLYAGNSUP.jsp?"+l_sr_param;
		//alert(l_sr_param);
		//alert(document.location.href);
		document.forms[0].target="_self";
}

function Modify_form()
{
	document.getElementById("PARAM1").value="MODIFY";
	document.getElementById("MODE").value="MOD";
	validateSubmit();
}

function Delete_form()
{
	document.getElementById("PARAM1").value="DELETE";
	document.getElementById("MODE").value="DEL";
	validateSubmit();
}

</SCRIPT>


<SCRIPT type="text/javascript" language = "JavaScript">
</script>

</HEAD>
<BODY class="mainbody" onLoad="execute_onLoad()" >

<DIV id="MT_AGENCYSUPPLY_div" >

<FORM name="MT_AGENCYSUPPLY" id="MT_AGENCYSUPPLY" method="post" action="distAppCommonActionServlet.do">
<INPUT type="hidden" id="Event" name="Event" value="">
<INPUT type="hidden" id="MAKER" name="MAKER" value="<%= (String)MT_AGENCYSUPPLYObj.get("MAKER") %>">
<INPUT type="hidden" id="MAKER_DT" name="MAKER_DT" value="">
<INPUT type="hidden" id="STATUS" name="STATUS" value="<%= (String)MT_AGENCYSUPPLYObj.get("STATUS") %>">
<INPUT type="hidden" id="MODE" name="MODE" value="INP">
<INPUT type="hidden" id="PARAM1" name="PARAM1" value="<%= (String)MT_AGENCYSUPPLYObj.get("PARAM1") %>">
<INPUT type="hidden" id="ENTITY" name="ENTITY" value="MT_AGN_NEWS_PAPER_MAP">
<INPUT type="hidden" id="SCREEN_NAME" name="SCREEN_NAME" value="MT_WKLYAGNSUP">
<INPUT type="hidden" id="ERRDESC" name="ERRDESC" value="<%= (String)MT_AGENCYSUPPLYObj.get("ERRDESC") %>">
<INPUT type="hidden" id="PRIMARY_KEY" name="PRIMARY_KEY" value="AGN_CODE#PUB_CODE">
<INPUT type="hidden" id="AGN_CODE" name="AGN_CODE" value="<%=l_agency_code%>">
<INPUT type="hidden" id="FROM_POPUP" name="FROM_POPUP" value="<%=l_from_popup%>">
<INPUT type="hidden" id="CUST_ADDRESS" name="CUST_ADDRESS" value="<%=l_CUST_ADDRESS%>">
<INPUT type="hidden" id="PARAMSTR" name="PARAMSTR" value="<%=(String)MT_AGENCYSUPPLYObj.get("PARAMSTR") %>">
<INPUT type="hidden" id="DAY1" name="DAY1" value="">
<INPUT type="hidden" id="DAY2" name="DAY2" value="">
<INPUT type="hidden" id="DAY3" name="DAY3" value="">
<INPUT type="hidden" id="DAY4" name="DAY4" value="">
<INPUT type="hidden" id="DAY5" name="DAY5" value="">
<INPUT type="hidden" id="DAY6" name="DAY6" value="">
<INPUT type="hidden" id="DAY7" name="DAY7" value="">
<INPUT type="hidden" id="DAY8" name="DAY8" value="">
<INPUT type="hidden" id="DAY9" name="DAY9" value="">
<INPUT type="hidden" id="DAY10" name="DAY10" value="">
<INPUT type="hidden" id="DAY11" name="DAY11" value="">
<INPUT type="hidden" id="DAY12" name="DAY12" value="">
<INPUT type="hidden" id="DAY13" name="DAY13" value="">
<INPUT type="hidden" id="DAY14" name="DAY14" value="">
<INPUT type="hidden" id="DAY15" name="DAY15" value="">
<INPUT type="hidden" id="DAY16" name="DAY16" value="">
<INPUT type="hidden" id="DAY17" name="DAY17" value="">
<INPUT type="hidden" id="DAY18" name="DAY18" value="">
<INPUT type="hidden" id="DAY19" name="DAY19" value="">
<INPUT type="hidden" id="DAY20" name="DAY20" value="">
<INPUT type="hidden" id="DAY21" name="DAY21" value="">
<INPUT type="hidden" id="DAY22" name="DAY22" value="">
<INPUT type="hidden" id="DAY23" name="DAY23" value="">
<INPUT type="hidden" id="DAY24" name="DAY24" value="">
<INPUT type="hidden" id="DAY25" name="DAY25" value="">
<INPUT type="hidden" id="DAY26" name="DAY26" value="">
<INPUT type="hidden" id="DAY27" name="DAY27" value="">
<INPUT type="hidden" id="DAY28" name="DAY28" value="">
<INPUT type="hidden" id="DAY29" name="DAY29" value="">
<INPUT type="hidden" id="DAY30" name="DAY30" value="">
<INPUT type="hidden" id="DAY31" name="DAY31" value="">
<INPUT type="hidden" id="WK_SUP" name="WK_SUP" value="">
<INPUT type="hidden" id="PUB_DAYS" name="PUB_DAYS" value="">
<INPUT type="hidden" id="BILL_DATE" name="BILL_DATE" value="">
<INPUT type="hidden" id="FLAG" name="FLAG" value="">
<INPUT type="hidden" id="MNTH_DIFF" name="MNTH_DIFF" value="">
  <TABLE class="headertable" cellspacing="0" cellpadding="0" width='100%'>
         <TD>&nbsp;</TD>
        <TR> 
           <TD class="heading" nowrap align="center">
            <%= field_labels.getString("MT_AGENCYSUPPLY.MT_AGENCYSUPPLY") %>
           </TD>
           <TD>&nbsp;</TD>
        </TR>
   </TABLE>

 <TABLE class="detailstable" cellspacing="0" cellpadding="0">

<TR class="str">
		<TD class="str" nowrap>   
			<LABEL ID="AGN_CODE_label" class="userlabel"><%= field_labels.getString("MT_AGENCYSUPPLY.AGN_CODE") %><SPAN class="instreditalic"> &nbsp;&nbsp;&nbsp;: &nbsp;&nbsp;&nbsp;</SPAN></LABEL>
			<LABEL ID="AGN_CODE_label" class="userlabel"><B><%=l_agency_code%></B></LABEL>

		</TD>
		<TD>
			<LABEL ID="CUST_ADDRESS_label" class="userlabel"><%= field_labels.getString("MT_AGENCYSUPPLY.CUST_ADDRESS") %><SPAN class="instreditalic">&nbsp;&nbsp;&nbsp;: &nbsp;&nbsp;&nbsp;</SPAN></LABEL>
			<LABEL ID="CUST_ADDRESS_label" class="userlabel"><B><%=l_CUST_ADDRESS%></B></LABEL>
		</TD>
		<TD>&nbsp;</TD>
	</TR>
	<TR>&nbsp;</TR>
	<TR>&nbsp;</TR>
	<TR class="str">
		<TD class="str" colspan='2' nowrap>   
			<LABEL ID="PUB_CODE_label" class="userlabel"><%= field_labels.getString("MT_AGENCYSUPPLY.PUB_CODE") %><SPAN class="instreditalic">*</SPAN></LABEL>
		</TD>
		<TD>
			<LABEL ID="COPY_label" class="userlabel"><%= field_labels.getString("MT_AGENCYSUPPLY.COPY") %><SPAN class="instreditalic">*</SPAN></LABEL>
		</TD>
		<TD>
			<LABEL ID="COPY_START_DATE_label" class="userlabel"><%= field_labels.getString("MT_AGENCYSUPPLY.COPY_START_DATE") %><SPAN class="instreditalic">*</SPAN></LABEL>
		</TD>
		<TD>
			<LABEL ID="WEEKDAYS_label" class="userlabel"><%= field_labels.getString("MT_AGENCYSUPPLY.WEEKDAYS") %><SPAN class="instreditalic">*</SPAN></LABEL>
		</TD>
		<TD>
			<LABEL ID="PYMT_MODE_label" class="userlabel"><%= field_labels.getString("MT_AGENCYSUPPLY.PYMT_MODE") %><SPAN class="instreditalic">*</SPAN></LABEL>
		</TD>
		<TD>
			<LABEL ID="COUPON_NO_label" class="userlabel"><%= field_labels.getString("COUPON_NO") %></LABEL>
		</TD>
		<TD>
			<LABEL ID="CPN_ST_DT_label" class="userlabel"><%= field_labels.getString("CPN_ST_DT") %></LABEL>
		</TD>
		<TD>
			<LABEL ID="CPN_EN_DT_label" class="userlabel"><%= field_labels.getString("CPN_EN_DT") %></LABEL>
		</TD>
		<TD>
			<LABEL ID="AVD_COUPON_label" class="userlabel"><%= field_labels.getString("AVD_COUPON") %></LABEL>
		</TD>
<%		if("Y".equals(g_comm_per_flag)){ %>
		<TD>
			<LABEL ID="COMM_PER_label" class="userlabel"><%= field_labels.getString("COMM_PER") %></LABEL>
		</TD>
<%		} %>
<%		if("Y".equals(g_sc_p_flag)){ %>
		<TD>
			<LABEL ID="SERV_CHRG_label" class="userlabel"><%= field_labels.getString("SERV_CHRG") %></LABEL>
		</TD>
<%		} %>
<%
if(!paramstr.equals(""))
{
String l_param_str = paramstr;
String l_param_vals[] = l_param_str.split("#");
for(int i=0;i<l_param_vals.length;i++)
{
	String l_param_fld_vals[]=l_param_vals[i].split("@");
	String l_passs_str = "PUB_CODE="+l_param_fld_vals[0].trim()+"&PUB_NAME="+l_param_fld_vals[1].trim()+ "&NOCOPY="+l_param_fld_vals[2].trim()+"&PAPER_START_DATE="+l_param_fld_vals[3].trim()+"&PYMT_MODE="+l_param_fld_vals[4].trim()+ "&WK_SUP="+l_param_fld_vals[5].trim()+"&NEW_ENTRY=Y&CUST_ADDRESS="+l_param_fld_vals[6].trim()+"&AGN_CODE="+l_agency_code+"&COUPON_NO="+l_param_fld_vals[7].trim()+"&CPN_ST_DT="+l_param_fld_vals[8].trim()+"&CPN_EN_DT="+l_param_fld_vals[9].trim()+"&AVD_COUPON="+l_param_fld_vals[10].trim()+"&COMM_PER="+l_param_fld_vals[11].trim()+"&SERV_CHRG="+l_param_fld_vals[12].trim(); 
	//System.out.println("\n l_passs_str"+l_passs_str);
%>
	<TR>
		<TD class="str" nowrap>
			<A href="#" id="PUB_CODE<%=i%>" class="linkblue" onClick="displayDet('<%=l_passs_str%>')" name="PUB_CODE<%=i%>"><%= l_param_fld_vals[0].trim() %></A>
			</td>
		<TD class="str" nowrap>
			<LABEL id="PUB_NAME<%=i%>" name="PUB_NAME<%=i%>" class="userlabel"><%= l_param_fld_vals[1].trim() %></LABEL>
		</TD>
		<TD class="str" nowrap>
			<LABEL id="COPY<%=i%>" name="COPY<%=i%>" class="userlabel"><%= l_param_fld_vals[2].trim() %></LABEL>
		</TD>
		<TD class="str" nowrap>
			<LABEL id="COPY_START_DATE<%=i%>" name="COPY_START_DATE<%=i%>" class="userlabel"><%= l_param_fld_vals[3].trim() %></LABEL>
		</TD>
		<TD class="str" nowrap>
		<%
		String weekly_supply=l_param_fld_vals[5];
		String flag = "";
		int j=0;
		flag = weekly_supply.indexOf("N")!=-1?"":"checked";
		%>
			<INPUT type="checkbox" id="PUB_DAYS<%=i%><%=j%>" name="PUB_DAYS<%=i%><%=j%>" <%=flag%> class="userlabel" readonly onblur="FieldValidation(this);" value="Y"><%= g_days[j]%>&nbsp;&nbsp;
		<%
		for(j=1;j<g_days.length;j++)
		{
			flag = weekly_supply.charAt((int)j-1%7)=='Y'?"checked":"";

		%>

			<INPUT type="checkbox" id="PUB_DAYS<%=i%><%=j%>" name="PUB_DAYS<%=i%><%=j%>" <%=flag%> class="userlabel" readonly onblur="FieldValidation(this);" value="Y"><%= g_days[j]%>&nbsp;&nbsp;
		<%
		}
		%>
		</TD>
		<TD class="str" nowrap>
			<LABEL id="PYMT_MODE<%=i%>" name="PYMT_MODE<%=i%>" class="userlabel"><%= l_param_fld_vals[4].trim() %></LABEL>
		</TD>
		<TD class="str" nowrap>
				<LABEL id="COUPON_NO<%=i%>" name="COUPON_NO<%=i%>" class="userlabel"><%= l_param_fld_vals[7].trim().equals("null")?"":l_param_fld_vals[7].trim() %></LABEL>
		</TD>
		<TD class="str" nowrap>
			<LABEL id="CPN_ST_DT<%=i%>" name="CPN_ST_DT<%=i%>" class="userlabel"><%= l_param_fld_vals[8].trim().equals("null")?"":l_param_fld_vals[8].trim() %></LABEL>
		</TD>
		<TD class="str" nowrap>
			<LABEL id="CPN_EN_DT<%=i%>" name="CPN_EN_DT<%=i%>" class="userlabel"><%= l_param_fld_vals[9].trim().equals("null")?"":l_param_fld_vals[9].trim() %></LABEL>
		</TD>
		<TD class="str" nowrap>
			<LABEL id="AVD_COUPON<%=i%>" name="AVD_COUPON<%=i%>" class="userlabel"><%= l_param_fld_vals[10].trim().equals("null")?"":l_param_fld_vals[10].trim() %></LABEL>
		</TD>
<%		if("Y".equals(g_comm_per_flag)){ %>
		<TD class="str" nowrap>
			<LABEL id="COMM_PER<%=i%>" name="COMM_PER<%=i%>" class="userlabel"><%= l_param_fld_vals[11].trim().equals("null")?"":l_param_fld_vals[11].trim() %></LABEL>
		</TD>
<%		} %>
<%		if("Y".equals(g_sc_p_flag)){ %>
		<TD class="str" nowrap>
			<LABEL id="SERV_CHRG<%=i%>" name="SERV_CHRG<%=i%>" class="userlabel"><%= l_param_fld_vals[12].trim().equals("null")?"":l_param_fld_vals[12].trim() %></LABEL>
		</TD>
<%		} %>

	</TR>
<%}}else{%>
	<TR>

		<TD class="str" colspan='2' nowrap>
		<INPUT type="text" name='PUB_CODE' id="PUB_CODE" readonly value="<%=request.getParameter("PUB_CODE")%>" onChange="FieldValidation(this);">


		  <INPUT type="text" id="PUB_NAME" name="PUB_NAME" class="input" size="30" readonly  maxLength="50" value="<%=request.getParameter("PUB_NAME")%>" >
<!--			<A id="PUB_CODEHLP" name="PUB_CODEEHLP"  href="#" onClick="getPicklistValues('g_pkl_publication','PUB_CODE','','')" class="linkblue" >?</A> &nbsp; -->

		</TD>
		<TD class="ste" nowrap>
			<INPUT type="text" id="COPY" name="COPY" class="input" size="3" maxLength="3"  value="<%=request.getParameter("NOCOPY")%>"
			onChange="FieldValidation(this);" >
		</TD>
	
		<TD class="str" nowrap>
			<INPUT type="text" id="COPY_START_DATE" name="COPY_START_DATE" readonly onBlur="FieldValidation(this)" class="input" size="10" maxLength="10"  value="<%=request.getParameter("PAPER_START_DATE")%>" >
<!-- 			<a id="COPY_START_DATEHLP" href="#" onClick="javascript:calendar('COPY_START_DATE',event.screenY,event.screenX,null,null,getDatePickerPattern());"
			title="Select Date"> <img src="images/calendar.gif" width="16"
			height="16" border="0" /></a> -->

		</TD>
		<TD class="ste" nowrap>
		<%
		String weekly_supply=request.getParameter("WK_SUP");
		String flag = "";
		int j=0;
		flag = weekly_supply.indexOf("N")!=-1?"":"checked";
//		System.out.println("weekly_supply"+weekly_supply);
		%>
		<INPUT type="checkbox" id="PUB_DAYS<%=j%>" name="PUB_DAYS<%=j%>" class="userlabel" <%=flag%> onClick="FieldValidation(this);" value="<%= g_days[j]%>"><%= g_days[j]%>&nbsp;&nbsp;

		<%
		for(j=1;j<g_days.length;j++)
		{
				flag = weekly_supply.charAt((int)j-1%7)=='Y'?"checked":"";
		%>
			<INPUT type="checkbox" id="PUB_DAYS<%=j%>" name="PUB_DAYS<%=j%>" class="userlabel" <%=flag%> onClick="FieldValidation(this);" value="<%= g_days[j]%>"><%= g_days[j]%>&nbsp;&nbsp;
		<%
		}
		%>
		</TD>
		<TD class="ste" nowrap>
		<select class="input"name='PYMT_MODE' id="PYMT_MODE" onChange="FieldValidation(this);"  onBlur="FieldValidation(this);" value="<%=request.getParameter("PYMT_MODE")%>">
		<%
//			out.println("<option value=''>Select</option>");
//			out.println("<option value='CASH'  selected>CASH</option>");
//			out.println("<option value='COUPON'>COUPON</option>");
			out.println(obj_fetch_pick_vals.createOptionValues("g_pkl_ptype",request.getParameter("PYMT_MODE"),db_name,insstalled_at));
		%>
	</SELECT>
	</TD>
	<TD class="ste" nowrap>
		<INPUT type="text" id="COUPON_NO" name="COUPON_NO" class="input" size="20" maxLength="20"  value="<%=request.getParameter("COUPON_NO")%>"
		onChange="FieldValidation(this);" >
	</TD>
	<TD class="str" nowrap>
		<INPUT type="text" id="CPN_ST_DT" name="CPN_ST_DT" onBlur="FieldValidation(this)" class="input" size="10" maxLength="10"  value="<%=request.getParameter("CPN_ST_DT")%>" >
		<a id="CPN_ST_DTHLP" href="#" onClick="javascript:calendar('CPN_ST_DT',event.screenY,event.screenX,null,null,getDatePickerPattern());"
		title="Select Date"> <img src="images/calendar.gif" width="16"
		height="16" border="0" /></a>
	</TD>
	<TD class="str" nowrap>
		<INPUT type="text" id="CPN_EN_DT" name="CPN_EN_DT" onBlur="FieldValidation(this)" class="input" size="10" maxLength="10"  value="<%=request.getParameter("CPN_EN_DT")%>" >
		<a id="CPN_EN_DTHLP" href="#" onClick="javascript:calendar('CPN_EN_DT',event.screenY,event.screenX,null,null,getDatePickerPattern());"
		title="Select Date"> <img src="images/calendar.gif" width="16"
		height="16" border="0" /></a>
	</TD>
	<TD class="ste" nowrap>
		<INPUT type="text" id="AVD_COUPON" name="AVD_COUPON" class="input" size="2" maxLength="2"  value="<%=request.getParameter("AVD_COUPON")%>"
		onChange="FieldValidation(this);" >
	</TD>

<%		if("Y".equals(g_comm_per_flag)){ %>
	<TD class="ste" nowrap>
			<INPUT type="text" id="COMM_PER" name="COMM_PER" class="input" size="6" maxLength="6"  value="<%=request.getParameter("COMM_PER")%>" >
	</TD>
<% } %>
<%		if("Y".equals(g_sc_p_flag)){ %>
	<TD class="ste" nowrap>
			<INPUT type="text" id="SERV_CHRG" name="SERV_CHRG" class="input" size="6" maxLength="6"  value="<%=request.getParameter("SERV_CHRG")%>" >
	</TD>
<% } %>

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


<!--  		<INPUT TYPE="button" value="Submit" name="Submit_label" class="button" onClick="javascript:validateSubmit()"> -->
		<INPUT TYPE="button" value="Modify" name="Modify_label" class="button" onClick="Modify_form()">
		<INPUT TYPE="button" value="Delete" name="Delete_label" class="button"  onClick="Delete_form()">
		<INPUT TYPE="button" value="Clear" name="Clear_label" class="button"  onClick="Reset_form()">
		<INPUT TYPE="button" value="Print" name="Print_label" class="button"  onClick="javascript:window.print()">
		<INPUT TYPE="button" value="Back" name="Back_label" class="button"  onClick="javascript:history.go(-1)">

      </TD>
     </TR>
    </TABLE>
   </TD>
  </TR>
  <%}%>
</TABLE>
</FORM>
</DIV>

</BODY>
</HTML>
<%}catch(Exception e){System.out.println("Exception e : "+e);e.printStackTrace();}%>