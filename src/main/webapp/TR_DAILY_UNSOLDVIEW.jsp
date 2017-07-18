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
	Logger logger = Logger.getLogger("TR_DAILY_UNSOLD");

	HashMap TR_DAILY_UNSOLDObj = (HashMap)request.getAttribute("RESPONSE");

	
	if(TR_DAILY_UNSOLDObj == null)
  		TR_DAILY_UNSOLDObj = new HashMap();
	
	String formName = "TR_DAILY_UNSOLD";

%>


<TITLE id="TR_DAILY_UNSOLD_title"><%= field_labels.getString("TR_DAILY_UNSOLD.TR_DAILY_UNSOLD_title") %></TITLE>

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
	
	document.getElementById("PARAM1").value="MODIFY";
	document.getElementById("MODE").value="VIEW";
	document.getElementById("ENTITY").value="TR_DAILY_UNSOLDVIEW";

	if(document.getElementById("MODE").value=="VIEW")
	{
		document.getElementById("ENTITY").value="TR_DAILY_UNSOLD";
	}
	setfldreadOnly('DROP_POINT','text',true);
	//setfldreadOnly('UCN_CREATION_DT','text',true);
	setfldreadOnly('UCN_CNNO','text',true);
	setfldreadOnly('RATE','text',true);
	setfldreadOnly('TOTAL_SUP','text',true);
	setfldreadOnly('COMM','text',true);
	setfldreadOnly('RET_COMM','text',true);
	setfldreadOnly('RET_TOTAL_AMT','text',true);
	setfldreadOnly('NET_AMT','text',true);
//	document.getElementById("DROP_POINTHLP").style.visibility="hidden";
}

function preSubmit()
	{
		document.getElementById("ENTITY").value="TR_DAILY_UNSOLD";
		javascript:validateSubmit();
	}

