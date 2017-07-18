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
	Logger logger = Logger.getLogger("MT_MULTI_CUSTPYMT");
	
	String l_dist_code = request.getParameter("DIST_CD");
	String l_sup_dt = request.getParameter("SUP_DT");
	ArrayList l_outer_array = new ArrayList();
	String l_str_query=null;

	if(l_dist_code!=null)
	{
		if(!(l_dist_code.equals("null")))
		{
			String l_sup_dt_arr[]=l_sup_dt.split("/");
			int firstDay = Integer.parseInt(l_sup_dt_arr[0]);

			ArrayList<String> replaceValues = new  ArrayList<String>();
			replaceValues.add("@FIRST_DAY#"+firstDay);
			replaceValues.add("@SUP_DT#"+l_sup_dt);
			replaceValues.add("@DIST_CODE#"+l_dist_code);
			replaceValues.add("@DB_NAME#"+db_name);
			replaceValues.add("@LOGIN_USR_VENDOR_ID#"+insstalled_at);
			l_str_query=obj_fetch_pick_vals.finalQuery(obj_fetch_pick_vals.getQuery("MT_DISTENTRY"), replaceValues);
			replaceValues = null;
			l_outer_array = obj_fetch_pick_vals.getQueryResults(l_str_query);
		}
	}
%>

<%	
	

	HashMap MT_DISTENTRYObj = (HashMap)request.getAttribute("RESPONSE");
	logger.debug("Distributer Billing Query.... "+l_str_query);

	if(MT_DISTENTRYObj == null)
  		MT_DISTENTRYObj = new HashMap();

	String formName = "MT_CUSTPAYMENT";

%>

<TITLE id="MT_CUSTPAYMENT_title"><%= field_labels.getString("MT_DISTENTRY.MT_CUSTPAYMENT_title") %></TITLE>

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
<SCRIPT type='text/javascript' language = 'JavaScript' src='scripts/DatePicker.js'></SCRIPT>
<SCRIPT type="text/javascript" language = "JavaScript">
	var g_submit_flg = 0;
function FieldValidation(as_field_name)
{
	return true;
}

function printChitti() {
	var l_dist_cd = "<%=l_dist_code%>";
	var l_supdt = "<%=l_sup_dt%>";
	if(l_dist_cd==null || l_dist_cd=="null" || l_dist_cd =="")
	{
		<%
			String l_dist_code_hmp =(String) MT_DISTENTRYObj.get("DIST_CD");
			String l_sup_dt_hmp =(String) MT_DISTENTRYObj.get("SUP_DT");
		%>
	l_dist_cd = "<%=l_dist_code_hmp%>";
	l_supdt = "<%=l_sup_dt_hmp%>";
	}
	document.location.href="RPT_DISTENTRY.jsp?DIST_CD="+l_dist_cd+"&SUP_DT_FROM="+l_supdt+"&SUP_DT_TO="+l_supdt+"&SINGLE=Y";
	document.forms[0].target="_self";
}

function calcTotalCopies(record_no) {
	var line_copy = document.getElementById('LINE_COPY'+record_no).value;
	var stall_copy = document.getElementById('STALL_COPY'+record_no).value;
	document.getElementById('TOTAL'+record_no).value = parseInt(line_copy)+parseInt(stall_copy);
	var total = document.getElementById('TOTAL'+record_no).value;
	var pur_rt = document.getElementById('PUR_RT'+record_no).value;
	var total_amt = parseInt(total)*parseFloat(pur_rt);
	document.getElementById('TOT_AMT'+record_no).value=total_amt;
	var total_amt = document.getElementById('TOT_AMT'+record_no).value;
	var return_copy = document.getElementById('RET_COPY'+record_no).value;
	var return_rate = document.getElementById('RET_RATE'+record_no).value;
	document.getElementById('TOT_RET_AMT'+record_no).value=parseInt(return_copy)*parseFloat(return_rate);
	var total_ret_amt = document.getElementById('TOT_RET_AMT'+record_no).value;
	var pay_amt = parseFloat(total_amt)-parseFloat(total_ret_amt);
	document.getElementById('PAY_AMT'+record_no).value=pay_amt;
	calcTotal();
}

