<%@ include file="DISTAPPDResourceProvider.jsp" %>
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
	Logger logger = Logger.getLogger("MT_RATE");

	HashMap MT_RATEObj = (HashMap)request.getAttribute("RESPONSE");

	
	if(MT_RATEObj == null)
  		MT_RATEObj = new HashMap();

	String formName = "MT_RATEVIEW";
	String weeklyRate = "0000000";
		if(MT_RATEObj.get("WK_SUP")!=null && !MT_RATEObj.get("WK_SUP").toString().equals(""))
			weeklyRate = MT_RATEObj.get("WK_SUP").toString();
%>

<TITLE id="MT_RATE_title"><%= field_labels.getString("MT_RATE.MT_RATE_title") %></TITLE>

<LINK rel='stylesheet' href='scripts/style.css' type='text/css'>
<SCRIPT Language='Javascript' type='text/javascript' src='scripts/CommonFunctions.js'></SCRIPT>
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
					if(document.getElementById("ERRDESC").value=="SUCCESS" ) window.close();
	var l_wk_rate_val=null;
	var i=0;
	clearNull();
	//wastage();
	if(document.getElementById("RATE1").value == "" && document.getElementById("WK_SUP").value != "")
	{
		l_wk_rate_val=document.getElementById("WK_SUP").value.split("#");
		for(i=0;i<l_wk_rate_val.length;i++)
		{
			document.getElementById("RATE"+(i+1)).value = l_wk_rate_val[i];
		}
	}
	var l_mode = "<%=(String)request.getParameter("MODE")%>";
	if(l_mode=="MOD" && document.getElementById("ERRDESC").value=="") {
			//document.getElementById("MODE").value='MOD';
			document.getElementById("PUB_CODE").value='<%=(String)request.getParameter("PUB_CODE")%>';
			Modify_Details();
	}
	if(document.getElementById("ERRDESC").value=="Details Not Available") {
			//document.getElementById("MODE").value='MOD';
		document.location.href="MT_PURRATE.jsp?MODE=MOD&PUB_CODE="+document.getElementById("PUB_CODE").value+"";
		document.forms[0].target="_self";
	}
	else
					getCodeDesc('PUB_CODE','PUB_CODEDESC', 'g_pkl_publicationDesc','');

}
function populateRate() 
{
	if(document.getElementById("RATE1").value!="")
	{
		if(IsNumeric(document.getElementById("RATE1"))==false) {
			alert("Monday Rate - Invalid Number ");
			return false;
		}
	} else {
		alert(" Please enter Monday Rate.");
		return false;
	}

	if(document.getElementById("RATE2").value!="")
	{
		if(IsNumeric(document.getElementById("RATE2"))==false) {
			alert("Tuesday Rate - Invalid Number ");
			return false;
		}
	} else {
		alert(" Please enter Tuesday Rate.");
		return false;
	}

	if(document.getElementById("RATE3").value!="")
	{
		if(IsNumeric(document.getElementById("RATE3"))==false) {
			alert("Wednesday Rate - Invalid Number ");
			return false;
		}
	} else {
		alert(" Please enter Wednesday Rate.");
		return false;
	}

	if(document.getElementById("RATE4").value!="")
	{
		if(IsNumeric(document.getElementById("RATE4"))==false) {
			alert("Thursday Rate - Invalid Number ");
			return false;
		}
	} else {
		alert(" Please enter Thursday Rate.");
		return false;
	}

	if(document.getElementById("RATE5").value!="")
	{
		if(IsNumeric(document.getElementById("RATE5"))==false) {
			alert("Friday Rate - Invalid Number ");
			return false;
		}
	} else {
		alert(" Please enter Friday Rate.");
		return false;
	}

	if(document.getElementById("RATE6").value!="")
	{
		if(IsNumeric(document.getElementById("RATE6"))==false) {
			alert("Saturday Rate - Invalid Number ");
			return false;
		}
	} else {
		alert(" Please enter Saturday Rate.");
		return false;
	}

	if(document.getElementById("RATE7").value!="")
	{
		if(IsNumeric(document.getElementById("RATE7"))==false) {
			alert("Sunday Rate - Invalid Number ");
			return false;
		}
	} else {
		alert(" Please enter Sunday Rate.");
		return false;
	}
	var l_mode = "<%=(String)MT_RATEObj.get("MODE")%>";
	document.getElementById("MODE").value = l_mode;
	document.getElementById("WK_SUP").value= document.getElementById("RATE1").value+"#"+ document.getElementById("RATE2").value+"#"+ document.getElementById("RATE3").value+"#"+ document.getElementById("RATE4").value+"#"+ document.getElementById("RATE5").value+"#"+ document.getElementById("RATE6").value+"#"+ document.getElementById("RATE7").value;
	document.getElementById("SCREEN_NAME").value = "RATE_PURPOPVEW";

	document.getElementById("ERRDESC").value = "";
	validateSubmit();
	return true;
}

