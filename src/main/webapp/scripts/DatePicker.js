
var weekend = [0,6];
var weekendColor = "#438973";
var fontface = "Verdana";
var fontsize = 2;

var gNow = new Date();
var ggWinCal;
isNav = (navigator.appName.indexOf("Netscape") != -1) ? true : false;
isIE = (navigator.appName.indexOf("Microsoft") != -1) ? true : false;

Calendar.Months = ["January", "February", "March", "April", "May", "June", "July", "August", "September", "October", "November", "December"];
Calendar.shortMonths = ["January", "February", "March", "April", "May", "June", "July", "August", "September", "October", "November", "December"];
//Calendar.Months = Locale.availableLocales[Locale.DEFAULT].longMonths;
//Calendar.shortMonths = Locale.availableLocales[Locale.DEFAULT].shortMonths;

// Non-Leap year Month days..
Calendar.DOMonth = [31, 28, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31];
// Leap year Month days..
Calendar.lDOMonth = [31, 29, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31];

function Calendar(p_item, p_WinCal, p_month, p_year, p_format) {
	if ((p_month == null) && (p_year == null))	return;

	if (p_WinCal == null)
		this.gWinCal = ggWinCal;
	else
		this.gWinCal = p_WinCal;
	
	if (p_month == null) {
		this.gMonthName = null;
		this.gMonth = null;
		this.gYearly = true;
	} else {
		this.gMonthName = Calendar.get_month(p_month);
		this.gShortMonthName = Calendar.get_shortmonth(p_month);
		this.gMonth = new Number(p_month);
		this.gYearly = false;
	}

	this.gYear = p_year;
	this.gFormat = p_format;
	this.gBGColor = "white";
	this.gFGColor = "black";
	this.gTextColor = "black";
	this.gHeaderColor = "black";
	this.gReturnItem = p_item;
}

Calendar.get_month = Calendar_get_month;
Calendar.get_shortmonth = Calendar_get_shortmonth;
Calendar.get_daysofmonth = Calendar_get_daysofmonth;
Calendar.calc_month_year = Calendar_calc_month_year;
Calendar.print = Calendar_print;

function Calendar_get_month(monthNo) {
	return Calendar.Months[monthNo];
}

function Calendar_get_shortmonth(monthNo) {
	return Calendar.shortMonths[monthNo];
}

function Calendar_get_daysofmonth(monthNo, p_year) {
	/* 
	Check for leap year ..
	1.Years evenly divisible by four are normally leap years, except for... 
	2.Years also evenly divisible by 100 are not leap years, except for... 
	3.Years also evenly divisible by 400 are leap years. 
	*/
	if ((p_year % 4) == 0) {
		if ((p_year % 100) == 0 && (p_year % 400) != 0)
			return Calendar.DOMonth[monthNo];
	
		return Calendar.lDOMonth[monthNo];
	} else
		return Calendar.DOMonth[monthNo];
}

function Calendar_calc_month_year(p_Month, p_Year, incr) {
	/* 
	Will return an n1-D array with 1st element being the calculated month 
	and second being the calculated year 
	after applying the month increment/decrement as specified by 'incr' parameter.
	'incr' will normally have 1/-1 to navigate thru the months.
	*/
	var ret_arr = new Array();
	
	if (incr == -1) {
		// B A C K W A R D
		if (p_Month == 0) {
			ret_arr[0] = 11;
			ret_arr[1] = parseInt(p_Year) - 1;
		}
		else {
			ret_arr[0] = parseInt(p_Month) - 1;
			ret_arr[1] = parseInt(p_Year);
		}
	} else if (incr == 1) {
		// F O R W A R D
		if (p_Month == 11) 
		{
			ret_arr[0] = 0;
			ret_arr[1] = parseInt(p_Year) + 1;
		}
		else {
			ret_arr[0] = parseInt(p_Month) + 1;
			ret_arr[1] = parseInt(p_Year);
		}
	}

	return ret_arr;
}

function Calendar_print() 
{
	ggWinCal.print();
}

