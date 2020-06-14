/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.itpm.server;


import com.itpm.controller.PDFService;
import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import java.io.File;
import java.util.Enumeration;
import java.util.Iterator;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import java.util.zip.ZipEntry;
import java.util.zip.ZipFile;
import javax.servlet.ServletContext;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpSession;

import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.FileItemFactory;
import org.apache.commons.fileupload.FileUploadException;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;

/**
 * Servlet implementation class UploadFile
 */
@WebServlet(name = "UploadFile", urlPatterns = {"/UploadFile"})
public class UploadFile extends HttpServlet {

    private static final long serialVersionUID = 1L;
    HttpSession session;
    ServletContext application;

    /**
     * Default constructor.
     */
    public UploadFile() {
        // TODO Auto-generated constructor stub
    }

    /**
     * @param request
     * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
     * response)
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // TODO Auto-generated method stub
    }

    /**
     * @param request
     * @param response
     * @throws javax.servlet.ServletException
     * @throws java.io.IOException
     * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
     * response)
     */
    
    public static String getFileExtension(String fullName) {
        String fileName = new File(fullName).getName();
        int dotIndex = fileName.lastIndexOf('.');
        return (dotIndex == -1) ? "" : fileName.substring(dotIndex + 1);
    }
    
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        application = getServletContext();
        session = request.getSession();;
        boolean isMultipart = ServletFileUpload.isMultipartContent(request);

        if (isMultipart) {
            // Create a factory for disk-based file items
            FileItemFactory factory = new DiskFileItemFactory();

            // Create a new file upload handler
            ServletFileUpload upload = new ServletFileUpload(factory);

            try {
                // Parse the request
                List /* FileItem */ items = upload.parseRequest(request);
                Iterator iterator = items.iterator();
                while (iterator.hasNext()) {
                    FileItem item = (FileItem) iterator.next();
                    if (!item.isFormField()) {
                        String fileName = item.getName();
                        
                        
                         String NewfileName = fileName.replace(".zip", ".java");
                        
                      session.setAttribute("filename1", NewfileName);
                          session.setAttribute("filetype", "single");
//                        String root = getServletContext().getRealPath("/");
//                        System.out.println(root);
                        File path = new File("CodeMe/upload");
                        if (!path.exists()) {
                            boolean status = path.mkdirs();
                        }
                        System.out.println(getFileExtension(path + "/" + fileName));
                      
                      String sname = getFileExtension(path + "/" + fileName);
                      
                      
                      if(sname.equals("zip")){
                          PDFService z = new PDFService();
                          session.setAttribute("filetype", "zip");
                          z.unzip("C://" +fileName ,"CodeMe/upload");
                           System.out.println("FILE : "+ session.getAttribute("filename"));
                          try (ZipFile zipFile = new ZipFile("C://" +fileName)) {
                                         Enumeration zipEntries = zipFile.entries();
                                            int i=1;
                                            while (zipEntries.hasMoreElements()) {
                                              String fileName1 = ((ZipEntry) zipEntries.nextElement()).getName();
                                                 System.out.println(fileName1);
                                               
                                                  session.setAttribute(fileName1, fileName1);
                                                  session.setAttribute("filename"+i, fileName1);
                                                System.out.println("filename"+i);
                                                 i++;
                                                 
                                          
                                                 
                                 }
                            }
                          
                      }
                        
                     
                        
                        File uploadedFile = new File(path + "/" + fileName);
                        System.out.println(uploadedFile.getAbsolutePath());
                        item.write(uploadedFile);
                    }
                }
                System.out.println("FILE : "+ session.getAttribute("filename"));
                response.sendRedirect("index.jsp");
            } catch (FileUploadException e) {
                e.printStackTrace();
            } catch (Exception ex) {
                Logger.getLogger(UploadFile.class.getName()).log(Level.SEVERE, null, ex);
            }
           
            
        }
         
    }

}
