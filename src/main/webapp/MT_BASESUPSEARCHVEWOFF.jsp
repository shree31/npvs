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

<%@ page errorPage="errorpage.jsp" %>
<%@ page import="java.util.*" %>
<%@ page import="javax.servlet.http.*" %>
<%@ page import="org.apache.log4j.Logger" %>
<%@ page import="com.distapp.beans.*" %>

<%
	HashMap MT_AGNSUPSEARCHObj = (HashMap)request.getAttribute("RESPONSE");
	if(MT_AGNSUPSEARCHObj == null)
  		MT_AGNSUPSEARCHObj = new HashMap();

	String formName = "MT_BASESUPSEARCH";

%>

<%
	Logger logger = Logger.getLogger("MT_BASESUPSEARCHVEW");
	String l_agency_code = request.getParameter("AGN_CODE");
	String l_cust_address = request.getParameter("CUST_ADDRESS");
	String l_param_str = request.getParameter("PARAMSTR");
	String l_rec_no = "";
	if(l_param_str!=null && !(l_param_str.equals("null")))
	{
		String l_param_str_arr[] = l_param_str.split("@");
		l_agency_code = l_param_str_arr[0];
		l_cust_address = l_param_str_arr[1];
		l_rec_no = l_param_str_arr[2];
	}

	ArrayList l_outer_array = new ArrayList();
	String l_str_query=null;
	String l_cust_address_arr[]=null;
	String system_date=Common_distAppServlet.getSystemDate();
	logger.debug("agency_code"+l_agency_code);
	logger.debug("cust_address"+l_cust_address);
	logger.debug("rec_no"+l_rec_no);
	String l_set_flag ="N";
	if(l_agency_code!=null)
	{
		if(!(l_agency_code.equals("null") ))
		{
			l_str_query = obj_fetch_pick_vals.getQuery("MT_BASESUPSEARCHVEWOFF");		
		}
		if(l_rec_no!=null && l_rec_no!=null)
		{
			if(! (l_rec_no.equals("null")) && l_rec_no.replaceAll("null","").trim().length()>0) {
			l_str_query = l_str_query + " AND REC_NO="+l_rec_no+"";
			l_set_flag = "Y";
			}
		}
		l_str_query = l_str_query + " ORDER BY IFNULL(START_DT,EFFECT_DT) DESC";

		ArrayList<String> replaceValues = new  ArrayList<String>();
		replaceValues.add("@AGN_CODE#"+l_agency_code);
		replaceValues.add("@DB_NAME#"+db_name);
		replaceValues.add("@LOGIN_USR_VENDOR_ID#"+insstalled_at);
		l_str_query=obj_fetch_pick_vals.finalQuery(l_str_query, replaceValues);
		replaceValues = null;
		l_outer_array = obj_fetch_pick_vals.getQueryResults(l_str_query);

		if(l_outer_array.size()>0)
		if(l_set_flag.equals("Y"))
		{
			ArrayList l_inner_arr = (ArrayList)l_outer_array.get(0);
			String paperDiscontinue=null;
			if(l_inner_arr.get(4)!=null ) {
				if(l_inner_arr.get(4).toString().equals("S") )
					paperDiscontinue = "Stop";
				else if(l_inner_arr.get(4).toString().equals("Y") )
					paperDiscontinue = "Discontinue";
				else
					paperDiscontinue = "Continue";
			}
			MT_AGNSUPSEARCHObj.put("START_DT",(String)l_inner_arr.get(0));
			MT_AGNSUPSEARCHObj.put("END_DT",(String)l_inner_arr.get(1));
			MT_AGNSUPSEARCHObj.put("PUB_FLG",(String)l_inner_arr.get(2));
			MT_AGNSUPSEARCHObj.put("PUB_CODE",(String)l_inner_arr.get(3));
			MT_AGNSUPSEARCHObj.put("PAPER_CONT",paperDiscontinue);
			MT_AGNSUPSEARCHObj.put("REC_NO",(String)l_inner_arr.get(6));
			MT_AGNSUPSEARCHObj.put("EFFECT_DT",(String)l_inner_arr.get(7));
			MT_AGNSUPSEARCHObj.put("PUB_NAME",(String)l_inner_arr.get(8));
		}
	}