function calcTotal() {
	var line_copy ="0";
	var stall_copy="0";
	var total="0";
	var pur_rt = "0.0";
	var total_amt = "0";
	var return_copy ="0";
	var total_ret_amt = "0.0";
	var pay_amt = "0.0";
	var tot_free_copy="0.0";
	var count = document.getElementById('count').value;
	for (var i =0; i < parseInt(count); i++) {
		 line_copy = parseInt(line_copy)+parseInt(document.getElementById('LINE_COPY'+i).value);
		 stall_copy = parseInt(stall_copy)+parseInt(document.getElementById('STALL_COPY'+i).value);
		 tot_free_copy = parseInt(stall_copy)+parseInt(document.getElementById('FREE_COPY'+i).value);
		 total = parseFloat(total)+parseFloat(document.getElementById('TOTAL'+i).value);
		 pur_rt = parseFloat(pur_rt)+ parseFloat(document.getElementById('PUR_RT'+i).value);
		 total_amt = parseFloat(total_amt)+ parseFloat(document.getElementById('TOT_AMT'+i).value);
		 return_copy = parseInt(return_copy)+ parseInt(document.getElementById('RET_COPY'+i).value);
		 total_ret_amt = parseFloat(total_ret_amt)+parseFloat(document.getElementById('TOT_RET_AMT'+i).value);
		 pay_amt = parseFloat(pay_amt)+parseFloat(document.getElementById('PAY_AMT'+i).value);
	}
	document.getElementById('TOT_LINE_COPY').value=line_copy;
	document.getElementById('TOT_STALL_COPY').value=stall_copy;
	document.getElementById('TOT_FREE_COPY').value=tot_free_copy;
	document.getElementById('TOTAL_COPIES').value=total;
	document.getElementById('TOT_PUR_RT').value=pur_rt;
	document.getElementById('TOTAL_AMT').value=total_amt;
	document.getElementById('TOT_RET_COPY').value=return_copy;
	document.getElementById('TOTAL_RET_AMT').value=total_ret_amt;
	document.getElementById('TOT_PAY_AMT').value=pay_amt;
}

function execute_onLoad()
{
	clearNull();
	getQueryResults("g_pkl_sysdate_plus1",'@',"","SUP_DT");
	if(document.getElementById("ERRDESC").value == "SUCCESS")
	{
		if(true == confirm('Do You Want to Print?'))
		{
			printChitti();
		}
	}
	if(document.getElementById("DIST_CD") != null)
		document.getElementById("DIST_CD").value = "";
<%

if(l_outer_array.size()<=0 && l_dist_code != "null" && l_dist_code != null)	
	{

%>
	alert("No Records Found....!!!");

document.getElementById("DIST_CD").value = "";
	<%
		l_dist_code = "null";
	}
	%>
}

