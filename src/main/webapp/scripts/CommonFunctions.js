
function setfldMandatory(f_name)
{
	var i = 0;
	var l_name=f_name;
	var l_one_str=null;	
	var clr_red = '<SPAN class="instreditalic">*</SPAN>';
	while(l_name.substr(0,l_name.indexOf(","))!=="")
	{
		l_one_str = l_name.substr(0,l_name.indexOf(","));
		if(document.getElementById(l_one_str+"_label").innerText.indexOf("*")==-1)
		document.getElementById(l_one_str+"_label").innerHTML = document.getElementById(l_one_str+"_label").innerText + clr_red;
		l_name = l_name.substring(l_name.indexOf(",")+1);
	}
	if(document.getElementById(l_name+"_label").innerText.indexOf("*")==-1)
	document.getElementById(l_name+"_label").innerHTML = document.getElementById(l_name+"_label").innerText + clr_red;
}


function setfldNonMandatory(f_name)
{
	var i = 0;
	var l_name=f_name;
	var l_one_str=null;	
	var l_non_mand=null;
	if (l_name.indexOf(",")==-1)
	{
		l_non_mand = document.getElementById(l_name+"_label").innerText;
	}
	while(l_name.indexOf(",")!=-1)
	{
		l_one_str = l_name.substr(0,l_name.indexOf(","));
		l_non_mand = document.getElementById(l_one_str+"_label").innerText;
		if (!(l_non_mand.indexOf("*")==-1))
		{
		document.getElementById(l_one_str+"_label").innerText = l_non_mand.substr(0,l_non_mand.indexOf("*"));
		}
		l_name = l_name.substring(l_name.indexOf(",")+1);
	}
	if (!(l_non_mand.indexOf("*")==-1)){
	l_non_mand = document.getElementById(l_name+"_label").innerText;
	document.getElementById(l_name+"_label").innerHTML = l_non_mand.substr(0,l_non_mand.indexOf("*"));
	}
}


function valdate(a_name,a_value)
{
	var today = new Date();
	var ent_date = new Date();
	var ent_day,ent_month,ent_year;
	ent_day=a_value.substr(0,2);
	ent_month=a_value.substr(3,2);
	ent_year=a_value.substr(6);
	ent_date.setFullYear(ent_year,ent_month-1,ent_day);

	if (ent_date > today) 
	{
	//	alert(a_name+" Should not more than current Date")
		var label,mand_label;
		if (document.getElementById(a_name+"_Label")==null)
			label=a_name;
		else
			mand_label=document.getElementById(a_name+"_Label").innerText;
			if (mand_label.substr(0,mand_label.lastIndexOf("*"))==-1)
				label=mand_label;
			else				
				label=mand_label.substr(0,mand_label.lastIndexOf("*"));

		displayAlert(MSG_ERROR, label+" Should not more than current Date");
		document.getElementById(a_name).value="";
		return false;
	}
	else
	{
	return true;
	}
	
}

function Reset_form()
{
	document.forms[0].reset();
	clearNull();
}

function compareSysDate(control_for_focus,first_date_value,second_date_value,f_str_Msg)
{
	 if (second_date_value != "" && first_date_value != "")
	 {
		var sdate = new Date();
		var edate = new Date();
	
		var s_day,s_month,s_year;
		var e_day,e_month,e_year;

		s_day   = first_date_value.substr(0,2);
		s_month = first_date_value.substr(3,2);
		s_year  = first_date_value.substr(6);
	
		//Setting the Date Format
	    sdate.setFullYear(s_year,s_month-1,s_day);	
 
		e_day   = second_date_value.substr(0,2);	
		e_month = second_date_value.substr(3,2);		
		e_year  = second_date_value.substr(6);	

		//Setting the Date Format
	    edate.setFullYear(e_year,e_month-1,e_day); 

		if (sdate > edate) 
		{							
			alert(f_str_Msg);		
			setFocus(control_for_focus);
			return false;
	    }	
		else
		{
			return true;
		}
      }	

}

function intcompareDate(first_date_value,second_date_value)
{
	 if (second_date_value != "" && first_date_value != "")
	 {
		var sdate = new Date();
		var edate = new Date();
	
		var s_day,s_month,s_year;
		var e_day,e_month,e_year;
		var g_mil_sec_per_day = 1000*60*60*24;
		var diff;

		s_day   = first_date_value.substr(0,2);
		s_month = first_date_value.substr(3,2);
		s_year  = first_date_value.substr(6);
	
		//Setting the Date Format
	    sdate.setFullYear(s_year,s_month-1,s_day);	
 
		e_day   = second_date_value.substr(0,2);	
		e_month = second_date_value.substr(3,2);		
		e_year  = second_date_value.substr(6);	

		//Setting the Date Format
	    edate.setFullYear(e_year,e_month-1,e_day); 
		diff = (sdate - edate) / g_mil_sec_per_day ;
		return diff;

	 }
}

