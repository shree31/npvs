<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd"> 
<HTML>
<HEAD>

<%@ page import="com.distapp.beans.*" %>
<%@ page import="java.util.*" %>
<%@ page import="org.apache.log4j.Logger" %>
<link rel="stylesheet" type="text/css" href="scripts/style.css"/>
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

<%
if(request.getParameter("MenuEnable")==null) {

HashMap appl_menu_entitls = (HashMap)session.getAttribute("MENUITEMS");

String l_array[] = (String[])appl_menu_entitls.get("TOPMENU");
String l_main_menu = "";
%>
<div id="menu">
<%
for(int i=0;i<l_array.length;i++)
{ 
	l_main_menu = l_array[i];
	l_main_menu = l_main_menu.substring(0,1) + l_main_menu.substring(1,l_main_menu.length()).toLowerCase();
%>
<ul>
	<li><h2><div class="title"><%=l_main_menu%></div></h2>
		<ul>
			<% 
			// Code to generate side menu
			ArrayList l_side_menu_arr = (ArrayList)appl_menu_entitls.get(l_array[i]);
			
			for(int j=0;j<l_side_menu_arr.size();j++)
			{
				ArrayList l_inner_arr = (ArrayList)l_side_menu_arr.get(j);

				String l_side_menu = (String)l_inner_arr.get(0);

				String l_side_link = (String)l_inner_arr.get(1);

				String l_side_enable = (String)l_inner_arr.get(2);

				if("Y".equalsIgnoreCase(l_side_enable)){
				if("".equals(l_side_link) || l_side_link == null)
				{%>
					<div class="triangle"></div><li><A  href="#"> <%=l_side_menu%> </A>
				<%
					
					ArrayList l_sub_menu_arr = (ArrayList)appl_menu_entitls.get(l_side_menu);
					%><ul><% 
					for(int k=0;k<l_sub_menu_arr.size();k++)
					{
						
						ArrayList l_sub_arr = (ArrayList)l_sub_menu_arr.get(k);

						String l_sub_menu = (String)l_sub_arr.get(0);
						String l_sub_link = (String)l_sub_arr.get(1);

				%>	
					<li><A href="<%= l_sub_link  %>"> <%= l_sub_menu %> </A></li>
					<%} %> 
				</ul>
				</li>
				<%} 
				else
				{
					if(l_side_link.toUpperCase().endsWith(".PDF"))
					{
						%>
					<div class="triangle"></div><li> <A  target="_blank" href="<%= l_side_link %>"> <%= l_side_menu %> </A></li>
					<%}
					else {%>
						<div class="triangle"></div><li> <A href="<%= l_side_link %>"> <%= l_side_menu %> </A></li>
			<%		}
				}%>
			<%}
			}%>
		</ul>
	</li>		
</ul>
<%} }%>

</div>
</body>
</HTML>