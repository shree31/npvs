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
		Logger logger = Logger.getLogger("MT_ROUTE");

	HashMap MT_ROUTEObj = (HashMap)request.getAttribute("RESPONSE");
	if(MT_ROUTEObj == null)
  		MT_ROUTEObj = new HashMap();

	String formName = "MT_ROUTEVIEW";
	
%>

<TITLE id="MT_ROUTE_title"><%= field_labels.getString("MT_ROUTE.MT_ROUTE_title") %></TITLE>



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

var suppress_date_validation = false;
var suppress_number_validation = false;
// -->
</SCRIPT>
<SCRIPT Language='Javascript' type='text/javascript' src='scripts/CommonFunctions.js'> </SCRIPT>
<SCRIPT Language='Javascript' type='text/javascript' src='scripts/DatePicker.js'> </SCRIPT>

<SCRIPT type="text/javascript" language = "JavaScript">
<!--

function execute_onLoad()
{
	clearNull();
	var l_valid_flg = "<%=((String)MT_ROUTEObj.get("VALID_FLG"))%>";
	if(l_valid_flg == "N")
		document.getElementById("VALID_FLG_N").checked=true;
	else 
		document.getElementById("VALID_FLG_Y").checked=true;
}


function FieldValidation(as_field_name)
{
		var l_numeric_flds = "DISTANCE,RATEPERKM,RATE_MONTHLY,SR_NO";

	if(l_numeric_flds.indexOf(as_field_name.name)!=-1 && as_field_name.value!="")
	{
		if(IsNumeric(as_field_name)==false) return false;
	}
	return true;
}

// -->
</SCRIPT>

</HEAD>
<BODY class="mainbody" onload="execute_onLoad();">

<DIV id="MT_ROUTE_div" >

<FORM name="MT_ROUTE" id="MT_ROUTE" method="post" action="distAppCommonActionServlet.do">
<INPUT type="hidden" id="Event" name="Event" value="">
<INPUT type="hidden" id="MAKER" name="MAKER" value="<%= (String)MT_ROUTEObj.get("MAKER") %>">
<INPUT type="hidden" id="MAKER_DT" name="MAKER_DT" value="">
<INPUT type="hidden" id="STATUS" name="STATUS" value="<%= (String)MT_ROUTEObj.get("STATUS") %>">
<INPUT type="hidden" id="MODE" name="MODE" value="">
<INPUT type="hidden" id="ENTITY" name="ENTITY" value="MT_ROUTE">
<INPUT type="hidden" id="PARAM1" name="PARAM1" value="<%= (String)MT_ROUTEObj.get("PARAM1") %>">
<INPUT type="hidden" id="PARAM2" name="PARAM2" value="<%= (String)MT_ROUTEObj.get("PARAM2") %>">
<INPUT type="hidden" id="PRIMARY_KEY" name="PRIMARY_KEY" value="ROUTE_CODE">
<INPUT type="hidden" id="SCREEN_NAME" name="SCREEN_NAME" value="MT_ROUTEVIEW">
<INPUT type="hidden" id="ERRDESC" name="ERRDESC" value="<%=(String)MT_ROUTEObj.get("ERRDESC")%>">
<INPUT type="hidden" id="DONT_CHANGE" name="DONT_CHANGE" value="MAR_NAME">


  <TABLE class="headertable" cellspacing="0" cellpadding="0" width='100%'>
         <TD>&nbsp;</TD>
        <TR> 
           <TD class="heading" nowrap align="center">
            <%= field_labels.getString("MT_ROUTE.MT_ROUTE") %>
           </TD>
           <TD>&nbsp;</TD>
        </TR>
   </TABLE>

 <TABLE class="detailstable" cellspacing="0" cellpadding="0">

<TR class="ste">
		<TD class="ste" nowrap>   
			<LABEL ID="ROUTE_CODE_label" class="userlabel"><%= field_labels.getString("MT_ROUTE.ROUTE_CODE") %><SPAN class="instreditalic">*</SPAN></LABEL>
		</TD>
		<TD class="ste" colspan="2" nowrap>
			<INPUT type="text" id="ROUTE_CODE" name="ROUTE_CODE" class="input" size="10"  onChange="FieldValidation(this);getCodeDesc('ROUTE_CODE','NAME','g_pkl_routeDesc','');" maxLength="10"  value="<%= (String)MT_ROUTEObj.get("ROUTE_CODE") %>">
			<A id="ROUTE_CODEHLP" name="ROUTE_CODEHLP"  href="#" onClick="getPicklistValues('g_pkl_route','ROUTE_CODE','','')" class="linkblue" >?</A> 
		</TD>
		<TD class="ste"></TD>
	</TR>

<TR class="ste">
		<TD class="ste" nowrap>   
			<LABEL ID="NAME_label" class="userlabel"><%= field_labels.getString("MT_ROUTE.NAME") %><SPAN class="instreditalic">*</SPAN></LABEL>
		</TD>
		<TD class="ste" colspan="2" nowrap>
			<INPUT type="text" id="NAME" name="NAME" class="input" size="30"  onblur="FieldValidation(this);" maxLength="65"  value="<%= (String)MT_ROUTEObj.get("NAME") %>" >
		</TD>
		<TD class="ste"></TD>
	</TR>