function removeLink(l_str_ButtonName)
{
		document.getElementById(l_str_ButtonName).style.visibility="hidden";
}

function showLink(l_str_ButtonName)
{
		document.getElementById(l_str_ButtonName).style.visibility="visible";
}

// use l_str_control_type as text for date type of fields
function setfldreadOnly(l_str_controlName,l_str_control_type,l_bln_disable)
{
	var l_str_controlObject=document.getElementById(l_str_controlName);
	if(l_bln_disable)
	{
		if(l_str_control_type=='text') 
			l_str_controlObject.readOnly=true;
		else if(l_str_control_type=='CALENDAR') 
		{
			l_str_controlObject.readOnly=true;
			removeLink(l_str_controlName+"IMG");
		}
		if(document.getElementById(l_str_controlName+"HLP")!=null)
			removeLink(l_str_controlName+"HLP");
		if(document.getElementById(l_str_controlName+"IMG")!=null)
			removeLink(l_str_controlName+"IMG");
		if(l_str_controlObject.parentElement != null)
			l_str_controlObject.parentElement.className='str';
		//alert(l_str_controlObject.readOnly);
		//alert(document.getElementById(l_str_controlName+"_label"));
		if(document.getElementById(l_str_controlName+"_label")!= null)
		{
		document.getElementById(l_str_controlName+"_label").parentElement.className='str';
		document.getElementById(l_str_controlName+"_label").className='str';
		}
	}
	else
	{
		l_str_controlObject.parentElement.className='ste';
		if(document.getElementById(l_str_controlName+"_label")!= null)
		{
		document.getElementById(l_str_controlName+"_label").parentElement.className='ste';
		document.getElementById(l_str_controlName+"_label").className='ste';
		}
		if(l_str_control_type=='text') 
			l_str_controlObject.readOnly=false;

		if(document.getElementById(l_str_controlName+"HLP")!=null)
			showLink(l_str_controlName+"HLP");
		if(document.getElementById(l_str_controlName+"IMG")!=null)
			showLink(l_str_controlName+"IMG");
	}
}

function roundOffDec(original_number, decimals) {
	if((original_number=="")||(original_number==0))
	{
		//no validations 
		return "0";	
	}
	else
	{
		var result1 = original_number * Math.pow(10, decimals)
		var result2 = Math.round(result1)
		var result3 = result2 / Math.pow(10, decimals)
		return pad_with_zeros(result3, decimals)
	}
}

function pad_with_zeros(rounded_value, decimal_places) {

    // Convert the number to a string
    var value_string = rounded_value.toString()
    
    // Locate the decimal point
    var decimal_location = value_string.indexOf(".")

    // Is there a decimal point?
    if (decimal_location == -1) {
        
        // If no, then all decimal places will be padded with 0s
        decimal_part_length = 0
        
        // If decimal_places is greater than zero, tack on a decimal point
        value_string += decimal_places > 0 ? "." : ""
    }
    else {

        // If yes, then only the extra decimal places will be padded with 0s
        decimal_part_length = value_string.length - decimal_location - 1
    }
    
    // Calculate the number of decimal places that need to be padded with 0s
    var pad_total = decimal_places - decimal_part_length
    
    if (pad_total > 0) {
        
        // Pad the string with 0s
        for (var counter = 1; counter <= pad_total; counter++) 
            value_string += "0"
        }
    return value_string
}

function getPicklistValues(p_str_pkl_name,p_src_name,as_cri_fld_names,as_alias_fld_name)
{
	var p_search_criteria="";
	var l_cr_set_flg = 1;
	if(as_cri_fld_names!="")
{
	var l_criteria_fld_vals=as_cri_fld_names.split(",");
//	alert(l_criteria_fld_vals[0]);
	var as_alias_fld_name_arr;
//	alert(as_alias_fld_name);
	if(as_alias_fld_name!="")
		as_alias_fld_name_arr = as_alias_fld_name.split(",");
//	alert(as_alias_fld_name_arr);
	//alert(document.getElementById(l_criteria_fld_vals[0]).value);
	for(var i=0;i<l_criteria_fld_vals.length;i++)
		{
			if(document.getElementById(l_criteria_fld_vals[i]).value != "")
			{
				if(as_alias_fld_name!="")
					p_search_criteria = p_search_criteria + as_alias_fld_name_arr[i]+"@"+document.getElementById(l_criteria_fld_vals[i]).value.toUpperCase()+"^";
				else
					p_search_criteria = p_search_criteria + l_criteria_fld_vals[i]+"@"+document.getElementById(l_criteria_fld_vals[i]).value.toUpperCase()+"^";
			}
			else
			{
				l_cr_set_flg =0;
				break;
			}

		}
	}
	//alert(as_cri_fld_names.length);
	//alert(l_cr_set_flg);
	var l_str_pklname =p_str_pkl_name;
	//alert(p_search_criteria);
	if(p_search_criteria=="")
		p_search_criteria = "No Search Criteria";
//	alert(p_search_criteria);
	if((l_str_pklname!="")&&(((as_cri_fld_names.length > 0) && (l_cr_set_flg == 1)) || (as_cri_fld_names.length == 0)))
	{
		//alert(l_str_pklname);
	window.open("Picklist.jsp?pklname=" + l_str_pklname + "&srcname=" + p_src_name + "&SEARCH_CRITERIA="+ encodeURI(p_search_criteria),"winpicklist","status=yes,toolbar=no,menubar=no,resizable=no,scrollbars=yes,left=70,top=0,resizable=yes,width="+ eval(screen.width-10) +",height="+ eval(screen.height-80)+')');
}
	else if ((as_cri_fld_names.length > 0) && (l_cr_set_flg == 0))
	{
		//alert(l_criteria_fld_vals[i]);
			var label = document.getElementById(l_criteria_fld_vals[i]+"_label").innerText;
			var k=label.indexOf('*');
			if(k!=-1)
				label =label.substring(0,k);
			alert("Please select "+label+" first");
	}
	//window.open("Picklist.jsp?pklname=" + l_str_pklname + "&srcname=KEY&SEARCH_CRITERIA=KEY","winpicklist","status=yes,toolbar=no,menubar=no,resizable=no,scrollbars=yes,left=70,top=0,resizable=yes,width="+ eval(screen.width-10) +",height="+ eval(screen.height-80)+')');
}

