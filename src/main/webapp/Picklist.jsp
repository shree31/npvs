<%@ page import="com.distapp.beans.*" %>
<%@ page import="java.util.*" %>
<%@ page import="org.apache.log4j.Logger" %>
<%GN_searchDetails obj_fetch_pick_vals = new GN_searchDetails();
ResourceBundle field_labels = ResourceBundle.getBundle("FieldLabels");
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
	response.setHeader("Cache-Control","no-private"); 
%>

<%@ page errorPage="errorpage.jsp" %>
<%@ page import="java.util.*" %>
<%@ page import="javax.servlet.http.*" %>
<%@ page import="org.apache.log4j.*" %>


<%	
	Logger logger = Logger.getLogger("Picklist");

	HashMap PicklistObj = (HashMap)request.getAttribute("RESPONSE");

	if( PicklistObj== null)
	{	
		PicklistObj = new HashMap();
	}
%>
<%
	String formName = "Picklist";
	String l_str_picklistname=null;
	String l_str_selectedvalue=new String("");
	int l_int_count = 0;
	int l_int_start_page = 0;
	int l_int_end_page = 0;
	int l_int_PageSelected = 0;
	int l_int_TotalPageNo = 0;
	int l_int_TotalRecordNo = 0;

%>

<%

 if(PicklistObj.containsKey("Selected_Value") && (String)PicklistObj.get("Selected_Value") != null)
 {
   l_str_selectedvalue = (String)PicklistObj.get("Selected_Value");
 }
  
 if(PicklistObj.containsKey("PickListName")) 			
   l_str_picklistname = (String)PicklistObj.get("PickListName"); 
 if(PicklistObj.containsKey("StartNo")) 			
   l_int_start_page =Integer.parseInt((String)PicklistObj.get("StartNo"));
 if(PicklistObj.containsKey("EndPageNo")) 			
   l_int_end_page = Integer.parseInt((String)PicklistObj.get("EndPageNo"));
 if(PicklistObj.containsKey("PageSelected")) 			
   l_int_PageSelected = Integer.parseInt((String)PicklistObj.get("PageSelected"));
 if(PicklistObj.containsKey("TotalPageNo")) 			
   l_int_TotalPageNo = Integer.parseInt((String)PicklistObj.get("TotalPageNo"));   
 if(PicklistObj.containsKey("TotalRecordNo")) 			
   l_int_TotalRecordNo = Integer.parseInt((String)PicklistObj.get("TotalRecordNo"));      
 %>

<TITLE id="Picklist_title">
<%= field_labels.getString("Picklist.Picklist_title") %>
</TITLE>

<SCRIPT Language='Javascript' type='text/javascript' src='scripts/CommonFunctions.js'> </SCRIPT>

<LINK rel='stylesheet' href='scripts/style.css' type='text/css'>

<SCRIPT Language = 'JavaScript' type='text/javascript'>

var g_str_SelectedRecordNo  = "";
var gs_main_form_name = "Picklist";
var g_str_selected  = "";
var g_str_listOptString ="";
var g_str_PageSelected = "0";

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
	if(kCode=="13")
		submitForm_all("OK");
		//return false;
}


document.onkeypress = checkCR;

</SCRIPT>

<!-- Tline JavaScript Code END -->

<SCRIPT type="text/javascript" language = "JavaScript">
function search_Record()
{
	submitForm_all();
}
function execute_onLoad()
{
	g_str_PageSelected = "<%=l_int_PageSelected%>";
	setDefaultValues();
	if(<%=PicklistObj.size()%> == false) 
	{	
		submitForm_all('OK');				
	}
}

function setDefaultValues()
{
	window.resizeTo(900,700);
	
/*	if(window.status=="To Submit")
	{
		window.status="";
		submitForm_all('OK');
	} */
}