<!--
	<TR class="ste">
		<TD class="ste" nowrap>   
			<LABEL ID="CMP_CODE_label" class="userlabel"><%= field_labels.getString("MT_ROUTE.CMP_CODE") %><SPAN class="instreditalic">*</SPAN></LABEL>
		</TD>
		<TD class="ste" nowrap>
			<INPUT type="text"  id="CMP_CODE" name="CMP_CODE" class="input" size="10" onChange="FieldValidation(this); getCodeDesc('CMP_CODE','CMP_CODEDESC', 'g_pkl_companyDesc','')" Value= "<%= (String)MT_ROUTEObj.get("CMP_CODE") %>">
           	  <INPUT type="text" id="CMP_CODEDESC" name="CMP_CODEDESC" class="input" size="50" readonly  maxLength="50" value="<%= 
	(String)MT_ROUTEObj.get("CMP_CODEDESC") %>" >
		<A id="CMP_CODEHLP" name="CMP_CODEHLP"  href="#" onClick="getPicklistValues('g_pkl_company','CMP_CODE','','')" class="linkblue" >?</A> &nbsp;</TD>
</TR>



<TR class="ste">
		<TD class="ste" nowrap>   
			<LABEL ID="MAR_NAME_label" class="userlabel"><%= field_labels.getString("MT_ROUTE.MAR_NAME") %></LABEL>
		</TD>
		<TD class="ste" colspan="2" nowrap>
			<INPUT type="text" id="MAR_NAME" name="MAR_NAME" class="input" size="30"  onblur="FieldValidation(this);" maxLength="65"  value="<%= (String)MT_ROUTEObj.get("MAR_NAME") %>" >
		</TD>
		<TD class="ste"></TD>
	</TR>
<TR class="ste">
		<TD class="ste" nowrap>   
			<LABEL ID="SR_NO_label" class="userlabel"><%= field_labels.getString("MT_ROUTE.SR_NO") %><SPAN class="instreditalic">*</SPAN></LABEL>
		</TD>
		<TD class="ste" colspan="2" nowrap>
			<INPUT type="text" id="SR_NO" name="SR_NO" class="input" size="10"  onblur="FieldValidation(this);" maxLength="10"  value="<%= (String)MT_ROUTEObj.get("SR_NO") %>" >
		</TD>
		<TD class="ste"></TD>
	</TR>
<TR class="ste">
		<TD class="ste" nowrap>   
			<LABEL ID="ST_PNT_label" class="userlabel"><%= field_labels.getString("MT_ROUTE.ST_PNT") %><SPAN class="instreditalic">*</SPAN></LABEL>
		</TD>
		<TD class="ste" colspan="2" nowrap>
			<INPUT type="text" id="ST_PNT" name="ST_PNT" class="input" size="30"  onblur="FieldValidation(this);" maxLength="50"  value="<%= (String)MT_ROUTEObj.get("ST_PNT") %>" >
		</TD>
		<TD class="ste"></TD>
	</TR>

<TR class="ste">
		<TD class="ste" nowrap>   
			<LABEL ID="ED_PNT_label" class="userlabel"><%= field_labels.getString("MT_ROUTE.ED_PNT") %><SPAN class="instreditalic">*</SPAN></LABEL>
		</TD>
		<TD class="ste" colspan="2" nowrap>
			<INPUT type="text" id="ED_PNT" name="ED_PNT" class="input" size="30"  onblur="FieldValidation(this);" maxLength="50"  value="<%= (String)MT_ROUTEObj.get("ED_PNT") %>" >
		</TD>
		<TD class="ste"></TD>
	</TR>

<TR class="ste">
		<TD class="ste" nowrap>   
			<LABEL ID="TRAN_MODE_label" class="userlabel"><%= field_labels.getString("MT_ROUTE.TRAN_MODE") %><SPAN class="instreditalic">*</SPAN></LABEL>
		</TD>
		<TD class="ste" nowrap>
			<INPUT type="text"  id="TRAN_MODE" name="TRAN_MODE" class="input" size="3" onChange="FieldValidation(this); getCodeDesc('TRAN_MODE','TRAN_MODEDESC', 'g_pkl_transportDesc','KEY_CODE')" Value= "<%=(String)MT_ROUTEObj.get("TRAN_MODE")%>">
           	  <INPUT type="text" id="TRAN_MODEDESC" name="TRAN_MODEDESC" class="input" size="50" readonly  maxLength="50" value="<%= 
	(String)MT_ROUTEObj.get("TRAN_MODEDESC") %>" >
		<A id="TRAN_MODEHLP" name="TRAN_MODEHLP"  href="#" onClick="getPicklistValues('g_pkl_transport','TRAN_MODE','','')" class="linkblue" >?</A> &nbsp;</TD>
	</TR>

