<%@ include file="DISTAPPINPResourceProvider.jsp" %>
<%try { %>
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
	Logger logger = Logger.getLogger("MT_USERCRN");

	HashMap MT_USERCRNObj = (HashMap)request.getAttribute("RESPONSE");

	
	if(MT_USERCRNObj == null)
  		MT_USERCRNObj = new HashMap();

	String formName = "MT_USERCRN";

%>

<%
	%>
<%
%>
<TITLE id="MT_USERCRN_title"><%= field_labels.getString("MT_USERCRN.MT_USERCRN_title") %></TITLE>

<LINK rel='stylesheet' href='scripts/style.css' type='text/css'>
<SCRIPT Language='Javascript' type='text/javascript' src='scripts/CommonFunctions.js'></SCRIPT>
<SCRIPT type='text/javascript' language = 'JavaScript' src='DatePicker.js'></SCRIPT>
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
		SaveForm('Save');
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
}

function FieldValidation(as_field_name)
{
	return true;
}

function validateForm(as_event_label)
{
	return true;
}

function getMultiple(ob)
{
	var l_selected_value_lst="";
    for (var i=0;i<ob.length;i++)//ob.selectedIndex != -1)
    {
		//alert(ob.selectedIndex);
        //if (ob.selectedIndex != 0) 
        if (ob.options[i].selected==true) 
		{
			if(l_selected_value_lst!="")
				l_selected_value_lst = l_selected_value_lst + ob.options[i].value + ";";
			else
				l_selected_value_lst = ob.options[i].value + ";";
	        //ob.options[ob.selectedIndex].selected = false;
		}
		//else
    }
	
	//alert(l_selected_value_lst);

	if(ob.name=="MNU_LST")
	{
		document.getElementById("TOP_MENU_LIST").value=l_selected_value_lst;
	}
	if(ob.name=="CNT_LST")
	{
		document.getElementById("CNT_CODE_LST").value=l_selected_value_lst;
	}

}

</SCRIPT>


<SCRIPT type="text/javascript" language = "JavaScript">
</script>

</HEAD>
<BODY class="mainbody" onLoad="execute_onLoad()" >

<DIV id="MT_USERCRN_div" >

