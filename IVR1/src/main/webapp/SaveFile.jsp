<%-- 
    Document   : SaveFile
    Created on : Jun 29, 2023, 6:00:09 PM
    Author     : aisha
--%>

<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="java.io.FileWriter,java.io.IOException" %>

<%
    // Get the file path to be saved
    String filePath = "/home/aisha/test.vxml";

    // Get the file content from the request
    String fileContent = request.getParameter("fileContent");

    try {
        // Create a FileWriter to write the file content
        FileWriter writer = new FileWriter(filePath);

        // Write the file content
        writer.write(fileContent);

        // Close the FileWriter
        writer.close();

        // Send a success response
        response.setStatus(200);
        response.getWriter().print("File saved successfully");
    } catch (IOException e) {
        // Send an error response
        response.setStatus(500);
        response.getWriter().print("Failed to save the file");
    }
%>