function Calendar_calc_month_year(p_Month, p_Year, incr) {
	/* 
	Will return an 1-D array with 1st element being the calculated month 
	and second being the calculated year 
	after applying the month increment/decrement as specified by 'incr' parameter.
	'incr' will normally have 1/-1 to navigate thru the months.
	*/
	var ret_arr = new Array();
	
	if (incr == -1) {
		// B A C K W A R D
		if (p_Month == 0) {
			ret_arr[0] = 11;
			ret_arr[1] = parseInt(p_Year) - 1;
		}
		else {
			ret_arr[0] = parseInt(p_Month) - 1;
			ret_arr[1] = parseInt(p_Year);
		}
	} else if (incr == 1) {
		// F O R W A R D
		if (p_Month == 11) {
			ret_arr[0] = 0;
			ret_arr[1] = parseInt(p_Year) + 1;
		}
		else {
			ret_arr[0] = parseInt(p_Month) + 1;
			ret_arr[1] = parseInt(p_Year);
		}
	}
	
	return ret_arr;
}

// This is for compatibility with Navigator 3, we have to create and discard one object before the prototype object exists.
new Calendar();

Calendar.prototype.getMonthlyCalendarCode = function() {
	var vCode = "";
	var vHeader_Code = "";
	var vData_Code = "";
	
	// Begin Table Drawing code here..
	vCode = vCode + "<TABLE width='100%' cellspacing=0  cellpadding=0 BORDER=1 BGCOLOR=\"" + this.gBGColor + "\">";
	
	vHeader_Code = this.cal_header();
	vData_Code = this.cal_data();
	vCode = vCode + vHeader_Code + vData_Code;
	
	vCode = vCode + "</TABLE>";
	
	return vCode;
}

function checkDateModal() {
	if (this.vWinCal && !this.vWinCal.closed) {
		this.vWinCal.focus()
		window.onfocus = checkDateModal
	}
}

Calendar.prototype.show = function() {
	var vCode = "";
	
	this.gWinCal.document.open();

	// Setup the page...
	this.wwrite("<html>");
	this.wwrite("<head><title>" + putEscape("Calendar","'","\\") +"</title>");
	this.wwrite("<meta HTTP-EQUIV='Content-Type' CONTENT='text/html; charset=utf-8'>");
	this.wwrite('<SCRIPT Language = "JavaScript" type="text/javascript">');
	this.wwrite('function oncontextmenu(){return true;}');
	this.wwrite('function populateDateValue(as_field_name,as_field_value){self.opener.document.getElementById(as_field_name).value=as_field_value;self.opener.document.getElementById(as_field_name).focus();window.close();}');
	this.wwrite('</SCRIPT>');
	this.wwrite("</head>");

	this.wwrite("<body topmargin='5' marginheight='5' " + 
		"link=\"" + this.gLinkColor + "\" " + 
		"vlink=\"" + this.gLinkColor + "\" " +
		"alink=\"" + this.gLinkColor + "\" " +
		"text=\"" + this.gTextColor + "\">");
	this.wwriteA("<FONT FACE='" + fontface + "' SIZE=2>");
	// Show navigation buttons
	var prevMMYYYY = Calendar.calc_month_year(this.gMonth, this.gYear, -1);
	var prevMM = prevMMYYYY[0];
	var prevYYYY = prevMMYYYY[1];

	var nextMMYYYY = Calendar.calc_month_year(this.gMonth, this.gYear, 1);
	var nextMM = nextMMYYYY[0];
	var nextYYYY = nextMMYYYY[1];
	
		this.wwrite("<TABLE WIDTH='100%' HEIGHT='10px' BORDER=1 CELLSPACING=0 CELLPADDING=0 BGCOLOR='#993812'><TR align='center'><TD ALIGN=center>");
	this.wwrite("<font face=verdana size=1><A HREF=\""   +
		"javascript:window.opener.Build(" + 
		"'" + this.gReturnItem + "', '" + this.gMonth + "', '" + (parseInt(this.gYear)-1) + "', '" + this.gFormat + "'" +
		");" +
		"\" title=\"Previous Year\"><img src='images/leftarrow.png' height='20px' width='20px'><\/A></font></TD><TD align='center'>"+this.gYear+"</TD><TD ALIGN=center height='10'>");
	this.wwrite("<font face=verdana size=1><A HREF=\"" +
		"javascript:window.opener.Build(" + 
		"'" + this.gReturnItem + "', '" + this.gMonth + "', '" + (parseInt(this.gYear)+1) + "', '" + this.gFormat + "'" +
		");" +
		"\" title=\"Next Year\"><img src='images/rightarrow.png' height='20px' width='20px'><\/A></font></TD></font></TD></TR><TR><TD ALIGN=center height='10'>");
	this.wwrite("<font face=verdana size=1><A HREF=\"" +
		"javascript:window.opener.Build(" + 
		"'" + this.gReturnItem + "', '" + prevMM + "', '" + prevYYYY + "', '" + this.gFormat + "'" +
		");" +
		"\" title=\"Previous Month\"><img src='images/leftarrow.png' height='20px' width='20px'><\/A></font></TD><TD align='center'>"+this.gMonthName+"</TD><TD ALIGN=center>");
	this.wwrite("<font face=verdana size=1><A HREF=\"" +
		"javascript:window.opener.Build(" + 
		"'" + this.gReturnItem + "', '" + nextMM + "', '" + nextYYYY + "', '" + this.gFormat + "'" +
		");" +
		"\" title=\"Next Month\"><img src='images/rightarrow.png' height='20px' width='20px'><\/A></font></TD></TR></TABLE><BR/>");
	// Get the complete calendar code for the month..
	vCode = this.getMonthlyCalendarCode();
	this.wwrite(vCode);

	this.wwrite("<center><BR><a href=\"Javascript:window.close();\">"+ putEscape("<img src='images/close.jpg' title='Close'>","'","") +"</A> </center>");


	this.wwrite("</font></body></html>");
	this.gWinCal.document.close();
}

