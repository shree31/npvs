<%ResourceBundle field_labels = ResourceBundle.getBundle("FieldLabels");
 %>
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
	GN_searchDetails obj_fetch_pick_vals = new GN_searchDetails();
	Logger logger = Logger.getLogger("MT_BASESUPSEARCHCALMOD");
	HashMap MT_BASESUPSEARCHCALMODObj = (HashMap)request.getAttribute("RESPONSE");

	
	if(MT_BASESUPSEARCHCALMODObj == null)
  		MT_BASESUPSEARCHCALMODObj = new HashMap();

	String formName = "MT_BASESUPSEARCHCALMOD";

%>




<TITLE id="MT_BASESUPSEARCHCALMOD_title"><%= field_labels.getString("MT_BASESUPSEARCHCALMOD.MT_BASESUPSEARCHCALMOD_title") %></TITLE>

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
// -->
</SCRIPT>
<SCRIPT Language='Javascript' type='text/javascript' src='scripts/CommonFunctions.js'> </SCRIPT>
<SCRIPT type="text/javascript" language = "JavaScript">
function FieldValidation(as_field_name)
{
		var l_numeric_flds = "";

		for(var i=1;i<32;i++)
			l_numeric_flds = l_numeric_flds + "DAY"+i+",";

	if(l_numeric_flds.indexOf(as_field_name.name)!=-1 && as_field_name.value!="")
	{
		if(IsNumeric(as_field_name)==false) return false;
	}
	return true;
}



function execute_onLoad()
{
//	getQueryResults('g_pkl_firstDay','','','DAY1_WD');
	clearNull();
//	if(g_comm_per_flag == "N")
//		document.getElementById("COMM_PER").parentElement.parentElement.style.display="none";

//	if(g_sc_p_flag == "N")
//		document.getElementById("SERV_CHRG").parentElement.parentElement.style.display="none";
	if(document.getElementById("ERRDESC").value=="SUCCESS")
		window.close();

	return true;
}

function validateSubmit(as_field_name)
{
	if(document.getElementById("PAPER_CONT").checked==true)
		document.getElementById("PAPER_CONT").value="Y";
	else
		document.getElementById("PAPER_CONT").value="N";

//	alert(document.getElementById("PAPER_CONT").value);
	document.forms[0].submit();
	//return true;
}


</SCRIPT>


<SCRIPT type="text/javascript" language = "JavaScript">
</script>
<%
String g_days[]={"Sun","Mon","Tue","Wed","Thu","Fri","Sat"};
int firstday_flg = Integer.valueOf(MT_BASESUPSEARCHCALMODObj.get("FIRSTDAY").toString()) - 1;
%>

</HEAD>
<BODY class="mainbody" onLoad="execute_onLoad()" >

<DIV id="MT_BASESUPSEARCHCALMOD_div" >

