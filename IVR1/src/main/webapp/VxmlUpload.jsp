<%-- 
    Document   : VxmlUpload
    Created on : Jun 30, 2023, 2:44:36 AM
    Author     : aisha
--%>


<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="utf-8">
    <title>Uploading vxml</title>
    <meta content="width=device-width, initial-scale=1.0" name="viewport">
    <meta content="" name="keywords">
    <meta content="" name="description">

    <!-- Favicon -->
    <link href="img/favicon.ico" rel="icon">

    <!-- Google Web Fonts -->
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Open+Sans:wght@400;600&family=Roboto:wght@500;700&display=swap" rel="stylesheet"> 
    
    <!-- Icon Font Stylesheet -->
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.10.0/css/all.min.css" rel="stylesheet">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.4.1/font/bootstrap-icons.css" rel="stylesheet">

    <!-- Libraries Stylesheet -->
    <link href="lib/owlcarousel/assets/owl.carousel.min.css" rel="stylesheet">
    <link href="lib/tempusdominus/css/tempusdominus-bootstrap-4.min.css" rel="stylesheet" />

    <!-- Customized Bootstrap Stylesheet -->
    <link href="css/bootstrap.min.css" rel="stylesheet">

    <!-- Template Stylesheet -->
    <link href="css/style.css" rel="stylesheet">
</head>

<body>
    <div class="container-fluid position-relative d-flex p-0">
        <!-- Spinner Start -->
        <div id="spinner" class="show bg-dark position-fixed translate-middle w-100 vh-100 top-50 start-50 d-flex align-items-center justify-content-center">
            <div class="spinner-border text-primary" style="width: 3rem; height: 3rem;" role="status">
                <span class="sr-only">Loading...</span>
            </div>
        </div>
        <!-- Spinner End -->


        <!-- Sidebar Start -->
        <div class="sidebar pe-4 pb-3">
            <nav class="navbar bg-secondary navbar-dark">
                <a href="index.html" class="navbar-brand mx-4 mb-3">
                    <h3 class="text-primary"><i class="fa fa-user-edit me-2"></i>IVR_System</h3>
                </a>
                <div class="d-flex align-items-center ms-4 mb-4">
                    <div class="position-relative">
                        <img class="rounded-circle" src="img/user.png" alt="" style="width: 40px; height: 40px;">
                        <div class="bg-success rounded-circle border border-2 border-white position-absolute end-0 bottom-0 p-1"></div>
                    </div>
                    <div class="ms-3">
                        <h6 class="mb-0">Telecom 43</h6>
                        <span>Admin</span>
                    </div>
                </div>
                <div class="navbar-nav w-100">
                    <a href="index.html" class="nav-item nav-link"><i class="fa fa-tachometer-alt me-2"></i>Dashboard</a>
                   <a href="records1.jsp" class="nav-item nav-link"><i class="fa fa-table me-2"></i>Records</a> 
                    
                  
                   <a href="Upload2.jsp" class="nav-item nav-link"><i class="fas fa-edit"></i>Edit VXML</a>
                        </div>
                    </div>
                </div>
            </nav>
        </div>
        <!-- Sidebar End -->


        <!-- Content Start -->
        <div class="content">
            <!-- Navbar Start -->
            <nav class="navbar navbar-expand bg-secondary navbar-dark sticky-top px-4 py-0">
                <a href="index.html" class="navbar-brand d-flex d-lg-none me-4">
                    <h2 class="text-primary mb-0"><i class="fa fa-user-edit"></i></h2>
                </a>
                <a href="#" class="sidebar-toggler flex-shrink-0">
                    <i class="fa fa-bars"></i>
                </a>
                <form class="d-none d-md-flex ms-4">
                    <input class="form-control bg-dark border-0" type="search" placeholder="Search">
                </form>
                <div class="navbar-nav align-items-center ms-auto">
                    <div class="nav-item dropdown">
                        <a href="#" class="nav-link dropdown-toggle" data-bs-toggle="dropdown">
                            <i class="fa fa-envelope me-lg-2"></i>
                            <span class="d-none d-lg-inline-flex">Message</span>
                        </a>
                        <div class="dropdown-menu dropdown-menu-end bg-secondary border-0 rounded-0 rounded-bottom m-0">
                         
                        </div>
                    </div>
                    <div class="nav-item dropdown">
                        <a href="#" class="nav-link dropdown-toggle" data-bs-toggle="dropdown">
                            <i class="fa fa-bell me-lg-2"></i>
                            <span class="d-none d-lg-inline-flex">Notificatin</span>
                        </a>
                        <div class="dropdown-menu dropdown-menu-end bg-secondary border-0 rounded-0 rounded-bottom m-0">
                           </div>
                    </div>
                    <div class="nav-item dropdown">
                        <a href="#" class="nav-link dropdown-toggle" data-bs-toggle="dropdown">
                            <img class="rounded-circle me-lg-2" src="img/user.png" alt="" style="width: 40px; height: 40px;">
                            <span class="d-none d-lg-inline-flex">IVR_System</span>
                        </a>
                        <div class="dropdown-menu dropdown-menu-end bg-secondary border-0 rounded-0 rounded-bottom m-0">
                            <a href="#" class="dropdown-item">My Profile</a>
                            <a href="#" class="dropdown-item">Settings</a>
                            <a href="#" class="dropdown-item">Log Out</a>
                        </div>
                    </div>
                </div>
            </nav>
             <h2 style="color: red">Edit VXML file</h2>
             <%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="java.io.File, java.io.IOException, java.io.PrintWriter, java.io.StringWriter, java.nio.file.Files" %>