function submitForm_all(as_event_label)
{	

	var l_arr_tokens = new Array();
	var l_arr_values = new Array();	

	l_arr_tokens[0] = "PickListName";	
	l_arr_tokens[1] = "StartNo";
	l_arr_tokens[2] = "EndPageNo";
	l_arr_tokens[3] = "TotalPageNo";
	l_arr_tokens[4] = "PageSelected";
	l_arr_tokens[5] = "TotalRecordNo";
	l_arr_tokens[6]= "SelectedRecordNo";
	l_arr_tokens[7]= "Picklist";
	l_arr_tokens[8]= "SEARCH_CRITERIA";
	l_arr_tokens[9]= "FIELD_NAME";
	l_arr_tokens[10]= "FIELD_VALUE";
	l_arr_tokens[11]= "SOURCE";
	l_arr_tokens[12]= "ACTION";
	l_arr_tokens[13]= "PicklistSearchResults";

	
	<%
	String l_str_srcName = "";
	String l_str_pklName = "";
	String  l_str_Descname="";
	String  l_str_Criteria="";
	String  l_filed_name="";
	String  l_filed_value="";

	if(PicklistObj.get("SOURCE") != null)
		l_str_srcName = (String)PicklistObj.get("SOURCE");	
	
	if(l_str_srcName != "")
		l_str_srcName = l_str_srcName;
	else
		l_str_srcName = request.getParameter("srcname");
	
	if(PicklistObj.get("SEARCH_CRITERIA") != null)
		l_str_Criteria = (String)PicklistObj.get("SEARCH_CRITERIA");	
	
	if(l_str_Criteria != "")
		l_str_Criteria = l_str_Criteria;
	else
		l_str_Criteria = request.getParameter("SEARCH_CRITERIA");

	if(l_str_Criteria==null || l_str_Criteria=="")
		l_str_Criteria="No Search Criteria";
	
	if(PicklistObj.get("PickListName") != null)
		l_str_pklName = (String)PicklistObj.get("PickListName");	
	
	if(l_str_pklName != "")
		l_str_pklName = l_str_pklName;
	else
		l_str_pklName = request.getParameter("pklname");


	%>
	var l_str_pklname = "<%=l_str_pklName%>";
	var l_str_srcname = "<%=l_str_srcName%>";

	var l_field_value=document.getElementById("FIELD_VALUE").value==""?"No Code":document.getElementById("FIELD_VALUE").value;

	if(as_event_label != "PageNumClick" && as_event_label != "Next" && as_event_label != "Previous")
	{
		as_event_label = "OK";
	}

	l_arr_values[0] =  l_str_pklname;
	l_arr_values[1] =  "<%=l_int_start_page%>";
	l_arr_values[2] =  "<%=l_int_end_page%>";
	l_arr_values[3] =  "<%=l_int_TotalPageNo%>";
	l_arr_values[4] =  g_str_PageSelected;
	l_arr_values[5] =  "<%=l_int_TotalRecordNo%>";
	l_arr_values[6] = g_str_SelectedRecordNo;
	l_arr_values[7] = "Picklist";
	l_arr_values[8] = replaceAll("<%=l_str_Criteria%>","^","#");
	l_arr_values[9] = document.getElementById("FIELD_NAME").value;
	l_arr_values[10] = l_field_value;
	l_arr_values[11] = l_str_srcname;
	l_arr_values[12] = as_event_label;
	l_arr_values[13] = document.getElementById("PicklistSearchResults").value;
	
	
	submitFormwithArgs(as_event_label,l_arr_tokens,l_arr_values);	

}

function submitForm_pageNum(as_event_label,as_pageNum)
{
	g_str_PageSelected = as_pageNum;	
	submitForm_all(as_event_label);	
	
}
function setValue(f_str_val,f_str_Desc)
{
	var str_srcname = '<%=PicklistObj.get("SOURCE")%>';
   	self.opener.document.getElementById(str_srcname).value = f_str_val;
	self.opener.document.getElementById(str_srcname).onchange();
	window.close();
}


</SCRIPT>

<jsp:useBean id="Common_distAppServlet" class="com.distapp.beans.Common_distAppServlet" scope="request" />

</HEAD>
<BODY class="mainbody" onLoad="execute_onLoad();">

<DIV id="Picklist_div" >

<FORM name="Picklist" id="Picklist" method="post" action="distAppCommonPicklistSearch.do">
<INPUT type="hidden" id="Event" name="Event" value="">
 <INPUT type="hidden" id="PickListName" name="PickListName" value="">