function populateDropDownVals(p_str_pkl_name,p_src_name,as_cri_fld_names)
{
	window.open("setDropDownVals.jsp?PickListName=" + p_str_pkl_name + "&source=" + p_src_name + "&criteria="+ encodeURI(as_cri_fld_names),"winpicklist","status=yes,toolbar=no,menubar=no,resizable=no,scrollbars=yes,left=70,top=0,resizable=yes,width="+ eval(screen.width-10) +",height="+ eval(screen.height-80)+')');
}

function submitFormwithArgs(as_event_label,f_str_other_args_tokens,f_str_other_args_values)
{
	var lb_pre_success;
	var frm, ele;
	var l_str_token;
	var gs_main_form_name = "Picklist";
	frm = document.forms[gs_main_form_name];
	var checkEvent = as_event_label.substring(0,4);
	if (checkEvent != "LIST")
	{
		//		alert(gs_main_form_name);		
		ele = frm.elements["Event"].value = gs_main_form_name + "_" + as_event_label;
	}	
	for (var l_int_count=0;l_int_count < f_str_other_args_tokens.length; l_int_count++)
	{
		ele = frm.elements[f_str_other_args_tokens[l_int_count]].value = f_str_other_args_values[l_int_count];
	}	

	frm.submit();
}

function getNumber(as_filed_name)
	{
		return (document.getElementById(as_filed_name).value==""?0:document.getElementById(as_filed_name).value);
	}

function clearNull()
{
//	alert(4);
//	alert('TEST'+document.getElementById("ERRDESC").value);
	if((document.getElementById("ERRDESC").value!="")&&(document.getElementById("ERRDESC").value!="null"))
	{
		if(document.getElementById("ERRDESC").value.indexOf("ORA-00001") > 0)
			alert("Record Already Exists. Please check.");
		else
		{
			if(document.getElementById("ERRDESC").value.indexOf("Data Loaded")==-1)
				alert(document.getElementById("ERRDESC").value);
		}
	}

	var i,args_mand;
	var args_mand=document.forms[0].elements;
			//alert(args_mand.length);
			for(i=0;i<args_mand.length;i++)
			{
//				if(i==27)
//				{
//				alert("i"+i);
//				alert(args_mand[i].type);
//				alert(args_mand[i].name);
//				alert(args_mand[i].name+"|"+document.getElementById(args_mand[i].name).value);
//				}
				if(args_mand[i].type!="button" && args_mand[i].type!="radio")
				{
					//alert(args_mand[i].name);
					//alert(document.getElementById("CMP_CODE").value);
					if(args_mand[i].name=="CNT_CODE" && document.getElementById("CENTER").value!="null")
					{
						//alert(1);
						//alert(document.getElementById("CENTER").value.split(";").length);
						if(document.getElementById("CENTER").value.split(";").length == 2)
						{
							document.getElementById("CNT_CODE").value  = document.getElementById("CENTER").value.replace(";","");	
							try
							{
								//alert(document.getElementById("CNT_CODE").onchange());
								document.getElementById("CNT_CODE").onchange();
							}
							catch(Exception){document.getElementById("CNT_CODE").onblur();}
						}
						else if(document.getElementById("CNT_CODE").value=="null" || document.getElementById("CNT_CODE").value=="NULL")
						{
							document.getElementById("CNT_CODE").value  = "";
						}
						//alert(document.getElementById("CNT_CODE").value);
					}
					else if (args_mand[i].name=="COUNTRY" && (document.getElementById("COUNTRY").value=="" || document.getElementById("COUNTRY").value=="null"))
					{
						//alert(2);
						document.getElementById("COUNTRY").value  = "IN";
						document.getElementById("COUNTRYDESC").value  = "INDIA";
						setfldreadOnly('COUNTRY','text',true);
					}
					else if (args_mand[i].name=="CMP_CODE" && (document.getElementById("CMP_CODE").value =="" || document.getElementById("CMP_CODE").value=="null"))
					{
						//alert(3);
						document.getElementById("CMP_CODE").value  = document.getElementById("COMPANY").value;
						if(document.getElementById("CMP_CODEDESC") != null)
								document.getElementById("CMP_CODE").onchange();
					}
					else if (document.getElementById(args_mand[i].name).value=="null")
					{
						//alert(4);
						//alert(args_mand[i].name);
						document.getElementById(args_mand[i].name).value="";
					}

				}
			}

//	alert(6);
//	alert("exit"+document.getElementById("MODE").value)
	if(document.getElementById("MODE").value=="")
	{
		setFields();
//		if(document.getElementById("COUNTRY")!=null)

	}

	return true;
}