Calendar.prototype.showY = function() {
	var vCode = "";
	var i;
	var vr, vc, vx, vy;		// Row, Column, X-coord, Y-coord
	var vxf = 285;			// X-Factor
	var vyf = 200;			// Y-Factor
	var vxm = 10;			// X-margin
	var vym;				// Y-margin
	if (isIE)	vym = 75;
	else if (isNav)	vym = 25;
	
	this.gWinCal.document.open();

	this.wwrite("<html>");
	this.wwrite("<head><title>Calendar</title>");
	this.wwrite("<style type='text/css'>\n<!--");
	for (i=0; i<12; i++) {
		vc = i % 3;
		if (i>=0 && i<= 2)	vr = 0;
		if (i>=3 && i<= 5)	vr = 1;
		if (i>=6 && i<= 8)	vr = 2;
		if (i>=9 && i<= 11)	vr = 3;
		
		vx = parseInt(vxf * vc) + vxm;
		vy = parseInt(vyf * vr) + vym;

		this.wwrite(".lclass" + i + " {position:absolute;top:" + vy + ";left:" + vx + ";}");
	}
	this.wwrite("-->\n</style>");
	this.wwrite("</head>");

	this.wwrite("<body " + 
		"link=\"" + this.gLinkColor + "\" " + 
		"vlink=\"" + this.gLinkColor + "\" " +
		"alink=\"" + this.gLinkColor + "\" " +
		"text=\"" + this.gTextColor + "\">");
	this.wwrite("<FONT FACE='" + fontface + "' SIZE=2><B>");
	this.wwrite("Year : " + this.gYear);
	this.wwrite("</B><BR>");

	// Show navigation buttons
	var prevYYYY = parseInt(this.gYear) - 1;
	var nextYYYY = parseInt(this.gYear) + 1;
	
	this.wwrite("<TABLE WIDTH='100%' BORDER=1 CELLSPACING=0 CELLPADDING=0 BGCOLOR='#e0e0e0'><TR><TD ALIGN=center>");
	this.wwrite("<A HREF=\"" +
		"javascript:window.opener.Build(" + 
		"'" + this.gReturnItem + "', null, '" + prevYYYY + "', '" + this.gFormat + "'" +
		");" +
		"\" alt='Prev Year'><img src='images/leftarrow.png'/><\/A></TD><TD ALIGN=center>");
	this.wwrite("<A HREF=\"javascript:window.print();\">Print</A></TD><TD ALIGN=center>");
	this.wwrite("<A HREF=\"" +
		"javascript:window.opener.Build(" + 
		"'" + this.gReturnItem + "', null, '" + nextYYYY + "', '" + this.gFormat + "'" +
		");" +
		"\"><img src='images/rightarrow.png'><\/A></TD></TR></TABLE><BR>");

	// Get the complete calendar code for each month..
	var j;
	for (i=11; i>=0; i--) {
		if (isIE)
			this.wwrite("<DIV ID=\"layer" + i + "\" CLASS=\"lclass" + i + "\">");
		else if (isNav)
			this.wwrite("<LAYER ID=\"layer" + i + "\" CLASS=\"lclass" + i + "\">");

		this.gMonth = i;
		this.gMonthName = Calendar.get_month(this.gMonth);
		vCode = this.getMonthlyCalendarCode();
		this.wwrite(this.gMonthName + "/" + this.gYear + "<BR>");
		this.wwrite(vCode);

		if (isIE)
			this.wwrite("</DIV>");
		else if (isNav)
			this.wwrite("</LAYER>");
	}

	this.wwrite("</font><BR></body></html>");
	this.gWinCal.document.close();
}