<TR class="ste">
		<TD class="ste" nowrap>   
			<LABEL ID="VAN_NO_label" class="userlabel"><%= field_labels.getString("MT_ROUTE.VAN_NO") %></LABEL>
		</TD>
		<TD class="ste" colspan="2" nowrap>
			<INPUT type="text" id="VAN_NO" name="VAN_NO" class="input" size="16"  onblur="FieldValidation(this);" maxLength="16"  value="<%= (String)MT_ROUTEObj.get("VAN_NO") %>" >
		</TD>
		<TD class="ste"></TD>
	</TR>

<TR class="ste">
		<TD class="ste" nowrap>   
			<LABEL ID="RPT_TIME_label" class="userlabel"><%= field_labels.getString("MT_ROUTE.RPT_TIME") %></LABEL>
		</TD>
		<TD class="ste" colspan="2" nowrap>
			<INPUT type="text" id="RPT_TIME" name="RPT_TIME" class="input" size="5"  onblur="FieldValidation(this);" maxLength="5"  value="<%= (String)MT_ROUTEObj.get("RPT_TIME") %>" >
		</TD>
		<TD class="ste"></TD>
	</TR>

<TR class="ste">
		<TD class="ste" nowrap>   
			<LABEL ID="ARV_TIME_label" class="userlabel"><%= field_labels.getString("MT_ROUTE.ARV_TIME") %></LABEL>
		</TD>
		<TD class="ste" colspan="2" nowrap>
			<INPUT type="text" id="ARV_TIME" name="ARV_TIME" class="input" size="5"  onblur="FieldValidation(this);" maxLength="5"  value="<%= (String)MT_ROUTEObj.get("ARV_TIME") %>" >
		</TD>
		<TD class="ste"></TD>
	</TR>

<TR class="ste">
		<TD class="ste" nowrap>   
			<LABEL ID="DISTANCE_label" class="userlabel"><%= field_labels.getString("MT_ROUTE.DISTANCE") %></LABEL>
		</TD>
		<TD class="ste" colspan="2" nowrap>
			<INPUT type="text" id="DISTANCE" name="DISTANCE" class="input" size="8"  onblur="FieldValidation(this);" maxLength="8"  value="<%= (String)MT_ROUTEObj.get("DISTANCE") %>" >
		</TD>
		<TD class="ste"></TD>
	</TR>

<TR class="ste">
		<TD class="ste" nowrap>   
			<LABEL ID="RATEPERKM_label" class="userlabel"><%= field_labels.getString("MT_ROUTE.RATEPERKM") %></LABEL>
		</TD>
		<TD class="ste" colspan="2" nowrap>
			<INPUT type="text" id="RATEPERKM" name="RATEPERKM" class="input" size="8"  onblur="FieldValidation(this);" maxLength="8"  value="<%= (String)MT_ROUTEObj.get("RATEPERKM") %>" >
		</TD>
		<TD class="ste"></TD>
	</TR>

<TR class="ste">
		<TD class="ste" nowrap>   
			<LABEL ID="RATE_MONTHLY_LABEL" class="userlabel"><%= field_labels.getString("MT_ROUTE.RATE_MONTHLY") %></LABEL>
		</TD>
		<TD class="ste" colspan="2" nowrap>
			<INPUT type="text" id="RATE_MONTHLY" name="RATE_MONTHLY" class="input" size="8"  onblur="FieldValidation(this);" maxLength="8"  value="<%= (String)MT_ROUTEObj.get("RATE_MONTHLY") %>" >
		</TD>
		<TD class="ste"></TD>
	</TR>

<TR class="ste">
		<TD class="ste" nowrap>   
			<LABEL ID="TIME_label" class="userlabel"><%= field_labels.getString("MT_ROUTE.TIME") %></LABEL>
		</TD>
		<TD class="ste" colspan="2" nowrap>
			<INPUT type="text" id="TIME" name="TIME" class="input" size="5"  onblur="FieldValidation(this);" maxLength="5"  value="<%= (String)MT_ROUTEObj.get("TIME") %>" >
		</TD>
		<TD class="ste"></TD>
	</TR>

<TR class="ste">
	<TD class="ste" nowrap>   
			<LABEL ID="VALID_FLG_label" class="userlabel"><%= field_labels.getString("MT_ROUTE.VALID_FLG") %></LABEL>
			</TD>
	<TD class="ste" colspan="2" nowrap>

		<INPUT type="radio" id="VALID_FLG_Y" name="VALID_FLG" checked onClick="FieldValidation(this);" value="Y" accessKey="Y" ><%= field_labels.getString("radio_yes") %>

		<INPUT type="radio" id="VALID_FLG_N" name="VALID_FLG"  onClick="FieldValidation(this);" value="N" accessKey="N" ><%= field_labels.getString("radio_no") %>
-->
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
	<INPUT TYPE="button" value="Submit" name="Submit_label" class="button" onClick="javascript:validateSubmit('')">
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