function View_Details()
{
	document.getElementById("PARAM1").value="VIEW";
	document.getElementById("MODE").value="VIEW";
	document.forms[0].submit();
	setFields();
}

function Modify_Details()
{
	document.getElementById("PARAM1").value="MODIFY";
	document.getElementById("MODE").value="VIEW";
	document.forms[0].submit();
	setFields();
}

function Delete_Details()
{
	document.getElementById("PARAM1").value="DELETE";
	document.getElementById("MODE").value="VIEW";
	document.forms[0].submit();
	setFields();
//	alert(document.getElementById("PARAM1").value);
}

function validateSubmit()
{
//		alert("MODE"+document.getElementById("MODE").value);
//	alert("PARAM1"+document.getElementById("PARAM1").value);
		if(document.getElementById("PARAM1").value=="MODIFY")
		document.getElementById("MODE").value="MOD";
	else if(document.getElementById("PARAM1").value=="DELETE")
		document.getElementById("MODE").value="DEL";
	else if(document.getElementById("MODE").value=="VIEW")
	{
		alert("View Mode record canot be altered");
	}
	if((document.getElementById("MODE").value=="MOD") ||(document.getElementById("MODE").value=="DEL"))
	{
	//	alert(2);
		var primary_key = document.getElementById("PRIMARY_KEY").value;
		var key_arr = primary_key.split("#");
		var primary_key="";
		for(var i=0;i<key_arr.length;i++)
			primary_key = primary_key + key_arr[i].substring(key_arr[i].indexOf(".")+1)+"#";
		document.getElementById("PRIMARY_KEY").value = primary_key.substring(0,primary_key.length-1);
		//alert(document.getElementById("PRIMARY_KEY").value);
	}
	if(chkMandatory()==true)
	{
		document.forms[0].submit();
	}
}

//as_picklist_name : 
//as_src_code_val : ex : CODE@MEDIA#NAME@MEDIA SOFTWARE LTD
function getCodeDesc(as_cri_fld_names,as_dest_field,as_picklist_name,as_alias_fld_name)
{

var as_src_code_val="";
var l_criteria_fld_vals=as_cri_fld_names.split(",");
var as_alias_fld_name_arr;
if(as_alias_fld_name!="")
	as_alias_fld_name_arr = as_alias_fld_name.split(",");
if(document.getElementById(l_criteria_fld_vals[0]).value != "")
	{
for(var i=0;i<l_criteria_fld_vals.length;i++)
	{
		if(document.getElementById(l_criteria_fld_vals[i]).value!="")
		{
			if(as_alias_fld_name!="")
				as_src_code_val = as_src_code_val + as_alias_fld_name_arr[i]+"@"+document.getElementById(l_criteria_fld_vals[i]).value.toUpperCase()+"^";
			else
				as_src_code_val = as_src_code_val + l_criteria_fld_vals[i]+"@"+document.getElementById(l_criteria_fld_vals[i]).value.toUpperCase()+"^";
			
		}
		else
			return false;
	}


function getXMLObject()  //XML OBJECT
{
   var xmlHttp = false;
   try {
     xmlHttp = new ActiveXObject("Msxml2.XMLHTTP")  // For Old Microsoft Browsers
   }
   catch (e) {
     try {
       xmlHttp = new ActiveXObject("Microsoft.XMLHTTP")  // For Microsoft IE 6.0+
     }
     catch (e2) {
       xmlHttp = false   // No Browser accepts the XMLHTTP Object then false
     }
   }
   if (!xmlHttp && typeof XMLHttpRequest != 'undefined') {
     xmlHttp = new XMLHttpRequest();        //For Mozilla, Opera Browsers
   }
   return xmlHttp;  // Mandatory Statement returning the ajax object created
}
var xmlhttp = new getXMLObject();
function handleServerResponse() {
	//alert("in");
   if (xmlhttp.readyState == 4)
   {
         if(xmlhttp.status == 200)
         {
			document.getElementById(as_dest_field).value=xmlhttp.responseText;
			if(document.getElementById(as_dest_field).value=="")
			 {
				document.getElementById(as_dest_field).value="";
				// document.forms[0].getElements[1].focus();
//					alert("Invalid Code. Please check.");
					var pkl_name = as_picklist_name.substring(0,as_picklist_name.length-4);
					getPicklistValues(pkl_name,l_criteria_fld_vals[0],as_cri_fld_names,as_alias_fld_name);		
			}
        }

      }

   }


if(xmlhttp) {
	xmlhttp.open("GET","getPicklistDesc?PICKLIST="+as_picklist_name+"&CRITERIA="+encodeURI(as_src_code_val),true);
    xmlhttp.onreadystatechange  = handleServerResponse;
    xmlhttp.setRequestHeader('Content-Type', 'application/x-www-form-urlencoded');
    xmlhttp.send(null);
  }


	}
}



