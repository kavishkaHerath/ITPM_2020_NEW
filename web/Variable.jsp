<%-- 
    Document   : sizevariable
    Created on : Feb 21, 2020, 3:28:38 PM
    Author     : user
--%>

<%@page import="java.io.File"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.itpm.model.VeriableDTO"%>
<%@page import="com.itpm.controller.VeriableConrtoller"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Size variable</title>
        <link rel="stylesheet" href="css/styl2.css"  >
           <link rel="stylesheet" href="css/button.css"  >
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css"  >
        <script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
 <%
        File file = new File("CodeMe/upload/");
        String[] fileList = file.list();
        ArrayList<String> filenames = new ArrayList<>();
        for(String name:fileList){
            System.out.println(name);
            filenames.add(name);
        }
        System.out.println(filenames.get(0));
      
        String sss;
        int size = filenames.size();
        
        
        %>



    </head>
    <body style="background: #e1ecf2;">
        <div class="wrapper">
  <div class="top_navbar">
       <div class="hamburger" onclick="window.location.href = 'index.jsp';">
       <div class="one"></div>
       <div class="two"></div>
       <div class="three"></div>
    </div>
    <div class="top_menu">
        
      <div class="logo">CodeME </div>
      <div class="logo"> Variable  </div>
      <div class="logo"><button onclick="window.location.href = 'VeribleSetting.jsp';">Setting</button>
    </div>
    </div>
  </div>
            <br>
     <div>    
                                        <p>
                                            
                                            <button class="buttonn" onclick="window.location.href = 'VeriableChart.jsp';">veriable Chart</button>

                                         </p>
                                            </div>
            
             <%  if(session.getAttribute("filetype").toString().equals("zip")){ %>   
                 
        <div class="wrapper">
            <div class="container-fluid">
            
          
                <div class="row">
                    <div class="col-md-1"></div> 
                    <div class="col-md-10">
                        <div class="card">
                            <div class="card-body">
                                <div class="table-responsive-sm">
                                    <form action="Variable.jsp">
      <select id="filenames" name="filena" value="filenames" class="form-control form-control-sm">
    <%
        VeriableConrtoller svm = new VeriableConrtoller();
        
        //String namee = "JumpingBox.java";
        
                                               
    for (int i=0;i<size;i++) {
       
      String se = (String)filenames.get(i);
      if(se.endsWith(".java")){
    
      
    %>
    <option value="<%=se%>"  ><%=se%></option>
    
    <%    
    }}
    %>
    
    </select>
    <br>
    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input class="buttonn" type="submit" value="Submit">
                                    </form>
   
     
  
                                
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        </div>
      
     <%    
    }
    %>  
    
    <div class="wrapper">
            <div class="container-fluid">
            
                <br>

              

                <div class="row">
                    <div class="col-md-1"></div> 
                    <div class="col-md-10">
                        <div class="card">
                            <div class="card-body">
                                <div class="table-responsive-sm">
                                      <%
                                               
                                                VeriableConrtoller svm1 = new VeriableConrtoller();
                                                String filename = request.getParameter("filena") == null ? session.getAttribute("filename1").toString():
                                                request.getParameter("filena") ;
                                               %>
                                     
                                               <h6> <B>File Name : <%=filename%></B> </h6> 
                            </div>
                        </div>
                    </div>
                </div>
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
                                                ArrayList<VeriableDTO> VariableList = svm1.measurevariable(filename);
                                                int lineNo = 0;
                                                int a=0;
                                                for (VeriableDTO s : VariableList) {
                                                    lineNo++;
                                                    a=a+s.getCv();
                                                    
                                            %>
                                            
                                            <tr>
                                                <th scope="row"><%=lineNo%></th>
                                                <td><%=s.getCodeLine()%></td>
                                                <td><%=s.getWvs() != 0 ? s.getWvs(): ""%></td>
                                                <td><%=s.getNpdtv() != 0 ? s.getNpdtv() : ""%></td>
                                                <td><%=s.getNcdtv() != 0 ? s.getNcdtv() : ""%></td>
                                                <td><%=s.getCv()%></td>
                                                
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
                 <br>
                 <div class="row">
                    <div class="col-md-1"></div> 
                        <div class="col-md-10">
                            <div class="card">
                                <div class="card-body"><b>
                                    File Name : <%=filename%>
                                    <br>
                                    Total Cv : <%=a%>
                                    
                                    </b> 
                                </div></div></div></div>



               


            </div>
        </div>
    </body>
</html>