function FieldValidation(as_field_name)
{
		var l_numeric_flds = "RATE_MON,RATE_TUE,RATE_WED,RATE_THU,RATE_FRI,RATE_SAT,RATE_SUN,W_MON,W_TUE,W_WED,W_THU,W_FRI,W_SAT,W_SUN";

	if(l_numeric_flds.indexOf(as_field_name.name)!=-1 && as_field_name.value!="")
	{
		if(IsNumeric(as_field_name)==false) return false;
	}
	if(as_field_name.name == "EX_RATE")
		chkExRate(as_field_name);
	else
	if(as_field_name.name == "WTYPE")
	{
		wastage();
	}

	return true;
}

function wastage()
{
	if(document.getElementById("WTYPE").value=="Amount")
		document.getElementById("W_VALUE_label").innerText ="Wastage Value (Rs)";
	else
		document.getElementById("W_VALUE_label").innerText ="Wastage Value (%)";

}

function validateForm(as_event_label)
{
	var l_mode = "<%=(String)MT_RATEObj.get("MODE")%>";
	for(var i=1;i<32;i++) {
		if(document.getElementById("RATE_DAY"+i).value=="") {
			alert("Please enter rate for Day"+i);
		}
		else
		{
			if(IsNumeric(document.getElementById("RATE_DAY"+i))==false) alert("Invalid rate for Day"+i);
		}
	}
        document.getElementById("SCREEN_NAME").value = "MT_PURRATEVIEW";
		document.getElementById("MODE").value = l_mode;
	document.getElementById("WK_SUP").value= document.getElementById("RATE1").value+"#"+ document.getElementById("RATE2").value+"#"+ document.getElementById("RATE3").value+"#"+ document.getElementById("RATE4").value+"#"+ document.getElementById("RATE5").value+"#"+ document.getElementById("RATE6").value+"#"+ document.getElementById("RATE7").value;
	validateSubmit();
	return true;
}

</SCRIPT>


<SCRIPT type="text/javascript" language = "JavaScript">
</script>

<%
String g_days[]={"Mon","Tue","Wed","Thu","Fri","Sat","Sun"};
String firstday= (String)MT_RATEObj.get("FIRSTDAY");

int firstday_flg =0;
for(int i=0;i<g_days.length;i++)
{
	if(g_days[i].equals(firstday))
	{
		firstday_flg = i;
		break;
	}
}
%>

</HEAD>
<BODY class="mainbody" onLoad="execute_onLoad()" >

<DIV id="MT_RATE_div" >

