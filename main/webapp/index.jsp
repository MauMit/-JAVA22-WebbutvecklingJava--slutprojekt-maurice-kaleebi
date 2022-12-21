<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="javax.servlet.http.Cookie" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>OpenWeather</title>
<link rel="stylesheet" href="style.css">
</head>
<body>


<!--Skapar en boolean som säger att cookie är Om Cookie är inte är null så ska den ska läsa från Cookie listan för att leta efter cookiesAccepted  -->
	<%
   Cookie[] cookies = request.getCookies();
   boolean CookieChecker = false;
   if (cookies != null) {
       for (Cookie cookie : cookies) {
           if (cookie.getName().equals("cookiesAccepted")) {
        	   CookieChecker = true;
               
           }
         
           
       }
   }
   
   /* Skapar en form som frågar om användaren vill använda cookies. Om acceptCookies är lika med Yes, skapa cookie, annars ingenting   */
   String acceptCookies = request.getParameter("acceptCookies");
   if (!CookieChecker && acceptCookies == null ) {
%>   <div class ="promtBox">
      <form action="index.jsp" method="get">
         Do you accept cookies?
         <input type="submit" name="acceptCookies" value="Yes">
         <input type="submit" name="acceptCookies" value="No">
      </form>
      </div>
<%
   } else if (acceptCookies != null) {
       if (acceptCookies.equals("Yes")) {
           Cookie cookie = new Cookie("cookiesAccepted", "true");
           cookie.setMaxAge(60 * 60 * 24 * 365); // cookie ska upphöra om ett år
           response.addCookie(cookie);
           
       } else if (acceptCookies.equals("No")) {
    	   Cookie cookie = new Cookie("cookiesAccepted", "false");
           cookie.setMaxAge(60 * 60 * 24 * 365); // cookie ska upphöra om ett år
           response.addCookie(cookie);
       }
   }
%>
<!-- skapar min for för att söka på land och stad -->
<div class="searchBox">
    <form action="OWservlet" method="get">
        City:<input type="text" name="city" /><br /> Country:<input type="text" name="country" /><br /> <input type="submit" value="go" />
    </form>
</div>

</body>
</html>
