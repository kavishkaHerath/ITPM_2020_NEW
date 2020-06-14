<%-- 
    Document   : sizevariable
    Created on : Feb 21, 2020, 3:28:38 PM
    Author     : user
--%>

<%@page import="java.io.File"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.itpm.model.SizeDTO"%>
<%@page import="com.itpm.controller.SizeVMController"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Size variable</title>
        <link rel="stylesheet" href="css/styl2.css"  >
        
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css"  >
        <script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<!--        <%
        File file = new File("c://ccmt/uploads/");
        String[] fileList = file.list();
        ArrayList<String> filenames = new ArrayList<>();
        for(String name:fileList){
            System.out.println(name);
            filenames.add(name);
        }
        System.out.println(filenames.get(0));
        System.out.println(filenames.get(0));
        System.out.println(filenames.get(0));
        System.out.println(filenames.get(0));
        System.out.println(filenames.get(0));
        String sss;
        int size = filenames.size();
        
        
        %>
        -->


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
                                    
                                    	<label> Uploaded File name</label> 
							
    
       <select id="filenames" name="filena" value="filenames" class="form-control form-control-sm">
    <%
        SizeVMController svm = new SizeVMController();
        //String namee = "JumpingBox.java";
        
                                               
    for (int i=0;i<size;i++) {
       
      String se = (String)filenames.get(i);
      if(se.endsWith(".java")){
     // namee = sqwe;
      
    %>
    <option value="<%=se%>"  ><%=se%></option>
    <%
    }}
    %>
    </select>
                                        
                                         <input type="submit" value="Submit"> </form>
                                     
                                    <table class="table table-bordered">
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
                                               
                                                
                                                 String filename = session.getAttribute("filename1").toString();
                                                 ArrayList<SizeDTO> List= svm.measureSize(filename);
                                                
                                                int lineNo = 0;
                                                for (SizeDTO s : List) {
                                                   lineNo++;
                                            %>
                                            
                                            <tr>
                                                <th scope="row"><%=lineNo%></th>
                                                <td><%=s.getCodeLine()%></td>
                                                <td><%=s.getNkw() != 0 ? s.getNkw() : ""%></td>
                                                <td><%=s.getNid() != 0 ? s.getNid() : ""%></td>
                                                <td><%=s.getNop() != 0 ? s.getNop() : ""%></td>
                                                <td><%=s.getNnv() != 0 ? s.getNnv() : ""%></td>
                                                <td><%=s.getNsl() != 0 ? s.getNsl() : ""%></td>
                                                <td><%=s.getCs() != 0 ? s.getCs() : ""%></td>
                                                 <td><%=s.getCv() != 0 ? s.getCv() : ""%></td>
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
