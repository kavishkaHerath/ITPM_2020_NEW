<%-- 
    Document   : sizevariable
    Created on : Feb 21, 2020, 3:28:38 PM
    Author     : user
--%>

<%@page import="com.itpm.controller.SizeVMController11_1"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.itpm.model.SizeDTO"%>
<%@page import="com.itpm.controller.SizeVMController11"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Size variable</title>
        <link rel="stylesheet" href="css/styl2.css"  >
        
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css"  >
        <script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>



    </head>
    <body style="background: #e1ecf2;">
        <div class="wrapper">
  <div class="top_navbar">
       <div class="hamburger">
       <div class="one"></div>
       <div class="two"></div>
       <div class="three"></div>
    </div>
    <div class="top_menu">
        
      <div class="logo">CodeME </div>
      <div class="logo">Size Variable Methods </div>
      <div class="logo"><button onclick="window.location.href = 'svmSetting.jsp';">Setting</button>
    </div>
    </div>
  </div>

        <div class="wrapper">
            <div class="container-fluid">
            
                <br>

              

                <div class="row">
                    <div class="col-md-1"></div> 
                    <div class="col-md-10">
                        <div class="card">
                            <div class="card-body">
                                <div class="table-responsive-sm">
                                    <table class="table table-bordered">
                                        <thead>
                                            <tr>
                                                <th>Line No</th>    
                                                <th>Program Statements</th>
                                                <th>Wvs</th>  
                                                <th>Npdtv</th>
                                                <th>Ncdtv</th>
                                                <th>Cv</th>
                                            </tr>
                                        </thead>
                                        <tbody>
                                            <%
                                                SizeVMController11_1 svmc11 = new SizeVMController11_1();
                                                String filename = session.getAttribute("filename").toString();
                                                ArrayList<SizeDTO> variableList = svmc11.measurevariable(filename);
                                                int lineNo = 0;
                                                for (SizeDTO s : variableList) {
                                                    lineNo++;
                                            %>
                                            
                                            <tr>
                                                <th scope="row"><%=lineNo%></th>
                                                <td><%=s.getCodeLine()%></td>
                                                <td><%=s.getWvs() != 0 ? s.getWvs(): ""%></td>
                                                <td><%=s.getNpdtv() != 0 ? s.getNpdtv() : ""%></td>
                                                <td><%=s.getNcdtv() != 0 ? s.getNcdtv() : ""%></td>
                                                
                                                
                                                <td><%=s.getCs() != 0 ? s.getCs() : ""%></td>
                                               
                                            </tr>

                                            <%
                                                }
                                            %>


                                        </tbody>
                                    </table>
                                </div>


                            </div>
                        </div>


                    </div> 
                    <div class="col-md-1"></div> 
                </div>


               


            </div>
        </div>
    </body>
</html>
