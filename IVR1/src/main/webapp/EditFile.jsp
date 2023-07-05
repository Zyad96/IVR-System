<%-- 
    Document   : EditFile
    Created on : Jun 29, 2023, 4:39:45 PM
    Author     : aisha
--%>

<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="java.io.*, java.util.Scanner" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Edit File</title>
</head>
<body>
    <h1>Edit File</h1>

    <%-- Check if a file was uploaded --%>
    <% if (request.getPart("fileUpload") != null) {
           Part filePart = request.getPart("fileUpload");
           String fileName = filePart.getSubmittedFileName();
           InputStream fileContent = filePart.getInputStream();

           // Read the file content using a Scanner
           Scanner scanner = new Scanner(fileContent);
           StringBuilder contentBuilder = new StringBuilder();
           while (scanner.hasNextLine()) {
               contentBuilder.append(scanner.nextLine());
               contentBuilder.append("\n");
           }
           String fileContentString = contentBuilder.toString();

           // Process the file content here (e.g., modify, save, etc.)
           // ...

           // Save the modified content to a new file
           String modifiedFileName = "modified_" + fileName;
           String savePath = "/home/aisha/" + modifiedFileName; // Replace with your desired save path

           try (FileWriter fileWriter = new FileWriter(savePath);
                BufferedWriter bufferedWriter = new BufferedWriter(fileWriter)) {
               bufferedWriter.write(fileContentString);
           } catch (IOException e) {
               // Handle the exception appropriately
           }

           // Set the file content as a request attribute to be displayed on the page
           request.setAttribute("fileContent", fileContentString);
           request.setAttribute("modifiedFileName", modifiedFileName);

           // Close resources
           scanner.close();
           fileContent.close();
       } %>

    <p>File edited successfully!</p>
    <% String modifiedFileName = (String) request.getAttribute("modifiedFileName");
       if (modifiedFileName != null) { %>
        <p><a href="<%= modifiedFileName %>">Download Modified File</a></p>
    <% } %>
    <a href="UploadFile.jsp">Go back to upload another file</a>
</body>
</html>