Calendar.prototype.wwrite = function(wtext) {
	this.gWinCal.document.writeln(wtext);
}

Calendar.prototype.wwriteA = function(wtext) {
	this.gWinCal.document.write(wtext);
}

Calendar.prototype.cal_header = function() {
	var vCode = "";
//var shortWeekdays_arr = Locale.availableLocales[Locale.DEFAULT].shortWeekdays;
var shortWeekdays_arr = ["Sun", "Mon", "Tue", "Wed", "Thu", "Fri", "Sat"];
	vCode = vCode + "<TR>";
	vCode = vCode + "<TD align='center' height='18'><FONT SIZE='1' FACE='" + fontface + "' COLOR='" + this.gHeaderColor + "'>" + shortWeekdays_arr[0] + "</FONT></TD>";
	vCode = vCode + "<TD align='center'><FONT SIZE='1' FACE='" + fontface + "' COLOR='" + this.gHeaderColor + "'>" + shortWeekdays_arr[1] + "</FONT></TD>";
	vCode = vCode + "<TD align='center'><FONT SIZE='1' FACE='" + fontface + "' COLOR='" + this.gHeaderColor + "'>" + shortWeekdays_arr[2] + "</FONT></TD>";
	vCode = vCode + "<TD align='center'><FONT SIZE='1' FACE='" + fontface + "' COLOR='" + this.gHeaderColor + "'>" + shortWeekdays_arr[3] + "</FONT></TD>";
	vCode = vCode + "<TD align='center'><FONT SIZE='1' FACE='" + fontface + "' COLOR='" + this.gHeaderColor + "'>" + shortWeekdays_arr[4] + "</FONT></TD>";
	vCode = vCode + "<TD align='center'><FONT SIZE='1' FACE='" + fontface + "' COLOR='" + this.gHeaderColor + "'>" + shortWeekdays_arr[5] + "</FONT></TD>";
	vCode = vCode + "<TD align='center'><FONT SIZE='1' FACE='" + fontface + "' COLOR='" + this.gHeaderColor + "'>" + shortWeekdays_arr[6] + "</FONT></TD>";
	vCode = vCode + "</TR>";
	
	return vCode;
}

Calendar.prototype.cal_data = function() {
	var vDate = new Date();
	vDate.setDate(1);
	vDate.setMonth(this.gMonth);
	vDate.setFullYear(this.gYear);

	var vFirstDay=vDate.getDay();
	var vDay=1;
	var vLastDay=Calendar.get_daysofmonth(this.gMonth, this.gYear);
	var vOnLastDay=0;
	var vCode = "";

	/*
	Get day for the 1st of the requested month/year..
	Place as many blank cells before the 1st day of the month as necessary. 
	*/

	vCode = vCode + "<TR>";
	for (i=0; i<vFirstDay; i++) {
		vCode = vCode + "<TD align='center' height='20'" + this.write_weekend_string(i) + "><FONT SIZE='1' FACE='" + fontface + "'> </FONT></TD>";
	}

	// Write rest of the 1st week
	for (j=vFirstDay; j<7; j++) {
	vCode = vCode + "<TD align='center' height='20'" + this.write_weekend_string(j) + "><FONT SIZE='1' FACE='" + fontface + "'>" + 
				"<A HREF='#' style='text-decoration:none;'" + 
					"onClick=\"populateDateValue('"+this.gReturnItem+"','"+this.format_data(vDay)+"')\">" + 
				this.format_day(vDay) + 
				"</A>" + 
				"</FONT></TD>";
			vDay=vDay + 1;
	}
	vCode = vCode + "</TR>";

	// Write the rest of the weeks
	for (k=2; k<7; k++) {
		vCode = vCode + "<TR>";

		for (j=0; j<7; j++) {

	vCode = vCode + "<TD align='center' height='20'" + this.write_weekend_string(j) + "><FONT SIZE='1' FACE='" + fontface + "'>" + 
				"<A HREF='#' style='text-decoration:none;'" + 
					"onClick=\"populateDateValue('"+this.gReturnItem+"','"+this.format_data(vDay)+"')\">" + 
				this.format_day(vDay) + 
				"</A>" + 
				"</FONT></TD>";
			vDay=vDay + 1;

			if (vDay > vLastDay) {
				vOnLastDay = 1;
				break;
			}
		}

		if (j == 6)
			vCode = vCode + "</TR>";
		if (vOnLastDay == 1)
			break;
	}
	
	// Fill up the rest of last week with proper blanks, so that we get proper square blocks
	for (m=1; m<(7-j); m++) {
		if (this.gYearly)
			vCode = vCode + "<TD align='center'" + this.write_weekend_string(j+m) + 
			"><FONT SIZE='1' FACE='" + fontface + "' COLOR='gray'> </FONT></TD>";
		else
			vCode = vCode + "<TD align='center'" + this.write_weekend_string(j+m) + 
			"><FONT SIZE='1' FACE='" + fontface + "' COLOR='gray'>" + m + "</FONT></TD>";
	}
	
	return vCode;
}

