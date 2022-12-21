<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="model.weatherBean"%>
<%@page import="controller.OWservlet"%>
<%@ page import="javax.servlet.http.Cookie" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>the weather</title>
<link rel="stylesheet" href="./style.css">
</head>
<body>

 <!-- kallar på weatherbean. Gör en uträkning så jag kan konventera Kelvin till Celcius.
 Skriver ut min data på jsp sidan -->

	<% 
	weatherBean wBean = (weatherBean) request.getAttribute("wBean");

	double number = Double.parseDouble(wBean.getTempStr());
	number = number - 273.15;
	int number2 = (int) number;

	out.print("<h2>The weather in " + wBean.getCityStr()+ ", " + wBean.getCountryStr() + " is now  " + wBean.getCloudsStr() + ", the temperature is : "
			+ number2 + "°C, and the date is: " + wBean.getTimeStr().substring(0, 10) + "</h2>");
	%>

<!-- lägger till min sök form på sidan så man kan förtsätta söka på land och stad -->

	<div class="searchBox">
		<form action="OWservlet" method="get">
			City:<input type="text" name="city" /><br /> Country:<input
				type="text" name="country" /><br /> <input type="submit"
				value="go" />
		</form>
	</div>


		
			
		<!-- skapar en loop som kollar om cookiesAccepted cookie finns, om inte ska den inte skriva ut cookies.
		Om den finns ska den skriva ut varje land och stad jag söker på-->
		
		 <%
		 Cookie[] cookies = request.getCookies();
		   boolean CookieChecker = false;
		   if (cookies != null) {
		       for (Cookie cookie : cookies) {
		           if (cookie.getName().equals("cookiesAccepted") && cookie.getValue().equals("true")) {
		        	   CookieChecker = true;
    for(int i = 0; i < wBean.getcityArr().length; i++){
        %>
    
		<!-- Printar ut mina cookies på sidan -->
		
	 <%
	 if(!wBean.getcityArr()[i].equals(null) && !wBean.getcityArr()[i].equals("")) {
		    out.print("<h3>" + wBean.getcityArr()[i]  + ", " + wBean.getCountyArr()[i] + "</h3>");
		}
    }
		 }
		       }
		   }
     %>





</body>
</html>