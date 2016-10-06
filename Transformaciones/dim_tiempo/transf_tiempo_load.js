//Create a Locale according to the specified language code
var locale = new java.util.Locale(
    language_code.getString()
,   country_code.getString()
);

//Create a calendar, use the specified initial date
var calendar = new java.util.GregorianCalendar(locale);
calendar.setTime(initial_date.getDate());

//set the calendar to the current date by adding DaySequence days
calendar.add(calendar.DAY_OF_MONTH,DaySequence.getInteger() - 1);

//get the calendar date
var tiempo_value = new java.util.Date(calendar.getTimeInMillis());

//day in year: 1..366
var simpleDateFormat   = java.text.SimpleDateFormat("D",locale);
var tiempo_dia         = simpleDateFormat.format(tiempo_value);

//day in month: 1..31
simpleDateFormat.applyPattern("d");
var tiempo_dia_mes     = simpleDateFormat.format(tiempo_value);

//en-us example: "Monday"
simpleDateFormat.applyPattern("EEEE");
var tiempo_dia_semana   = simpleDateFormat.format(tiempo_value);

//week in year, 1..53
simpleDateFormat.applyPattern("ww");
var tiempo_semana      = simpleDateFormat.format(tiempo_value);

//en-us example: "September"
simpleDateFormat.applyPattern("MMMM");
var tiempo_mes         = simpleDateFormat.format(tiempo_value);

//2 digit representation of the year, example: 07
simpleDateFormat.applyPattern("yyyy");
var tiempo_anho        = "" + simpleDateFormat.format(tiempo_value);

//handling Quarters is a DIY
//month number in year, 1..12
simpleDateFormat.applyPattern("MM");
var month_number       = simpleDateFormat.format(tiempo_value);
var tiempo_trimestre;
switch(parseInt(month_number)){
    case 1: case 2: case 3: tiempo_trimestre = "1"; break;
    case 4: case 5: case 6: tiempo_trimestre = "2"; break;
    case 7: case 8: case 9: tiempo_trimestre = "3"; break;
    case 10: case 11: case 12: tiempo_trimestre = "4"; break;
}

var falso = 0;
var tiempo_key = tiempo_anho + month_number + tiempo_dia;