//QUERY : 
//destination field : 
//l_param_value : separator @ , format field_name@field_value ex : CODE@MEDIA^NAME@MEDIA SOFTWARE LTD
function getQueryResults(l_picklist_name,l_param_value,l_criteria,as_dest_field)
{
function getXMLObject1()  //XML OBJECT
{
   var xmlHttp = false;
   try {
     xmlHttp = new ActiveXObject("Msxml2.XMLHTTP")  // For Old Microsoft Browsers
   }
   catch (e) {
     try {
       xmlHttp = new ActiveXObject("Microsoft.XMLHTTP")  // For Microsoft IE 6.0+
     }
     catch (e2) {
       xmlHttp = false   // No Browser accepts the XMLHTTP Object then false
     }
   }
   if (!xmlHttp && typeof XMLHttpRequest != 'undefined') {
     xmlHttp = new XMLHttpRequest();        //For Mozilla, Opera Browsers
   }
   return xmlHttp;  // Mandatory Statement returning the ajax object created
}
var xmlhttp = new getXMLObject1();


if(xmlhttp) {
xmlhttp.open("GET","getQueryResults?PICKLIST="+l_picklist_name+"&PARAM="+l_param_value+"&CRITERIA="+encodeURI(l_criteria),true);
    xmlhttp.onreadystatechange  = handleServerResponse_QR;
    xmlhttp.setRequestHeader('Content-Type', 'application/x-www-form-urlencoded');
    xmlhttp.send(null);
  }


function handleServerResponse_QR()
{
   if (xmlhttp.readyState == 4)
   {
         if(xmlhttp.status == 200)
         {
			 var l_response = xmlhttp.responseText;
			 l_response = l_response.substring(0,l_response.lastIndexOf("^"));
			 //alert(l_response);
			 var l_field_values = l_response.split("^");
			 //alert(l_field_values);
			 var as_dest_field_arr = as_dest_field.split("^");
			 //alert(l_field_values.length);
			 //alert(as_dest_field_arr.length);
			 for(var i=0;i<l_field_values.length;i++)
			 {
				// alert(as_dest_field_arr[i]);
			  document.getElementById(as_dest_field_arr[i]).value=l_field_values[i];

			 }
         }
     }
   }
}

function getQueryResultsSync(l_picklist_name,l_param_value,l_criteria,as_dest_field)
{
function getXMLObject1()  //XML OBJECT
{
   var xmlHttp = false;
   try {
     xmlHttp = new ActiveXObject("Msxml2.XMLHTTP")  // For Old Microsoft Browsers
   }
   catch (e) {
     try {
       xmlHttp = new ActiveXObject("Microsoft.XMLHTTP")  // For Microsoft IE 6.0+
     }
     catch (e2) {
       xmlHttp = false   // No Browser accepts the XMLHTTP Object then false
     }
   }
   if (!xmlHttp && typeof XMLHttpRequest != 'undefined') {
     xmlHttp = new XMLHttpRequest();        //For Mozilla, Opera Browsers
   }
   return xmlHttp;  // Mandatory Statement returning the ajax object created
}
var xmlhttp = new getXMLObject1();


if(xmlhttp) {
xmlhttp.open("GET","getQueryResults?PICKLIST="+l_picklist_name+"&PARAM="+l_param_value+"&CRITERIA="+encodeURI(l_criteria),false);
    xmlhttp.onreadystatechange  = handleServerResponse_QR;
    xmlhttp.setRequestHeader('Content-Type', 'application/x-www-form-urlencoded');
    xmlhttp.send(null);
  }


function handleServerResponse_QR()
{
   if (xmlhttp.readyState == 4)
   {
         if(xmlhttp.status == 200)
         {
			 var l_response = xmlhttp.responseText;
			 l_response = l_response.substring(0,l_response.lastIndexOf("^"));
			 //alert(l_response);
			 var l_field_values = l_response.split("^");
			 //alert(l_field_values);
			 var as_dest_field_arr = as_dest_field.split("^");
			 //alert(l_field_values.length);
			 //alert(as_dest_field_arr.length);
			 for(var i=0;i<l_field_values.length;i++)
			 {
				// alert(as_dest_field_arr[i]);
			  document.getElementById(as_dest_field_arr[i]).value=l_field_values[i];

			 }
         }
     }
   }
}