function validateSubmit()
{
		if("<%=l_dist_code%>"=="null")
		{
			if(chkMandatory()==true)
			{
				var l_dist_code = document.getElementById("DIST_CD").value==""?"null":document.getElementById("DIST_CD").value.toUpperCase();
				var l_sup_dt = document.getElementById("SUP_DT").value==""?"null":document.getElementById("SUP_DT").value;
		
				document.location.href="MT_DISTENTRY.jsp?DIST_CD="+l_dist_code+"&SUP_DT="+l_sup_dt;
				document.forms[0].target="_self";
			}
		}
		else
		{
			var l_paramstr="";
			var l_dist_code = '<%=l_dist_code%>';
			var l_sup_dt = '<%=l_sup_dt%>';
			var count = document.getElementById('count').value;
			for (var i =0; i < parseInt(count); i++) {
					var pub_code = document.getElementById('PUB_CODE'+i).value;
					var line_copy = document.getElementById('LINE_COPY'+i).value;
					var stall_copy = document.getElementById('STALL_COPY'+i).value;
					var total = document.getElementById('TOTAL'+i).value;
					var pur_rt = document.getElementById('PUR_RT'+i).value;
					var total_amt = document.getElementById('TOT_AMT'+i).value;
					var return_copy = document.getElementById('RET_COPY'+i).value;
					var total_ret_amt = document.getElementById('TOT_RET_AMT'+i).value;
					var pay_amt = document.getElementById('PAY_AMT'+i).value;
					var mode = document.getElementById('MODE'+i).value;
					var free_copy = document.getElementById('FREE_COPY'+i).value;
					var ret_rate = document.getElementById('RET_RATE'+i).value;
					l_paramstr = l_paramstr+l_dist_code +","+ l_sup_dt + "," + pub_code + "," + line_copy+ "," + stall_copy+ "," + total+ "," + pur_rt+ "," + total_amt+ "," + return_copy+ "," + total_ret_amt+ "," +pay_amt+","+mode+","+free_copy+","+ret_rate+"#";
			}
			document.getElementById("PARAM2").value=l_paramstr;
			document.forms[0].submit();
		}
}

</SCRIPT>

<SCRIPT type="text/javascript" language = "JavaScript">
</script>

</HEAD>
<BODY class="mainbody" onLoad="execute_onLoad()" >

<DIV id="MT_CUSTPAYMENT_div" >

<FORM name="MT_CUSTPAYMENT" id="MT_CUSTPAYMENT" method="post" action="distAppCommonActionServlet.do">
<INPUT type="hidden" id="Event" name="Event" value="">
<INPUT type="hidden" id="MAKER" name="MAKER" value="<%= (String)MT_DISTENTRYObj.get("MAKER") %>">
<INPUT type="hidden" id="MAKER_DT" name="MAKER_DT" value="">
<INPUT type="hidden" id="STATUS" name="STATUS" value="<%= (String)MT_DISTENTRYObj.get("STATUS") %>">
<INPUT type="hidden" id="MODE" name="MODE" value="MT_DISTENTRY">
<INPUT type="hidden" id="PARAM1" name="PARAM1" value="<%= (String)MT_DISTENTRYObj.get("PARAM1") %>">
<INPUT type="hidden" id="PARAM2" name="PARAM2" value="<%= (String)MT_DISTENTRYObj.get("PARAM2") %>">
<INPUT type="hidden" id="ENTITY" name="ENTITY" value="MT_DISTENTRY">
<INPUT type="hidden" id="SCREEN_NAME" name="SCREEN_NAME" value="MT_DIST_ENTRY">
<INPUT type="hidden" id="ERRDESC" name="ERRDESC" value="<%= (String)MT_DISTENTRYObj.get("ERRDESC") %>">
<INPUT type="hidden" id="PRIMARY_KEY" name="PRIMARY_KEY" value="DIST_CD#PUB_CODE#SUP_DT,DATE">
<INPUT type="hidden" id="PARAMSTR" name="PARAMSTR" value="<%=(String)MT_DISTENTRYObj.get("PARAMSTR") %>">

  <TABLE class="headertable" cellspacing="0" cellpadding="0" width='100%'>
         <TD>&nbsp;</TD>
        <TR> 
           <TD class="heading" nowrap align="center">
            <%= field_labels.getString("MT_DISTENTRY.MT_CUSTPAYMENT") %>
           </TD>
        </TR>
   </TABLE>


