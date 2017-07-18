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
<%! String publication_frequency=""; %>
<%@ page errorPage="errorpage.jsp" %>
<%@ page import="java.util.*" %>
<%@ page import="javax.servlet.http.*" %>
<%@ page import="org.apache.log4j.Logger" %>
<%@ page import="com.distapp.beans.*" %>
<%@ page import="java.util.Date" %>
<%@ page import="java.text.DateFormat" %>
<%@ page import="java.text.SimpleDateFormat"%>
<%@ page import="java.util.Calendar"%>

<%	
	Logger logger = Logger.getLogger("MT_AGENCYSUPPLY");

	HashMap MT_AGENCYSUPPLYObj = (HashMap)request.getAttribute("RESPONSE");

	String paramstr = "";	
	if(MT_AGENCYSUPPLYObj == null)
  		MT_AGENCYSUPPLYObj = new HashMap();

	String l_agency_code = null;
	String l_pub_code = null;
	String l_CUST_ADDRESS = null;
	String l_new_entry = request.getParameter("NEW_ENTRY")==null?"N":"Y";
	ArrayList l_outer_array = new ArrayList();
	String l_str_query=null;
	int dayOfTheMonth =0;
	
	if(MT_AGENCYSUPPLYObj.get("AGN_CODE")!=null)
			l_agency_code = (String)MT_AGENCYSUPPLYObj.get("AGN_CODE");
	else
			l_agency_code = request.getParameter("AGN_CODE");

	if(MT_AGENCYSUPPLYObj.get("PUB_CODE")!=null)
			l_pub_code = (String)MT_AGENCYSUPPLYObj.get("PUB_CODE");
	else
			l_pub_code = request.getParameter("PUB_CODE");


	if(MT_AGENCYSUPPLYObj.get("CUST_ADDRESS")!=null)
			l_CUST_ADDRESS = (String)MT_AGENCYSUPPLYObj.get("CUST_ADDRESS");
	else
			l_CUST_ADDRESS = request.getParameter("CUST_ADDRESS")==null?"":request.getParameter("CUST_ADDRESS");

	if(l_CUST_ADDRESS.equals("null"))
		l_CUST_ADDRESS = "";

	ArrayList arr_outer_param = null;
	String inner_param = "";
	String totalSubscriptionsCount ="0";
	Calendar javaCalendar = null;
	String currentDate = "";
