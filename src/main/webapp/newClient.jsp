<%@page import="com.distapp.beans.Constants"%>
<%@page import="com.kryptos.npp.person.dao.Person"%>
<%@page import="com.distapp.beans.Common_distAppServlet"%>
<%
Person loggedInUser = (Person)session.getAttribute(Constants.LOGIN_USER_SESSION_DATA);
String userVendorID = loggedInUser.getVendorId();
Common_distAppServlet.getSysemData(userVendorID);
%>