<%
if(l_outer_array.size()<=0)	
	{
%>

 <TABLE class="detailstable" cellspacing="0" cellpadding="0">
 	<TR class="ste">
		<TD class="ste" nowrap>   
			<LABEL ID="CMP_CODE_label" class="userlabel"><%= field_labels.getString("MT_COMPANY.CMP_CODE") %><SPAN class="instreditalic">*</SPAN></LABEL>
		</TD>
		<TD class="ste" colspan="2" nowrap>
			<INPUT type="text" id="CMP_CODE" name="CMP_CODE" class="input" size="10" onblur="FieldValidation(this);" maxLength="10"  value="<%= (String)MT_DISTENTRYObj.get("CMP_CODE") %>" >
		</TD>
	</TR>

	<TR class="ste">
		<TD class="ste" nowrap>   
			<LABEL ID="DIST_CD_label" class="userlabel"><%= field_labels.getString("MT_PUBLICATION.DIST_CD") %><SPAN class="instreditalic">*</SPAN></LABEL>
		</TD>
		<TD class="ste" nowrap>
	<SELECT class="input"name='DIST_CD' id="DIST_CD" onChange="FieldValidation(this);getCodeDesc('DIST_CD','DIST_CDDESC', 'g_pkl_DistDesc','');"  onBlur="FieldValidation(this);">
		<%
			out.println("<option value=''>Select</option>");
			out.println(obj_fetch_pick_vals.createOptionValues("g_pkl_Dist","",db_name,insstalled_at));
		%>
	</SELECT>

           	  <INPUT type="text" id="DIST_CDDESC" name="DIST_CDDESC" class="input" size="50" readonly  maxLength="50" value="<%=	(String)MT_DISTENTRYObj.get("DIST_CDDESC")%>">
			</TD>
	</TR>
	<TR class="ste">
		<TD class="ste" nowrap>   
			<LABEL ID="SUP_DT_label" class="userlabel"><%= field_labels.getString("RPT_ORDER.SUP_DT") %><SPAN class="instreditalic">*</SPAN></LABEL>
		</TD>
		<TD class="ste" colspan="7" nowrap>
			<INPUT type="text" id="SUP_DT" name="SUP_DT" class="input" size="10" onblur="FieldValidation(this);" maxLength="10"  value="<%= (String)MT_DISTENTRYObj.get("SUP_DT") %>" ><a href="#" onClick="javascript:calendar('SUP_DT',event.screenY,event.screenX,null,null,getDatePickerPattern());"
			title="Select Date"><img src="images/calendar.gif" width="16"
			height="16" border="0" /></a>
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
		<INPUT TYPE="button" value="Print" name="Print_label" class="button"  onClick="javascript:printChitti()">
		<INPUT TYPE="button" value="Back" name="Back_label" class="button"  onClick="javascript:history.go(-1)">

   </TABLE>

      </TD>
     </TR>
    </TABLE>

   </TD>
  </TR>
</TABLE>
<%}%>