//	String subGranted="";
	String totalSubscriptionsCountfortheDay = "";
	String l_CUST_ADDRESS_ARR[]= l_CUST_ADDRESS.split(" - ");		

	if(g_subsapp_flg.equals("P"))
	{
		javaCalendar = Calendar.getInstance();
		currentDate = javaCalendar.get(Calendar.DATE)+"";
		l_str_query=obj_fetch_pick_vals.finalQuery(obj_fetch_pick_vals.getQuery("MT_AGENCYSUPPLY.1"), db_name,insstalled_at);	
		l_outer_array = obj_fetch_pick_vals.getQueryResults(l_str_query);
	
	for(int i=0;i<l_outer_array.size();i++)
	{
		arr_outer_param = (ArrayList)l_outer_array.get(i);

		for(int j=0;j<arr_outer_param.size();j++)
		{
			totalSubscriptionsCount = (String)arr_outer_param.get(j);
		}
	}

		ArrayList<String> replaceValues = new  ArrayList<String>();
		replaceValues.add("@CUR_DAY#"+currentDate);
		replaceValues.add("@DB_NAME#"+db_name);
		replaceValues.add("@LOGIN_USR_VENDOR_ID#"+insstalled_at);
		l_str_query=obj_fetch_pick_vals.finalQuery(obj_fetch_pick_vals.getQuery("MT_AGENCYSUPPLY.2"), replaceValues);
		replaceValues = null;
		l_outer_array = obj_fetch_pick_vals.getQueryResults(l_str_query);
	
		for(int i=0;i<l_outer_array.size();i++)
		{
			arr_outer_param = (ArrayList)l_outer_array.get(i);

			for(int j=0;j<arr_outer_param.size();j++)
			{
				totalSubscriptionsCountfortheDay = (String)arr_outer_param.get(j);
			}
		}

		if( ! (Integer.parseInt(totalSubscriptionsCount) > Integer.parseInt(totalSubscriptionsCountfortheDay) ))
			totalSubscriptionsCount = totalSubscriptionsCountfortheDay;
		}	

			l_str_query = obj_fetch_pick_vals.getQuery("MT_AGENCYSUPPLY.3");
			
			if(request.getParameter("PUB_CODE")!=null)
			l_str_query = l_str_query + " AND S.PUB_CODE ='"+l_pub_code+"'";

			l_str_query = l_str_query + " order by 1,3";
			ArrayList<String> replaceValues = new  ArrayList<String>();
			replaceValues.add("@AGN_CODE#"+l_agency_code);
			replaceValues.add("@DB_NAME#"+db_name);
			replaceValues.add("@LOGIN_USR_VENDOR_ID#"+insstalled_at);
			l_str_query=obj_fetch_pick_vals.finalQuery(l_str_query, replaceValues);
			replaceValues = null;
			l_outer_array = obj_fetch_pick_vals.getQueryResults(l_str_query);

			inner_param = "";

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

	String formName = "MT_AGENCYSUPPLY";
	String g_days[]={"All","Mon","Tue","Wed","Thu","Fri","Sat","Sun"};
	//System.out.println("totalSubscriptionsCount...."+totalSubscriptionsCount);
	if( (Integer.parseInt(totalSubscriptionsCount) >= Integer.parseInt(LicenseCheckBean.getWarningsAlertNumber(session)) ) && (Integer.parseInt(LicenseCheckBean.getWarningsAlertNumber(session)) < Integer.parseInt(LicenseCheckBean.getSubGranted(session)) ) )  {
%>

<marquee behavior="alternate"><%= field_labels.getString("AGN.SUBSCRIPTION_WARNING") %></marquee>

<% } %>
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
		var l_numeric_flds = "COPY,AVD_COUPON";

	if(l_numeric_flds.indexOf(as_field_name.name)!=-1 && as_field_name.value!="")
	{
		if(IsNumeric(as_field_name)==false) return false;
	}
//alert(as_field_name.name);
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
			document.getElementById("COUPON_NO").value="";
			document.getElementById("CPN_ST_DT").value="";
			document.getElementById("CPN_EN_DT").value="";
			document.getElementById("AVD_COUPON").value="";
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

