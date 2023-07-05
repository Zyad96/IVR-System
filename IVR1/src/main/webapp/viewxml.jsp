<%-- 
    Document   : viewxml
    Created on : Jun 29, 2023, 11:31:04 PM
    Author     : omoor
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="utf-8">
    <title>View Vxml</title>
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
                            <span class="d-none d-lg-inline-flex">Telecom 43</span>
                        </a>
                        <div class="dropdown-menu dropdown-menu-end bg-secondary border-0 rounded-0 rounded-bottom m-0">
                            <a href="#" class="dropdown-item">My Profile</a>
                            <a href="#" class="dropdown-item">Settings</a>
                            <a href="#" class="dropdown-item">Log Out</a>
                        </div>
                    </div>
                </div>
            </nav>
<div class="container-fluid">
    <div class="row">
        <div class="col-md-9">
            <h2 class="text-danger">Edit VXML File</h2> <!-- Title for the first div -->
            <%-- Retrieve the XML content attribute --%>
            <%
                String xmlContent = (String) request.getAttribute("xmlContent");
            %>

            <%-- Display the XML content in a <textarea> for editing --%>
            <form id="saveForm" method="post">
                <textarea name="editedXmlContent" id="text-editor" rows="10" cols="50"><%= xmlContent %></textarea>
                <br>
                <input type="submit" class="btn btn-primary m-2" value="Save File">
                <div id="message"></div> <!-- Placeholder for success/error message -->
            </form>
        </div>
        <div class="col-md-3">
            <div class="container-fluid pt-4 px-4">
                <div class="h-100 bg-secondary rounded p-4">
                    <h2 class="text-danger">Upload Audio File</h2> <!-- Title for the second div -->
                    <%-- Add your code for uploading an audio file here --%>
                    <!-- Example: -->
                    <form id="uploadForm" method="post" enctype="multipart/form-data">
                        <input type="file" name="audioFile" id="audio-file">
                        <br>
                        <input type="submit" class="btn btn-primary m-2" value="Upload Audio">
                        <div id="audio-message"></div> <!-- Placeholder for success/error message -->
                    </form>
                </div>
            </div>
        </div>
    </div>
</div>




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

    /* Add any additional styles for the new div here */
</style>

<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>

<script>
    $(document).ready(function () {
        $('#saveForm').submit(function (e) {
            e.preventDefault(); // Prevent the form from submitting normally

            // Get the form data
            var formData = $(this).serialize();

            // Send an AJAX request to save the file
            $.ajax({
                type: 'POST',
                url: 'VxmlSave.jsp',
                data: formData,
                success: function (response) {
                    // Display success message
                    $('#message').text('File saved successfully');
                },
                error: function (xhr, status, error) {
                    // Display error message
                    $('#message').text('Failed to save the file');
                }
            });
        });

        // Add your code for uploading an audio file here
        $('#uploadForm').submit(function (e) {
            e.preventDefault(); // Prevent the form from submitting normally

            // Get the form data
            var formData = new FormData(this);

            // Send an AJAX request to upload the audio file
            $.ajax({
                type: 'POST',
                url: 'AudioUpload.jsp',
                data: formData,
                processData: false,
                contentType: false,
                success: function (response) {
                    // Display success message
                    $('#audio-message').text('Audio file uploaded successfully');
                },
                error: function (xhr, status, error) {
                    // Display error message
                    $('#audio-message').text('Failed to upload the audio file');
                }
            });
        });
    });
</script>

<!--<div class="col-sm-12 col-md-6 col-xl-4">
                        <div class="h-100 bg-secondary rounded p-4">
                            <div class="d-flex align-items-center justify-content-between mb-4">
                                
                            </div>
                        </div>-->
  <div class="container-fluid pt-4 px-4">
                <div class="bg-secondary rounded-top p-4">
                    <div class="row">
                        <div class="col-12 col-sm-6 text-center text-sm-start">
                            &copy; <a href="#">Telecom 43</a>, All Right Reserved. 
                        </div>
                        <div class="col-12 col-sm-6 text-center text-sm-end">
                            <!--/*** This template is free as long as you keep the footer author’s credit link/attribution link/backlink. If you'd like to use the template without the footer author’s credit link/attribution link/backlink, you can purchase the Credit Removal License from "https://htmlcodex.com/credit-removal". Thank you for your support. ***/-->
<!--                            Designed By <a href="https://htmlcodex.com">HTML Codex</a>
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

