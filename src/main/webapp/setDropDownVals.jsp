<%
	response.setDateHeader("Expires",0);
	response.setHeader("Pragma","no-cache");
	if(request.getProtocol().equals("HTTP/1.1"))
	{
		response.setHeader("Cache-Control","no-cache");
	}
%>
<%@ page import="java.util.*" %>
<%@ page import="javax.servlet.http.*" %>

<jsp:useBean id="Common_distAppServlet" class="com.distapp.beans.Common_distAppServlet" scope="request" />
<jsp:useBean id="GN_searchDetails" class="com.distapp.beans.GN_searchDetails" scope="request" />

<html>
<head>
		<TITLE></TITLE>
		<LINK HREF="scripts/style.css" REL="stylesheet" TYPE="text/css">
		<script language="JavaScript">
			function removeOption(f_str_destName)
			{
				for(i=0;self.opener.document.getElementById(f_str_destName).length;i++)
				{
					self.opener.document.getElementById(f_str_destName).remove(0);
				}
				//Inserting Blank value in destination control
				var l_obj_Option = self.opener.document.createElement("OPTION");
				l_obj_Option.text = "Select";
				l_obj_Option.value = "";
				self.opener.document.getElementById(f_str_destName).add(l_obj_Option);
			}

			function CreateOption()
			{
				var l_str_destName ="<%=request.getParameter("source")%>"; 
				//Clearing destination controls value
				removeOption(l_str_destName)
				var l_obj_Option ;
				<%
					String vendor=(String)session.getAttribute("LOGIN_USR_VENDOR_ID");
					String db_name=(String)session.getAttribute("DB_NAME");
					String pkl_name = request.getParameter("PickListName");
					String src_fld_name = request.getParameter("source");
					String criteria = request.getParameter("criteria");
					String search_Qry =(String)Common_distAppServlet.getPklQry().get(pkl_name+"search_Qry");
					String order_by =(String)Common_distAppServlet.getPklQry().get(pkl_name+"order_By");
					String l_str_query = search_Qry + order_by;
					
					String l_param_val[] = criteria.toUpperCase().split("@");
					String l_rep_str="";
					int i;

					for(i=0;i<l_param_val.length;i++)
					{
						if(i>9)
							l_rep_str = "@PARAM"+(i+1);
						else
							l_rep_str = "@PARAM0"+(i+1);

						l_str_query = l_str_query.replaceAll(l_rep_str,l_param_val[i].toUpperCase());
					}
					
					l_str_query=GN_searchDetails.finalQuery(l_str_query,db_name,vendor);

					System.out.println("l_str_query : "+l_str_query);

					ArrayList l_outer_array = GN_searchDetails.getQueryResults(l_str_query);
					String l_str_value="";

								for (int l_int_cnt=0; l_int_cnt<l_outer_array.size(); l_int_cnt++)
								{
									ArrayList l_inner_arr = (ArrayList)l_outer_array.get(l_int_cnt);
									l_str_value = l_inner_arr.get(0).toString();
									l_str_value = l_str_value.trim();
									l_str_value = l_str_value.replace((char)13,(char)32);
									l_str_value = l_str_value.replace((char)10,(char)32);
									%>
										l_obj_Option = self.opener.document.createElement("OPTION");
										l_obj_Option.text = "<%=l_str_value%>";
										l_obj_Option.value = "<%=l_str_value%>";
										self.opener.document.getElementById(l_str_destName).add(l_obj_Option);
										l_obj_Option = null; 							
									<%
								}
							%>
							window.close();
						}
		</script>
</head>
<body onload="CreateOption()">
	<form name="Criteriadropdownvals">
	</form>
</body>
</html>