function setFields()
{
	//alert("Inset field "+document.getElementById("PARAM1").value);
	//document.getElementById("PARAM1").value = "VIEW";
	var separator ="#";
	var primary_key = document.getElementById("PRIMARY_KEY").value;
//	primary_key ="COMM_CODE";
	//alert(primary_key);
	var key_arr = new Array();
	if((document.getElementById("PARAM1").value == "MODIFY")||(document.getElementById("PARAM1").value == ""))
	{
		if(primary_key.indexOf("#") != -1)
		{
			key_arr = primary_key.split("#");
		}
		else
		{
			if(primary_key.indexOf(".")!=-1)
				primary_key = primary_key.substring(primary_key.indexOf(".")+1);
			//alert(primary_key);
			key_arr[0] = primary_key;
		}
	}
	//alert(key_arr.length);

	//if((document.getElementById("PARAM1").value == "DELETE")||(document.getElementById("PARAM1").value == "VIEW")||(document.getElementById("PARAM1").value == "MODIFY"))
	//{
		var i,args_mand;
		args_mand=document.forms[0].elements;
	//	alert(args_mand);
			for(i=0;i<args_mand.length;i++)
			{
				pk_flg =0 ;
				if((args_mand[i].type != "hidden" ) && (args_mand[i].type!="radio") && (args_mand[i].type!="button"))
				{
					if((document.getElementById("PARAM1").value == "MODIFY")||(document.getElementById("PARAM1").value == ""))
					{
						for(j=0;j<key_arr.length;j++)
						{
							//alert(key_arr[j]);
							var l_filed_name = key_arr[j];
							if(l_filed_name.indexOf(",")!=-1)
								l_filed_name = l_filed_name.substring(0,l_filed_name.indexOf(","));
							//alert(l_filed_name);
							if(l_filed_name.indexOf(".")!=-1)
								primary_key = l_filed_name.substring(l_filed_name.indexOf(".")+1);
							else
								primary_key = l_filed_name;
							if(primary_key==args_mand[i].name)
							{
								pk_flg =1;
								break;
							}
						}
					}
					if(args_mand[i].name== "COUNTRY")
					{
							setfldreadOnly(args_mand[i].name,args_mand[i].type,true);
					}
					else
					{
						if((document.getElementById("PARAM1").value == "DELETE")||(document.getElementById("PARAM1").value == "VIEW"))
						{
							//alert(args_mand[i].name);
							setfldreadOnly(args_mand[i].name,args_mand[i].type,true);
						}
						if(document.getElementById("PARAM1").value == "MODIFY")
						{
							if(pk_flg ==1) 
								setfldreadOnly(args_mand[i].name,args_mand[i].type,true);
							else
								setfldreadOnly(args_mand[i].name,args_mand[i].type,false);
						}
						if(document.getElementById("PARAM1").value == "")
						{
							if(pk_flg ==1) 
								setfldreadOnly(args_mand[i].name,args_mand[i].type,false);
							else
								setfldreadOnly(args_mand[i].name,args_mand[i].type,true);
						}
					}
				}
			}
	//alert('OUT SET FIELDS '+document.getElementById("PARAM1").value);

	return true;
}

function getDay(date_field_name, day_field_name)
{
		if(document.getElementById(date_field_name).value!="")
		{
			var date = document.getElementById(date_field_name).value;
			var week_days = new Array("SUN","MON","TUE","WED","THU","FRI","SAT");
			var sdate = new Date();
			var day   = date.substr(0,2);
			var month = date.substr(3,2);
			var year  = date.substr(6);
		
			//Setting the Date Format
			sdate.setFullYear(year,month-1,day);
			document.getElementById(day_field_name).value=week_days[sdate.getDay()];
		}
}

function replaceAll(str_tobe_replaced, char_to_rep, as_replace)
{
    var ls_remaining, ls_ret;
    var i;
    ls_remaining = str_tobe_replaced;
    ls_ret = "";
    i = ls_remaining.indexOf(char_to_rep);
    while(i > -1)
    {
        ls_ret = ls_ret + ls_remaining.substring(0,i);
        ls_ret = ls_ret + as_replace;
        ls_remaining = ls_remaining.substring(i + char_to_rep.length);
        i = ls_remaining.indexOf(char_to_rep);
    }
    ls_ret = ls_ret + ls_remaining;
    return ls_ret;
}

