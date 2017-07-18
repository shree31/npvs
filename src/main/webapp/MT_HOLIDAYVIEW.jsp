<%@ include file="DISTAPPResourceProvider.jsp" %>
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
	Logger logger = Logger.getLogger("MT_HOLIDAY");

	HashMap MT_HOLIDAYObj = (HashMap)request.getAttribute("RESPONSE");

	
	if(MT_HOLIDAYObj == null)
  		MT_HOLIDAYObj = new HashMap();

	String formName = "MT_HOLIDAYVIEW";

%>

<TITLE id="MT_HOLIDAY_title"><%= field_labels.getString("MT_HOLIDAY.MT_HOLIDAY_title") %></TITLE>

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
		submitForm('Submit');
	}
	*/
}
	
document.onkeypress = checkCR;
// -->
</SCRIPT>

<SCRIPT type="text/javascript" language = "JavaScript">

//var l_dt_char = "TO_CHAR(HLD_DATE,'DD\MM\YYYY')";

function execute_onLoad()
{
	clearNull();
	document.getElementById("PUB_CODE").parentElement.parentElement.style.display="none";
	var l_hld_type = "<%=((String)MT_HOLIDAYObj.get("HLD_TYPE"))%>";
	var l_hld_valid_allyr = "<%=((String)MT_HOLIDAYObj.get("HLD_VALID_ALLYR"))%>";
	var l_hld_date = "<%=((String)MT_HOLIDAYObj.get("HLD_DATE"))%>";
	if(l_hld_type == "N")
	{
		document.getElementById("HLD_TYPE_N").checked=true;
		document.getElementById("HLD_TYPE_Y").readOnly=true;
	}
	else 
	{
		document.getElementById("HLD_TYPE_Y").checked=true;
		document.getElementById("HLD_TYPE_N").readOnly=true;
		document.getElementById("PUB_CODE").value = "ALL";
	}
	if(l_hld_valid_allyr == "N")
		document.getElementById("HLD_VALID_ALLYR_N").checked=true;
	else 
		document.getElementById("HLD_VALID_ALLYR_Y").checked=true;

	if(l_hld_type != "null")
	{
		document.getElementById("HLD_TYPE_"+l_hld_type).value=l_hld_type;
		chkHldType(document.getElementById("HLD_TYPE_"+l_hld_type));
	}
	
	<%
	if((String)MT_HOLIDAYObj.get("ERRDESC") == null)
	{	%>
			populateDropDownVals('g_pkl_holiday','HLD_DATE','');

	<%}
	else
	{%>
		document.getElementById('HLD_DATE').options[0] = new Option(l_hld_date, l_hld_date, 1);
		document.getElementById('HLD_DATE').options[1] = new Option("select", "");
	<%}%>
	var l_hld_date="<%=MT_HOLIDAYObj.get("HLD_DATE")%>";
	//alert(l_hld_date);
	if(l_hld_date!="null")
	{
		document.getElementById("HLD_DATE").value=l_hld_date;
	}
}

function FieldValidation(as_field_name)
{
	if(as_field_name.name == "HLD_TYPE")
		chkHldType(as_field_name);

	if(as_field_name.name =="HLD_DATE")
		checkdate(as_field_name);

	return true;
}