<INPUT type="hidden" id="Selected_Value" name="Selected_Value" value="">
<INPUT type="hidden" id="OptString_Value" name="OptString_Value" value="">
<INPUT type="hidden" id="PageSelected" name="PageSelected" value="">
<INPUT type="hidden" id="TotalPageNo" name="TotalPageNo" value="">
<INPUT type="hidden" id="EndPageNo" name="EndPageNo" value="">
<INPUT type="hidden" id="StartNo" name="StartNo" value="">
<INPUT type="hidden" id="TotalRecordNo" name="TotalRecordNo" value="">
<INPUT type="hidden" id="SelectedRecordNo" name="SelectedRecordNo" value="">
<INPUT type="hidden" id="PARAMSTR" name="PARAMSTR" value="">
<INPUT type="hidden" id="RECORD_QRY" name="RECORD_QRY" value="">
<INPUT type="hidden" id="SEARCH_CRITERIA" name="SEARCH_CRITERIA" value="">
<INPUT type="hidden" id="StartVal" name="StartVal" value="<%=(String)PicklistObj.get("StartVal") %>">
<INPUT type="hidden" id="Picklist" name="Picklist" value="">
<INPUT type="hidden" id="SOURCE" name="SOURCE" value="<%= (String)PicklistObj.get("SOURCE") %>">
<INPUT type="hidden" id="ACTION" name="ACTION" value="<%= (String)PicklistObj.get("ACTION") %>">
<INPUT type="hidden" id="PicklistSearchResults" name="PicklistSearchResults" value="">

		 <TABLE class="headertable" cellspacing="0" cellpadding="0" width="100%">
		  <TR class="eventsrow2" align="center"> 
		  <TD class="ste"  nowrap>
			 
			 <LABEL ID="Picklist_label_id" ><B>Search Parameters</B></LABEL>
			<SELECT  id="FIELD_NAME" name="FIELD_NAME" class="input" value="">
			  <OPTION value=""><%= field_labels.getString("DefaultOption") %></OPTION>
			  <%
				String l_search_params = (String)Common_distAppServlet.getPklQry().get(l_str_pklName+"search_param_name");
				String l_search_fldnm = (String)Common_distAppServlet.getPklQry().get(l_str_pklName+"search_col_name");
				String l_search_params_arr[]=l_search_params.split(",");
				String l_search_fldnm_arr[]=l_search_fldnm.split(",");
				for(int i=0;i<l_search_params_arr.length;i++)
				{
			 %>
			  <OPTION value="<%=l_search_fldnm_arr[i]%>"><%=l_search_params_arr[i]%></OPTION>
				<%
				}				 
				%>	
</SELECT>
			 </TD>
			 <TD>
			 <LABEL ID="Picklist_label_id" ><B>Enter Search value</B></LABEL>
			 <input type="text" id="FIELD_VALUE" name="FIELD_VALUE" value="">
			<button id="FIND" name="FIND" class="input" value="" onclick="search_Record()" accesskey="F"><u>F</u>ind</button>&nbsp;

		</TD>
			<TD class="buffercol">&nbsp;</TD>
		  </TR>
         </TABLE>

		<TABLE class="headertable" cellspacing="0" cellpadding="0" width="100%">
         <TR class="headerrow" align="Center" class="str" > 
           <TH class="heading"  width="100%">
           </TH>
           <TD class="headercol2" align="right" >&nbsp;</TD>
         </TR>


         </TABLE>


 <TR class="formrow2" align="right"> 
  <TD class="buffercol">&nbsp; </TD>
   <TD class= "formcol"> 	  			
    <TABLE class="eventstable" cellspacing="0" cellpadding="0" width="100%">
	 
	 <TR class="eventsrow2" align="left">     	 		    
		 <TD class="eventscol"	align="left">
	  </TD>
				 
	 </TR>
	 <TR class="eventsrow2" align="right">     	 		    
	  <TD class="eventscol" align="right" colspan = "0">		
		<% if(1 != l_int_PageSelected && 0 != l_int_PageSelected) %>
			<IMG src="images/arrowPrevious.gif" border="0" width="7" height="8" onClick="submitForm_all('Previous')">
		<%;%>
		<%if(l_int_start_page != 0){
		  for(l_int_count=l_int_start_page;l_int_count <= l_int_end_page;l_int_count++)	
		  {
			if(l_int_count != l_int_PageSelected)
			{%>		    
			<A id="First_label" name="<%=l_int_count%>" href="#" onClick= "submitForm_pageNum('PageNumClick',<%=l_int_count%>);" class="linkblue" >
			<% out.println(l_int_count);%>
			</A>&nbsp; 
			<%}
			if(l_int_count == l_int_PageSelected){
				  out.println(l_int_count);%>
				  &nbsp;
		    <%}
		  }
		}%>
		<% if(l_int_TotalPageNo != 0 && l_int_PageSelected !=  l_int_TotalPageNo) %>	
			<IMG src="images/arrowNext.gif" border="0" width="7" height="8" onClick="submitForm_all('Next')">		
		<%;%>
      </TD>
     </TR>	 
    </TABLE>		
	<%
	if(PicklistObj.containsKey("VIEWSTRING") && PicklistObj.get("VIEWSTRING") != null)
			out.println((String)PicklistObj.get("VIEWSTRING"));
	%>
	</TD>
  </TR>

	</TABLE>
</TR>
</TABLE>
</FORM>
</DIV>
</BODY>
</HTML>

<%
}
catch(Exception e)
{
	System.out.println("Exception in picklist : "+e);
	e.printStackTrace();
}
%>