%>


<TITLE id="MT_AGNSUPSEARCH_title"><%= field_labels.getString("MT_AGNSUPSEARCH.MT_AGNSUPSEARCH_title") %></TITLE>

<LINK rel='stylesheet' href='scripts/style.css' type='text/css'>

<SCRIPT Language = "JavaScript" type="text/javascript">
<!--
var flag = "N";
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
<SCRIPT Language='Javascript' type='text/javascript' src='scripts/DatePicker.js'> </SCRIPT>

<SCRIPT type="text/javascript" language = "JavaScript">

function execute_onLoad()
{
		if(document.getElementById("PAPER_CONT").value=="Y") {
			document.getElementById("END_DT").disabled = true;
			document.getElementById("END_DTHLP").style.display="none";
			document.getElementById("START_DT").disabled = true;
			document.getElementById("START_DTHLP").style.display="none";
		}
			document.getElementById("EFFECT_DT").disabled = true;
			document.getElementById("EFFECT_DTHLP").style.display="none";

	if("<%=l_set_flag%>"=="Y") {
		if('<%=MT_AGNSUPSEARCHObj.get("PUB_FLG")%>'=="Y") {
			document.getElementById("PUB_CODE").setAttribute("disabled","disabled");
			document.getElementById("PUB_NAME").setAttribute("disabled","disabled");
			document.getElementById("PUB_NAMEHLP").innerText="";
			document.getElementById("PUB_FLG").checked=true;
			document.getElementById("PUB_FLG_NO").checked=false;
		}
		if('<%=MT_AGNSUPSEARCHObj.get("PUB_FLG")%>'=="N") {
			document.getElementById("PUB_CODE").removeAttribute("disabled");
			document.getElementById("PUB_NAME").removeAttribute("disabled");
			document.getElementById("PUB_NAMEHLP").innerText="?";
			document.getElementById("PUB_FLG").checked=false;
			document.getElementById("PUB_FLG_NO").checked=true;
		}

	}
	else
	{
		document.getElementById("PUB_CODE").setAttribute("disabled","disabled");
		document.getElementById("PUB_NAME").setAttribute("disabled","disabled");
		document.getElementById("PUB_NAMEHLP").innerText="";
	}
	clearNull();
	//if(document.getElementById("AGN_CODE") != null)
	///	document.getElementById("AGN_CODE").value = "";
}

function FieldValidation(as_field_name)
{
	if((as_field_name.name=="START_DT") || (as_field_name.name=="END_DT"))
	{
		checkdate(as_field_name);
	}
	if(as_field_name.name == "AGN_CODE")
	{	//chkAgnCode(as_field_name);		
		return true;
	}
	if(as_field_name.name == "PAPER_CONT")
	{
//		alert(11111);
		
		document.getElementById("START_DT").value="";		
		document.getElementById("END_DT").value="";
		document.getElementById("EFFECT_DT").value="";

		if(document.getElementById("PAPER_CONT").value=="Y" || document.getElementById("PAPER_CONT").value=="N") {
			document.getElementById("END_DT").disabled = true;
			document.getElementById("END_DTHLP").style.display="none";
			document.getElementById("START_DT").disabled = true;
			document.getElementById("START_DTHLP").style.display="none";
			document.getElementById("EFFECT_DT").disabled = false;
			document.getElementById("EFFECT_DTHLP").style.display="block";
			
		}
		else {
			document.getElementById("END_DT").disabled = false;
			document.getElementById("END_DTHLP").style.display="block";
			document.getElementById("START_DT").disabled = false;
			document.getElementById("START_DTHLP").style.display="block";
			document.getElementById("EFFECT_DT").disabled = true;
			document.getElementById("EFFECT_DTHLP").style.display="none";

		}
		return true;
	}

	if(as_field_name.name == "PUB_FLG")
	{
		if(as_field_name.value == 'Y')
		{
			document.getElementById("PUB_CODE").value="";
			document.getElementById("PUB_NAME").value="";
			document.getElementById("PUB_CODE").setAttribute("disabled","disabled");
			document.getElementById("PUB_NAME").setAttribute("disabled","disabled");
//			alert(document.getElementById("PUB_NAMEHLP").innerText);
			document.getElementById("PUB_NAMEHLP").innerText="";
		}
		else
		{
			flag = "Y";
			document.getElementById("PUB_CODE").removeAttribute("disabled");
			document.getElementById("PUB_NAME").removeAttribute("disabled");
			document.getElementById("PUB_NAMEHLP").innerText="?";
		}
	}
	
}