function createParamStr(param_fld_str)
{
	var l_param_fld_str=param_fld_str.split(",");
	var l_param = "";
	for(var i=0;i<l_param_fld_str.length;i++)
	{
		if(i < l_param_fld_str.length -1)
			l_param = l_param + document.getElementById(l_param_fld_str[i]).value+"@";
		else
			l_param = l_param + document.getElementById(l_param_fld_str[i]).value;
	}

	document.getElementById("PARAM").value = l_param;

	return true;
}

function checkHoliday(f_date_control, f_pub_control)
{
//	alert(f_date_control);
	var f_date_val = document.getElementById(f_date_control).value;
	var f_pub_val = document.getElementById(f_pub_control).value;
	var holiday = 0;
	var label = "";
	var k = "";
	var l_holiday_param_str = "";

	if( f_date_val.length == 10 && f_pub_val != "")
	{
		l_holiday_param_str= g_holiday_param_str;
		var pub_hld_fld_val =l_holiday_param_str.split(",");
		for(var i=0;i<pub_hld_fld_val.length;i=i+3)
		{
			//alert(pub_hld_fld_val[i])
			if(pub_hld_fld_val[i] != "")
			{
				if(pub_hld_fld_val[i]==f_pub_val || pub_hld_fld_val[i] == "ALL") 
					if((pub_hld_fld_val[i+1]==f_date_val) || ((pub_hld_fld_val[i+2] == "Y" ) && 
					( pub_hld_fld_val[i+1].substring(0,6) == f_date_val.substring(0,6))))
					{
						holiday = 1;
						break;
					}
			}
		}
		if(holiday == 1)
		{
			label = document.getElementById(f_date_control+"_label").innerText;
			k=label.indexOf('*');
			if(k!=-1)
				label =label.substring(0,k);
			alert(label+" can not be a holiday"); 
			document.getElementById(f_date_control).focus();
			return false;
		}
		return true;
	}
}

function chkMandatory()
{
	var li_i, li_j, li_k, li_len,j,i;
	var a_value;
	var col_label;

		
		var args_mand=document.forms[0].elements;
			for(i=0,li_j=0;i<args_mand.length;i++)
			{
				if(args_mand[i].type!="radio")			
					if (document.getElementById(args_mand[i].name+"_label")!=null)
					{
						col_label=document.getElementById(args_mand[i].name+"_label").innerText;
						//alert(col_label);
						if(!(col_label.lastIndexOf("*")==-1))
						{
							a_value = document.getElementById(args_mand[i].name).value;
							//alert("|"+trim(a_value)+"|");
							if(a_value == null || a_value == "")
							{
								//alert('in');
								alert("Please enter mandatory field "+col_label+".");						
								return false;
							}
							else
								continue;
						}

					}
			}
			return true;
}

function alphanumeric(alphane)
{
	var numaric = alphane;
	for(var j=0; j<numaric.length; j++)
		{
		  var alphaa = numaric.charAt(j);
		  var hh = alphaa.charCodeAt(0);
		  if((hh > 47 && hh<58) || (hh > 64 && hh<91) || (hh > 96 && hh<123))
		  {
		  }
		else	{
                         alert("Your Alpha Numeric Test Failed");
			 return false;
		  }
 		}
 //alert("Your Alpha Numeric Test Passed");
 return true;
}

function IsNumeric(objName)
   //  check for valid numeric strings	
   {
	var strString = objName.value;
   var strValidChars = "0123456789.-";
   var strChar;
   var blnResult = true;

   if (strString.length == 0) return false;

   //  test strString consists of valid characters listed above
   for (i = 0; i < strString.length && blnResult == true; i++)
      {
      strChar = strString.charAt(i);
      if (strValidChars.indexOf(strChar) == -1)
         {
			//objName.value="";
			objName.focus();
			blnResult = false;
			alert("Invalid Number. Please check.");
         }
      }
   return blnResult;
 }

function DateCharecters(objName)
   //  check for valid numeric strings	
   {
	var strString = objName.value;
   var strValidChars = "0123456789/";
   var strChar;
   var blnResult = true;
   if (strString.length == 0) return false;
   //  test strString consists of valid characters listed above
   for (i = 0; i < strString.length && blnResult == true; i++)
      {
      strChar = strString.charAt(i);
      if (strValidChars.indexOf(strChar) == -1)
         {
			//objName.value="";
			objName.focus();
			blnResult = false;
        }
      }
   return blnResult;
 }


function checkdate(objName) 
{
	if(objName.value != "")
	{
		var datefield = objName;
		if (DateCharecters(objName) ==false || chkdate(objName) == false ) 
		{
			datefield.select();
			if(document.getElementById(objName.name+"_label")!= null)
				alert(document.getElementById(objName.name+"_label").innerText+" is invalid.");
			else
				alert("Date is invalid.");
			datefield.focus();
			return false;
		}
		else 
		{
			return true;
		}
	}
   return true;
}