function FieldValidation(as_field_name)
{
		var l_numeric_flds = "TOTAL_SUP,RETURN_COPY,RATE,RET_TOTAL_AMT,COMM,NET_AMT,RET_COMM";

	if(l_numeric_flds.indexOf(as_field_name.name)!=-1 && as_field_name.value!="")
	{
		if(IsNumeric(as_field_name)==false) return false;
	}
	if(as_field_name.name=="SUP_DT")
	{
		getDay("SUP_DT","SUP_DAY");
	}
/*	if(as_field_name.name=="W_FLAG" && document.getElementById("W_FLAG").value=="Y")
	{
		document.getElementById("RET_W_AMT").value= parseFloat(parseFloat(document.getElementById("RET_W_AMT").value) * parseFloat(document.getElementById("WASTAGE").value));
	}
*/
	if(as_field_name.name=="RETURN_COPY")
	{
		if(as_field_name!="")
		{
			if(parseInt(document.getElementById("RETURN_COPY").value) > parseInt(document.getElementById("TOTAL_SUP").value))
			{
				alert("No of Return Copies Should Not Exceed Total Supply");
				setFocus("RETURN_COPY");
			} 

			document.getElementById("RET_TOTAL_AMT").value=parseFloat(parseFloat(document.getElementById("RATE").value)*parseInt(document.getElementById("RETURN_COPY").value));
			
			document.getElementById("RET_COMM").value=parseFloat(parseFloat(document.getElementById("RET_TOTAL_AMT").value)*parseFloat((parseInt(document.getElementById("COMM").value)/100)));

			document.getElementById("NET_AMT").value = parseFloat(parseFloat(document.getElementById("RET_TOTAL_AMT").value)-parseFloat(document.getElementById("RET_COMM").value));
		}
		else
		{
				//alert("No of return copies should be non zero.");
				document.getElementById("RETURN_COPY").value=0;
				//return false;
		}
		return true;	
	} 

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

<DIV id="TR_DAILY_UNSOLD_div" >

<FORM name="TR_DAILY_UNSOLD" id="TR_DAILY_UNSOLD" method="post" action="distAppCommonActionServlet.do">
<INPUT type="hidden" id="Event" name="Event" value="">
<INPUT type="hidden" id="MAKER" name="MAKER" value="<%= (String)TR_DAILY_UNSOLDObj.get("MAKER") %>">
<INPUT type="hidden" id="MAKER_DT" name="MAKER_DT" value="">
<INPUT type="hidden" id="STATUS" name="STATUS" value="<%= (String)TR_DAILY_UNSOLDObj.get("STATUS") %>">
<INPUT type="hidden" id="MODE" name="MODE" value="">
<INPUT type="hidden" id="ENTITY" name="ENTITY" value="TR_DAILY_UNSOLD">
<INPUT type="hidden" id="PARAM" name="PARAM" value="<%= (String)TR_DAILY_UNSOLDObj.get("PARAM") %>">
<INPUT type="hidden" id="PARAM1" name="PARAM1" value="<%= (String)TR_DAILY_UNSOLDObj.get("PARAM1") %>">
<INPUT type="hidden" id="PARAM2" name="PARAM2" value="<%= (String)TR_DAILY_UNSOLDObj.get("PARAM2") %>">
<INPUT type="hidden" id="PRIMARY_KEY" name="PRIMARY_KEY" value="A.AGN_CODE#SUP_DT,DATE#P.PUB_CODE">
<INPUT type="hidden" id="SCREEN_NAME" name="SCREEN_NAME" value="TR_DAILY_UNSOLDVIEW">
<INPUT type="hidden" id="WASTAGE" name="WASTAGE" value="<%= (String)TR_DAILY_UNSOLDObj.get("WASTAGE") %>">
<INPUT type="hidden" id="W_FLAG" name="W_FLAG" value="<%= (String)TR_DAILY_UNSOLDObj.get("W_FLAG") %>">
<INPUT type="hidden" id="ERRDESC" name="ERRDESC" value="<%= (String)TR_DAILY_UNSOLDObj.get("ERRDESC") %>">
<INPUT type="hidden" id="PARAMSTR" name="PARAMSTR" value="<%=(String)TR_DAILY_UNSOLDObj.get("PARAMSTR") %>">


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
<!--	<TR class="ste">
		<TD class="ste" nowrap>   
			<LABEL ID="CMP_CODE_label" class="userlabel"><%= field_labels.getString("TR_DAILY_UNSOLD.CMP_CODE") %><SPAN class="instreditalic">*</SPAN></LABEL>
		</TD>
		<TD class="ste" colspan="3" nowrap>
			<INPUT type="text"  id="CMP_CODE" name="CMP_CODE" class="input" size="10" maxlength="10" onChange="FieldValidation(this); getCodeDesc('CMP_CODE','CMP_CODEDESC', 'g_pkl_companyDesc','');"  value="<%= (String)TR_DAILY_UNSOLDObj.get("CMP_CODE")%>">
           	  <INPUT type="text" id="CMP_CODEDESC" name="CMP_CODEDESC" class="input" size="50" readOnly  maxLength="50" value="<%= 
	(String)TR_DAILY_UNSOLDObj.get("CMP_CODEDESC") %>" >
		<A id="CMP_CODEHLP" name="CMP_CODEHLP"  href="#" onClick="getPicklistValues('g_pkl_company','CMP_CODE','','')" class="linkblue" >?</A> &nbsp;
			</TD>
	</TR>
-->
	<TR class="ste">
	<TD class="ste" nowrap>   
			<LABEL ID="AGN_CODE_label" class="userlabel"><%= field_labels.getString("TR_DAILY_UNSOLD.AGN_CODE") %><SPAN class="instreditalic">*</SPAN></LABEL>
		</TD>
		<TD class="ste" colspan="3" nowrap>
			<INPUT type="text" id="AGN_CODE" name="AGN_CODE" class="input" size="10" onChange="FieldValidation(this);getCodeDesc('AGN_CODE,CMP_CODE,USER_ID','AGN_CODEDESC', 'g_pkl_agencyDesc','');" maxLength="10"  value="<%= (String)TR_DAILY_UNSOLDObj.get("AGN_CODE") %>" >
           	  <INPUT type="text" id="AGN_CODEDESC" name="AGN_CODEDESC" readOnly class="input" size="50" maxLength="50" value="<%= 
	(String)TR_DAILY_UNSOLDObj.get("AGN_CODEDESC") %>" >
		<A id="AGN_CODEHLP" name="AGN_CODEHLP"  href="#" onClick="getPicklistValues('g_pkl_agency','AGN_CODE','CMP_CODE,USER_ID','')" class="linkblue" >?</A> &nbsp;
		</TD>
	</TR>

	<TR class="ste">
		<TD class="ste" colspan="1" nowrap>   
			<LABEL ID="SUP_DT_label" class="userlabel"><%= field_labels.getString("TR_DAILY_UNSOLD.SUP_DT") %><SPAN class="instreditalic">*</SPAN></LABEL>
		</TD>
		<TD class="ste" nowrap>   
		<INPUT type="text" id="SUP_DT" name="SUP_DT" class="input" size="10" onblur="FieldValidation(this);" maxLength="10"  value="<%= (String)TR_DAILY_UNSOLDObj.get("SUP_DT") %>" >
		<a id="SUP_DTHLP" href="#" onClick="javascript:calendar('SUP_DT',event.screenY,event.screenX,null,null,getDatePickerPattern());"
			title="Select Date"> <img src="images/calendar.gif" width="16"
			height="16" border="0" /></a>
		</TD>

		<TD>
			<LABEL ID="SUP_DAY_label" class="userlabel"><%= field_labels.getString("TR_DAILY_UNSOLD.SUP_DAY") %><SPAN class="instreditalic">*</SPAN></LABEL>
		</TD>
		<TD class="ste" colspan="1" nowrap>
			<INPUT type="text" id="SUP_DAY" name="SUP_DAY" readOnly class="input" size="3" onblur="FieldValidation(this);" maxLength="3"  value="<%= (String)TR_DAILY_UNSOLDObj.get("SUP_DAY") %>" >
		</TD>
	</TR>

	<TR class="ste">
		<TD>
			<LABEL ID="PUB_CODE_label" class="userlabel"><%= field_labels.getString("TR_DAILY_UNSOLD.PUB_CODE") %><SPAN class="instreditalic">*</SPAN></LABEL>
		</TD>
		<TD class="ste" colspan="3" nowrap>
		<INPUT type="text" id="PUB_CODE" name="PUB_CODE" class="input" size="10" maxLength="10" onChange="FieldValidation(this);getCodeDesc('PUB_CODE,CMP_CODE','PUB_NAME', 'g_pkl_publicationDesc','');"  value="<%= (String)TR_DAILY_UNSOLDObj.get("PUB_CODE") %>">
		  <INPUT type="text" id="PUB_NAME" name="PUB_NAME" class="input" size="50" readonly  maxLength="50" value="<%= (String)TR_DAILY_UNSOLDObj.get("PUB_NAME") %>" >
			<A id="PUB_CODEHLP" name="PUB_CODEEHLP"  href="#" onClick="getPicklistValues('g_pkl_publication','PUB_CODE','CMP_CODE','')" class="linkblue" >?</A> &nbsp;
		</TD>
	</TR>
<!--
	<TR class="ste">
		<TD>
			<LABEL ID="EDT_CODE_label" class="userlabel"><%= field_labels.getString("TR_DAILY_UNSOLD.EDT_CODE") %><SPAN class="instreditalic">*</SPAN></LABEL>
		</TD>
		<TD class="ste" colspan="3" nowrap>
		<INPUT type="text" id="EDT_CODE" name="EDT_CODE" class="input" size="21" maxLength="21" onChange="FieldValidation(this);getCodeDesc('EDT_CODE,CMP_CODE,PUB_CODE,USER_ID','EDT_NAME', 'g_pkl_editionDesc','');" value="<%= (String)TR_DAILY_UNSOLDObj.get("EDT_CODE") %>">
		  <INPUT type="text" id="EDT_NAME" name="EDT_NAME" class="input" size="50" readonly  maxLength="50" value="<%= (String)TR_DAILY_UNSOLDObj.get("EDT_NAME") %>" >
			<A id="EDT_CODEHLP" name="EDT_CODEEHLP"  href="#" onClick="getPicklistValues('g_pkl_edition','EDT_CODE','PUB_CODE,USER_ID','')" class="linkblue" >?</A> &nbsp;
		</TD>
	</TR>

	<TR class="ste">
		<TD class="ste" nowrap>   
			<LABEL ID="DROP_POINT_label" class="userlabel"><%= field_labels.getString("TR_DAILY_UNSOLD.DROP_POINT") %></LABEL>
		</TD>
		<TD class="ste" colspan="3" nowrap>
			<INPUT type="text"  id="DROP_POINT" name="DROP_POINT" class="input" size="10" readonly maxlength="10" onChange="FieldValidation(this); getCodeDesc('DROP_POINT','DROP_POINTDESC', 'g_pkl_deliveryDesc','DLV_CODE')"  value="<%= (String)TR_DAILY_UNSOLDObj.get("DROP_POINT")%>">
        <INPUT type="text" id="DROP_POINTDESC" name="DROP_POINTDESC" class="input" size="50" readonly  maxLength="50" value="<%= 
	(String)TR_DAILY_UNSOLDObj.get("DROP_POINTDESC") %>" >
		<A id="DROP_POINTHLP" name="DROP_POINTHLP"  href="#" onClick="getPicklistValues('g_pkl_delivery','DROP_POINT','','')" class="linkblue" >?</A> &nbsp;
			</TD>
	</TR> -->
    <TR class="ste">
	<TD class="ste" nowrap>   
			<LABEL ID="UCN_CREATION_DT_label" class="userlabel"><%= field_labels.getString("TR_DAILY_UNSOLD.UCN_CREATION_DT") %></LABEL>
		</TD>
		<TD class="ste" colspan="3" nowrap>
			<INPUT type="text" id="UCN_CREATION_DT" name="UCN_CREATION_DT" class="input" size="10" onblur="FieldValidation(this);" maxLength="10"  value="<%= (String)TR_DAILY_UNSOLDObj.get("UCN_CREATION_DT")%>" >
		</TD>
	</TR>
	<TR class="ste">
	<TD class="ste" nowrap>   
			<LABEL ID="UCN_CNNO_label" class="userlabel"><%= field_labels.getString("TR_DAILY_UNSOLD.UCN_CNNO") %></LABEL>
		</TD>
		<TD class="ste" colspan="3" nowrap>
			<INPUT type="text" id="UCN_CNNO" name="UCN_CNNO" class="input" size="20" readonly onblur="FieldValidation(this);" maxLength="20"  value="<%= (String)TR_DAILY_UNSOLDObj.get("UCN_CNNO")%>" >
		</TD>
	</TR>

	<TR class="ste">
		<TD>
			<LABEL ID="RATE_label" class="userlabel"><%= field_labels.getString("TR_DAILY_UNSOLD.RATE") %><SPAN class="instreditalic">*</SPAN></LABEL>
		</TD>
		<TD class="ste" colspan="3" nowrap>
		<INPUT type="text" id="RATE" name="RATE" class="input" readOnly size="6" maxLength="6"  value="<%= (String)TR_DAILY_UNSOLDObj.get("RATE") %>"
			onBlur="FieldValidation(this);">
		</TD>
		</TR>

	<TR class="ste">
		<TD>
			<LABEL ID="RETURN_REASON_label" class="userlabel"><%= field_labels.getString("TR_DAILY_UNSOLD.RETURN_REASON") %></LABEL>
		</TD>
		<TD class="ste" colspan="3" nowrap>
		<INPUT type="text" id="RETURN_REASON" name="RETURN_REASON" class="input" size="30" maxLength="50"  value="<%= (String)TR_DAILY_UNSOLDObj.get("RETURN_REASON") %>"
			onBlur="FieldValidation(this);">
		</TD>
		</TR>

	<TR class="ste">
		<TD>
			<LABEL ID="TOTAL_SUP_label" class="userlabel"><%= field_labels.getString("TR_DAILY_UNSOLD.TOTAL_SUP") %><SPAN class="instreditalic">*</SPAN></LABEL>
		</TD>

		<TD class="ste" colspan="3" nowrap>
		<INPUT type="text" id="TOTAL_SUP" name="TOTAL_SUP" class="input" size="8" maxLength="8"  value="<%= (String)TR_DAILY_UNSOLDObj.get("TOTAL_SUP") %>"
			onBlur="FieldValidation(this);">
		</TD>
	</TR>

	<TR class="ste">
		<TD>
			<LABEL ID="RETURN_COPY_label" class="userlabel"><%= field_labels.getString("TR_DAILY_UNSOLD.RETURN_COPY") %><SPAN class="instreditalic">*</SPAN></LABEL>
		</TD>
		<TD class="ste" colspan="1" nowrap>
		<INPUT type="text" id="RETURN_COPY" name="RETURN_COPY" class="input" size="8" maxLength="8"  value="<%= (String)TR_DAILY_UNSOLDObj.get("RETURN_COPY") %>"
			onBlur="FieldValidation(this);">
		</TD>
<!--		<TD>
			<LABEL ID="W_FLAG_label" class="userlabel"><%= field_labels.getString("TR_DAILY_UNSOLD.W_FLAG") %><SPAN class="instreditalic">*</SPAN></LABEL>
		</TD>

		<TD class="ste" nowrap>
		<SELECT id="W_FLAG" name="W_FLAG" class="input" 
			onBlur="FieldValidation(this);" value="<%= (String)TR_DAILY_UNSOLDObj.get("W_FLAG") %>">
			<%
			String selected_y = "";
			String selected_n = "";
			if(TR_DAILY_UNSOLDObj.get("W_FLAG")!=null && TR_DAILY_UNSOLDObj.get("W_FLAG").toString().equals("Y"))
				selected_y="selected";
			else
				selected_n="selected";
			%>
			<option value="Y" <%=selected_y%>>Yes</option>
			<option value="N" <%=selected_n%>>No</option>
		</SELECT>
		</TD> -->
</TR>
	<TR class="ste">
		<TD>
			<LABEL ID="RET_TOTAL_AMT_label" class="userlabel"><%= field_labels.getString("TR_DAILY_UNSOLD.RET_TOTAL_AMT") %><SPAN class="instreditalic">*</SPAN></LABEL>
		</TD>
		<TD class="ste" colspan="1" nowrap>
		<INPUT type="text" id="RET_TOTAL_AMT" name="RET_TOTAL_AMT" class="input" size="10" maxLength="10"  value="<%= (String)TR_DAILY_UNSOLDObj.get("RET_TOTAL_AMT") %>"
			onBlur="FieldValidation(this);">
		</TD>
<!--		<TD class="ste" nowrap>   
			<LABEL ID="RET_W_AMT_label" class="userlabel"><%= field_labels.getString("TR_DAILY_UNSOLD.RET_W_AMT") %></LABEL>
		</TD>

		<TD class="ste" nowrap>
		<INPUT type="text" id="RET_W_AMT" name="RET_W_AMT" readOnly class="input" size="10" maxLength="10"  value="<%= (String)TR_DAILY_UNSOLDObj.get("RET_W_AMT") %>"
			onBlur="FieldValidation(this);">
		</TD> -->
	</TR>

	<TR class="ste">
		<TD>
			<LABEL ID="COMM_label" class="userlabel"><%= field_labels.getString("TR_DAILY_UNSOLD.COMM") %><SPAN class="instreditalic">*</SPAN></LABEL>
		</TD>
		<TD class="ste" colspan="3" nowrap>
		<INPUT type="text" id="COMM" name="COMM" class="input" size="8" maxLength="8"  value="<%= (String)TR_DAILY_UNSOLDObj.get("COMM") %>"
			onBlur="FieldValidation(this);">
		</TD>
	</TR>
		<TR class="ste">
		<TD>
			<LABEL ID="RET_COMM_label" class="userlabel"><%= field_labels.getString("TR_DAILY_UNSOLD.RET_COMM") %><SPAN class="instreditalic">*</SPAN></LABEL>
		</TD>

	<TD class="ste" colspan="3" nowrap>
		<INPUT type="text" id="RET_COMM" name="RET_COMM" class="input" size="6" maxLength="8"  value="<%= (String)TR_DAILY_UNSOLDObj.get("RET_COMM") %>"
			onBlur="FieldValidation(this);">
		</TD>
	</TR>

	<TR class="ste">
		<TD>
			<LABEL ID="NET_AMT_label" class="userlabel"><%= field_labels.getString("TR_DAILY_UNSOLD.NET_AMT") %><SPAN class="instreditalic">*</SPAN></LABEL>
		</TD>
		<TD class="ste" colspan="3" nowrap>
		<INPUT type="text" id="NET_AMT" name="NET_AMT" class="input" size="10" maxLength="10"  value="<%= (String)TR_DAILY_UNSOLDObj.get("NET_AMT") %>"
			onBlur="FieldValidation(this);">
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

		<INPUT TYPE="button" value="Save" name="Submit_label" class="button" onClick="preSubmit()">

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