function chkAgnCode(as_field_name)
{
		//getQueryResults('g_pkl_agencyCompany','','AGN_CODE@'+document.getElementById("AGN_CODE").value.toUpperCase(),'AGN_CODEDESC^CUST_ADDRESS^CUST_ADDRESSDESC');
}

function validateSubmit(as_field_name)
{
	if(document.getElementById("PAPER_CONT").value==""){
		alert("Please fill mandatory information before submit data.");
		
}else{
		//alert(flag);
		if(flag=="Y"&& document.getElementById("PUB_CODE").value==""){
		alert("Please select publication before submit data.");	
		}
	else {
		if(document.getElementById("PAPER_CONT").value!=""){
		
		if(document.getElementById("PAPER_CONT").value=="S"){
			if(document.getElementById("START_DT").value=="" ||document.getElementById("END_DT").value=="" )	
	alert("Please fill start date / end date before submit data.");
		else
			document.forms[0].submit();
		}else if (document.getElementById("PAPER_CONT").value=="Y" || document.getElementById("PAPER_CONT").value=="N"){
		if(document.getElementById("EFFECT_DT").value=="")	
	alert("Please fill effective date before submit data.");
		else 
		document.forms[0].submit();	
			}
		}
	}
}
}
function ModifyRecord() {
	document.getElementById("MODE").value='MOD';
	validateSubmit();
	}
