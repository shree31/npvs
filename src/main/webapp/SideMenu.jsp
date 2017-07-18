<html>
<head>

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
	Logger logger = Logger.getLogger("SIDEMENU");

	HashMap appl_menu_entitls = (HashMap)session.getAttribute("MENUITEMS");

%>
<%@ include file="DISTAPPINPResourceProvider.jsp" %>
<LINK REL=stylesheet TYPE="text/css" HREF="scripts/style.css">
</head>
<body bgcolor="#857873" leftmargin="0" topmargin="0" marginwidth="0" marginheight="0">
<DIV><TABLE border="0" cellpadding="0" cellspacing="0" height="25" width="170"><TR>

<script>
window.document.open();
window.document.writeln('<DIV><TD ID="TID1" CLASS="imageCell"><TD><TD ID="TID2" bgcolor=#000000 width="22" CLASS="imageCell">&nbsp;&nbsp;<img ID="IMGID" align="absmiddle" src="images/master.gif"></TD><TD ID="TID3" CLASS="imageCell"></TD><TD ID="TID4" bgcolor=#000000 CLASS="redbold" width="150">'+"<%=request.getParameter("MAINMENU").substring(0,1) + request.getParameter("MAINMENU").substring(1,request.getParameter("MAINMENU").length()).toLowerCase()%>"+'</TD></DIV>');
window.document.writeln('</TR></TABLE></DIV>');
window.document.writeln('<DIV CLASS="noscroll"><TABLE width="100%">');

<%
String l_main_menu = request.getParameter("MAINMENU");
String l_side_sub_menu_req = request.getParameter("SIDESUBMENU");

ArrayList l_side_menu_arr = (ArrayList)appl_menu_entitls.get(l_main_menu);
ArrayList l_sub_menu_arr = (ArrayList)appl_menu_entitls.get(l_side_sub_menu_req);

String l_side_menu="";
String l_menu_link="";

for(int i=0;i<l_side_menu_arr.size();i++)
{
	ArrayList l_inner_arr = (ArrayList)l_side_menu_arr.get(i);

	l_side_menu = (String)l_inner_arr.get(0);

	l_menu_link = (String)l_inner_arr.get(1);

	if("".equals(l_menu_link) || l_menu_link==null)
	{
	%>

	window.document.writeln('<TR><Td class="str" height="30"><B><A STYLE="TEXT-DECORATION:NONE" NAME="A1.1" ID="A1.1" <A href=SideMenu.jsp?MAINMENU='+"<%=l_main_menu%>"+'&SIDESUBMENU='+"<%=l_side_menu%>"+' target="SIDEBAR">'+"<%=l_side_menu%>"+'</a></a></B></TD></TR>');

<%
	}
	else
	{
%>
	window.document.writeln('<TR><Td class="str" height="30" nowrap><B><A STYLE="TEXT-DECORATION:NONE" NAME="A1.1" ID="A1.1" <A href="'+"<%=l_menu_link%>"+'" target="BLANK">'+"<%=l_side_menu%>"+'</a></a></B></TD></TR>');

<%
	}
if(l_side_sub_menu_req!="NoChild" || l_side_sub_menu_req!=null)
	{
		if(l_side_menu.equals(l_side_sub_menu_req))
		{
			for(int j=0;j<l_sub_menu_arr.size();j++)
			{
				ArrayList l_sub_menus = (ArrayList)l_sub_menu_arr.get(j);
				l_side_menu = (String)l_sub_menus.get(0);
				l_menu_link = (String)l_sub_menus.get(1);
%>
			window.document.writeln('<TR><B><TD class="sub" nowrap><A id="1.1.1" name="1.1.1" <A href='+"<%=l_menu_link%>"+' target="BLANK" >'+"<%=l_side_menu%>"+'</a></a></B></TD></TR>');

	<%
			}
		}
	}

}

%>
window.document.close();
</script>
</DIV></TABLE>
</body></html>
