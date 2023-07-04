<%-- 
    Document   : UploadFile
    Created on : Jun 29, 2023, 4:41:20 PM
    Author     : aisha
--%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>File Editor</title>
</head>
<body>
    <h1>File Editor</h1>
    <form action="EditFilee.jsp" method="post" enctype="multipart/form-data">
        <input type="file" name="fileUpload" accept=".vxml">
        <input type="submit"  value="Upload and Edit">
    </form>
</body>
</html>