function chkHldType(as_field_name)
{
	if(as_field_name.accessKey == "Y")
		{
			document.getElementById("PUB_CODE").parentElement.parentElement.style.display="none";
			setfldNonMandatory("PUB_CODE");
			document.getElementById("PUB_CODE").value = "ALL";
			document.getElementById("PRIMARY_KEY").value = "HLD_DATE,DATE#HLD_TYPE";
		}
		else
		{
			document.getElementById("PUB_CODE").parentElement.parentElement.style.display="block";
			setfldMandatory("PUB_CODE");
//			alert("MODE"+document.getElementById("MODE").value);
//			alert("PARAM1"+document.getElementById("PARAM1").value);
			if(document.getElementById("PARAM1").value == "")
				document.getElementById("PUB_CODE").value = "";
		}
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

<DIV id="MT_HOLIDAY_div" >

<FORM name="MT_HOLIDAY" id="MT_HOLIDAY" method="post" action="distAppCommonActionServlet.do">
<INPUT type="hidden" id="Event" name="Event" value="">
<INPUT type="hidden" id="MAKER" name="MAKER" value="<%= (String)MT_HOLIDAYObj.get("MAKER") %>">
<INPUT type="hidden" id="MAKER_DT" name="MAKER_DT" value="">
<INPUT type="hidden" id="STATUS" name="STATUS" value="<%= (String)MT_HOLIDAYObj.get("STATUS") %>">
<INPUT type="hidden" id="MODE" name="MODE" value="">
<INPUT type="hidden" id="ENTITY" name="ENTITY" value="MT_HOLIDAY">
<INPUT type="hidden" id="PARAM" name="PARAM" value="<%= (String)MT_HOLIDAYObj.get("PARAM") %>">
<INPUT type="hidden" id="PARAM1" name="PARAM1" value="<%= (String)MT_HOLIDAYObj.get("PARAM1") %>">
<INPUT type="hidden" id="PARAM2" name="PARAM2" value="<%= (String)MT_HOLIDAYObj.get("PARAM2") %>">
<INPUT type="hidden" id="PRIMARY_KEY" name="PRIMARY_KEY" value="HLD_DATE,DATE#H.HLD_TYPE#H.PUB_CODE">
<INPUT type="hidden" id="SCREEN_NAME" name="SCREEN_NAME" value="MT_HOLIDAYVIEW">
<INPUT type="hidden" id="ERRDESC" name="ERRDESC" value="<%=(String)MT_HOLIDAYObj.get("ERRDESC")%>">



   <TABLE class="headertable" cellspacing="0" cellpadding="0" width='100%'>
         <TD>&nbsp;</TD>
        <TR> 
           <TD class="heading" nowrap align="center">
            <%= field_labels.getString("MT_HOLIDAY.MT_HOLIDAY") %>
           </TD>
           <TD>&nbsp;</TD>
        </TR>
   </TABLE>
 
 <TABLE class="detailstable" cellspacing="0" cellpadding="0">

	<TR class="ste">
		<TD class="ste" nowrap>   
			<LABEL ID="HLD_DATE_label" class="userlabel"><%= field_labels.getString("MT_HOLIDAY.HLD_DATE") %><SPAN class="instreditalic">*</SPAN></LABEL>
		</TD>
		<TD class="ste" colspan="2" nowrap>
				<SELECT id="HLD_DATE" name="HLD_DATE" class="input" onChange="FieldValidation(this);"  value="" >
           <OPTION value="">Select</OPTION>
		   </SELECT>

		</TD>
	</TR>

	<TR class="ste">
		<TD class="ste" nowrap>   
			<LABEL ID="HLD_TYPE_label" class="userlabel"><%= field_labels.getString("MT_HOLIDAY.HLD_TYPE") %><SPAN class="instreditalic">*</SPAN></LABEL>
		</TD>
		<TD class="ste" colspan="2" nowrap>

		<INPUT type="radio" id="HLD_TYPE_Y" name="HLD_TYPE" onClick="FieldValidation(this);" value="Y" accessKey="Y" ><%= field_labels.getString("radio_yes") %>

		<INPUT type="radio" id="HLD_TYPE_N" name="HLD_TYPE"  onClick="FieldValidation(this);" value="N" accessKey="N" ><%= field_labels.getString("radio_no") %>

		</TD>
	</TR>

	<TR class="ste">
		<TD class="ste" nowrap>   
			<LABEL ID="PUB_CODE_label" class="userlabel"><%= field_labels.getString("MT_HOLIDAY.PUB_CODE") %></LABEL>
		</TD>
		<TD class="ste" colspan="2" nowrap>
			<INPUT type="text" id="PUB_CODE" name="PUB_CODE" class="input" size="10" onChange="FieldValidation(this);getCodeDesc('PUB_CODE','PUB_CODEDESC', 'g_pkl_publicationDesc','');" maxLength="10"  value="<%= (String)MT_HOLIDAYObj.get("PUB_CODE") %>" >

	  <INPUT type="text" id="PUB_CODEDESC" name="PUB_CODEDESC" class="input" size="50" readonly  maxLength="50" value="<%= 
	(String)MT_HOLIDAYObj.get("PUB_CODEDESC") %>" >
		<A id="PUB_CODEHLP" name="PUB_CODEHLP"  href="#" onClick="getPicklistValues('g_pkl_holidayPub','PUB_CODE','','')" class="linkblue" >?</A> &nbsp;
		
		</TD>
	</TR>	

	<TR class="ste">
		<TD class="ste" nowrap>   
			<LABEL ID="HLD_DESC_label" class="userlabel"><%= field_labels.getString("MT_HOLIDAY.HLD_DESC") %><SPAN class="instreditalic">*</SPAN></LABEL>
		</TD>
		<TD class="ste" colspan="2" nowrap>
			<INPUT type="text" id="HLD_DESC" name="HLD_DESC" class="input" size="60" onblur="FieldValidation(this);" maxLength="60"  value="<%= (String)MT_HOLIDAYObj.get("HLD_DESC") %>" >
		</TD>
	</TR>
	<TR class="ste">
		<TD class="ste" nowrap>   
			<LABEL ID="HLD_VALID_ALLYR_label" class="userlabel"><%= field_labels.getString("MT_HOLIDAY.HLD_VALID_ALLYR") %><SPAN class="instreditalic">*</SPAN></LABEL>
		</TD>
		<TD class="ste" colspan="2" nowrap>

		<INPUT type="radio" id="HLD_VALID_ALLYR_Y" name="HLD_VALID_ALLYR" onClick="FieldValidation(this);" value="Y" accessKey="Y" ><%= field_labels.getString("radio_yes") %>

		<INPUT type="radio" id="HLD_VALID_ALLYR_N" name="HLD_VALID_ALLYR"  onClick="FieldValidation(this);" value="N" accessKey="N" ><%= field_labels.getString("radio_no") %>

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
     <TR class="eventsrow1"> 
      <TD class="eventscol" align="left">
       <LABEL ID="man_label" class="instreditalic">
        <SPAN class="instreditalic"> &nbsp;&nbsp;<%= field_labels.getString("mandatory_msg") %>&nbsp;</SPAN>
       </LABEL>
      </TD>
     </TR>
     <TR class="eventsrow2"> 
      <TD class="eventscol" align="right">
<INPUT TYPE="button" value="Submit" name="Submit_label" class="button" onClick="javascript:validateSubmit()">
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