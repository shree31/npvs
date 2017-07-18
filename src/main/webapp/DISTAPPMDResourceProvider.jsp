<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd"> 
<HTML>
<HEAD>
<%@ page import="com.distapp.beans.*" %>
<%@ page import="java.util.*" %>
<%@ page import="org.apache.log4j.Logger" %>
<script>
<%
	String g_serv_chrg_flag = "N";
	String g_comm_per_flag = "N";
	String g_bill_group_flag = "N";
	String g_sc_p_flag = "N";
	String g_base_sup_flag = "N";
	String g_late_chrg_flag = "N";
	String insstalled_at=(String)session.getAttribute("LOGIN_USR_VENDOR_ID");
	String db_name=(String)session.getAttribute("DB_NAME");
	String g_subsapp_flg = (String)(((HashMap)Common_distAppServlet.getSystemData()).get(insstalled_at+"#SUBSAPP_FLG"));
	List<String> sysParams = (List<String>)session.getAttribute("SYS_PARAMS");
	if(sysParams!=null  && sysParams.contains(insstalled_at+"#SERV_CHRG"))
		g_serv_chrg_flag = "Y";

	if(sysParams!=null  && sysParams.contains(insstalled_at+"#PUB_BASE_SUP"))
		g_base_sup_flag = "Y";

	if(sysParams!=null  && sysParams.contains(insstalled_at+"#COMM_PER"))
		g_comm_per_flag = "Y";	

	if(sysParams!=null  && sysParams.contains(insstalled_at+"#BILL_GROUP"))
		g_bill_group_flag = "Y";	
	
	if(sysParams!=null  && sysParams.contains(insstalled_at+"#SC_P") && g_serv_chrg_flag=="N")
		g_sc_p_flag = "Y";
	if(sysParams!=null  && sysParams.contains(insstalled_at+"#LT_CH"))
		g_late_chrg_flag = "Y";
	
	String holiday_lists = (String)session.getAttribute("HOLIDAY_LIST");
%>

var g_holiday_param_str = "<%=holiday_lists%>";
var g_serv_chrg_flag = "<%=g_serv_chrg_flag%>";
var g_comm_per_flag = "<%=g_comm_per_flag%>";
var g_bill_group_flag = "<%=g_bill_group_flag%>";
var g_sc_p_flag = "<%=g_sc_p_flag%>";
var g_late_chrg_flag = "<%=g_late_chrg_flag%>";
</script>

<style type="text/css" media="screen">
/**************** menu coding *****************/
#menu {
width: 100%;
background: #eee;
float: left;
}

#menu ul {
list-style: none;
margin: 0;
padding: 0;
width: 12em;
float: left;
}

#menu a, #menu h2 {
font: bold 11px/16px arial, helvetica, sans-serif;
display: block;
border-width: 1px;
border-style: solid;
border-color: #ccc #888 #555 #bbb;
margin: 0;
padding: 2px 3px;
}

#menu h2 {
color: #fff;
background: #000;
text-transform: uppercase;
}

#menu a {
color: #000;
background: #efefef;
text-decoration: none;
}

#menu a:hover {
color: #a00;
background: #fff;
}

#menu li {position: relative;}

#menu ul ul {
position: absolute;
z-index: 500;
}

#menu ul ul ul {
position: absolute;
top: 0;
left: 100%;
}

div#menu ul ul,
div#menu ul li:hover ul ul,
div#menu ul ul li:hover ul ul
{display: none;}

div#menu ul li:hover ul,
div#menu ul ul li:hover ul,
div#menu ul ul ul li:hover ul
{display: block;}

</style>
<!--[if IE]>
<style type="text/css" media="screen">
 #menu ul li {float: left; width: 100%;}
</style>
<![endif]-->
<!--[if lt IE 7]>
<style type="text/css" media="screen">
body {
behavior: url(scripts/csshover.htc);
font-size: 100%;
}

#menu ul li a {height: 1%;} 

#menu a, #menu h2 {
font: bold 0.7em/1.4em arial, helvetica, sans-serif;
}
</style>
<![endif]-->

</HEAD>
<Body>
<input type="hidden" id="CENTER" name="CENTER" value="<%=session.getAttribute("CENTER")%>">
<INPUT type="hidden" id="USER_ID" name="USER_ID" value="<%= session.getAttribute("UserId") %>">
<INPUT type="hidden" id="COMPANY" name="COMPANY" value="<%= insstalled_at %>">
<%
GN_searchDetails obj_fetch_pick_vals = new GN_searchDetails();
ResourceBundle field_labels = ResourceBundle.getBundle("FieldLabels");
%>

</body>
</HTML>