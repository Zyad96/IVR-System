<%-- 
    Document   : SaveFile
    Created on : Jun 29, 2023, 6:00:09 PM
    Author     : aisha
--%>

<%@page import="java.io.FileWriter"%>
<%@page import="java.io.IOException"%>
<%@page import="java.io.BufferedWriter"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Save File</title>
</head>
<body>
    <h1>Save File</h1>

    <%-- Retrieve the file content from the request parameter --%>
    <% String fileContent = request.getParameter("fileContent"); %>

    <%-- Define the path of the file to be saved --%>
    <% String filePath = "/home/aisha/file2.vxml"; %>

    <%-- Save the file content to the file --%>
    <% try (BufferedWriter writer = new BufferedWriter(new FileWriter(filePath))) {
           writer.write(fileContent);
       } catch (IOException e) {
           e.printStackTrace();
       }
    %>

   
</body>
</html>
