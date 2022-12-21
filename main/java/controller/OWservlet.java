package controller;

import java.io.IOException;
import java.net.URLEncoder;
import java.util.ArrayList;
import java.util.List;
import java.util.Scanner;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.GettheWeather;
import model.weatherBean;

@WebServlet("/OWservlet")
public class OWservlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		String cityStr = request.getParameter("city");
		String countryStr = request.getParameter("country");

		weatherBean wBean = new weatherBean(cityStr, countryStr);

		GettheWeather.getWeather(wBean);

		request.setAttribute("wBean", wBean);

		
		Cookie[] cookies = request.getCookies();
		
//		skapar en loop som kollar om cookiesAccepted finns så ska den köra mina cookies på land och stad, annars inte
		
		for (int i = 0; i < cookies.length; i++) {
			if (cookies[i].getName().equals("cookiesAccepted") && cookies[i].getValue().equals("true")) {
				
//				skapar en loop for att hitta cookie med namnet city och sparar värdet i temp
				String temp = "";
				for (int j = 0; j < cookies.length; j++) {
					if (cookies[j].getName().equals("city")) {
						temp = cookies[j].getValue();
					}
				}

				temp = temp + "-" + cityStr;
/* skapar en cookie med namnet city och värdet temp, skapar en string och lägger in värdet på cookie.
 *  skapar en array och använder denna array for att splita komma tecken från mina cookies */
				Cookie ck = new Cookie("city", temp);
				String line = ck.getValue();
				String[] arr = new String[1];
				arr = line.split("-");

				wBean.setcityArr(arr);
				ck.setMaxAge(50);
				response.addCookie(ck);

				Cookie[] cook = request.getCookies();
				String temp2 = "";
				for (int j = 0; j < cook.length; j++) {
					if (cook[j].getName().equals("country")) {
						temp2 = cook[j].getValue();
					}
				}

				temp2 = temp2 + "-" + countryStr;

				Cookie ck2 = new Cookie("country", temp2);
				String line2 = ck2.getValue();
				String[] arr2 = new String[1];
				arr2 = line2.split("-");

				wBean.setCountyArr(arr2);
				ck2.setMaxAge(50);
				response.addCookie(ck2);
				
			}
		}

		
		RequestDispatcher rd = request.getRequestDispatcher("views/showWeather.jsp");
		rd.forward(request, response);

	}

}