<FORM name="MT_USERCRN" id="MT_USERCRN" method="post" action="distAppCommonActionServlet.do">
<INPUT type="hidden" id="MAKER" name="MAKER" value="<%= (String)MT_USERCRNObj.get("MAKER") %>">
<INPUT type="hidden" id="MAKER_DT" name="MAKER_DT" value="<%= (java.util.Date)MT_USERCRNObj.get("MAKER_DT")%>">
<INPUT type="hidden" id="STATUS" name="STATUS" value="<%= (String)MT_USERCRNObj.get("STATUS") %>">
<INPUT type="hidden" id="MODE" name="MODE" value="INP">
<INPUT type="hidden" id="ENTITY" name="ENTITY" value="ST_USER">
<INPUT type="hidden" id="PARAM" name="PARAM" value="<%= (String)MT_USERCRNObj.get("PARAM") %>">
<INPUT type="hidden" id="PRIMARY_KEY" name="PRIMARY_KEY" value="USR_ID">
<INPUT type="hidden" id="PARAM1" name="PARAM1" value="<%= (String)MT_USERCRNObj.get("PARAM1") %>">
<INPUT type="hidden" id="PARAM2" name="PARAM2" value="<%= (String)MT_USERCRNObj.get("PARAM2") %>">
<INPUT type="hidden" id="SCREEN_NAME" name="SCREEN_NAME" value="MT_USERCRN">
<INPUT type="hidden" id="DONT_CHANGE" name="DONT_CHANGE" value="ENC">
<INPUT type="hidden" id="ERRDESC" name="ERRDESC" value="<%=(String)MT_USERCRNObj.get("ERRDESC")%>">
<INPUT type="hidden" id="TOP_MENU_LIST" name="TOP_MENU_LIST" value="<%=(String)MT_USERCRNObj.get("TOP_MENU_LIST")%>">
<INPUT type="hidden" id="CNT_CODE_LST" name="CNT_CODE_LST" value="<%=(String)MT_USERCRNObj.get("CNT_CODE_LST")%>">


 <TABLE class="headertable" cellspacing="0" cellpadding="0" width='100%'>
         <TD>&nbsp;</TD>
        <TR> 
           <TD class="heading" nowrap align="center">
            <%= field_labels.getString("MT_USERCRN.MT_USERCRN") %>
           </TD>
           <TD>&nbsp;</TD>
        </TR>
   </TABLE>
 <TABLE class="detailstable" cellspacing="0" cellpadding="0">

	<TR class="ste">
		<TD class="ste" nowrap>   
			<LABEL ID="USR_ID_label" class="userlabel"><%= field_labels.getString("MT_USERCRN.USR_ID") %><SPAN class="instreditalic">*</SPAN></LABEL>
		</TD>
		<TD class="ste" colspan="2" nowrap>
			<INPUT type="text" id="USR_ID" name="USR_ID" class="input" size="15" onblur="FieldValidation(this);" maxLength="15"  value="<%= (String)MT_USERCRNObj.get("USR_ID") %>" >
		</TD>
	</TR>
	<TR class="ste">
		<TD class="ste" nowrap>   
			<LABEL ID="USR_NAME_label" class="userlabel"><%= field_labels.getString("MT_USERCRN.USR_NAME") %><SPAN class="instreditalic">*</SPAN></LABEL>
		</TD>
		<TD class="ste" colspan="2" nowrap>
			<INPUT type="text" id="USR_NAME" name="USR_NAME" class="input" size="30" onblur="FieldValidation(this);" maxLength="65"  value="<%= (String)MT_USERCRNObj.get("USR_NAME") %>" >
		</TD>
	</TR>
		<TR class="ste">
		<TD class="ste" nowrap>   
			<LABEL ID="USR_PWD_label" class="userlabel"><%= field_labels.getString("MT_USERCRN.ENC") %><SPAN class="instreditalic">*</SPAN></LABEL>
		</TD>
		<TD class="ste" colspan="2" nowrap>
			<INPUT type="Password" id="ENC" name="ENC" class="input" size="20" onblur="FieldValidation(this);" maxLength="20"  value="<%= (String)MT_USERCRNObj.get("ENC") %>" >
		</TD>
	</TR>

 	<TR class="ste">
		<TD class="ste" nowrap>   
			<LABEL ID="USR_TYPE_label" class="userlabel"><%= field_labels.getString("MT_USERCRN.USR_TYPE") %></LABEL>
		</TD>
		<TD class="ste" colspan="2" nowrap>
			<select type="text" id="USR_TYPE" name="USR_TYPE" class="input" onblur="FieldValidation(this);"  value="<%= (String)MT_USERCRNObj.get("USR_TYPE") %>" >
			<option value='A'>ADMIN</option>
			<option value='N'>NORMAL</option>
			</SELECT>
		</TD>
	</TR>
	<TR class="ste">
		<TD class="ste" nowrap>   
			<LABEL ID="MNU_LST_label" class="userlabel"><%= field_labels.getString("MT_USERCRN.MNU_LST") %></LABEL>
		</TD>
		<TD class="ste" colspan="2" nowrap>
		<select name='MNU_LST' multiple='multiple' onblur='getMultiple(this);'>
		<%
			out.println(obj_fetch_pick_vals.createOptionValues("g_pkl_topMenu","",db_name,insstalled_at));
		%>
		</SELECT>
		</TD>
	</TR>
	<TR class="ste">
		<TD class="ste" nowrap>   
			<LABEL ID="CNT_LST_label" class="userlabel"><%= field_labels.getString("MT_USERCRN.CNT_LST") %></LABEL>
		</TD>
		<TD class="ste" colspan="2" nowrap>
		<select name='CNT_LST' multiple='multiple' onblur='getMultiple(this);'>
		<%
			out.println(obj_fetch_pick_vals.createOptionValues("g_pkl_Usercenter","",db_name,insstalled_at));
		%>
				</SELECT>

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
<%} catch(Exception e) {e.printStackTrace();} %>