<FORM name="MT_BASESUPSEARCHCALMOD" id="MT_BASESUPSEARCHCALMOD" method="post" action="distAppCommonActionServlet.do">
<INPUT type="hidden" id="Event" name="Event" value="">
<INPUT type="hidden" id="MAKER" name="MAKER" value="<%= (String)MT_BASESUPSEARCHCALMODObj.get("MAKER") %>">
<INPUT type="hidden" id="MAKER_DT" name="MAKER_DT" value="">
<INPUT type="hidden" id="STATUS" name="STATUS" value="<%= (String)MT_BASESUPSEARCHCALMODObj.get("STATUS") %>">
<INPUT type="hidden" id="MODE" name="MODE" value="MOD">
<INPUT type="hidden" id="PARAM1" name="PARAM1" value="<%= (String)MT_BASESUPSEARCHCALMODObj.get("PARAM1") %>">
<INPUT type="hidden" id="PARAM2" name="PARAM2" value="<%= (String)MT_BASESUPSEARCHCALMODObj.get("PARAM2") %>">
<INPUT type="hidden" id="ENTITY" name="ENTITY" value="MT_AGN_NEWS_PAPER_MAP">
<INPUT type="hidden" id="SCREEN_NAME" name="SCREEN_NAME" value="MT_BASESUPSEARCHCALMOD">
<INPUT type="hidden" id="ERRDESC" name="ERRDESC" value="<%= (String)MT_BASESUPSEARCHCALMODObj.get("ERRDESC") %>">
<INPUT type="hidden" id="PRIMARY_KEY" name="PRIMARY_KEY" value="AGN_CODE#PUB_CODE">
<INPUT type="hidden" id="PARAMSTR" name="PARAMSTR" value="<%=(String)MT_BASESUPSEARCHCALMODObj.get("PARAMSTR") %>">
<INPUT type="hidden" id="AGN_CODE" name="AGN_CODE" value="<%=(String)MT_BASESUPSEARCHCALMODObj.get("AGN_CODE") %>">
<INPUT type="hidden" id="PUB_CODE" name="PUB_CODE" value="<%=(String)MT_BASESUPSEARCHCALMODObj.get("PUB_CODE") %>">
<INPUT type="hidden" id="COPY_START_DATE" name="COPY_START_DATE" value="<%=(String)MT_BASESUPSEARCHCALMODObj.get("COPY_START_DATE") %>">
<INPUT type="hidden" id="PYMT_MODE" name="PYMT_MODE" value="<%=(String)MT_BASESUPSEARCHCALMODObj.get("PYMT_MODE") %>">
<INPUT type="hidden" id="WK_SUP" name="WK_SUP" value="<%=(String)MT_BASESUPSEARCHCALMODObj.get("WK_SUP") %>">
<INPUT type="hidden" id="COPY" name="COPY" value="<%=(String)MT_BASESUPSEARCHCALMODObj.get("COPY") %>">
<INPUT type="hidden" id="COMM_PER" name="COMM_PER" value="<%=(String)MT_BASESUPSEARCHCALMODObj.get("COMM_PER") %>">
<INPUT type="hidden" id="SERV_CHRG" name="SERV_CHRG" value="<%=(String)MT_BASESUPSEARCHCALMODObj.get("SERV_CHRG") %>">
<INPUT type="hidden" id="AVD_COUPON" name="AVD_COUPON" value="<%=(String)MT_BASESUPSEARCHCALMODObj.get("AVD_COUPON") %>">
<INPUT type="hidden" id="PUB_RUN" name="PUB_RUN" value="<%=(String)MT_BASESUPSEARCHCALMODObj.get("PUB_RUN") %>">
<INPUT type="hidden" id="PUB_DAY1" name="PUB_DAY1" value="<%=(String)MT_BASESUPSEARCHCALMODObj.get("PUB_DAY1") %>">
<INPUT type="hidden" id="PUB_DAY2" name="PUB_DAY2" value="<%=(String)MT_BASESUPSEARCHCALMODObj.get("PUB_DAY2") %>">
<INPUT type="hidden" id="PUB_DT" name="PUB_DT" value="<%=(String)MT_BASESUPSEARCHCALMODObj.get("PUB_DT") %>">
<INPUT type="hidden" id="PUB_DT_ALL_FLG" name="PUB_DT_ALL_FLG" value="<%=(String)MT_BASESUPSEARCHCALMODObj.get("PUB_DT_ALL_FLG") %>">


  <TABLE class="headertable" cellspacing="0" cellpadding="0" width='100%'>
         <TD>&nbsp;</TD>
<!--         <TR> 
           <TD class="heading" nowrap align="center">
            <%= field_labels.getString("MT_BASESUPSEARCHCALMOD.MT_BASESUPSEARCHCALMOD") %>
           </TD>
           <TD>&nbsp;</TD>
        </TR> -->
   </TABLE>

 <TABLE class="detailstable" cellspacing="0" cellpadding="3">
 	<TR class="str">
		<TD class="str" nowrap>   
			<LABEL ID="AGN_CODE_label" class="userlabel"><%= field_labels.getString("MT_AGNSUPSEARCH.AGN_CODE") %></LABEL>
		</TD>
		<TD class="str" colspan="1" nowrap>
			<LABEL ID="AGN_CODE_label" class="userlabel"><%=(String)MT_BASESUPSEARCHCALMODObj.get("AGN_CODE") %></LABEL>
		</TD>
		<TD class="str" nowrap>   
			<LABEL ID="AGN_DESC_label" class="userlabel"><%= field_labels.getString("MT_AGNSUPSEARCH.AGN_CODE_NAME") %></LABEL>
		</TD>
		<TD class="str" colspan="5" nowrap>
			<LABEL ID="AGN_DESC_label" class="userlabel"><%=(String)MT_BASESUPSEARCHCALMODObj.get("AGN_NAME") %></LABEL>
	</TD>

	</TR>	


	<TR class="str">
		<TD class="str" nowrap>   
			<LABEL ID="PUB_NAME_label" class="userlabel"><%= field_labels.getString("MT_BASESUPSEARCHCALMOD.PUB_NAME") %></LABEL>
		</TD>
		<TD class="str" colspan="7" nowrap>
			<INPUT type="text" id="PUB_NAME" name="PUB_NAME" class="input" size="50" readOnly onblur="FieldValidation(this);" maxLength="10"  value="<%= (String)MT_BASESUPSEARCHCALMODObj.get("PUB_NAME") %>" >
		</TD>
	</TR>	

	<TR class="str">
		<TD class="str" nowrap>   
			<LABEL ID="COUPON_NO_label" class="userlabel"><%= field_labels.getString("COUPON_NO") %></LABEL>
		</TD>
		<TD class="str" nowrap>
			<INPUT type="text" id="COUPON_NO" name="COUPON_NO" class="input" size="20" readOnly onblur="FieldValidation(this);" maxLength="20"  value="<%= (String)MT_BASESUPSEARCHCALMODObj.get("COUPON_NO") %>" >
		</TD>
		<TD class="str" nowrap>   
			<LABEL ID="CPN_ST_DT_label" class="userlabel"><%= field_labels.getString("CPN_ST_DT") %></LABEL>
		</TD>
		<TD class="str" nowrap>
			<INPUT type="text" id="CPN_ST_DT" name="CPN_ST_DT" class="input" size="10" readOnly onblur="FieldValidation(this);" maxLength="10"  value="<%= (String)MT_BASESUPSEARCHCALMODObj.get("CPN_ST_DT") %>" >
		</TD>
		<TD class="str" nowrap>   
			<LABEL ID="CPN_EN_DT_label" class="userlabel"><%= field_labels.getString("CPN_EN_DT") %></LABEL>
		</TD>
		<TD class="str" colspan="3" nowrap>
			<INPUT type="text" id="CPN_EN_DT" name="CPN_EN_DT" class="input" size="10" readOnly onblur="FieldValidation(this);" maxLength="10"  value="<%= (String)MT_BASESUPSEARCHCALMODObj.get("CPN_EN_DT") %>" >
		</TD>
	</TR>		