Calendar.prototype.format_day = function(vday) {
	var vNowDay = gNow.getDate();
	var vNowMonth = gNow.getMonth();
	var vNowYear = gNow.getFullYear();

	if (vday == vNowDay && this.gMonth == vNowMonth && this.gYear == vNowYear)
		return ("<FONT COLOR=\"RED\"><B>" + vday + "</B></FONT>");
	else
		return (vday);
}

Calendar.prototype.write_weekend_string = function(vday) {
	var i;

	// Return special formatting for the weekend day.
	for (i=0; i<weekend.length; i++) {
		if (vday == weekend[i])
			return (" BGCOLOR=\"" + weekendColor + "\"");
	}
	
	return "";
}

Calendar.prototype.format_data = function(p_day) {
	var vData;
	var vMonth = 1 + this.gMonth;
	vMonth = (vMonth.toString().length < 2) ? "0" + vMonth : vMonth;
	var vMon = Calendar.get_shortmonth(this.gMonth).toUpperCase();
	var vFMon = Calendar.get_month(this.gMonth).toUpperCase();
	var vY4 = new String(this.gYear);
	var vY2 = new String(this.gYear.substr(2,2));
	var vDD = (p_day.toString().length < 2) ? "0" + p_day : p_day;

	switch (this.gFormat) {
		case "MM\/DD\/YYYY" :
			vData = vMonth + "\/" + vDD + "\/" + vY4;
			break;
		case "MM\/DD\/YY" :
			vData = vMonth + "\/" + vDD + "\/" + vY2;
			break;
		case "MM-DD-YYYY" :
			vData = vMonth + "-" + vDD + "-" + vY4;
			break;
		case "MM-DD-YY" :
			vData = vMonth + "-" + vDD + "-" + vY2;
			break;

		case "DD\/MON\/YYYY" :
			vData = vDD + "\/" + vMon + "\/" + vY4;
			break;
		case "DD\/MON\/YY" :
			vData = vDD + "\/" + vMon + "\/" + vY2;
			break;
		case "DD-MON-YYYY" :
			vData = vDD + "-" + vMon + "-" + vY4;
			break;
		case "DD-MON-YY" :
			vData = vDD + "-" + vMon + "-" + vY2;
			break;

		case "DD\/Month\/YYYY" :
			vData = vDD + "\/" + vFMon + "\/" + vY4;
			break;
		case "DD\/Month\/YY" :
			vData = vDD + "\/" + vFMon + "\/" + vY2;
			break;
		case "DD-Month-YYYY" :
			vData = vDD + "-" + vFMon + "-" + vY4;
			break;
		case "DD-Month-YY" :
			vData = vDD + "-" + vFMon + "-" + vY2;
			break;

		case "DD\/MM\/YYYY" :
			vData = vDD + "\/" + vMonth + "\/" + vY4;
			break;
		case "DD\/MM\/YY" :
			vData = vDD + "\/" + vMonth + "\/" + vY2;
			break;
		case "DD-MM-YYYY" :
			vData = vDD + "-" + vMonth + "-" + vY4;
			break;
		case "DD-MM-YY" :
			vData = vDD + "-" + vMonth + "-" + vY2;
			break;

		default :
			vData = vMonth + "\/" + vDD + "\/" + vY4;
	}

	return vData;
}