<FORM name="MT_RATE" id="MT_RATE" method="post" action="distAppCommonActionServlet.do">
<INPUT type="hidden" id="Event" name="Event" value="">
<INPUT type="hidden" id="MAKER" name="MAKER" value="<%= (String)MT_RATEObj.get("MAKER") %>">
<INPUT type="hidden" id="MAKER_DT" name="MAKER_DT" value="">
<INPUT type="hidden" id="STATUS" name="STATUS" value="<%= (String)MT_RATEObj.get("STATUS") %>">
<INPUT type="hidden" id="MODE" name="MODE" value="">
<INPUT type="hidden" id="ENTITY" name="ENTITY" value="MT_PURRATE">
<INPUT type="hidden" id="PARAM" name="PARAM" value="<%= (String)MT_RATEObj.get("PARAM") %>">
<INPUT type="hidden" id="PARAM1" name="PARAM1" value="<%= (String)MT_RATEObj.get("PARAM1") %>">
<INPUT type="hidden" id="PARAM2" name="PARAM2" value="<%= (String)MT_RATEObj.get("PARAM2") %>">
<INPUT type="hidden" id="PRIMARY_KEY" name="PRIMARY_KEY" value="PUB_CODE#RATE_CODE">
<INPUT type="hidden" id="SCREEN_NAME" name="SCREEN_NAME" value="MT_PURRATEVIEW">
<INPUT type="hidden" id="ERRDESC" name="ERRDESC" value="<%= (String)MT_RATEObj.get("ERRDESC") %>">
<INPUT type="hidden" id="WK_SUP" name="WK_SUP" value="<%=(String)MT_RATEObj.get("WK_SUP") %>">
<INPUT type="hidden" id="FIRSTDAY" name="FIRSTDAY" value="<%=(String)MT_RATEObj.get("FIRSTDAY")%>" >
<INPUT type="hidden" id="EX_RATE" name="EX_RATE" value="Y" >
<INPUT type="hidden" id="RATE_CODE" name="RATE_CODE" value="RATE" >
<INPUT type="hidden" id="NAME" name="NAME" value="RATE" >

  <TABLE class="headertable" cellspacing="0" cellpadding="0" width='100%'>
         <TD>&nbsp;</TD>
        <TR> 
           <TD class="heading" nowrap align="center">
            <%= field_labels.getString("MT_RATE.MT_RATE") %>
           </TD>
           <TD>&nbsp;</TD>
        </TR>
   </TABLE>
 <TABLE class="detailstable" cellspacing="0" cellpadding="0">


	<TR class="ste">
		<TD class="ste" nowrap>   
			<LABEL ID="CMP_CODE_label" class="userlabel"><%= field_labels.getString("MT_RATE.CMP_CODE") %><SPAN class="instreditalic">*</SPAN></LABEL>
		</TD>
		<TD class="ste" colspan="7" nowrap>
			<INPUT type="text" id="CMP_CODE" name="CMP_CODE" class="input" size="10" onChange="FieldValidation(this);getCodeDesc('CMP_CODE','CMP_CODEDESC', 'g_pkl_companyDesc','');" maxLength="10"  value="<%= (String)MT_RATEObj.get("CMP_CODE") %>" >

	  <INPUT type="text" id="CMP_CODEDESC" name="CMP_CODEDESC" class="input" size="50" readonly  maxLength="50" value="<%= 
	(String)MT_RATEObj.get("CMP_CODEDESC") %>" >
		<A id="CMP_CODEHLP" name="CMP_CODEHLP"  href="#" onClick="getPicklistValues('g_pkl_company','CMP_CODE','','')" class="linkblue" >?</A> &nbsp;
		</TD>
	</TR>

	<TR class="ste">
		<TD class="ste" nowrap>   
			<LABEL ID="PUB_CODE_label" class="userlabel"><%= field_labels.getString("MT_RATE.PUB_CODE") %><SPAN class="instreditalic">*</SPAN></LABEL>
		</TD>
		<TD class="ste" colspan="7" nowrap>
			<INPUT type="text" id="PUB_CODE" name="PUB_CODE" class="input" size="10" readOnly onChange="FieldValidation(this);getCodeDesc('PUB_CODE','PUB_CODEDESC', 'g_pkl_publicationDesc','');" maxLength="10"  value="<%= (String)MT_RATEObj.get("PUB_CODE") %>" >

	  <INPUT type="text" id="PUB_CODEDESC" name="PUB_CODEDESC" class="input" size="50" readonly  maxLength="50" value="<%= 
	(String)MT_RATEObj.get("PUB_CODEDESC") %>" >
		<A id="PUB_CODEHLP" name="PUB_CODEHLP"  href="#" onClick="getPicklistValues('g_pkl_publication','PUB_CODE','','')" class="linkblue" >?</A> &nbsp;
		</TD>
	</TR>
