<%-- 
    Document   : sizevariable
    Created on : Feb 21, 2020, 3:28:38 PM
    Author     : user
--%>

<%@page import="com.itpm.model.InheritanceDTO"%>
<%@page import="com.itpm.controller.InheritanceTotal"%>
<%@page import="com.itpm.model.SizeDTO_1"%>
<%@page import="com.itpm.model.SizeDTO_11"%>
<%@page import="com.itpm.model.TotalDTO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.itpm.model.SizeDTO"%>

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
      <div class="logo"><button onclick="window.location.href = 'Isetting.jsp';">Setting</button>
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
                                                <th>direct</th>
                                                <th>indirect</th>
                                                <th>total</th>
                                                <th>Ci</th>
                                            </tr>
                                        </thead>
                                        <tbody>
                                            <%
                                                InheritanceTotal svmc = new InheritanceTotal();
                                                String filename = session.getAttribute("filename").toString();
                                                ArrayList<InheritanceDTO> sizeList = svmc.measureInherittot(filename);
                                                int lineNo = 0;
                                                for (InheritanceDTO s : sizeList) {
                                                    lineNo++;
                                            %>
                                            
                                            <tr>
                                                <th scope="row"><%=lineNo%></th>
                                                <td><%=s.getCodeLine()%></td>
                                                 <td><%=s.getDirectInheritance()!= 0 ? s.getDirectInheritance() : ""%></td>
                                                 <td><%=s.getIndirectInheritance() != 0 ? s.getIndirectInheritance() : ""%></td>
                                                 <td><%=s.getTotal()!= 0 ? s.getTotal() : ""%></td>
                                                 <td><%=s.getCi()%></td>
                                            
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