<%
if(l_outer_array.size()>0)	
	{
	%>
	 <TABLE  class="detailstable" cellspacing="1" cellpadding="1">


<TR class="str">
		<TD class="str" nowrap colspan="4">   
			<LABEL ID="DIST_CD_label" class="userlabel"><%= field_labels.getString("MT_DISTENTRY.DIST_CD") %><SPAN class="instreditalic"> &nbsp;&nbsp;&nbsp;: &nbsp;&nbsp;&nbsp;</SPAN></LABEL>
			<LABEL ID="DIST_CD_label" class="userlabel"><B><%=l_dist_code%></B></LABEL>

		</TD>
		<TD class="str" nowrap colspan="4">   
			<LABEL ID="SUP_DT_label" class="userlabel"><%= field_labels.getString("MT_DISTENTRY.SUP_DT") %><SPAN class="instreditalic"> &nbsp;&nbsp;&nbsp;: &nbsp;&nbsp;&nbsp;</SPAN></LABEL>
			<LABEL ID="SUP_DT_label" class="userlabel"><B><%=l_sup_dt%></B></LABEL>
		</TD>

	</TR>

<TR>&nbsp;</TR> 
	<TR class="str">

		<TR>
		<TD class="str" wrap>   
			<LABEL ID="SR_NO_label" class="userlabel"><%= field_labels.getString("MT_DISTENTRY.RECORD_NO") %></LABEL>
		</TD>
		<TD class="str" wrap>   
			<LABEL ID="PUB_NAME_label" class="userlabel"><%= field_labels.getString("MT_DISTENTRY.PUB_NAME") %></LABEL>
		</TD>
		<TD class="ste" wrap>   
			<LABEL ID="LINE_COPY_label" class="userlabel"><%= field_labels.getString("MT_DISTENTRY.LINE_COPY") %></LABEL>
		</TD>
		<TD class="ste" wrap>   
			<LABEL ID="STALL_COPY_label" class="userlabel"><%= field_labels.getString("MT_DISTENTRY.STALL_COPY") %></LABEL>
		</TD>
		<TD class="str" wrap>   
			<LABEL ID="TOTAL_label" class="userlabel"><%= field_labels.getString("MT_DISTENTRY.TOTAL") %></LABEL>
		</TD>
		<TD class="ste" wrap>   
			<LABEL ID="FREE_COPY_label" class="userlabel"><%= field_labels.getString("MT_DISTENTRY.FREE_COPY") %></LABEL>
		</TD>
		<TD class="ste" wrap>   
			<LABEL ID="PUR_RT_label" class="userlabel"><%= field_labels.getString("MT_DISTENTRY.PUR_RT") %></LABEL>
		</TD>
		<TD class="str" wrap>   
			<LABEL ID="TOT_AMT_label" class="userlabel"><%= field_labels.getString("MT_DISTENTRY.TOT_AMT") %></LABEL>
		</TD>
		<TD class="ste" wrap>   
			<LABEL ID="RET_RATE_label" class="userlabel"><%= field_labels.getString("MT_DISTENTRY.RET_RATE") %></LABEL>
		</TD>
		<TD class="ste" wrap>   
			<LABEL ID="RET_COPY_label" class="userlabel"><%= field_labels.getString("MT_DISTENTRY.RET_COPY") %></LABEL>
		</TD>
		<TD class="str" wrap>   
			<LABEL ID="TOT_RET_AMT_label" class="userlabel"><%= field_labels.getString("MT_DISTENTRY.TOT_RET_AMT") %></LABEL>
		</TD>
		<TD class="str" wrap>   
			<LABEL ID="PAY_AMT_label" class="userlabel"><%= field_labels.getString("MT_DISTENTRY.PAY_AMT") %></LABEL>
		</TD>
<%
	int i=0;
	String class_css = "ste";
	String readonly_css = "";
	String tot_line_copy="0";
	String tot_stall_copy="0";
	String tot_line_stall_copy="0";
	String tot_pur_rate="0";
	String tot_amt="0";
	String tot_ret_copy="0";
	String tot_ret_amt="0";
	String tot_pay_amt="0";
	String tot_free_copy="0";
	
	for(i=0;i<l_outer_array.size();i++)
	{

	ArrayList l_inner_arr = (ArrayList)l_outer_array.get(i);
	class_css = "ste";
	readonly_css = "";
	tot_line_copy=String.valueOf(Integer.parseInt(tot_line_copy)+Integer.parseInt(l_inner_arr.get(1)==null?"0":l_inner_arr.get(1).toString()));
	tot_stall_copy=String.valueOf(Integer.parseInt(tot_stall_copy)+Integer.parseInt(l_inner_arr.get(2)==null?"0":l_inner_arr.get(2).toString()));
	tot_free_copy=String.valueOf(Integer.parseInt(tot_free_copy)+Integer.parseInt(l_inner_arr.get(11)==null?"0":l_inner_arr.get(11).toString()));
	tot_line_stall_copy=String.valueOf(Integer.parseInt(tot_line_stall_copy)+Integer.parseInt(l_inner_arr.get(3)==null?"0":l_inner_arr.get(3).toString()));
//	tot_pur_rate=String.valueOf(Double.parseDouble(tot_pur_rate)+Double.parseDouble(l_inner_arr.get(4)==null?"0":l_inner_arr.get(4).toString()));
	tot_amt=String.valueOf(Double.parseDouble(tot_amt)+Double.parseDouble(l_inner_arr.get(5)==null?"0":l_inner_arr.get(5).toString()));
	tot_ret_copy=String.valueOf(Integer.parseInt(tot_ret_copy)+Integer.parseInt(l_inner_arr.get(6)==null?"0":l_inner_arr.get(6).toString()));
	tot_ret_amt=String.valueOf(Double.parseDouble(tot_ret_amt)+Double.parseDouble(l_inner_arr.get(7)==null?"0":l_inner_arr.get(7).toString()));
	tot_pay_amt=String.valueOf(Double.parseDouble(tot_pay_amt)+Double.parseDouble(l_inner_arr.get(8)==null?"0":l_inner_arr.get(8).toString()));
%>
	<TR>
		<TD class="ste" nowrap>   
			<LABEL ID="RECORD_NO_label" class="userlabel"><%=(i+1)%></LABEL>
		</TD>
		<TD class="str" >   
			<input type="text" ID="PUB_NAME<%=i%>" name="PUB_NAME<%=i%>" class="userlabel" size=30   value="<%= (String)l_inner_arr.get(0) %>" >
		</TD>

		<TD class="<%=class_css%>" >   
			<input type="text" ID="LINE_COPY<%=i%>" name="LINE_COPY<%=i%>" <%=readonly_css%> size=10 onChange="calcTotalCopies(<%=i%>)"  value="<%= (String)l_inner_arr.get(1) %>" >
		</TD>

		<TD class="<%=class_css%>" >   
			<input type="text" ID="STALL_COPY<%=i%>" name="STALL_COPY<%=i%>" <%=readonly_css%> size=10  onChange="calcTotalCopies(<%=i%>)" value="<%= (String)l_inner_arr.get(2) %>" >
		</TD>

		<TD class="str" >   
			<input type="text" ID="TOTAL<%=i%>" name="TOTAL<%=i%>" class="userlabel" readOnly size=10 value="<%= (String)l_inner_arr.get(3) %>" >
		</TD>

		<TD class="ste" >   
			<input type="text" ID="FREE_COPY<%=i%>" name="FREE_COPY<%=i%>" size=10 value="<%= (String)l_inner_arr.get(11) %>" >
		</TD>

		<TD class="str" >
			<input type="text" ID="PUR_RT<%=i%>" name="PUR_RT<%=i%>" size=10   onChange="calcTotalCopies(<%=i%>)" value="<%= (String)l_inner_arr.get(4) %>" >
		</TD>

		<TD class="str" >
			<input type="text" ID="TOT_AMT<%=i%>" name="TOT_AMT<%=i%>" size=10 class="userlabel" readOnly  value="<%= (String)l_inner_arr.get(5) %>" >
		</TD>
		<TD class="<%=class_css%>" >
			<input type="text" ID="RET_RATE<%=i%>" name="RET_RATE<%=i%>" <%=readonly_css%> onChange="calcTotalCopies(<%=i%>)" size=10 value="<%= (String)l_inner_arr.get(4) %>" >
		</TD>
		<TD class="<%=class_css%>" >   
			<input type="text" ID="RET_COPY<%=i%>" name="RET_COPY<%=i%>" <%=readonly_css%> onChange="calcTotalCopies(<%=i%>)"  size=10 value="<%= (String)l_inner_arr.get(6) %>" >
		</TD>
		<TD class="str" >   
			<input type="text" ID="TOT_RET_AMT<%=i%>" name="TOT_RET_AMT<%=i%>" class="userlabel"  size=10 readOnly value="<%= (String)l_inner_arr.get(7) %>" >
		</TD>
		<TD class="str" >   
			<input type="text" ID="PAY_AMT<%=i%>" name="PAY_AMT<%=i%>" <%=readonly_css%>  size=10 value="<%= (String)l_inner_arr.get(8) %>" >
		</TD>
			<input type="hidden" ID="PUB_CODE<%=i%>" name="PUB_CODE<%=i%>" class="userlabel"  size=10 readOnly value="<%= (String)l_inner_arr.get(9) %>" >
			<input type="hidden" ID="MODE<%=i%>" name="MODE<%=i%>" class="userlabel"  size=10 readOnly value="<%= (String)l_inner_arr.get(10) %>" >

</TR>
<%
	}
	%>
	<TR>
	<TD class="str" colspan='2' nowrap>   
		<LABEL ID="Total_label" class="userlabel"><%= field_labels.getString("MT_DISTENTRY.TOTAL") %></LABEL>
	</TD>
	<TD class="str" >   
		<input type="text" ID="TOT_LINE_COPY" name="TOT_LINE_COPY" readOnly size=10 value="<%= tot_line_copy %>" >
	</TD>

	<TD class="str" >   
		<input type="text" ID="TOT_STALL_COPY" name="TOT_STALL_COPY" readOnly  size=10 value="<%=tot_stall_copy %>" >
	</TD>

	<TD class="str" >   
		<input type="text" ID="TOTAL_COPIES" name="TOTAL_COPIES" class="userlabel" readOnly size=10 value="<%=tot_line_stall_copy%>" >
	</TD>
	<TD class="str" >   
		<input type="text" ID="TOT_FREE_COPY" name="TOT_FREE_COPY" class="userlabel"  readOnly  size=10 value="<%= tot_free_copy %>" >
	</TD>
	<TD class="str" >
		<input type="hidden" ID="TOT_PUR_RT" name="TOT_PUR_RT" size=10 class="userlabel" readOnly  onChange="calcPendAmt()" value="0" >
	</TD>

	<TD class="str" >
		<input type="text" ID="TOTAL_AMT" name="TOTAL_AMT" size=10 class="userlabel" readOnly  onChange="calcPendAmt()"  value="<%=tot_amt%>" >
	</TD>
	<TD class="str" >
		<input type="hidden" ID="TOT_RET_RATE" name="TOT_RET_RATE" size=10 class="userlabel" readOnly  onChange="calcPendAmt()" value="0" >
	</TD>

	<TD class="str" >   
		<input type="text" ID="TOT_RET_COPY" name="TOT_RET_COPY" class="userlabel"  readOnly  size=10 value="<%= tot_ret_copy %>" >
	</TD>
	<TD class="str" >   
		<input type="text" ID="TOTAL_RET_AMT" name="TOTAL_RET_AMT" class="userlabel"  size=10 readOnly value="<%=tot_ret_amt %>" >
	</TD>
	<TD class="str" >   
		<input type="text" ID="TOT_PAY_AMT" name="TOT_PAY_AMT" class="userlabel"  readOnly  size=10 value="<%= tot_pay_amt %>" >
	</TD>

</TR>

		<input type="hidden" ID="count" name="count" value="<%=i%>">	
		</TABLE>
		<%	
}
%>
		
<%
if(l_outer_array.size()>0)	
	{
	%>

 <TR class="formrow2" align="left"> 
  <TD class="buffercol">&nbsp; </TD>
   <TD class= "formcol"> 
    <TABLE class="eventstable" cellspacing="0" cellpadding="0">
     <TR class="eventsrow2"> 
      <TD class="eventscol" align="right">

		<INPUT TYPE="button" value="Submit" name="Submit_label" class="button" onClick="javascript:validateSubmit()">
		<INPUT TYPE="button" value="Clear" name="Clear_label" class="button"  onClick="reset_field()">
		<INPUT TYPE="button" value="Print" name="Print_label" class="button"  onClick="javascript:javascript:printChitti()">
		<INPUT TYPE="button" value="Back" name="Back_label" class="button"  onClick="javascript:history.go(-1)">

   </TABLE>

      </TD>
     </TR>
    </TABLE>
	<%}%>
   </TD>
  </TR>
</TABLE>

</FORM>
</DIV>

</BODY>
</HTML>
<%}catch(Exception e){System.out.println("Exception e : "+e);e.printStackTrace();}%>