function chkdate(objName) 
{
	//var strDatestyle = "US"; //United States date style
	//var strDatestyle = "EU";  //European date style
	var strDatestyle = "MS";  //European date style
	var strDate;
	var strDateArray;
	var strDay;
	var strMonth;
	var strYear;
	var intday;
	var intMonth;
	var intYear;
	var booFound = false;
	var datefield = objName;
	var strSeparatorArray = new Array("-"," ","/",".");
	var intElementNr;
	var err = 0;
	var strMonthArray = new Array(12);
	strMonthArray[0] = "Jan";
	strMonthArray[1] = "Feb";
	strMonthArray[2] = "Mar";
	strMonthArray[3] = "Apr";
	strMonthArray[4] = "May";
	strMonthArray[5] = "Jun";
	strMonthArray[6] = "Jul";
	strMonthArray[7] = "Aug";
	strMonthArray[8] = "Sep";
	strMonthArray[9] = "Oct";
	strMonthArray[10] = "Nov";
	strMonthArray[11] = "Dec";
	strDate = datefield.value;
	if (strDate.length < 1) 
	{
		return true;
	}
	for (intElementNr = 0; intElementNr < strSeparatorArray.length; intElementNr++) 
	{
		if (strDate.indexOf(strSeparatorArray[intElementNr]) != -1) 
		{
			strDateArray = strDate.split(strSeparatorArray[intElementNr]);
			if (strDateArray.length != 3) 
			{
				err = 1;
				return false;
			}
			else 
			{
				strDay = strDateArray[0];
				strMonth = strDateArray[1];
				strYear = strDateArray[2];
			}
			booFound = true;
		}
	}
	if (booFound == false) 
	{
		if (strDate.length>5)
		{
			strDay = strDate.substr(0, 2);
			strMonth = strDate.substr(2, 2);
			strYear = strDate.substr(4);
	   }
	}
	if (strYear.length == 2) 
	{
		strYear = '20' + strYear;
	}
	// US style
	if (strDatestyle == "US") 
	{
		strTemp = strDay;
		strDay = strMonth;
		strMonth = strTemp;
	}
	intday = parseInt(strDay, 10);
	if (isNaN(intday)) 
	{
		err = 2;
		return false;
	}
	intMonth = parseInt(strMonth, 10);
	if (isNaN(intMonth)) 
	{
		for (i = 0;i<12;i++) 
		{
			if (strMonth.toUpperCase() == strMonthArray[i].toUpperCase()) 
			{
				intMonth = i+1;
				strMonth = strMonthArray[i];
				i = 12;
			}
		}
		if (isNaN(intMonth)) 
		{
			err = 3;
			return false;
		}
	}
	intYear = parseInt(strYear, 10);
	if (isNaN(intYear)) 
	{
		err = 4;
		return false;
	}
	if (intMonth>12 || intMonth<1) 
	{
		err = 5;
		return false;
	}
	if ((intMonth == 1 || intMonth == 3 || intMonth == 5 || intMonth == 7 || intMonth == 8 || intMonth == 10 || intMonth == 12) && (intday > 31 || intday < 1)) 
	{
		err = 6;
		return false;
	}
	if ((intMonth == 4 || intMonth == 6 || intMonth == 9 || intMonth == 11) && (intday > 30 || intday < 1)) 
	{
		err = 7;
		return false;
	}
	if (intMonth == 2) 
	{
		if (intday < 1) 
		{
			err = 8;
			return false;
		}
		if (LeapYear(intYear) == true) 
		{
			if (intday > 29) 
			{
				err = 9;
				return false;
			}
		}
		else 
		{
			if (intday > 28) 
			{
				err = 10;
				return false;
			}
		}
	}
	if (strDatestyle == "US") 
	{
		datefield.value = strMonthArray[intMonth-1] + " " + intday+" " + strYear;
	}
	else if(strDatestyle == "EU") 
	{
		datefield.value = intday + " " + strMonthArray[intMonth-1] + " " + strYear;
	}
	else
	{
		//alert(intday.length);
		if(intday<10)
			intday ="0"+intday;
		if(intMonth<10)
			intMonth ="0"+intMonth;
		datefield.value = intday + "/"+intMonth+"/"+strYear;
	}
	return true;
}

function LeapYear(intYear) 
{
	if (intYear % 100 == 0) 
	{
		if (intYear % 400 == 0) 
		{ 
			return true; 
		}
	}
	else
	{
		if ((intYear % 4) == 0) 
		{ 
			return true; 
		}
	}
	return false;
}

function doDateCheck(from, to) 
{
	if (from.value != "" && to.value != "") 
	{
		if (Date.parse(from.value) <= Date.parse(to.value)) 
		{
			//alert("The dates are valid.");
			return true;
		}
		else 
		{
			alert(document.getElementById(to.name+"_label").innerText +" must occur after the "+document.getElementById(from.name+"_label").innerText +".");
		}
	}
}