function Build(p_item, p_month, p_year, p_format) {
	var p_WinCal = ggWinCal;
	gCal = new Calendar(p_item, p_WinCal, p_month, p_year, p_format);

	// Customize your Calendar here..
	gCal.gBGColor="white";
	gCal.gLinkColor="black";
	gCal.gTextColor="black";
	gCal.gHeaderColor="#000000";

	// Choose appropriate show function
	if (gCal.gYearly)	gCal.showY();
	else	gCal.show();
}

function calendar() {
	/* 
		p_month : 0-11 for Jan-Dec; 12 for All Months.
		p_year	: 4-digit year
		p_format: Date format (mm/dd/yyyy, dd/mm/yy, ...)
		p_item	: Return Item.
	*/
	p_item = arguments[0];

	if(screen.height - arguments[1] > 300)
		p_top = arguments[1];
	else
		p_top = screen.height - 300;

	if(screen.width - arguments[2] > 200)
		p_left = arguments[2];
	else
		p_left = screen.width - 200;

	if (arguments[3] == null)
		p_month = new String(gNow.getMonth());
	else
		p_month = arguments[3];
	if (arguments[4] == "" || arguments[4] == null)
		p_year = new String(gNow.getFullYear().toString());
	else
		p_year = arguments[4];
	if (arguments[5] == null)
		p_format = "DD-MON-YYYY";
	else
		p_format = arguments[5];
	//Calendar.Months = Locale.availableLocales[Locale.DEFAULT].longMonths;
	///Calendar.shortMonths = Locale.availableLocales[Locale.DEFAULT].shortMonths;
	Calendar.Months = ["January", "February", "March", "April", "May", "June", "July", "August", "September", "October", "November", "December"];
Calendar.shortMonths = ["January", "February", "March", "April", "May", "June", "July", "August", "September", "October", "November", "December"];

	vWinCal = window.open("", "Calendar", 
		"width=180,height=240,status=no,resizable=no,top="+p_top+",left="+p_left);

		//"width=180,height=240,status=no,resizable=no,top=100,left=100");
	vWinCal.opener = self;
	ggWinCal = vWinCal;
	ggWinCal.focus();
	Build( p_item,p_month, p_year, p_format);
}
/*
Yearly Calendar Code Starts here
*/
function show_yearly_calendar(p_item, p_year, p_format) {
	// Load the defaults..
	if (p_year == null || p_year == "")
		p_year = new String(gNow.getFullYear().toString());
	if (p_format == null || p_format == "")
		p_format = "MM/DD/YYYY";

	var vWinCal = window.open("", "Calendar", "scrollbars=yes");
	vWinCal.opener = self;
	ggWinCal = vWinCal;

	Build(p_item, null, p_year, p_format);
}

function getDatePickerPattern()
{
	var ls_date_format, ls_pattern;

	/*if(typeof JSFORM != "undefined" && document.forms[JSFORM] && document.forms[JSFORM].elements["MlineDateFormat"])
		ls_date_format = document.forms[JSFORM].elements["MlineDateFormat"].value;
	else
	{ */
		//ls_date_format = document.forms[gs_main_form_name].elements["DateFormat"].value;
		ls_date_format = "dd/MM/yyyy";
	//}

	ls_pattern = ls_date_format.replace(/dd/g, "DD");	// make dd to DD
	ls_pattern = ls_pattern.replace(/yy/g , "YY");		// make yy / yyyy to YY / YYYY
	ls_pattern = ls_pattern.replace(/MMMM/g , "Month");		
	ls_pattern = ls_pattern.replace(/MMM/g , "MON");		
	return ls_pattern;
}

function trim(inString)
{
  var retVal = "";
  var start = 0;
  var l_input;
  if(inString == null)
    return null;
  l_input = inString.toString();	// as inString may be array
  while ((start < l_input.length) && (l_input.charAt(start) == ' ')) 
  {
    ++start;
  }
  if(start==l_input.length)
  	return "";
  	
  var end = l_input.length;
  while ((end > 0) && (l_input.charAt(end - 1) == ' ')) 
  {
    --end;
  }
  retVal = l_input.substring(start, end);
  return retVal;
}

function putEscape(as_str, char_to_escape, prefix_char)
{
	var temp, ls_str;
	ls_str = as_str;
	if(trim(ls_str).length>0)
		for(var i=0; i < ls_str.length; i++)
		{
			temp = ls_str.charAt(i);
			if(temp == char_to_escape || temp == prefix_char)
			{
				ls_str = ls_str.substring(0,i) + prefix_char + ls_str.substring(i,ls_str.length);
				i++;
			}
		}
	return ls_str;
}