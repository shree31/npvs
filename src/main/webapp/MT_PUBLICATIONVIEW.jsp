<%@ include file="DISTAPPResourceProvider.jsp" %>
<%
try
{
%>
<HTML>
<HEAD>

<%@ page contentType="text/html; charset=utf-8" %>
<%
	//request.setCharacterEncoding("UTF-8");
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
	Logger logger = Logger.getLogger("MT_PUBLICATION");

        HashMap MT_PUBLICATIONObj = (HashMap)request.getAttribute("RESPONSE");
	if(MT_PUBLICATIONObj == null)
  		MT_PUBLICATIONObj = new HashMap();

	String formName = "MT_PUBLICATION";
	%>


<TITLE id="MT_PUBLICATION_title"><%= field_labels.getString("MT_PUBLICATION.MT_PUBLICATION_title") %></TITLE>

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
<SCRIPT Language='Javascript' type='text/javascript' src='scripts/DatePicker.js'> </SCRIPT>


<SCRIPT type="text/javascript" language = "JavaScript">
function checkRunType(as_field_name)
{
	if(as_field_name.value==("D") || as_field_name.value==("d") || as_field_name.value==("W") || as_field_name.value==("w"))
	{
		setfldNonMandatory("PUB_DAY1,PUB_DAY2,PUB_DT");
		document.getElementById("PUB_DAY1").parentElement.parentElement.style.display="none";
		document.getElementById("PUB_DT").parentElement.parentElement.style.display="none";
		document.getElementById("PUB_DAYS0").parentElement.parentElement.style.display="block";
		if(as_field_name.value==("D") || as_field_name.value==("d"))
		{
			var selectedDays = document.getElementById("PUB_DAYS").value;
			<%
			for(int i=0;i<g_days.length;i++)
			{
			%>
				if(selectedDays.indexOf('<%=g_days[i].toUpperCase()%>') > -1 )
				MT_PUBLICATION.PUB_DAYS<%=i%>.checked=true;
			<%
			}
			%>
		}
		else
		{
			var selectedDays = document.getElementById("PUB_DAYS").value;
			<%
			for(int i=0;i<g_days.length;i++)
			{
			%>
				if(selectedDays.indexOf('<%=g_days[i].toUpperCase()%>') > -1 )
				MT_PUBLICATION.PUB_DAYS<%=i%>.checked=true;
				else
				MT_PUBLICATION.PUB_DAYS<%=i%>.checked=false;
			<%
			}
			%>
		}
		
	}
	else
	{
		<%
		for(int i=0;i<g_days.length;i++)
		{
		%>
			MT_PUBLICATION.PUB_DAYS<%=i%>.checked=true;
		<%
		}
		%>

		document.getElementById("PUB_DAYS0").parentElement.parentElement.style.display="none";
		if(as_field_name.value==("F") || as_field_name.value==("f"))
		{
			document.getElementById("PUB_DAY1").parentElement.parentElement.style.display="block";
			document.getElementById("PUB_DT").parentElement.parentElement.style.display="none";
			setfldMandatory("PUB_DAY1,PUB_DAY2");
			setfldNonMandatory("PUB_DT");
		}
		else if(as_field_name.value==("M") || as_field_name.value==("m")|| as_field_name.value==("Y")|| as_field_name.value==("y"))
		{
			document.getElementById("PUB_DAY1").parentElement.parentElement.style.display="none";
			document.getElementById("PUB_DT").parentElement.parentElement.style.display="block";
			setfldMandatory("PUB_DT");
			setfldNonMandatory("PUB_DAY1,PUB_DAY2");

		}

	}
	return true;
}

function pubDaysField()
{
			var CheckedPubDays=null;
	
<%
for(int i=0;i<g_days.length;i++)
		{
%>

			if(MT_PUBLICATION.PUB_DAYS<%=i%>.checked==true)
			{
					if(CheckedPubDays==null)
				{
					CheckedPubDays=MT_PUBLICATION.PUB_DAYS<%=i%>.value;
				}
				else
				{
					CheckedPubDays=CheckedPubDays+","+MT_PUBLICATION.PUB_DAYS<%=i%>.value;
				}
			}
					
		<%}%>		
			document.getElementById("PUB_DAYS").value=CheckedPubDays;
	}

function preValidateSubmit(as_event_label)
{
	var cnt =0;
	if(document.getElementById("PARAM1").value=="MODIFY")
	{
		if((document.getElementById("PUB_RUN").value == "D") || (document.getElementById("PUB_RUN").value == "d") || (document.getElementById("PUB_RUN").value == "W") || (document.getElementById("PUB_RUN").value == "w"))	
		{
			<%
			for(int i=0;i<g_days.length;i++)
			{
			%>
				if(MT_PUBLICATION.PUB_DAYS<%=i%>.checked==true)
					cnt++;
			<%
			}
			%>		

				if(((document.getElementById("PUB_RUN").value == "D") || (document.getElementById("PUB_RUN").value == "d") ) && (cnt ==0 || cnt ==1))
				{
					alert("Run Type Is Daily, So More Than 1 Publication Days Should Be Selected");
					return false;
				}
				if(((document.getElementById("PUB_RUN").value == "W") || (document.getElementById("PUB_RUN").value == "w") ) && (cnt !=1))
				{
				alert("Run Type Is Weekly, So Only 1 Publication Day Should Be Selected");
					return false;
				}
		}
	if(document.getElementById("PUB_RUN").value.toUpperCase() == "D" || document.getElementById("PUB_RUN").value.toUpperCase() == "W")
	pubDaysField();
	}
		if(document.getElementById("PUB_BASE_SUP").value=="")
		document.getElementById("PUB_BASE_SUP").value="0";

	validateSubmit();
	return true;
}
function execute_onLoad()
{
	clearNull();	
	var l_cnt_valid_flg = "<%=((String)MT_PUBLICATIONObj.get("PUB_DT_ALL_FLG"))%>";

	if(l_cnt_valid_flg == "N")
		document.getElementById("PUB_DT_ALL_FLG_N").checked=true;
	else 
		document.getElementById("PUB_DT_ALL_FLG_Y").checked=true;
	if(document.getElementById("PUB_DT").value=="00/00/0000")
		document.getElementById("PUB_DT").value="";
	checkRunType(document.getElementById("PUB_RUN"));
//	alert(document.getElementById("DIST_CDDESC").value);
	document.getElementById("CMP_CODE").parentElement.parentElement.style.display="none";
	document.getElementById("COUNTRY").parentElement.parentElement.style.display="none";
	document.getElementById("STATE").parentElement.parentElement.style.display="none";
	document.getElementById("CITY").parentElement.parentElement.style.display="none";
	document.getElementById("PUB_ADD_PIN").parentElement.parentElement.style.display="none";

//alert("..........."+document.getElementById("ERRDESC").value+"..............");
	if(document.getElementById("ERRDESC").value=="")
	{
		document.getElementById("GotoRate").style.display='none';
		document.getElementById("GotoPurRate").style.display='none';
		document.getElementById("GotoSupRate").style.display='none';
	}
if(document.getElementById("ERRDESC").value=="SUCCESS")
	{
		if(true == confirm('Do You Want to Modify Rate?'))
		{
			gotoRate();
		}

		//document.getElementById("GotoRate").style.display='blaock';
		//document.getElementById("GotoPurRate").style.display='block';
		//document.getElementById("GotoSupRate").style.display='block';
	}
	else if(document.getElementById("ERRDESC").value=="Data Loaded successfully")
	{
		// do Nothing
	}
	else
	{
		document.getElementById("GotoRate").style.display='none';
		document.getElementById("GotoPurRate").style.display='none';
		document.getElementById("GotoSupRate").style.display='none';
	}

}

function gotoRate() {
		//alert(1111);
		window.open("MT_RATEVIEW.jsp?MODE=MOD&PUB_CODE="+document.getElementById("PUB_CODE").value,"AddRate","height=550, width=1000");
		//window.document.forms[0].target="_blank";
}

function gotoPurRate() {
		window.open("MT_PURRATEVIEW.jsp?MODE=MOD&PUB_CODE="+document.getElementById("PUB_CODE").value,"AddRate","height=550, width=1000");
		//document.forms[0].target="_blank";
}

function gotoSupRate() {
		window.open("MT_SUPCHRGVEW.jsp?MODE=MOD&PUB_CODE="+document.getElementById("PUB_CODE").value,"AddRate","height=550, width=1000");
		//document.forms[0].target="_blank";
}


function FieldValidation(as_field_name)
{

	var l_numeric_flds = "PUB_PRODDAYSBEF,PUB_GUTTER,PUB_SIZEHEIGHT,PUB_NOOFCOLS,PUB_SIZEWIDTH";

	if(l_numeric_flds.indexOf(as_field_name.name)!=-1 && as_field_name.value!="")
	{
		if(IsNumeric(as_field_name)==false) return false;
	}

	if(as_field_name.name == "PUB_RUN")
		checkRunType(as_field_name);
	return true;
}

function validateForm(as_event_label)
{
	return true;
}

</SCRIPT>


<%!
String g_days[]={"Mon","Tue","Wed","Thu","Fri","Sat","Sun"};
String optionValue;
String l_selectedValue;
%>
</HEAD>
<BODY class="mainbody" onLoad="execute_onLoad()" >

<DIV id="MT_PUBLICATION_div" >

<FORM name="MT_PUBLICATION" id="MT_PUBLICATION" method="post" action="distAppCommonActionServlet.do">
<INPUT type="hidden" id="Event" name="Event" value="">
<INPUT type="hidden" id="MAKER" name="MAKER" value="<%= (String)MT_PUBLICATIONObj.get("MAKER") %>">
<INPUT type="hidden" id="MAKER_DT" name="MAKER_DT" value="">
<INPUT type="hidden" id="STATUS" name="STATUS" value="<%=(String)MT_PUBLICATIONObj.get("STATUS") %>">
<INPUT type="hidden" id="MODE" name="MODE" value="">
<INPUT type="hidden" id="ENTITY" name="ENTITY" value="MT_PUBLICATION">
<INPUT type="hidden" id="PARAM" name="PARAM" value="<%= (String)MT_PUBLICATIONObj.get("PARAM") %>">
<INPUT type="hidden" id="PARAM1" name="PARAM1" value="<%= (String)MT_PUBLICATIONObj.get("PARAM1") %>">
<INPUT type="hidden" id="PARAM2" name="PARAM2" value="<%= (String)MT_PUBLICATIONObj.get("PARAM2") %>">
<INPUT type="hidden" id="PRIMARY_KEY" name="PRIMARY_KEY" value="PUB_CODE">
<INPUT type="hidden" id="SCREEN_NAME" name="SCREEN_NAME" value="MT_PUBLICATIONVIEW">
<INPUT type="hidden" id="ERRDESC" name="ERRDESC" value="<%=(String)MT_PUBLICATIONObj.get("ERRDESC")%>">
<INPUT type="hidden" id="PUB_DAYS" name="PUB_DAYS" value="<%=(String)MT_PUBLICATIONObj.get("PUB_DAYS")%>">
<INPUT type="hidden" id="COUPON_COPY_FLAG" name="COUPON_COPY_FLAG" value="<%=(String)MT_PUBLICATIONObj.get("COUPON_COPY_FLAG")%>">

    <TABLE class="headertable" cellspacing="0" cellpadding="0" width='100%'>
         <TD>&nbsp;</TD>
        <TR> 
           <TD class="heading" nowrap align="center">
            <%= field_labels.getString("MT_PUBLICATION.MT_PUBLICATION") %>
           </TD>
           <TD>&nbsp;</TD>
        </TR>
   </TABLE>
 
 <TABLE class="detailstable" cellspacing="0" cellpadding="0">

	<TR class="ste">
		<TD class="ste" nowrap>   
			<LABEL ID="PUB_CODE_label" class="userlabel"><%= field_labels.getString("MT_PUBLICATION.PUB_CODE") %><SPAN class="instreditalic">*</SPAN></LABEL>
		</TD>
		<TD class="ste" colspan="6" nowrap>
			<INPUT type="text" id="PUB_CODE" name="PUB_CODE" class="input" size="10" onchange ="FieldValidation(this);getCodeDesc('PUB_CODE','PUB_NAME', 'g_pkl_publicationDesc','')" maxLength="10"  value="<%= (String)MT_PUBLICATIONObj.get("PUB_CODE") %>" >
		<A id="PUB_CODEHLP" name="PUB_CODEHLP"  href="#" onClick="getPicklistValues('g_pkl_publication','PUB_CODE','','')" class="linkblue" >?</A> 
		</TD>
			</TR>
	<TR class="ste">
		<TD class="ste" nowrap>   
			<LABEL ID="PUB_NAME_label" class="userlabel"><%= field_labels.getString("MT_PUBLICATION.PUB_NAME") %><SPAN class="instreditalic">*</SPAN></LABEL>
		</TD>
		<TD class="ste" colspan="2" nowrap>
			<INPUT type="text" id="PUB_NAME" name="PUB_NAME" class="input" size="65" onblur="FieldValidation(this);" maxLength="65"  value="<%= (String)MT_PUBLICATIONObj.get("PUB_NAME") %>" >
		</TD>
				<TD class="ste" nowrap>   
			<LABEL ID="DIST_CD_label" class="userlabel"><%= field_labels.getString("MT_PUBLICATION.DIST_CD") %><SPAN class="instreditalic">*</SPAN></LABEL>
		</TD>
		<TD class="ste" nowrap>
	<SELECT class="input"name='DIST_CD' id="DIST_CD" onChange="FieldValidation(this);getCodeDesc('DIST_CD','DIST_CDDESC', 'g_pkl_DistDesc','');"  onBlur="FieldValidation(this);">
		<%
			l_selectedValue=(String)MT_PUBLICATIONObj.get("DIST_CD");
			out.println("<option value=''>Select</option>");
			out.println(obj_fetch_pick_vals.createOptionValues("g_pkl_Dist",l_selectedValue,db_name,insstalled_at));
		%>
	</SELECT>

           	  <INPUT type="text" id="DIST_CDDESC" name="DIST_CDDESC" class="input" size="50" readonly  maxLength="50" value="<%=	(String)MT_PUBLICATIONObj.get("DIST_NAME")%>">
			</TD>
		

	</TR>
	<TR class="ste">
		<TD class="ste" nowrap>   
			<LABEL ID="CMP_CODE_label" class="userlabel"><%= field_labels.getString("MT_PUBLICATION.CMP_CODE") %><SPAN class="instreditalic">*</SPAN></LABEL>
		</TD>
		<TD class="ste" colspan="4" nowrap>
	<SELECT class="input"name='CMP_CODE' id="CMP_CODE" onChange="FieldValidation(this);getCodeDesc('CMP_CODE','CMP_CODEDESC', 'g_pkl_companyDesc','');"  onBlur="FieldValidation(this);" >
		<%
			l_selectedValue=(String)MT_PUBLICATIONObj.get("CMP_CODE");
			out.println("<option value=''>Select</option>");
			out.println(obj_fetch_pick_vals.createOptionValues("g_pkl_company",l_selectedValue,db_name,insstalled_at));
		%>
	</SELECT>

           	  <INPUT type="text" id="CMP_CODEDESC" name="CMP_CODEDESC" class="input" size="50" readonly  maxLength="50" value="<%=	(String)MT_PUBLICATIONObj.get("CMP_CODEDESC")%>">
			</TD>
	</TR>

	<TR class="ste">
		<TD class="ste" nowrap>   
			<LABEL ID="PUB_OLD_CODE_label" class="userlabel"><%= field_labels.getString("MT_PUBLICATION.PUB_OLD_CODE") %></LABEL>
		</TD>
		<TD class="ste" colspan="2" nowrap>
			<INPUT type="text" id="PUB_OLD_CODE" name="PUB_OLD_CODE" class="input" size="20" onblur="FieldValidation(this);" maxLength="20"  value="<%= (String)MT_PUBLICATIONObj.get("PUB_OLD_CODE") %>" >
		</TD>
			<TD class="ste" nowrap>   
			<LABEL ID="PUB_LANG_label" class="userlabel"><%= field_labels.getString("MT_PUBLICATION.PUB_LANG") %></LABEL>
		</TD>
		<TD class="ste" nowrap>
<!--			<INPUT type="text" id="PUB_LANG" name="PUB_LANG" class="input" size="10" onChange="FieldValidation(this);getCodeDesc('PUB_LANG','PUB_LANGDESC', 'g_pkl_languagueDesc','KEY_CODE');" maxLength="10"  value="<%= (String)MT_PUBLICATIONObj.get("PUB_LANG") %>" > -->
	<SELECT class="input"name='PUB_LANG' id="PUB_LANG" onChange="FieldValidation(this);getCodeDesc('PUB_LANG','PUB_LANGDESC', 'g_pkl_languagueDesc','KEY_CODE');"  onBlur="FieldValidation(this);" >
		<%
			l_selectedValue=(String)MT_PUBLICATIONObj.get("PUB_LANG");

			out.println("<option value=''>Select</option>");
			out.println(obj_fetch_pick_vals.createOptionValues("g_pkl_languague",l_selectedValue,db_name,insstalled_at));
		%>
	</SELECT>


	  <INPUT type="text" id="PUB_LANGDESC" name="PUB_LANGDESC" class="input" size="50" readonly  maxLength="50" value="<%= 
	(String)MT_PUBLICATIONObj.get("PUB_LANGDESC") %>" >
<!--		<A id="PUB_LANGHLP" name="PUB_LANGHLP"  href="#" onClick="getPicklistValues('g_pkl_languague','PUB_LANG','','')" class="linkblue" >?</A> &nbsp; -->
			</TD>

	</TR>
	
	<TR class="ste">
		<TD class="titlehead" colspan="6" nowrap>
			<LABEL ID="HEADER1"><%= field_labels.getString("MT_PUBLICATION.HEADER1") %></LABEL>
		</TD>
	</TR>
	
	<TR class="ste">
		<TD class="ste" nowrap>   
			<LABEL ID="PUB_ADD1_label" class="userlabel"><%= field_labels.getString("MT_PUBLICATION.PUB_ADD1") %></LABEL>
		</TD>
		<TD class="ste" colspan="2" nowrap>
			<INPUT type="text" id="PUB_ADD1" name="PUB_ADD1" class="input" size="60" onblur="FieldValidation(this);" maxLength="60"  value="<%= (String)MT_PUBLICATIONObj.get("PUB_ADD1") %>" >
		</TD>
		<TD class="ste" nowrap>   
			<LABEL ID="PUB_WEBADD_label" class="userlabel"><%= field_labels.getString("MT_PUBLICATION.PUB_WEBADD") %></LABEL>
		</TD>
		<TD class="ste" colspan="2" nowrap>
			<INPUT type="text" id="PUB_WEBADD" name="PUB_WEBADD" class="input" size="60" onblur="FieldValidation(this);" maxLength="60"  value="<%= (String)MT_PUBLICATIONObj.get("PUB_WEBADD") %>" >
		</TD>

		</TR>
	<TR class="ste">
			<TD class="ste" nowrap>   
			<LABEL ID="PUB_ADD2_label" class="userlabel"><%= field_labels.getString("MT_PUBLICATION.PUB_ADD2") %></LABEL>
		</TD>
		<TD class="ste" colspan="2" nowrap>
			<INPUT type="text" id="PUB_ADD2" name="PUB_ADD2" class="input" size="60" onblur="FieldValidation(this);" maxLength="60"  value="<%= (String)MT_PUBLICATIONObj.get("PUB_ADD2") %>" >
		</TD>
			<TD class="ste" nowrap>   
			<LABEL ID="PUB_CONEMAIL_label" class="userlabel"><%= field_labels.getString("MT_PUBLICATION.PUB_CONEMAIL") %></LABEL>
		</TD>
		<TD class="ste" colspan="2" nowrap>
			<INPUT type="text" id="PUB_CONEMAIL" name="PUB_CONEMAIL" class="input" size="60" onblur="FieldValidation(this);" maxLength="60"  value="<%= (String)MT_PUBLICATIONObj.get("PUB_CONEMAIL") %>" >
		</TD>

	</TR>
	<TR class="ste">
		<TD class="ste" nowrap>   
			<LABEL ID="COUNTRY_label" class="userlabel"><%= field_labels.getString("MT_PUBLICATION.COUNTRY") %></LABEL>
		</TD>
		<TD class="ste" colspan="4" nowrap>
			<INPUT type="text" id="COUNTRY" name="COUNTRY" class="input" size="10" readonly onChange="FieldValidation(this);getCodeDesc('COUNTRY','COUNTRYDESC','g_pkl_countryDesc','KEY_CODE');" maxLength="10"  value="<%= (String)MT_PUBLICATIONObj.get("COUNTRY") %>" >
	  <INPUT type="text" id="COUNTRYDESC" name="COUNTRYDESC" class="input" size="50" readonly  maxLength="50" value="<%= 
	(String)MT_PUBLICATIONObj.get("COUNTRYDESC") %>" >
			<A id="COUNTRYHLP" name="COUNTRYHLP"  href="#" onClick="getPicklistValues('g_pkl_country','COUNTRY','','')" class="linkblue" >?</A> &nbsp;


			</TD>
			</TR>
	<TR class="ste">
		<TD class="ste" nowrap>   
			<LABEL ID="STATE_label" class="userlabel"><%= field_labels.getString("MT_PUBLICATION.STATE") %></LABEL>
		</TD>
		<TD class="ste" colspan="4" nowrap>
			<INPUT type="text" id="STATE" name="STATE" class="input" size="10" onChange="FieldValidation(this);getCodeDesc('STATE','STATEDESC','g_pkl_stateDesc','KEY_CODE');" maxLength="10"  value="<%= (String)MT_PUBLICATIONObj.get("STATE") %>" >

	  <INPUT type="text" id="STATEDESC" name="STATEDESC" class="input" size="50" readonly  maxLength="50" value="<%= 
	(String)MT_PUBLICATIONObj.get("STATEDESC") %>" >
		<A id="STATEHLP" name="STATEHLP"  href="#" onClick="getPicklistValues('g_pkl_state','STATE','COUNTRY','KEY_TYPE')" class="linkblue" >?</A> &nbsp;
			</TD>
	</TR>
	<TR class="ste">
		<TD class="ste" nowrap>   
			<LABEL ID="CITY_label" class="userlabel"><%= field_labels.getString("MT_PUBLICATION.CITY") %></LABEL>
		</TD>
		<TD class="ste" colspan="2" nowrap>
			<INPUT type="text" id="CITY" name="CITY" class="input" size="10" onChange="FieldValidation(this);getCodeDesc( 'CITY','CITYDESC','g_pkl_cityDesc','KEY_CODE');" maxLength="10"  value="<%= (String)MT_PUBLICATIONObj.get("CITY") %>" >

	  <INPUT type="text" id="CITYDESC" name="CITYDESC" class="input" size="50" readonly  maxLength="50" value="<%= 
	(String)MT_PUBLICATIONObj.get("CITYDESC") %>" >
		<A id="CITYHLP" name="CITYHLP"  href="#" onClick="getPicklistValues('g_pkl_city','CITY','STATE','KEY_TYPE')" class="linkblue" >?</A> &nbsp;
			</TD>
			</TR>
			<TR>
			<TD class="ste" nowrap>   
			<LABEL ID="PUB_TEL_label" class="userlabel"><%= field_labels.getString("MT_PUBLICATION.PUB_TEL") %></LABEL>
		</TD>
		<TD class="ste" colspan="2" nowrap>
			<INPUT type="text" id="PUB_TEL" name="PUB_TEL" class="input" size="20" onblur="FieldValidation(this);" maxLength="20"  value="<%= (String)MT_PUBLICATIONObj.get("PUB_TEL") %>" >
		</TD>
			</TR>
	<TR class="ste">
		<TD class="ste" nowrap>   
			<LABEL ID="PUB_ADD_PIN_label" class="userlabel"><%= field_labels.getString("MT_PUBLICATION.PUB_ADD_PIN") %></LABEL>
		</TD>
		<TD class="ste" colspan="2" nowrap>
			<INPUT type="text" id="PUB_ADD_PIN" name="PUB_ADD_PIN" class="input" size="6" onblur="FieldValidation(this);" maxLength="6"  value="<%= (String)MT_PUBLICATIONObj.get("PUB_ADD_PIN") %>" >
		</TD>
		<TD class="ste" nowrap>   
			<LABEL ID="PUB_FAX_label" class="userlabel"><%= field_labels.getString("MT_PUBLICATION.PUB_FAX") %></LABEL>
		</TD>
		<TD class="ste" colspan="2" nowrap>
			<INPUT type="text" id="PUB_FAX" name="PUB_FAX" class="input" size="20" onblur="FieldValidation(this);" maxLength="20"  value="<%= (String)MT_PUBLICATIONObj.get("PUB_FAX") %>" >
		</TD>
	</TR>
	<TR class="ste">
		<TD class="titlehead" colspan="6" nowrap>
			<LABEL ID="HEADER2"><%= field_labels.getString("MT_PUBLICATION.HEADER2") %></LABEL>
		</TD>
	</TR>
	
	<TR class="ste">
		<TD class="ste" nowrap>   
			<LABEL ID="PUB_TYPE_label" class="userlabel"><%= field_labels.getString("MT_PUBLICATION.PUB_TYPE") %></LABEL>
		</TD>
		<TD class="ste" colspan="2" nowrap>
<!--			<INPUT TYPE="text"  id="PUB_TYPE" name="PUB_TYPE" class="input" onChange="FieldValidation(this); getCodeDesc('PUB_TYPE','PUB_TYPEDESC', 'g_pkl_pubtypeDesc','KEY_CODE');" maxlength="10" value="<%=(String)MT_PUBLICATIONObj.get("PUB_TYPE") %>"> -->
<SELECT class="input"name='PUB_TYPE' id="PUB_TYPE" onChange="FieldValidation(this);getCodeDesc('PUB_TYPE','PUB_TYPEDESC', 'g_pkl_pubtypeDesc','KEY_CODE');"  onBlur="FieldValidation(this);" value="<%=(String)MT_PUBLICATIONObj.get("PUB_TYPE") %>">
		<%
			l_selectedValue=(String)MT_PUBLICATIONObj.get("PUB_TYPE");
			out.println("<option value=''>Select</option>");
			out.println(obj_fetch_pick_vals.createOptionValues("g_pkl_pubtype",l_selectedValue,db_name,insstalled_at));
		%>
	</SELECT>
          
			  <INPUT type="text" id="PUB_TYPEDESC" name="PUB_TYPEDESC" class="input" size="10" readonly  maxLength="10" value="<%= 
	(String)MT_PUBLICATIONObj.get("PUB_TYPEDESC") %>" >
		<!--<A id="PUB_TYPEHLP" name="PUB_TYPEHLP"  href="#" onClick="getPicklistValues('g_pkl_pubtype','PUB_TYPE','','')" class="linkblue" >?</A> &nbsp; -->
			</TD>
		<TD class="ste" nowrap>   
			<LABEL ID="PUB_RUN_label" class="userlabel"><%= field_labels.getString("MT_PUBLICATION.PUB_RUN") %></LABEL>
		</TD>
		<TD class="ste" colspan="2" nowrap>
<!--			<INPUT TYPE="text"  id="PUB_RUN" name="PUB_RUN" class="input" onChange="FieldValidation(this); getCodeDesc('PUB_RUN','PUB_RUNDESC', 'g_pkl_pubruntypeDesc','KEY_CODE')" maxlength="10" value="<%=(String)MT_PUBLICATIONObj.get("PUB_RUN")%>"> -->
	<SELECT class="input"name='PUB_RUN' id="PUB_RUN" onChange="FieldValidation(this);getCodeDesc('PUB_RUN','PUB_RUNDESC', 'g_pkl_pubruntypeDesc','KEY_CODE');"  onBlur="FieldValidation(this);" value="<%=(String)MT_PUBLICATIONObj.get("PUB_RUN")%>">
		<%
			l_selectedValue=(String)MT_PUBLICATIONObj.get("PUB_RUN");
			out.println("<option value=''>Select</option>");
			out.println(obj_fetch_pick_vals.createOptionValues("g_pkl_pubruntype",l_selectedValue,db_name,insstalled_at));
		%>
	</SELECT>

           
			  <INPUT type="text" id="PUB_RUNDESC" name="PUB_RUNDESC" class="input" size="10" readonly  maxLength="10" value="<%= 
	(String)MT_PUBLICATIONObj.get("PUB_RUNDESC") %>" >
<!--		<A id="PUB_RUNHLP" name="PUB_RUNHLP"  href="#" onClick="getPicklistValues('g_pkl_pubruntype','PUB_RUN','','')" class="linkblue" >?</A> &nbsp; -->
			</TD>
	</TR>
	<TR class="ste">
		<TD class="ste" nowrap>   
			<LABEL ID="PUB_DAYS_label" class="userlabel"><%= field_labels.getString("MT_PUBLICATION.PUB_DAYS") %></LABEL>
		</TD>
		<TD class="ste" colspan="4" nowrap>
		<%
		String flag = "";
		for(int i=0;i<g_days.length;i++)
		{
//			flag = weekly_supply.charAt((int)j-1%7)=='Y'?"checked":"";

		%>
			<INPUT type="checkbox" id="PUB_DAYS<%=i%>" name="PUB_DAYS<%=i%>" class="userlabel" size="7" onblur="FieldValidation(this);" maxLength="7"  value="<%= g_days[i]%>"><%= g_days[i]%>&nbsp;&nbsp;
		<%
			}
		%>
		</TD>
	</TR>
	<TR class="ste">
		<TD class="ste" nowrap>   
			<LABEL ID="PUB_DAY1_label" class="userlabel"><%= field_labels.getString("MT_PUBLICATION.PUB_DAY1") %></LABEL>
		</TD>
		<TD class="ste" colspan="2" nowrap>
			<SELECT  id="PUB_DAY1" name="PUB_DAY1" class="input" onChange="FieldValidation(this);" value="<%=(String)MT_PUBLICATIONObj.get("PUB_DAY1")%>">
          		<%
			l_selectedValue=(String)MT_PUBLICATIONObj.get("PUB_DAY1");
			out.println("<option value=''>Select</option>");
			out.println(obj_fetch_pick_vals.createOptionValues("g_pkl_days1",l_selectedValue,db_name,insstalled_at));
		%>
          </SELECT>

		</TD>

		<TD class="ste" nowrap>   
			<LABEL ID="PUB_DAY2_label" class="userlabel"><%= field_labels.getString("MT_PUBLICATION.PUB_DAY2") %></LABEL>
		</TD>
		<TD class="ste" colspan="2" nowrap>
			<SELECT  id="PUB_DAY2" name="PUB_DAY2" class="input" onChange="FieldValidation(this);" value="<%=(String)MT_PUBLICATIONObj.get("PUB_DAY2")%>">
          		<%
			l_selectedValue=(String)MT_PUBLICATIONObj.get("PUB_DAY2");
			out.println("<option value=''>Select</option>");
			out.println(obj_fetch_pick_vals.createOptionValues("g_pkl_days2",l_selectedValue,db_name,insstalled_at));
		%>
          </SELECT>

		</TD>

		</TR>
	<TR class="ste">
		<TD class="ste" nowrap>   
			<LABEL ID="PUB_DT_label" class="userlabel"><%= field_labels.getString("MT_PUBLICATION.PUB_DT") %></LABEL>
		</TD>
		<TD class="ste" colspan="2" nowrap>
			<INPUT type="text" id="PUB_DT" name="PUB_DT" class="input" size="10" onblur="FieldValidation(this);" maxLength="10"  value="<%= (String)MT_PUBLICATIONObj.get("PUB_DT") %>" >
			<a id="PUB_DTHLP" href="#"  onClick="javascript:calendar('PUB_DT',event.screenY,event.screenX,null,null,getDatePickerPattern());"
			title="Select Date"> <img src="images/calendar.gif" width="16"
			height="16" border="0" /></a>
		</TD>
		<TD class="ste" nowrap>   
			<LABEL ID="PUB_DT_ALL_FLG_label" class="userlabel"><%= field_labels.getString("MT_PUBLICATION.PUB_DT_ALL_FLG") %></LABEL>
		</TD>
		<TD class="ste" colspan="2" nowrap>
		<INPUT type="radio" id="PUB_DT_ALL_FLG_Y" name="PUB_DT_ALL_FLG" checked onClick="FieldValidation(this);" value="Y" accessKey="Y" ><%= field_labels.getString("radio_yes") %>

		<INPUT type="radio" id="PUB_DT_ALL_FLG_N" name="PUB_DT_ALL_FLG"  onClick="FieldValidation(this);" value="N" accessKey="N" ><%= field_labels.getString("radio_no") %>

	</TR>
		<TR class="ste">
		<TD class="ste" nowrap>   
			<LABEL ID="PUB_BASE_SUP_label" class="userlabel"><%= field_labels.getString("MT_PUBLICATION.PUB_BASE_SUP") %></LABEL>
		</TD>
		<TD class="ste" colspan="2" nowrap>
			<INPUT type="text" id="PUB_BASE_SUP" name="PUB_BASE_SUP" class="input" size="10" onblur="FieldValidation(this);" maxLength="10"  value="<%= (String)MT_PUBLICATIONObj.get("PUB_BASE_SUP") %>" >
		</TD>
</TR>


	<TR class="ste">
		
	</TR>
	<TR class="ste">
		
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
	  
	     <INPUT TYPE="button" value="Submit" name="Submit_label" class="button" onClick="javascript:preValidateSubmit()">
		<INPUT TYPE="button" value="Back" name="Back_label" class="button"  onClick="javascript:history.go(-1)">
		<INPUT TYPE="button" id="GotoRate" value="Add/Modify Rate"  class="button"  onClick="gotoRate()">
		<INPUT TYPE="button" id="GotoPurRate" value="Add/Modify PurRate"  class="button"  onClick="gotoPurRate()">
		<INPUT TYPE="button" id="GotoSupRate" value="Add/Modify SupRate"  class="button"  onClick="gotoSupRate()">


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