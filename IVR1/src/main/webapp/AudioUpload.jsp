<%-- 
    Document   : AudioUpload
    Created on : Jul 4, 2023, 4:43:12 PM
    Author     : aisha
--%>

<%@page import="java.util.List"%>
<%--
    String editedXmlContent = request.getParameter("audioFile");
    String saveDirectory = "/var/lib/asterisk/sounds/en/";

    File directory = new File(saveDirectory);
    if (!directory.exists()) {
        directory.mkdirs();
    }

    try (FileWriter writer = new FileWriter(saveDirectory + File.separator + fileName)) {
        writer.write(editedXmlContent);
    } catch (IOException e) {
        e.printStackTrace();
    }

//    response.sendRedirect("success.jsp");
--%>

<%@page import="org.apache.commons.fileupload.servlet.ServletFileUpload"%>
<%@page import="org.apache.commons.fileupload.disk.DiskFileItemFactory"%>
<%@page import="org.apache.commons.fileupload.FileItem"%>
<%@page import="java.io.File"%>
<%
    // Check if the request contains a file upload
    boolean isMultipart = ServletFileUpload.isMultipartContent(request);

    if (isMultipart) {
        // Create a factory for disk-based file items
        DiskFileItemFactory factory = new DiskFileItemFactory();

        // Set the directory to temporarily store uploaded files
        String tempDirectory = System.getProperty("java.io.tmpdir");
        factory.setRepository(new File(tempDirectory));

        // Create the file upload handler
        ServletFileUpload upload = new ServletFileUpload(factory);

        try {
            // Parse the request to get the file items
            List<FileItem> items = upload.parseRequest(request);

            // Process each file item
            for (FileItem item : items) {
                // Check if the item is a file
                if (!item.isFormField()) {
                    // Get the file name
                    String fileName = item.getName();

                    // Specify the directory to save the file
                    String saveDirectory = "/var/lib/asterisk/sounds/en/";

                    // Create the save directory if it doesn't exist
                    File directory = new File(saveDirectory);
                    if (!directory.exists()) {
                        directory.mkdirs();
                    }

                    // Save the file to the specified directory
                    String filePath = saveDirectory + File.separator + fileName;
                    item.write(new File(filePath));

                    // Display success message
                    out.println("Audio file uploaded successfully");
                }
            }
        } catch (Exception e) {
            // Display error message
            out.println("Failed to upload the audio file");
            e.printStackTrace();
        }
    }
%>