function DeleteRecord() {
	document.getElementById("MODE").value='DEL';
	validateSubmit();
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
<INPUT type="hidden" id="MODE" name="MODE" value="INP">
<INPUT type="hidden" id="PARAM1" name="PARAM1" value="<%= (String)MT_AGNSUPSEARCHObj.get("PARAM1") %>">
<INPUT type="hidden" id="PARAM2" name="PARAM2" value="<%= (String)MT_AGNSUPSEARCHObj.get("PARAM2") %>">
<INPUT type="hidden" id="ENTITY" name="ENTITY" value="MT_AGN_PAPER_STOP">
<INPUT type="hidden" id="SCREEN_NAME" name="SCREEN_NAME" value="MT_AGN_PAPER_STOP">
<INPUT type="hidden" id="ERRDESC" name="ERRDESC" value="<%= (String)MT_AGNSUPSEARCHObj.get("ERRDESC") %>">
<INPUT type="hidden" id="PRIMARY_KEY" name="PRIMARY_KEY" value="REC_NO">
<INPUT type="hidden" id="AGN_CODE" name="AGN_CODE" value="<%=l_agency_code%>">
<INPUT type="hidden" id="CUST_ADDRESS" name="CUST_ADDRESS" value="<%=l_cust_address%>">
<INPUT type="hidden" id="REC_NO" name="REC_NO" value="<%= (String)MT_AGNSUPSEARCHObj.get("REC_NO") %>">


  <TABLE class="headertable" cellspacing="0" cellpadding="0" width='100%'>
         <TD>&nbsp;</TD>
        <TR> 
           <TD class="heading" nowrap align="center">
            <%= field_labels.getString("MT_AGNSUPSEARCH.MT_AGNSUPPAPEROFF") %>
           </TD>
           <TD>&nbsp;</TD>
        </TR>
   </TABLE>

	<TR class="str">
		<TD class="str" nowrap colspan="2">   
			<LABEL ID="AGN_CODE_label" class="userlabel"><%= field_labels.getString("MT_CUSTPAYMENT.AGN_CODE") %><SPAN class="instreditalic"> &nbsp;&nbsp;&nbsp;: &nbsp;&nbsp;&nbsp;</SPAN></LABEL>
			<LABEL ID="AGN_CODE_label" class="userlabel"><B><%=l_agency_code%></B></LABEL>

		</TD>
			<TD class="str" nowrap colspan="2">   
			<LABEL ID="CUST_ADDRESS_label" class="userlabel"><%= field_labels.getString("MT_CUSTPAYMENT.CUST_ADDRESS") %><SPAN class="instreditalic"> &nbsp;&nbsp;&nbsp;: &nbsp;&nbsp;&nbsp;</SPAN></LABEL>
			<LABEL ID="CUST_ADDRESS_label" class="userlabel"><B><%=l_cust_address%></B></LABEL>

		</TD>

</TR>
<TR>&nbsp;</TR>

 <TABLE class="detailstable" cellspacing="0" cellpadding="0">

	<TR class="str">

		<TR class="str">
		<TD class="str" wrap>   
			<LABEL ID="SR_NO_label" class="userlabel"><%= field_labels.getString("SR_NO") %></LABEL>
		</TD>
				<TD class="str" wrap>   
			<LABEL ID="MT_BASESUPSEARCHCALMOD.DISCONT_label" class="userlabel"><%= field_labels.getString("MT_BASESUPSEARCHCALMOD.DISCONT") %></LABEL>
		</TD>

		<TD class="str" wrap>   
			<LABEL ID="START_DT_label" class="userlabel"><%= field_labels.getString("START_DT") %></LABEL>
		</TD>
		<TD class="str" wrap>   
			<LABEL ID="END_DT_label" class="userlabel"><%= field_labels.getString("END_DT") %></LABEL>
		</TD>
		<TD class="str" wrap>   
			<LABEL ID="PUB_FLG_label" class="userlabel"><%= field_labels.getString("PUB_FLG") %></LABEL>
		</TD>

		<TD class="ste" wrap>   
			<LABEL ID="PUB_CODE_label" class="userlabel"><%= field_labels.getString("PUB_CODE") %></LABEL>
		</TD>
				<TD class="str" wrap>   
			<LABEL ID="EFFECT_DT_label" class="userlabel"><%= field_labels.getString("EFFECT_DT") %></LABEL>
		</TD>

	</TR>

	<TR>
		<TD class="str" wrap>   New
		</TD>
		
	<TD class="ste" nowrap>
		<select class="input"name='PAPER_CONT' id="PAPER_CONT" onChange="FieldValidation(this);"  onBlur="FieldValidation(this);">
		<%
		String paperDiscontinue  = (String)MT_AGNSUPSEARCHObj.get("PAPER_CONT");
		out.println("<option value=''>Please select</option>");
		if("Continue".equals(paperDiscontinue))
		{
		
			out.println("<option value='N' selected>Continue</option>");
		}
		else
		{	
			out.println("<option value='N'>Continue</option>");
		}
		if("Discontinue".equals(paperDiscontinue))
		{
			out.println("<option value='Y' selected>Discontinue</option>");
		}
		else
		{	
			out.println("<option value='Y'>Discontinue</option>");
		}
		if("Stop".equals(paperDiscontinue) || paperDiscontinue == null)
		{
		
			out.println("<option value='S' selected>Stop</option>");
		}
		else
		{	
			out.println("<option value='S'>Stop</option>");
		}
		%>
	</SELECT>

		</td>

		<TD class="ste" nowrap>
				<INPUT type="text" id="START_DT" name="START_DT" CLASS="input" size="10" maxlength="10" onBlur="FieldValidation(this);" value="<%= (String)MT_AGNSUPSEARCHObj.get("START_DT") %>"> <a id="START_DTHLP" href="#" onClick="javascript:calendar('START_DT',event.screenY,event.screenX,null,null,getDatePickerPattern());"
			title="Select Date"> <img src="images/calendar.gif" width="16"
			height="16" border="0" /></a>

		</TD>

		<TD class="ste" nowrap>
			<INPUT type="text" id="END_DT" name="END_DT" onBlur="FieldValidation(this)" class="input" size="10" maxLength="10"  value="<%= (String)MT_AGNSUPSEARCHObj.get("END_DT") %>" >
			<a id="END_DTHLP" href="#" onClick="javascript:calendar('END_DT',event.screenY,event.screenX,null,null,getDatePickerPattern());"
			title="Select Date"> <img src="images/calendar.gif" width="16"
			height="16" border="0" /></a>
		</TD>

		<TD class="ste" nowrap>
			<INPUT type="radio" id="PUB_FLG" name="PUB_FLG" checked onClick="FieldValidation(this);" value="Y" accessKey="Y"/><%= field_labels.getString("radio_yes") %>

			<INPUT type="radio" id="PUB_FLG_NO" name="PUB_FLG"  onClick="FieldValidation(this);" value="N" accessKey="N"
			/><%= field_labels.getString("radio_no") %>
		</TD>

		<TD class="ste" nowrap>
				<INPUT type="text" id="PUB_CODE" name="PUB_CODE" class="input" size="10" onChange="FieldValidation(this);getCodeDesc('PUB_CODE','PUB_NAME','g_pkl_publicationDesc','');" 
					maxLength="10" value="<%= (String)MT_AGNSUPSEARCHObj.get("PUB_CODE") %>" >
			<INPUT type="text" id="PUB_NAME" name="PUB_NAME" class="input" size="25" readonly  maxLength="50" value="<%= (String)MT_AGNSUPSEARCHObj.get("PUB_NAME") %>" />
			<A id="PUB_NAMEHLP" name="PUB_NAMEHLP"  href="#" onClick="getPicklistValues('getMappedPublications','PUB_CODE','AGN_CODE','')" class="linkblue" >?</A> &nbsp;
		</td>

		<TD class="ste" nowrap>
			<INPUT type="text" id="EFFECT_DT" name="EFFECT_DT" onBlur="FieldValidation(this)" class="input" size="10" maxLength="10"  value="<%= (String)MT_AGNSUPSEARCHObj.get("EFFECT_DT") %>" >
			<a id="EFFECT_DTHLP" href="#" onClick="javascript:calendar('EFFECT_DT',event.screenY,event.screenX,null,null,getDatePickerPattern());"
			title="Select Date"> <img src="images/calendar.gif" width="16"
			height="16" border="0" /></a>
		</TD>


		<%
		if(l_set_flag.equals("Y"))
		{ %>
		<TD class="ste" nowrap>
		<INPUT TYPE="button" value="Modify" name="Modify_label" class="button" onClick="javascript:ModifyRecord()">
		<INPUT TYPE="button" value="Delete" name="Delete_label" class="button" onClick="javascript:DeleteRecord()">
		</td>

		<%}else{%>
		<TD class="ste" nowrap>
		<INPUT TYPE="button" value="Submit" name="Submit_label" class="button" onClick="javascript:validateSubmit()">
		</td>
		<%}%>
	</tr>

<%
	if(l_outer_array.size()>0 && l_set_flag.equals("N"))	
	{
	//System.out.println("Array Size...."+l_outer_array.size());
	int i=0;
for(i=0;i<l_outer_array.size();i++)
	{

	ArrayList l_inner_arr = (ArrayList)l_outer_array.get(i);

	String class_css = l_inner_arr.get(5).toString().equals("E")?"ste":"str";
//	String class_css = i == 0?"ste":"str";
	String readonly_css = l_inner_arr.get(5).toString().equals("E")?"":"class='userlabel' readOnly";
//	String readonly_css = i == 0?"":"class='userlabel' readOnly";

	String l_passs_str = l_agency_code + "@" + l_cust_address + "@" + l_inner_arr.get(6) ;
	String paperDiscontinueStr = null;
	if(l_inner_arr.get(4)!=null ) {
		if(l_inner_arr.get(4).toString().equals("S") )
			paperDiscontinueStr = "Stop";
		else if(l_inner_arr.get(4).toString().equals("Y") )
			paperDiscontinueStr = "Discontinue";
		else
			paperDiscontinueStr = "Continue";
	}
//	System.out.println("|"+(String)l_inner_arr.get(4)+"|");
%>
	<TR>
		<TD class="ste" nowrap>   
		<%
		if(l_inner_arr.get(5).toString().equals("E"))
		{
		%>
			<A href="MT_BASESUPSEARCHVEWOFF.jsp?PARAMSTR=<%=l_passs_str%>&AGN_CODE=<%=l_agency_code%>" target="Right" alt="Click here to edit details" id="Link" class="linkblue" ><%=(i+1)%></a>
		<%
		}
		else
		{
		%>
			<input type="text" class="userlabel" readonly size= 3 value="<%=(i+1)%>" >
		<%
		}
		%>
		</TD>
		<TD class="str" >   
			<input type="text" ID="PAPER_CONT<%=i%>" name="PAPER_CONT<%=i%>" class="userlabel" readonly size=10 value="<%= paperDiscontinueStr %>" >
		</TD>

		<TD class="str" >   
			<input type="text" ID="START_DT<%=i%>" name="START_DT<%=i%>" class="userlabel" readonly size=10 value="<%= (String)l_inner_arr.get(0) %>" >
		</TD>
		<TD class="str" >   
			<input type="text" ID="END_DT<%=i%>" name="END_DT<%=i%>" class="userlabel" readonly size=10 value="<%= (String)l_inner_arr.get(1) %>" >
		</TD>
		<TD class="str" >   
			<input type="text" ID="PUB_FLG<%=i%>" name="PUB_FLG<%=i%>" class="userlabel" readonly size=10 value="<%= (String)l_inner_arr.get(2) %>" >
		</TD>
		<TD class="str" >   
			<input type="text" ID="PUB_CODE<%=i%>" name="PUB_CODE<%=i%>" class="userlabel" readonly  size=10 value="<%= (String)l_inner_arr.get(3) %>" >
			<INPUT type="text" id="PUB_NAME<%=i%>" name="PUB_NAME<%=i%>" class="input" size="25" maxLength="40" readonly value="<%= (String) l_inner_arr.get(3) %>" >

		</TD>
				<TD class="str" >   
			<input type="text" ID="EFFECT_DT<%=i%>" name="EFFECT_DT<%=i%>" class="userlabel" readonly size=10 value="<%= (String)l_inner_arr.get(7) %>" >
		</TD>

	</TR>
<%
	}
	}
%>

	</TABLE>
     </TD>
    </TR>
   </TABLE>
  </TD>
 </TR>



 <TR class="formrow2" align="right"> 
  <TD class="buffercol">&nbsp; </TD>
   <TD class= "formcol"> 
    <TABLE class="eventstable" cellspacing="0" cellpadding="0">
     <TR class="eventsrow2"> 
      <TD class="eventscol" align="right">

<!-- 		<INPUT TYPE="button" value="Clear" name="Clear_label" class="button"  onClick="reset_field()">
		<INPUT TYPE="button" value="Print" name="Print_label" class="button"  onClick="javascript:window.print()">
		<INPUT TYPE="button" value="Back" name="Back_label" class="button"  onClick="javascript:history.go(-1)"> -->
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