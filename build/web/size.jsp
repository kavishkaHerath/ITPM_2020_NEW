<%-- 
    Document   : sizevariable
    Created on : Feb 21, 2020, 3:28:38 PM
    Author     : IT18153750  Herath H.M.R.K.R
--%>

<%@page import="java.io.File"%>
<%@page import="com.itpm.controller.SizeController"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.itpm.model.SizeDTO"%>
<%@page import="com.itpm.controller.SizeController"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
           <link rel="stylesheet" href="css/button.css"  >
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Size variable</title>
        <link rel="stylesheet" href="css/styl2.css"  >
        <link rel="stylesheet" type="text/css" href="css/bootstrap.css">
        
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
  <div class="top_navbar" >
       <div class="hamburger" onclick="window.location.href = 'index.jsp';">
       <div class="one"></div>
       <div class="two"></div>
       <div class="three"></div>
    </div>
    <div class="top_menu">
        
      <div class="logo">CodeME </div>
      <div class="logo">Size </div>
      
      <div class="logo"><button onclick="window.location.href = 'SizeSetting.jsp';">Setting</button>
    </div>
    </div>
  </div>
            

                    <div>    
                                        <p>
                                            
                                            <button class="buttonn" onclick="window.location.href = 'sizeChart.jsp';">Size Chart</button>

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
                                    <form action="size.jsp">
      <select id="filenames" name="filena" value="filenames" class="form-control form-control-sm">
    <%
        SizeController svm = new SizeController();
        
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
                                               
                                                SizeController svm1 = new SizeController();
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
    
                                    <table class="table table-bordered" id="example">
                                        <thead>
                                            <tr>
                                                <th scope="col">Line no</th>
                                                <th scope="col">Program statements</th>
                                                <th scope="col">Nkw</th>
                                                <th scope="col">Nid</th>
                                                <th scope="col">Nop</th>
                                                <th scope="col">Nnv</th>
                                                <th scope="col">Nsl</th>
                                                <th scope="col">Cs</th>
                                            </tr>
                                        </thead>
                                        <tbody>
                                            <%
                                               
                                                //String productSelected = request.getParameter("filenames");
                                                ArrayList<SizeDTO> sizeList = svm1.measureSize(filename);
                                               
                                                int lineNo = 0;
                                                int a = 0;
                                                
                                                for (SizeDTO s : sizeList) {
                                                   lineNo++;
                                                   a=a+s.getCs();
                                            
                                            %>
                                                
                                                
                                                
                                            <tr>
                                                <th scope="row"><%=s.getSno()%></th>
                                                <td><%=s.getCodeLine()%></td>
                                                <td><%=s.getNkw() != 0 ? s.getNkw() : ""%></td>
                                                <td><%=s.getNid() != 0 ? s.getNid() : ""%></td>
                                                <td><%=s.getNop() != 0 ? s.getNop() : ""%></td>
                                                <td><%=s.getNnv() != 0 ? s.getNnv() : ""%></td>
                                                <td><%=s.getNsl() != 0 ? s.getNsl() : ""%></td>
                                                <td><%=s.getCs() != 0 ? s.getCs() : ""%></td>
                                                 <%
                                                }
                                            %>
                                           
                                            </tr>

                                           


                                        </tbody>
                                    </table>
                   



                                </div>


                            </div>
                        </div>


                    </div> 
                    <div class="col-md-1"></div> 
                </div>
                                            
                
                                            <br>
                <br>
                <div class="row">
                    <div class="col-md-1"></div> 
                        <div class="col-md-10">
                            <div class="card">
                                <div class="card-body"><b>
                                    File Name : <%=filename%>
                                    <br>
                                    Total Cs : <%=a%>
                                    
                                    </b> 
                                </div></div></div></div>

                                    <br>
               


            </div>
        </div>
    </body>
</html>
