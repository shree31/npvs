<%@page import="com.kryptos.npp.person.dao.Person"%>
<%@page import="com.kryptos.npp.person.service.PersonService"%>
<%@ page contentType="text/html; charset=utf-8"%>
<%@ include file="DISTAPPINPResourceProvider.jsp"%>
<%
	try {
%>
<HTML>
<HEAD>

<%
	response.setDateHeader("Expires", 0);
		response.setHeader("Pragma", "no-cache");
		if (request.getProtocol().equals("HTTP/1.1")) {
			response.setHeader("Cache-Control", "no-cache");
		}
%>

<%@ page errorPage="errorpage.jsp"%>
<%@ page import="java.util.*"%>
<%@ page import="javax.servlet.http.*"%>
<%@ page import="org.apache.log4j.Logger"%>
<%@ page import="com.distapp.beans.Common_distAppServlet"%>

<%
	Logger logger = Logger.getLogger("TR_BILL_EMAIL");
		HashMap TR_BILLEMAILObj = (HashMap) request
				.getAttribute("RESPONSE");

		if (TR_BILLEMAILObj == null)
			TR_BILLEMAILObj = new HashMap();

		String formName = "TR_BILL_EMAIL";
		Person loggedInUser = (Person)session.getAttribute(Constants.LOGIN_USER_SESSION_DATA);
		int mailCount = Integer.valueOf(PersonService.getSystemParms(loggedInUser).get("PENDING_EMAIL_COUNT"));
		int smsCount = Integer.valueOf(PersonService.getSystemParms(loggedInUser).get("PENDING_SMS_COUNT"));
		
%>
<LINK rel='stylesheet' href='scripts/style.css' type='text/css'>
<SCRIPT Language='Javascript' type='text/javascript'
	src='scripts/CommonFunctions.js'></SCRIPT>

<SCRIPT type="text/javascript" language="JavaScript">
	function validateSubmit() {
		document.forms[0].submit();
		return true;
	}
	function execute_onLoad() {
		clearNull();
	}
</SCRIPT>
</HEAD>
<BODY class="mainbody" onLoad="execute_onLoad()">
	<DIV id="TR_BILL_EMAIL_div">

		<FORM name="TR_BILL_EMAIL" id="TR_BILL_EMAIL" method="post"
			action="distAppCommonActionServlet.do">
			<INPUT type="hidden" id="Event" name="Event" value=""> <INPUT
				type="hidden" id="MAKER" name="MAKER"
				value="<%=(String) TR_BILLEMAILObj.get("MAKER")%>"> <INPUT
				type="hidden" id="MAKER_DT" name="MAKER_DT" value=""> <INPUT
				type="hidden" id="STATUS" name="STATUS"
				value="<%=(String) TR_BILLEMAILObj.get("STATUS")%>"> <INPUT
				type="hidden" id="MODE" name="MODE" value="BILLING"> <INPUT
				type="hidden" id="ENTITY" name="ENTITY" value="TR_BILL_EMAIL">
			<INPUT type="hidden" id="PARAM" name="PARAM"
				value="<%=(String) TR_BILLEMAILObj.get("PARAM")%>"> <INPUT
				type="hidden" id="PARAM1" name="PARAM1"
				value="<%=(String) TR_BILLEMAILObj.get("PARAM1")%>"> <INPUT
				type="hidden" id="PARAM2" name="PARAM2"
				value="<%=(String) TR_BILLEMAILObj.get("PARAM2")%>"> <INPUT
				type="hidden" id="PRIMARY_KEY" name="PRIMARY_KEY"
				value="BILL_NO#BILL_DATE"> <INPUT type="hidden"
				id="SCREEN_NAME" name="SCREEN_NAME" value="TR_BILL_EMAIL"> <INPUT
				type="hidden" id="ERRDESC" name="ERRDESC"
				value="<%=(String) TR_BILLEMAILObj.get("ERRDESC")%>"> <INPUT
				type="hidden" id="PROCESS_NAME" name="PROCESS_NAME" value="BILL_GEN">
			<INPUT type="hidden" id="BILL_FREQ" name="BILL_FREQ" value="M">
			<INPUT type="hidden" id="BILL_EDATE" name="BILL_EDATE"
				value="<%=(String) TR_BILLEMAILObj.get("BILL_EDATE")%>"> <INPUT
				type="hidden" id="BILL_SDATE" name="BILL_SDATE"
				value="<%=(String) TR_BILLEMAILObj.get("BILL_SDATE")%>"> <INPUT
				type="hidden" id="BILL_DATE" name="BILL_DATE"
				value="<%=(String) TR_BILLEMAILObj.get("BILL_DATE")%>">
			<TABLE class="headertable" cellspacing="0" cellpadding="0"
				width='100%'>
				<TR>
					<TD class="heading" nowrap align="center"><%=field_labels.getString("TR_BILL_EAMIL.TR_BILL_EAMIL")%>
					</TD>
					<TD>&nbsp;</TD>
				</TR>
			</TABLE>
			<TABLE class="detailstable" cellspacing="0" cellpadding="0">

				<TR class="ste">
					<TD class="ste" nowrap><LABEL ID="AGN_CODE_label"
						class="userlabel"><%=field_labels.getString("RPT_BILL.AGN_CODE")%></LABEL>

					</TD>
					<TD><INPUT type="text" id="AGN_CODE" name="AGN_CODE"
						class="input" size="10" maxLength="10" value=""
						onChange="getCodeDesc('AGN_CODE','AGN_NAME', 'g_pkl_agencyDesc','');">
						<INPUT type="text" id="AGN_NAME" name="AGN_NAME" class="input"
						size="50" readonly maxLength="50" value=""> <A
						id="AGN_CODEHLP" name="AGN_CODEEHLP" href="#"
						onClick="getPicklistValues('g_pkl_agency','AGN_CODE','','')"
						class="linkblue">?</A> &nbsp;</TD>
				</TR>
				<TR class="ste">
					<TD class="ste" nowrap><LABEL ID="ROUTE_CODE_label"
						class="userlabel"><%=field_labels.getString("RPT_BILL.ROUTE_CODE")%></LABEL>

					</TD>
					<TD><INPUT type="text" id="ROUTE_CODE" name="ROUTE_CODE"
						class="input" size="10" maxLength="10" value=""
						onChange="getCodeDesc('ROUTE_CODE','ROUTE_NAME', 'g_pkl_routeDesc','');">
						<INPUT type="text" id="ROUTE_NAME" name="ROUTE_NAME" class="input"
						size="50" readonly maxLength="50" value=""> <A
						id="ROUTE_CODEHLP" name="ROUTE_CODEEHLP" href="#"
						onClick="getPicklistValues('g_pkl_route','ROUTE_CODE','','')"
						class="linkblue">?</A> &nbsp;</TD>
				</TR>
				<TR class="ste">
					<TD class="ste" nowrap><LABEL ID="DLV_CODE_label"
						class="userlabel"><%=field_labels.getString("RPT_BILL.DELIVERY_CODE")%></LABEL>

					</TD>
					<TD><INPUT type="text" id="DLV_CODE" name="DLV_CODE"
						class="input" size="10"
						onChange="getCodeDesc('DLV_CODE','DLV_CODEDESC','g_pkl_deliveryDesc','');"
						maxLength="10" value="<%=(String) TR_BILLEMAILObj.get("DLV_CODE")%>">
						<INPUT type="text" id="DLV_CODEDESC" name="DLV_CODEDESC"
						class="input" size="50" readonly maxLength="50"
						value="<%=(String) TR_BILLEMAILObj.get("DLV_CODEDESC")%>" /> <A
						id="DLV_CODEHLP" name="DLV_CODEHLP" href="#"
						onClick="getPicklistValues('g_pkl_delivery','DLV_CODE','','')"
						class="linkblue">?</A> &nbsp;</TD>
				</TR>
				<TR class="ste">
					<TD class="ste" nowrap>   
			<LABEL ID="HLD_VALID_ALLYR_label" class="userlabel">Send Via<SPAN class="instreditalic">*</SPAN></LABEL>
		</TD>
		<TD class="ste" colspan="2" nowrap>

		<INPUT type="radio" id="TR_BILL_SEND_EMAIL" name="TR_BILL_SEND" checked onClick="FieldValidation(this);" value="EMAIL" accessKey="Y" >EMAIL

		<INPUT type="radio" id="TR_BILL_SEND_SMS" name="TR_BILL_SEND"  onClick="FieldValidation(this);" value="SMS" accessKey="N" >SMS

</TD>

				</TR>
				<TR class="ste">
					<TD class="ste" nowrap>
					<LABEL class="userlabel"> Balance Mail Count : <%=mailCount %></LABEL></TD>
				</TR>
				<TR class="ste">
					<TD class="ste" nowrap>
					<LABEL class="userlabel"> Balance SMS Count : <%=smsCount%></LABEL></TD>
				</TR>
				<TR class="eventsrow2">
					<TD class="eventscol" align="right">

						<div id="submit_div">

							<INPUT TYPE="button" value="Submit" name="Submit_label"
								class="button" onClick="javascript:validateSubmit()"> <INPUT
								TYPE="button" value="Clear" name="Clear_label" class="button"
								onClick="Reset_form()"> <INPUT TYPE="button"
								value="Print" name="Print_label" class="button"
								onClick="javascript:window.print()"> <INPUT
								TYPE="button" value="Back" name="Back_label" class="button"
								onClick="javascript:history.go(-1)">
						</div>
					</TD>
				</TR>
			</TABLE>
		</FORM>
	</DIV>
</BODY>
</HTML>
<%
	} catch (Exception e) {
		System.out.println("Exception e : " + e);
		e.printStackTrace();
	}
%>
