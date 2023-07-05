<%-- 
    Document   : EditFile
    Created on : Jun 29, 2023, 4:39:45 PM
    Author     : aisha
--%>
<%@page import="java.io.IOException"%>
<%@page import="java.io.FileReader"%>
<%@page import="java.io.BufferedReader"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Edit File</title>
</head>
<body>
    <h1>Edit File</h1>

    <%-- Define the path of the file to be edited --%>
    <% String filePath = "/home/aisha/test.vxml"; %>

    <%-- Read the file content using a BufferedReader --%>
    <% String fileContent = "";
       try (BufferedReader br = new BufferedReader(new FileReader(filePath))) {
           String line;
           while ((line = br.readLine()) != null) {
               fileContent += line + "\n";
           }
       } catch (IOException e) {
           e.printStackTrace();
       }
    %>

    <%-- Display the file content in a textarea --%>
    <form action="SaveFile.jsp" method="post">
        <textarea name="fileContent" rows="10" cols="50"><%= fileContent %></textarea>
        <br>
        <input type="submit" value="Save">
    </form>
</body>
</html>