<!--
	<TR class="ste">
		<TD class="ste" nowrap>   
			<LABEL ID="EDT_CODE_label" class="userlabel"><%= field_labels.getString("MT_RATE.EDT_CODE") %><SPAN class="instreditalic">*</SPAN></LABEL>
		</TD>
		<TD class="ste" colspan="7" nowrap>
			<INPUT type="text" id="EDT_CODE" name="EDT_CODE" class="input" size="30" readonly onChange="FieldValidation(this);getCodeDesc('EDT_CODE,CMP_CODE,PUB_CODE,USER_ID','EDT_CODEDESC', 'g_pkl_editionDesc','');" maxLength="30"  value="<%= (String)MT_RATEObj.get("EDT_CODE") %>" >
	  <INPUT type="text" id="EDT_CODEDESC" name="EDT_CODEDESC" class="input" size="50" readonly  maxLength="50" value="<%= 
	(String)MT_RATEObj.get("EDT_CODEDESC") %>" >
		<A id="EDT_CODEHLP" name="EDT_CODEHLP"  href="#" onClick="getPicklistValues('g_pkl_edition','EDT_CODE','CMP_CODE,PUB_CODE,USER_ID','')" class="linkblue" >?</A> &nbsp;
		</TD>
	</TR>

	<TR class="ste">
		<TD class="ste" nowrap>   
			<LABEL ID="RATE_CODE_label" class="userlabel"><%= field_labels.getString("MT_RATE.PURRATE_CODE") %><SPAN class="instreditalic">*</SPAN></LABEL>
		</TD>
		<TD class="ste" colspan="7" nowrap>
			<INPUT type="text" id="RATE_CODE" name="RATE_CODE" class="input" size="10" onChange="FieldValidation(this);getCodeDesc('RATE_CODE,PUB_CODE','NAME','g_pkl_rateDesc','');" maxLength="10" readOnly value="<%= (String)MT_RATEObj.get("RATE_CODE") %>" >
 			<A id="RATE_CODEHLP" name="RATE_CODEHLP"  href="#" onClick="getPicklistValues('g_pkl_rate','RATE_CODE','PUB_CODE','')" class="linkblue" >?</A>
		</TD>
	</TR>
	<TR class="ste">
		<TD class="ste" nowrap>   
			<LABEL ID="NAME_label" class="userlabel"><%= field_labels.getString("MT_RATE.NAME") %><SPAN class="instreditalic">*</SPAN></LABEL>
		</TD>
		<TD class="ste" colspan="7" nowrap>
			<INPUT type="text" id="NAME" name="NAME" class="input" size="65" onblur="FieldValidation(this);" maxLength="65"  value="<%= (String)MT_RATEObj.get("NAME") %>" >
		</TD>
	</TR>-->
<!-- 	<TR class="ste">
		<TD class="ste" nowrap>   
			<LABEL ID="OLD_CODE_label" class="userlabel"><%= field_labels.getString("MT_RATE.OLD_CODE") %></LABEL>
		</TD>
		<TD class="ste" colspan="7" nowrap>
			<INPUT type="text" id="OLD_CODE" name="OLD_CODE" class="input" size="20" onblur="FieldValidation(this);" maxLength="20"  value="<%= (String)MT_RATEObj.get("OLD_CODE") %>" >
		</TD>
	</TR> -->
		<TR class="ste">
		<TD class="ste" nowrap>   
			<LABEL ID="WEEKLY_RATE_label" class="userlabel"><%= field_labels.getString("MT_AGENCY.PURRATE_WEEKLY") %></LABEL>
		</TD>
     <TD class="ste" colspan="7" nowrap>
		
			&nbsp;&nbsp;<%= field_labels.getString("MONDAY") %>&nbsp;
			<INPUT type="textbox" id="RATE1" name="RATE1" size="4" class="userlabel" onClick="FieldValidation(this);" value="<%=(String)MT_RATEObj.get("RATE1")%>">
		
			&nbsp;&nbsp;<%= field_labels.getString("TUESDAY") %>&nbsp;
			<INPUT type="textbox" id="RATE2" name="RATE2" size="4" class="userlabel" onClick="FieldValidation(this);" value="<%=(String)MT_RATEObj.get("RATE2")%>">
		
			&nbsp;&nbsp;<%= field_labels.getString("WEDNESDAY") %>&nbsp;
			<INPUT type="textbox" id="RATE3" name="RATE3" size="4" class="userlabel" onClick="FieldValidation(this);" value="<%=(String)MT_RATEObj.get("RATE3")%>">

			&nbsp;&nbsp;<%= field_labels.getString("THURSDAY") %>&nbsp;
			<INPUT type="textbox" id="RATE4" name="RATE4" size="4" class="userlabel" onClick="FieldValidation(this);" value="<%=(String)MT_RATEObj.get("RATE4")%>">

			&nbsp;&nbsp;<%= field_labels.getString("FRIDAY") %>&nbsp;
			<INPUT type="textbox" id="RATE5" name="RATE5" size="4" class="userlabel" onClick="FieldValidation(this);" value="<%=(String)MT_RATEObj.get("RATE5")%>">
			
			&nbsp;&nbsp;<%= field_labels.getString("SATURDAY") %>&nbsp;
			<INPUT type="textbox" id="RATE6" name="RATE6" size="4" class="userlabel" onClick="FieldValidation(this);" value="<%=(String)MT_RATEObj.get("RATE6")%>">

			&nbsp;&nbsp;<%= field_labels.getString("SUNDAY") %>&nbsp;
			<INPUT type="textbox" id="RATE7" name="RATE7" size="4" class="userlabel" onClick="FieldValidation(this);" value="<%=(String)MT_RATEObj.get("RATE7")%>">