function populateRunType(as_field_name) {
	if(as_field_name.name=="PUB_CODE")
	{
		<%for(int i=0;i<g_days.length;i++)
		{
		%>
			MT_AGENCYSUPPLY.PUB_DAYS<%=i%>.checked=false;
		<%
		}
		%>
		getQueryResultsSync('g_pkl_getPubDays',as_field_name.value+'@',"","PUB_DAYS");
		
		var selectedDays = document.getElementById("PUB_DAYS").value;
		//selectedDays = PUB_RUN~PUB_DAYS~PUB_DAY1~PUB_DAY2~PUB_DT~PUB_DT_ALL_FLG
/*		for (int i=0; i<selectedDays.split('~').length; i++)
		{
			
		}*/
		var pub_run_type = selectedDays.split('~')[0];

		//populate Fields related to run type Starts
		document.getElementById("PUB_RUN").value = pub_run_type;
		if(pub_run_type ==("D") || pub_run_type ==("d") || pub_run_type == ("W") || pub_run_type == ("w"))
		{
			document.getElementById("PUB_DAYS_D").style.display="";
			document.getElementById("PUB_DAYS_M").style.display="none";
			document.getElementById("PUB_DAYS_F").style.display="none";
			setfldNonMandatory("PUB_DAY1,PUB_DAY2,PUB_DT");
//			document.getElementById("PUB_DAY1").parentElement.parentElement.style.display="none";
//			document.getElementById("PUB_DT").parentElement.parentElement.style.display="none";
			//document.getElementById("PUB_DAYS").style.display="";

		<%
		for(int i=0;i<g_days.length;i++)
		{
		%>
				if(selectedDays.split('~')[1].indexOf('<%=g_days[i].toUpperCase()%>') > -1 )
				MT_AGENCYSUPPLY.PUB_DAYS<%=i%>.checked=true;
		<%
		}
		%>
			
		}
		else
		{
			<%
			for(int i=0;i<g_days.length;i++)
			{
			%>
				MT_AGENCYSUPPLY.PUB_DAYS<%=i%>.checked=false;
			<%
			}
			%>

//			document.getElementById("PUB_DAYS0").parentElement.parentElement.style.display="none";
			if(pub_run_type ==("F") || pub_run_type ==("f"))
			{
				document.getElementById("PUB_DAYS_D").style.display="none";
				document.getElementById("PUB_DAYS_M").style.display="none";
				document.getElementById("PUB_DAYS_F").style.display="";

//				document.getElementById("PUB_DAY1").parentElement.parentElement.style.display="block";
//				document.getElementById("PUB_DT").parentElement.parentElement.style.display="none";
				setfldMandatory("PUB_DAY1,PUB_DAY2");
				document.getElementById("PUB_DAY1").value = selectedDays.split('~')[1];
				document.getElementById("PUB_DAY2").value = selectedDays.split('~')[2];
				setfldNonMandatory("PUB_DT");
			}
			else if(pub_run_type ==("M") || pub_run_type ==("m")|| pub_run_type ==("Y")|| pub_run_type ==("y"))
			{
				document.getElementById("PUB_DAYS_D").style.display="none";
				document.getElementById("PUB_DAYS_F").style.display="none";
				document.getElementById("PUB_DAYS_M").style.display="";
				document.getElementById("PUB_DT").value = selectedDays.split('~')[3];
				if(selectedDays.split('~')[4] == 'Y')
				{
					document.getElementById("PUB_DT_ALL_FLG_Y").checked = true;
				}
				else
				{
					document.getElementById("PUB_DT_ALL_FLG_N").checked = true;
				}
				setfldMandatory("PUB_DT");
				setfldNonMandatory("PUB_DAY1,PUB_DAY2");

			}
		}
	
	
		//Populate Fields related to run type Ends

	}
}

function execute_onLoad()
{
	clearNull();
	if(document.getElementById("ERRDESC").value=="SUCCESS") {
		//alert(1111111111111111);
			//history.go(-1);
		var l_agency_code = "<%=l_agency_code%>";
   	    var l_CUST_ADDRESS = "<%=l_CUST_ADDRESS%>";

		document.location.href="MT_AGENCYSUPPLYRPL.jsp?AGN_CODE="+l_agency_code+"&CUST_ADDRESS="+l_CUST_ADDRESS+"";
		document.forms[0].target="_self";
	}

	//getQueryResultsSync("g_pkl_sysdate_plus1",'',"","COPY_START_DATE");
	if(g_comm_per_flag == "Y")
		getQueryResults("g_pkl_comm_per",'',"AGN_CODE@"+document.getElementById("AGN_CODE").value.toUpperCase(),"COMM_PER");
	//if(g_sc_p_flag == "Y")
	//	getQueryResults("g_pkl_serv_chrg",'',"CTG_CODE@CUST","SERV_CHRG");
//	document.getElementById("COPY_START_DATE").value = getQyeryResults("SELECT DATE_FORMAT(DATE_ADD(CURDATE(),INTERVAL 1 DAY),'%d/%m/%Y')");
/*	setfldreadOnly("COUPON_NO",'text',true);
	setfldreadOnly("CPN_ST_DT",'text',true);
	setfldreadOnly("CPN_EN_DT",'text',true);
	setfldreadOnly("AVD_COUPON",'text',true); */
	FieldValidation(document.getElementById("PYMT_MODE"));
}

