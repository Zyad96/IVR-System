/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author aisha
 */
public class testmimes extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
            PrintWriter out = resp.getWriter();
// Actual logic goes here.
//resp.setContentType("application/pdf");

resp.setContentType("audio/mp3");
//resp.setContentType("image/jpeg");
//resp.setContentType("text/xml");
out.println(" <audio controls>\n" +
"    <source src=\"/home/aisha/Downloads/recording2.mp3\" type=\"audio/mp3\">\n" +
"</audio> ");
//String username=getServletConfig().getInitParameter("userName");
//String password =getServletConfig().getInitParameter("password");
//out.printf("Username of app: "+username +"\n");
//out.print("\n The password: "+password);

        

    }




}