<!-- 	<TR class="ste">
		<TD class="ste" nowrap>   
			<LABEL ID="COMM_PER_label" class="userlabel"><%= field_labels.getString("COMM_PER") %></LABEL>
		</TD>
		<TD class="ste" colspan="7" nowrap>
			<INPUT type="text" id="COMM_PER" name="COMM_PER" class="input" size="8" onblur="FieldValidation(this);" maxLength="6"  value="<%= (String)MT_BASESUPSEARCHCALMODObj.get("COMM_PER") %>" >
		</TD>
	</TR>	
	<TR class="ste">
		<TD class="ste" nowrap>   
			<LABEL ID="SERV_CHRG_label" class="userlabel"><%= field_labels.getString("SERV_CHRG") %></LABEL>
		</TD>
		<TD class="ste" colspan="7" nowrap>
			<INPUT type="text" id="SERV_CHRG" name="SERV_CHRG" class="input" size="8" onblur="FieldValidation(this);" maxLength="6"  value="<%= (String)MT_BASESUPSEARCHCALMODObj.get("SERV_CHRG") %>" >
		</TD>
	</TR>	
 -->	 
	<TR class="ste">
<!-- 		<TD class="ste" nowrap>   
			<LABEL ID="DAY_label" class="userlabel"><%= field_labels.getString("DAY") %></LABEL>
		</TD> -->
		<%
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
			<INPUT type="text" id="DAY<%=kd%>" name="DAY<%=kd%>" class="input" size="6" onblur="FieldValidation(this);" maxLength="6"  value="<%= MT_BASESUPSEARCHCALMODObj.get("DAY"+kd) %>" >
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
			<INPUT type="text" id="DAY29" name="DAY29" class="input" size="6" onblur="FieldValidation(this);" maxLength="6"  value="<%= MT_BASESUPSEARCHCALMODObj.get("DAY29") %>" >
		</TD>
		<TD class="ste" nowrap>   
			<INPUT type="text" id="DAY30" name="DAY30" class="input" size="6" onblur="FieldValidation(this);" maxLength="6"  value="<%= MT_BASESUPSEARCHCALMODObj.get("DAY30") %>" >
		</TD>
		<TD class="ste" nowrap>   
			<INPUT type="text" id="DAY31" name="DAY31" class="input" size="6" onblur="FieldValidation(this);" maxLength="6"  value="<%= MT_BASESUPSEARCHCALMODObj.get("DAY31") %>" >
		</TD>		

		<!--<TD class="ste" nowrap>   
			<LABEL ID="PAPER_CONT_label" class="userlabel"><%=field_labels.getString("MT_BASESUPSEARCHCALMOD.DISCONT")%><SPAN class="instreditalic">*</SPAN></LABEL>
		</TD>-->
		<TD class="ste" colspan="2" nowrap>
		<INPUT type="checkbox" id="PAPER_CONT" style="display:none" name="PAPER_CONT" <%="Y".equals(MT_BASESUPSEARCHCALMODObj.get("PAPER_CONT"))?"checked":""%> onClick="FieldValidation(this);" >
		</TD>

	</tr>

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


 		<INPUT TYPE="button" value="Submit" name="Submit_label" class="button" onClick="javascript:validateSubmit()">
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