function validateSubmit(as_field_name)
{
	//var l_param_str = document.getElementById("PARAMSTR").value;
	var l_pub_val = document.getElementById("PUB_CODE").value;
	var l_pub_name = document.getElementById("PUB_NAME").value;
	var copy_start_date = document.getElementById("COPY_START_DATE").value;
	
	//alert(copy_start_date);

	var pay_mode = document.getElementById("PYMT_MODE").value;

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
//			{
//				alert(document.getElementById("CPN_ST_DT_label").innerText +" should be greater than Last Billing date"+document.getElementById("BILL_DATE").value);
//				return false;
//			}

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
		var wk_sup_str = "NNNNNNN";
	var str_temp= "";
	<%
	if ( ! ( "F".equalsIgnoreCase(publication_frequency) || "M".equalsIgnoreCase(publication_frequency) ) ) { %>
		wk_sup_str="";	
	//alert("<%=publication_frequency%>");
	//alert(2525325);
	//setTimeout(100);
	<%
		for(int k=1;k<g_days.length;k++)
		{
		%>
			str_temp = "PUB_DAYS"+<%=k%>;
			//alert(str_temp);
			//alert((document.getElementById(str_temp).checked==true?"Y":"N"));
			wk_sup_str = wk_sup_str + (document.getElementById(str_temp).checked==true?"Y":"N");			
			//alert(wk_sup_str);

		<%
		}
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
<INPUT type="hidden" id="MODE" name="MODE" value="MOD">
<INPUT type="hidden" id="PARAM1" name="PARAM1" value="<%= (String)MT_AGENCYSUPPLYObj.get("PARAM1") %>">
<INPUT type="hidden" id="ENTITY" name="ENTITY" value="MT_AGN_NEWS_PAPER_MAP">
<INPUT type="hidden" id="SCREEN_NAME" name="SCREEN_NAME" value="MT_AGENCYSUPPLYMODALL">
<INPUT type="hidden" id="ERRDESC" name="ERRDESC" value="<%= (String)MT_AGENCYSUPPLYObj.get("ERRDESC") %>">
<INPUT type="hidden" id="PRIMARY_KEY" name="PRIMARY_KEY" value="AGN_CODE#PUB_CODE">
<INPUT type="hidden" id="AGN_CODE" name="AGN_CODE" value="<%=l_agency_code%>">
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

<TR class="ste">
		<TD class="ste" nowrap>   
			<LABEL ID="AGN_CODE_label" class="userlabel"><%= field_labels.getString("MT_AGENCYSUPPLY.AGN_CODE") %><SPAN class="instreditalic"> &nbsp;&nbsp;&nbsp;: &nbsp;&nbsp;&nbsp;</SPAN></LABEL>
			<LABEL ID="AGN_CODE_label" class="userlabel"><B><%=l_agency_code%></B></LABEL>

		</TD>
		<TD colspan=6>
			<LABEL ID="CUST_ADDRESS_label" class="userlabel"><%= field_labels.getString("MT_AGENCYSUPPLY.CUST_ADDRESS") %><SPAN class="instreditalic">&nbsp;&nbsp;&nbsp;: &nbsp;&nbsp;&nbsp;</SPAN></LABEL>
			<LABEL ID="CUST_ADDRESS_label" class="userlabel"><B><%=l_CUST_ADDRESS%></B></LABEL>
		</TD>
		<TD>&nbsp;</TD>
	</TR>
	<TR>&nbsp;</TR>
	<TR>&nbsp;</TR>
	<TR class="str">
		<TD class="str" nowrap>   
			<LABEL ID="PUB_CODE_label" class="userlabel"><%= field_labels.getString("MT_AGENCYSUPPLY.PUB_CODE") %></LABEL>
		</TD>
			<TD class="str" nowrap>   
			<LABEL ID="PUB_CODE_label" class="userlabel">&nbsp;</LABEL>
		</TD>

		<TD>
			<LABEL ID="COPY_label" class="userlabel"><%= field_labels.getString("MT_AGENCYSUPPLY.COPY") %></LABEL>
		</TD>
		<TD>
			<LABEL ID="COPY_START_DATE_label" class="userlabel"><%= field_labels.getString("MT_AGENCYSUPPLY.COPY_START_DATE") %><SPAN class="instreditalic">*</SPAN></LABEL>
		</TD>
		<TD>
			<LABEL ID="PUB_RUN_label" class="userlabel"><%= field_labels.getString("MT_PUBLICATION.PUB_RUN") %><SPAN class="instreditalic">*</SPAN></LABEL>
		</TD>
		<TD>
			<LABEL ID="PYMT_MODE_label" class="userlabel"><%= field_labels.getString("MT_AGENCYSUPPLY.WEEKDAYS") %><SPAN class="instreditalic">*</SPAN></LABEL>
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
			//System.out.println(MT_AGENCYSUPPLYObj.get("PARAMSTR"));
if(!paramstr.equals(""))
{
String l_param_str = paramstr;
String l_param_vals[] = l_param_str.split("#");
for(int i=0;i<l_param_vals.length;i++)
{
	String l_param_fld_vals[]=l_param_vals[i].split("@");
	//String l_param_str_edt = l_agency_code+"@"+l_param_fld_vals[0].trim();
	//String l_passs_str = "PUB_CODE="+l_param_fld_vals[0].trim()+"&PUB_NAME="+l_param_fld_vals[1].trim()+ "&NOCOPY="+l_param_fld_vals[2].trim()+"&PAPER_START_DATE="+l_param_fld_vals[3].trim()+"&PYMT_MODE="+l_param_fld_vals[4].trim()+ "&WK_SUP="+l_param_fld_vals[5].trim()+"&NEW_ENTRY=Y&CUST_ADDRESS="+l_param_fld_vals[6].trim()+"&AGN_CODE="+l_agency_code+"&COUPON_NO="+l_param_fld_vals[6].trim()+"&CPN_ST_DT="+l_param_fld_vals[7].trim()+"&CPN_EN_DT="+l_param_fld_vals[8].trim()+"&AVD_COUPON="+l_param_fld_vals[9].trim()+"&PUB_RUN="+l_param_fld_vals[10].trim()+"&COMM_PER="+l_param_fld_vals[12].trim()+"&SERV_CHRG="+l_param_fld_vals[13].trim()+"&FROM_POPUP=Y";
%>
	<TR>
		<TD class="str">
		<INPUT type="text" id="PUB_CODE" name="PUB_CODE" size="10" readOnly value="<%= l_param_fld_vals[0].trim() %>" >
		</TD>
		<TD class="str">
		<INPUT type="text" id="PUB_NAME" name="PUB_NAME" readOnly class="input" size="15" maxLength="40" readonly value="<%= l_param_fld_vals[1].trim() %>" >
		</TD>
		<TD class="ste" nowrap>
			<INPUT type="text" id="COPY" name="COPY" class="input" size="3" maxLength="3"  value="<%= l_param_fld_vals[2].trim() %>" >
		</TD>
		<TD class="ste" nowrap>
					<INPUT type="text" id="COPY_START_DATE" readOnly name="COPY_START_DATE" onBlur="FieldValidation(this)" class="input" size="10" maxLength="10"  value="<%= l_param_fld_vals[3].trim() %>" > <!--
			<a id="COPY_START_DATEHLP" href="#" onClick="javascript:calendar('COPY_START_DATE',event.screenY,event.screenX,null,null,getDatePickerPattern());"
			title="Select Date"> <img src="images/calendar.gif" width="16"
			height="16" border="0" /></a> -->

		<TD class="ste" nowrap>
			<INPUT type="text" id="PUB_RUN" name="PUB_RUN" class="input" readOnly size="10" maxLength="10"  value="<%= l_param_fld_vals[10].trim() %>" >
		</TD>
		
		<%
		if ("M".equalsIgnoreCase(l_param_fld_vals[10]))
		{
			publication_frequency = l_param_fld_vals[10];
			%>

		<TD class="str" nowrap>   
			<LABEL ID="PUB_DT_label" class="userlabel"><%= field_labels.getString("MT_PUBLICATION.PUB_DT") %></LABEL>
		
			<INPUT type="text" id="PUB_DT" name="PUB_DT" class="input" size="10" onblur="FieldValidation(this);" maxLength="10"  value="<%=l_param_fld_vals[15]%>" ><a id="PUB_DTHLP" href="#" onClick="javascript:calendar('PUB_DT',event.screenY,event.screenX,null,null,getDatePickerPattern());"
			title="Select Date"> <img src="images/calendar.gif" width="16"
			height="16" border="0" /></a>

	   
			<LABEL ID="PUB_DT_ALL_FLG_label" class="userlabel"><%= field_labels.getString("MT_PUBLICATION.PUB_DT_ALL_FLG") %></LABEL>
	
			<INPUT type="radio" id="PUB_DT_ALL_FLG_Y" name="PUB_DT_ALL_FLG" checked onClick="FieldValidation(this);" value="Y" accessKey="Y" ><%= field_labels.getString("radio_yes") %>

			<INPUT type="radio" id="PUB_DT_ALL_FLG_N" name="PUB_DT_ALL_FLG"  onClick="FieldValidation(this);" value="N" accessKey="N" ><%= field_labels.getString("radio_no") %>
		</TD>
			<%}

		else if ("F".equalsIgnoreCase(l_param_fld_vals[10]))
		{
			publication_frequency = l_param_fld_vals[10];
			%>
		<TD class="ste" nowrap>   
			<LABEL ID="PUB_DAY1_label" class="userlabel"><%= field_labels.getString("MT_PUBLICATION.PUB_DAY1") %></LABEL>
		
			<SELECT  id="PUB_DAY1" name="PUB_DAY1" class="input" onChange="FieldValidation(this);" value="<%=l_param_fld_vals[11]%>">
           <OPTION value="0"><%= field_labels.getString("DefaultOption") %></OPTION>
		   <OPTION value="1" <%=l_param_fld_vals[11].equals("1") ? "selected" : ""%>>1</OPTION>
		   <OPTION value="2" <%=l_param_fld_vals[11].equals("2") ? "selected" : ""%>>2</OPTION>
		   <OPTION value="3" <%=l_param_fld_vals[11].equals("3") ? "selected" : ""%>>3</OPTION>
		   <OPTION value="4" <%=l_param_fld_vals[11].equals("4") ? "selected" : ""%>>4</OPTION>
		   <OPTION value="5" <%=l_param_fld_vals[11].equals("5") ? "selected" : ""%>>5</OPTION>
		   <OPTION value="6" <%=l_param_fld_vals[11].equals("6") ? "selected" : ""%>>6</OPTION>
		   <OPTION value="7" <%=l_param_fld_vals[11].equals("7") ? "selected" : ""%>>7</OPTION>
		   <OPTION value="8" <%=l_param_fld_vals[11].equals("8") ? "selected" : ""%>>8</OPTION>
		   <OPTION value="9" <%=l_param_fld_vals[11].equals("9") ? "selected" : ""%>>9</OPTION>
		   <OPTION value="10" <%=l_param_fld_vals[11].equals("10") ? "selected" : ""%>>10</OPTION>
		   <OPTION value="11" <%=l_param_fld_vals[11].equals("11") ? "selected" : ""%>>11</OPTION>
		   <OPTION value="12" <%=l_param_fld_vals[11].equals("12") ? "selected" : ""%>>12</OPTION>
		   <OPTION value="13" <%=l_param_fld_vals[11].equals("13") ? "selected" : ""%>>13</OPTION>
		   <OPTION value="14" <%=l_param_fld_vals[11].equals("14") ? "selected" : ""%>>14</OPTION>
		   <OPTION value="15" <%=l_param_fld_vals[11].equals("15") ? "selected" : ""%>>15</OPTION>
          </SELECT>
   
			<LABEL ID="PUB_DAY2_label" class="userlabel"><%= field_labels.getString("MT_PUBLICATION.PUB_DAY2") %></LABEL>
		
			<SELECT  id="PUB_DAY2" name="PUB_DAY2" class="input" onChange="FieldValidation(this);" value="<%=l_param_fld_vals[12]%>">
           <OPTION value="0"><%= field_labels.getString("DefaultOption") %></OPTION>
		   <OPTION value="16" <%=l_param_fld_vals[12].equals("16") ? "selected" : ""%>>16</OPTION>
		   <OPTION value="17" <%=l_param_fld_vals[12].equals("17") ? "selected" : ""%>>17</OPTION>
		   <OPTION value="18" <%=l_param_fld_vals[12].equals("18") ? "selected" : ""%>>18</OPTION>
		   <OPTION value="19" <%=l_param_fld_vals[12].equals("19") ? "selected" : ""%>>19</OPTION>
		   <OPTION value="20" <%=l_param_fld_vals[12].equals("20") ? "selected" : ""%>>20</OPTION>
		   <OPTION value="21" <%=l_param_fld_vals[12].equals("21") ? "selected" : ""%>>21</OPTION>
		   <OPTION value="22" <%=l_param_fld_vals[12].equals("22") ? "selected" : ""%>>22</OPTION>
		   <OPTION value="23" <%=l_param_fld_vals[12].equals("23") ? "selected" : ""%>>23</OPTION>
		   <OPTION value="24" <%=l_param_fld_vals[12].equals("24") ? "selected" : ""%>>24</OPTION>
		   <OPTION value="25" <%=l_param_fld_vals[12].equals("25") ? "selected" : ""%>>25</OPTION>
		   <OPTION value="26" <%=l_param_fld_vals[12].equals("26") ? "selected" : ""%>>26</OPTION>
		   <OPTION value="27" <%=l_param_fld_vals[12].equals("27") ? "selected" : ""%>>27</OPTION>
		   <OPTION value="28" <%=l_param_fld_vals[12].equals("28") ? "selected" : ""%>>28</OPTION>
		   <OPTION value="29" <%=l_param_fld_vals[12].equals("29") ? "selected" : ""%>>29</OPTION>
		   <OPTION value="30" <%=l_param_fld_vals[12].equals("30") ? "selected" : ""%>>30</OPTION>
		   <OPTION value="31" <%=l_param_fld_vals[12].equals("31") ? "selected" : ""%>>31</OPTION>
          </SELECT>

		</TD>
		<%}
		else
		{
		%>

		<TD class="ste" nowrap>
		<%
		String weekly_supply=l_param_fld_vals[5];
		String flag = "";
		int j=0;
		flag = weekly_supply.indexOf("N")!=-1?"":"checked";
		%>
		<INPUT type="checkbox" id="PUB_DAYS<%=j%>" name="PUB_DAYS<%=j%>" <%=flag%> onClick="FieldValidation(this);" value="Y"><%= g_days[j]%>&nbsp;&nbsp;
		<%
		for(j=1;j<g_days.length;j++)
		{
			flag = weekly_supply.charAt((int)j-1%7)=='Y'?"checked":"";
		%>
			<INPUT type="checkbox" id="PUB_DAYS<%=j%>" name="PUB_DAYS<%=j%>" <%=flag%> onClick="FieldValidation(this);" value="Y"><%= g_days[j]%>&nbsp;&nbsp;
		<%
		}
			}
		%>
		</TD>

			<TD class="ste" nowrap>
		<select class="input"name='PYMT_MODE' id="PYMT_MODE" onBlur="FieldValidation(this);"  value="<%= l_param_fld_vals[4] %>">
		<%
			out.println("<option value=''>Select</option>");
		
		if(l_param_fld_vals[4].equals("CASH"))
		{
			out.println("<option value='CASH' selected>CASH</option>");
			out.println("<option value='COUPON'>COUPON</option>");
		}
		if(l_param_fld_vals[4].equals("COUPON")) {
			out.println("<option value='CASH'>CASH</option>");
			out.println("<option value='COUPON' selected>COUPON</option>");
		}
		%>
	</SELECT>
</TD>
		<TD class="ste" nowrap>
			<INPUT type="text" id="COUPON_NO" name="COUPON_NO" class="input" size="20" maxLength="20"  value="<%= l_param_fld_vals[6] %>" >
		</TD>
		<TD class="ste" nowrap>
			<INPUT type="text" id="CPN_ST_DT" name="CPN_ST_DT" class="input" size="10" maxLength="10"  value="<%= l_param_fld_vals[7].trim() %>" ><a id="CPN_ST_DTHLP" href="#" onClick="javascript:calendar('CPN_ST_DT',event.screenY,event.screenX,null,null,getDatePickerPattern());"
			title="Select Date"> <img src="images/calendar.gif" width="16"
			height="16" border="0" /></a>
		</TD>
		<TD class="ste" nowrap>
			<INPUT type="text" id="CPN_EN_DT" name="CPN_EN_DT" class="input" size="10" maxLength="10"  value="<%= l_param_fld_vals[8].trim() %>" ><a id="CPN_EN_DTHLP" href="#" onClick="javascript:calendar('CPN_EN_DT',event.screenY,event.screenX,null,null,getDatePickerPattern());"
			title="Select Date"> <img src="images/calendar.gif" width="16"
			height="16" border="0" /></a>
		</TD>
		<TD class="ste" nowrap>
			<INPUT type="text" id="AVD_COUPON" name="AVD_COUPON" class="input" size="10" maxLength="2"  value="<%= l_param_fld_vals[9].trim() %>" >
		</TD>
<%		if("Y".equals(g_comm_per_flag)){ %>
		<TD class="ste" nowrap>
			<INPUT type="text" id="COMM_PER" name="COMM_PER" class="input" size="6" maxLength="6"  value="<%= l_param_fld_vals[13].trim() %>" >
		</TD>
<%		} %>
<%		if("Y".equals(g_sc_p_flag)){ %>
		<TD class="ste" nowrap>
			<INPUT type="text" id="SERV_CHRG" name="SERV_CHRG" class="input" size="6" maxLength="6"  value="<%= l_param_fld_vals[14].trim() %>" >
		</TD>
<%		} %>

	</TR>
<%}}%>
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
<%
	//System.out.println("Maximum Sub Granted..."+LicenseCheckBean.getSubGranted());
	if(Integer.parseInt(LicenseCheckBean.getSubGranted(session)) > Integer.parseInt(totalSubscriptionsCount)) {
%>
		<INPUT TYPE="button" value="Modify" name="Modify_label" class="button" onClick="Modify_form()">
<% } else { 
		out.println(field_labels.getString("AGN.SUBSCRIPTION_ERROR")); 
 } %>

		<INPUT TYPE="button" value="Delete" name="Delete_label" class="button"  onClick="Delete_form()">
		<INPUT TYPE="button" value="Clear" name="Clear_label" class="button"  onClick="Reset_form()">
		<INPUT TYPE="button" value="Print" name="Print_label" class="button"  onClick="javascript:window.print()">
		<INPUT TYPE="button" value="Back" name="Back_label" class="button"  onClick="javascript:history.go(-1)">

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