<!-- 			<INPUT TYPE="button" value="Populate Mothly Rate" name="Submit_label" class="button" onClick="javascript:populateRate()"> -->
		</TD>
	</TR>
	
<%
if( MT_RATEObj.get("RATE_DAY1") != null) {
		int cnt = 1;
		for(int i=firstday_flg;cnt <=g_days.length;i++)
		{
			if(i>= g_days.length)
			{
				i = i%g_days.length;
			}

		%>
			<TD class="ste" nowrap>   
				<LABEL ID="GDAY<%=i+1%>_label" class="userlabel"><%= g_days[i]%><SPAN class="instreditalic">*</SPAN>&nbsp;&nbsp;</LABEL>
			</TD>
		<%
			cnt++;
		}
		%>		

	</TR>
		<%
		int k=1;
		int kd=1;
		for(int i=1;i<5;i++)
		{
		%>

	<TR class="ste">
		<%
		for(int j=0;j<g_days.length;j++)
		{
		%>
		<TD class="ste" nowrap>   
			<LABEL ID="DAY<%=k%>_label" class="userlabel"><%=k%></LABEL>

		</TD>
		<%
			k++;
		}
		%>
	</TR>


	<TR class="ste">
		<%
		for(int j=0;j<g_days.length;j++)
		{
		%>
		<TD class="ste" nowrap>   
			<INPUT type="text" id="RATE_DAY<%=kd%>" name="RATE_DAY<%=kd%>" class="input" size="6" onblur="FieldValidation(this);" maxLength="6"  value="<%= MT_RATEObj.get("RATE_DAY"+kd) %>" >
		</TD>
		<%
			kd++;
		}
		%>
	</TR>
		<%
		}
		%>		

	<TR class="ste">
		<TD class="ste" nowrap>   
			<LABEL ID="DAY29_label" class="userlabel">29</LABEL>
		</TD>
		<TD class="ste" nowrap>   
			<LABEL ID="DAY30_label" class="userlabel">30</LABEL>
		</TD>
		<TD class="ste" nowrap>   
			<LABEL ID="DAY31_label" class="userlabel">31</LABEL>
		</TD>
	</tr>

	<TR class="ste">
		<TD class="ste" nowrap>   
			<INPUT type="text" id="RATE_DAY29" name="RATE_DAY29" class="input" size="6" onblur="FieldValidation(this);" maxLength="6"  value="<%= MT_RATEObj.get("RATE_DAY29") %>" >
		</TD>
		<TD class="ste" nowrap>   
			<INPUT type="text" id="RATE_DAY30" name="RATE_DAY30" class="input" size="6" onblur="FieldValidation(this);" maxLength="6"  value="<%= MT_RATEObj.get("RATE_DAY30") %>" >
		</TD>
		<TD class="ste" nowrap>   
			<INPUT type="text" id="RATE_DAY31" name="RATE_DAY31" class="input" size="6" onblur="FieldValidation(this);" maxLength="6"  value="<%= MT_RATEObj.get("RATE_DAY31") %>" >
		</TD>		
<%}%>

<!-- 	<TR class="ste">
		<TD class="ste" nowrap>   
			<LABEL ID="REMARKS_label" class="userlabel"><%= field_labels.getString("MT_RATE.REMARKS") %></LABEL>
		</TD>
		<TD class="ste" colspan="7" nowrap>
			<INPUT type="text" id="REMARKS" name="REMARKS" class="input" size="100" onblur="FieldValidation(this);" maxLength="200"  value="<%= (String)MT_RATEObj.get("REMARKS") %>" > -->

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
     <TR class="eventsrow1"> 
      <TD class="eventscol" align="left">
       <LABEL ID="man_label" class="instreditalic">
        <SPAN class="instreditalic"> &nbsp;&nbsp;<%= field_labels.getString("mandatory_msg") %>&nbsp;</SPAN>
       </LABEL>
      </TD>
     </TR>
     <TR class="eventsrow2"> 
      <TD class="eventscol" align="right">

		<INPUT TYPE="button" value="Submit" name="Submit_label" class="button" onClick="javascript:validateForm()">
		<INPUT TYPE="button" value="Clear" name="Clear_label" class="button"  onClick="reset_field()">
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