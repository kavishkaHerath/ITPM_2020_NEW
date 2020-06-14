<%@page import="java.io.File"%>
<%@page import="com.itpm.controller.Couplingcontroller"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.itpm.model.Coupling"%>
<%@page import="com.itpm.model.CouplingDTO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Coupling</title>
        
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
    <body>
        
        <div class="wrapper">
            <div class="container-fluid">
                <div class="page-title-box">
                    <div class="row align-items-center">
                        <div class="col-sm-1"></div>
                        <div class="col-sm-10 align-items-center" color="blue">
                           
                        </div>

                    </div>
                    <!-- end row -->
<!--                </div>
                <div class="row">
                    <div class="col-md-1"></div>
                    <div class="col-md-10">
                        <div class="form-group">
                            <label for="exampleFormControlTextarea1">Code here</label>
                            <textarea class="form-control rounded-0" id="txtcode" rows="12"></textarea>
                        </div>
                    </div>
                </div>
                <div class="row" >
                    <div class="col-md-9"> </div>
                    <div class="col-md-1">
                        <button type="button" class="btn btn-primary">Measure</button>
                    </div>
                    <div class="col-md-1">
                        <button type="button" class="btn btn-secondary">Clear</button><br>
                    </div>
                </div>-->
                <br>

                <div>
                    <button class="buttonn button2" onclick="window.location.href = 'CouplingSettings.jsp';">Set Weight</button>
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
                                    <form action="cupling.jsp">
      <select id="filenames" name="filena" value="filenames" class="form-control form-control-sm">
    <%
       Couplingcontroller  svm = new Couplingcontroller();
        
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
                                               
                                                Couplingcontroller svm1 = new Couplingcontroller();
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
    
                
                <div class="row">
                    <div class="col-md-1"></div> 
                    <div class="col-md-10">
                        <div class="card" style="width: 1600px;">
                            <div class="card-heading p-2"><h4>Coupling</h4></div>
                            <div class="card-body">
                                <div class="table-responsive-sm">
                                    <table class="table table-bordered">
                                        <thead>
                                            <tr>
                                                <th scope="col">Line no</th>
                                                <th scope="col">Program statements</th>
                                                <th scope="col">Nr</th>
                                                <th scope="col">Nmcms</th>
                                                <th scope="col">Nmcnb</th>
                                                <th scope="col">Nmcrms</th>
                                                <th scope="col">Nmcrmd</th>
                                                <th scope="col">Nrmcrms</th>
                                                <th scope="col">Nrmcrmd</th>
                                                <th scope="col">Nrncms</th>
                                                <th scope="col">Nrmcmd</th>
                                                <th scope="col">Nmrgvs</th>
                                                <th scope="col">Nmrgvd</th>
                                                <th scope="col">Nrmrgvs</th>
                                                <th scope="col">Nrmrgvd</th>
                                                <th scope="col">Ccp</th>
                                            </tr>
                                        </thead>
                                        <tbody>
                                            <%
                                                ArrayList<CouplingDTO> couplingList = svm1.measureCoupling(filename);
                                                int lineNo = 0;
                                                int a = 0;
                                                for (CouplingDTO s : couplingList) {
                                                    lineNo++;
                                                    a=a+s.getCcp();
                                            %>
                                            <tr>
                                                <th scope="row"><%=lineNo%></th>
                                                <td><%=s.getCodeLine()%></td>
                                                <td><%=s.getNr() != 0 ? s.getNr() : ""%></td>
                                                <td><%=s.getNmcms() != 0 ? s.getNmcms() : ""%></td>
                                                <td><%=s.getNmcmd() != 0 ? s.getNmcmd() : ""%></td>
                                                <td><%=s.getNmcrms() != 0 ? s.getNmcrms() : ""%></td>
                                                <td><%=s.getNmcrmd() != 0 ? s.getNmcrmd() : ""%></td>
                                                <td><%=s.getNrmcrms() != 0 ? s.getNrmcrms() : ""%></td>
                                                <td><%=s.getNrmcrmd() != 0 ? s.getNrmcrmd() : ""%></td>
                                                <td><%=s.getNrmcms() != 0 ? s.getNrmcms() : ""%></td>
                                                <td><%=s.getNrmcmd() != 0 ? s.getNrmcmd() : ""%></td>
                                                <td><%=s.getNmrgvs() != 0 ? s.getNmrgvs() : ""%></td>
                                                <td><%=s.getNmrgvd() != 0 ? s.getNmrgvd() : ""%></td>
                                                <td><%=s.getNrmrgvs() != 0 ? s.getNrmrgvs() : ""%></td>
                                                <td><%=s.getNrmrgvd() != 0 ? s.getNrmrgvd() : ""%></td>
                                                <td><%=s.getCcp() != 0 ? s.getCcp() : ""%></td>
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
