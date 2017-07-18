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
			<%
			for(int i=0;i<g_days.length;i++)
			{
			%>
				MT_PUBLICATION.PUB_DAYS<%=i%>.checked=true;
			<%
			}
			%>
		}
		else
		{
			<%
			for(int i=0;i<g_days.length;i++)
			{
			%>
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

function preValidateSubmit(as_event_label)
{
	var cnt =0;
	if((document.getElementById("PUB_RUN").value == "D") || (document.getElementById("PUB_RUN").value == "d") || (document.getElementById("PUB_RUN").value == "W") || (document.getElementById("PUB_RUN").value == "w"))	
	{
		<%
		for(int i=0;i<g_days.length;i++)
		{
		%>
			if(MT_PUBLICATION.PUB_DAYS<%=i%>.checked==true);
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
				alert("Run Type Is Weekly, So 1 Publication Day Should Be Selected");
				return false;
			}
	}
	validateSubmit();
	return true;
}

</SCRIPT>