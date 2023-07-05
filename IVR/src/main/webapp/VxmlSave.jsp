<%-- 
    Document   : VxmlSave
    Created on : Jun 30, 2023, 2:50:51 AM
    Author     : aisha
--%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.io.File"%>
<%@ page import="java.io.FileWriter"%>
<%@ page import="java.io.IOException"%>
<%@ page import="javax.servlet.ServletException"%>
<%@ page import="javax.servlet.http.HttpServlet"%>
<%@ page import="javax.servlet.http.HttpServletRequest"%>
<%@ page import="javax.servlet.http.HttpServletResponse"%>

<%
    String editedXmlContent = request.getParameter("editedXmlContent");
    String saveDirectory = "/home/aisha/";

    File directory = new File(saveDirectory);
    if (!directory.exists()) {
        directory.mkdirs();
    }

    try (FileWriter writer = new FileWriter(saveDirectory + File.separator + "modified.vxml")) {
        writer.write(editedXmlContent);
    } catch (IOException e) {
        e.printStackTrace();
    }

//    response.sendRedirect("success.jsp");
%>