<%@ page import="java.util.List, javax.servlet.RequestDispatcher, javax.servlet.ServletException, javax.servlet.http.HttpServlet, javax.servlet.http.HttpServletRequest, javax.servlet.http.HttpServletResponse" %>
<%@ page import="javax.xml.parsers.*, javax.xml.transform.*, javax.xml.transform.dom.DOMSource, javax.xml.transform.stream.StreamResult, org.w3c.dom.Document, org.w3c.dom.Element" %>
<%@ page import="org.apache.commons.fileupload.FileItem, org.apache.commons.fileupload.disk.DiskFileItemFactory, org.apache.commons.fileupload.servlet.ServletFileUpload" %>


<%
    // Check if the request is a file upload request
    if (!ServletFileUpload.isMultipartContent(request)) {
        out.println("File upload not supported!");
        return;
    }

    // Create a factory for disk-based file items
    DiskFileItemFactory factory = new DiskFileItemFactory();

    // Set memory threshold
    factory.setSizeThreshold(1024 * 1024 * 3); // 3MB

    // Set temporary location to store files
    factory.setRepository(new File(System.getProperty("java.io.tmpdir")));

    // Create a new file upload handler
    ServletFileUpload upload = new ServletFileUpload(factory);

    // Set maximum file size limit
    upload.setFileSizeMax(1024 * 1024 * 40); // 40MB

    // Set maximum request size limit
    upload.setSizeMax(1024 * 1024 * 50); // 50MB

    // Create the upload directory if it does not exist
    String uploadDirectory = "D:\\Microsoft MB-910--AZ-900";
    File uploadDir = new File(uploadDirectory);
    if (!uploadDir.exists()) {
        uploadDir.mkdirs();
    }

    try {
        // Parse the request and retrieve file items
        List<FileItem> formItems = upload.parseRequest(request);

        if (formItems != null && formItems.size() > 0) {
            // Process each file item
            for (FileItem item : formItems) {
                // Handle form fields differently than file uploads
                if (item.isFormField()) {
                    // Process regular form fields here
                    String fieldName = item.getFieldName();
                    String fieldValue = item.getString();
                    // ...
                } else {
                    // Handle file uploads
                    String fileName = new File(item.getName()).getName();
                    String filePath = uploadDirectory + File.separator + fileName;
                    File storeFile = new File(filePath);

                    // Save the file to the upload directory
                    item.write(storeFile);

                    // Read the content of the uploaded file as XML
                    DocumentBuilderFactory dbFactory = DocumentBuilderFactory.newInstance();
                    DocumentBuilder dBuilder = dbFactory.newDocumentBuilder();
                    Document document = dBuilder.parse(storeFile);
                    document.getDocumentElement().normalize();

                    // Wrap the XML content within a root element
                    Element rootElement = document.createElement("fileContent");
                    rootElement.appendChild(document.getDocumentElement());

                    // Set the content type to XML
                    response.setContentType("text/xml");

                    // Convert the XML document to string
                    TransformerFactory transformerFactory = TransformerFactory.newInstance();
                    Transformer transformer = transformerFactory.newTransformer();
                    transformer.setOutputProperty(OutputKeys.OMIT_XML_DECLARATION, "no");
                    transformer.setOutputProperty(OutputKeys.INDENT, "yes");
                    StringWriter stringWriter = new StringWriter();
                    transformer.transform(new DOMSource(rootElement), new StreamResult(stringWriter));
                    String xmlContent = stringWriter.toString();

                    // Store the XML content in a request attribute
                    request.setAttribute("xmlContent", xmlContent);

                    // Forward the request to the viewxml.jsp page
                    RequestDispatcher dispatcher = request.getRequestDispatcher("viewxml.jsp");
                    dispatcher.forward(request, response);
                }
            }
        }
    } catch (Exception ex) {
        out.println("File upload failed due to an error: " + ex.getMessage());
    }
%>

<style>
    #text-editor {
    background-color: darkgray;
        color: darkred;
        width: 1000px;
        height: 600px;
        font-size: 16px;
    }
    #message {
        color: red;
        font-size: 20px;
    }
    
</style>

     <div class="container-fluid pt-4 px-4">
                <div class="bg-secondary rounded-top p-4">
                    <div class="row">
                        <div class="col-12 col-sm-6 text-center text-sm-start">
                            &copy; <a href="#">Telecom43</a>, All Right Reserved. 
                        </div>
                        <div class="col-12 col-sm-6 text-center text-sm-end">
<!--                            /*** This template is free as long as you keep the footer author’s credit link/attribution link/backlink. If you'd like to use the template without the footer author’s credit link/attribution link/backlink, you can purchase the Credit Removal License from "https://htmlcodex.com/credit-removal". Thank you for your support. ***/
                            Designed By <a href="https://htmlcodex.com">HTML Codex</a>
                            <br>Distributed By: <a href="https://themewagon.com" target="_blank">ThemeWagon</a>-->
                        </div>
                    </div>
                </div>
            </div>
            <!-- Footer End -->
        </div>
        <!-- Content End -->


        <!-- Back to Top -->
        <a href="#" class="btn btn-lg btn-primary btn-lg-square back-to-top"><i class="bi bi-arrow-up"></i></a>
    </div>

    <!-- JavaScript Libraries -->
    <script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0/dist/js/bootstrap.bundle.min.js"></script>
    <script src="lib/chart/chart.min.js"></script>
    <script src="lib/easing/easing.min.js"></script>
    <script src="lib/waypoints/waypoints.min.js"></script>
    <script src="lib/owlcarousel/owl.carousel.min.js"></script>
    <script src="lib/tempusdominus/js/moment.min.js"></script>
    <script src="lib/tempusdominus/js/moment-timezone.min.js"></script>
    <script src="lib/tempusdominus/js/tempusdominus-bootstrap-4.min.js"></script>

    <!-- Template Javascript -->
    <script src="js/main.js"></script>
</body>

</html>
