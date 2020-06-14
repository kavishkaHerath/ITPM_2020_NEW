

<%@page import="java.io.File"%>
<%@page import="java.util.Date"%>
<%@page import="com.itpm.model.InheritanceDTO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.itpm.controller.InheritanceController"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Inheritance</title>
           <link rel="stylesheet" href="css/button.css"  >
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
  <div class="top_navbar">
       <div class="hamburger" onclick="window.location.href = 'index.jsp';">
       <div class="one"></div>
       <div class="two"></div>
       <div class="three"></div>
    </div>
    <div class="top_menu">
        
      <div class="logo">CodeME </div>
      <div class="logo">Inheritance </div>
      <div class="logo"><button class="button" onclick="window.location.href = 'Isetting.jsp';">Setting</button>
          
          
    </div>
    </div>
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
                                    <form action="inheritance.jsp">
      <select id="filenames" name="filena" value="filenames" class="form-control form-control-sm">
    <%
        InheritanceController svm = new InheritanceController();
        
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
                                               
                                             InheritanceController svm1 = new InheritanceController();
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
                              <div id="tab">
                                    <table class="table table-bordered"  >
                                       
                                        <thead>
                                            <tr>
                                                <th scope="col">Count</th>
                                                <th scope="col">Class Name</th>
                                                <th scope="col">No of direct inheritance</th>
                                                <th scope="col">No of indirect inheritance</th>
                                                <th scope="col">Total inheritance</th>
                                                <th scope="col">Ci</th>
                                                
                                                
                                            </tr>
                                        </thead>
                                        <tbody>
                                            <%
                                                
                                                Date date = new Date();
                                               ArrayList<InheritanceDTO> inheritanceList = svm1.measureInheritance(filename);
                                               int lineNo=0;
                                                
                                                int a=0;
                                                int b=0;
                                                int c=0;
                                                int d=0;
                                                
                                                
                                                
                                                for (InheritanceDTO I : inheritanceList) {
                                                    lineNo++;
                                                    

                                                   a=a+I.getDirectInheritance();
                                                    b=b+I.getIndirectInheritance();
                                                    c=c+I.getTotal();
                                                    d=d+I.getCi();


                                            %>
                                           
                                            
                                            <tr>
                                                <th scope="row"><%=lineNo%></th>
                                                <td><%=I.getClassName()%></td>
                                                <td><%=I.getDirectInheritance()%></td>
                                                <td><%=I.getIndirectInheritance()%></td>
                                                <td><%=I.getTotal()%></td>
                                                <td><%=I.getCi()%></td> 
                                                       
                                            </tr>
                                            
                                        <%
                                            }
                                        %>
                                           

                                        </tbody>
                                        
                                    </table>
                                            </div> 
                                        
         
                                        
                                        <p>
                                            
                                            <button class="buttonn" onclick="createPDF()">Create PDF</button>
                                            
<!--        <input type="button" class="buttonn"value="Create PDF" 
            id="btPrint" onclick="createPDF()" />-->
    </p>
                                        
  </body>                                     
  <script>
    function createPDF() {
        var sTable = document.getElementById('tab').innerHTML;

        var style = "<style>";
      
       
  
      
        style = style + "h2 {color: white; text-align: center;background-color: #2e4ead;padding: 8px 20px;margin: 8px 0;}";
        style = style + "table {width: 80%;font: 20px Calibri;}";
        style = style + "table, th, td  {  border: 1px solid #ddd; background-color: #f2f2f2;  border-collapse: collapse; ";
        style = style + "padding: 15px;text-align: center;}";
        style = style + "</style>";

        // CREATE A WINDOW OBJECT.
        var win = window.open('', '', 'height=700,width=700');

        
      
        win.document.write('<center><h2>CodeME-Inheritance-Report</h2></center>');
        win.document.write('<br>');
        win.document.write('<h3>File Name: <%=filename%></h3>');
       
        win.document.write('<h3>Date and Time: <%=date%><h3>');
       
        
        win.document.write('<hr>');   
        win.document.write('<br>');
        win.document.write(style);          // ADD STYLE INSIDE THE HEAD TAG.
      
        win.document.write('<center><body>');
        win.document.write(sTable);         // THE TABLE CONTENTS INSIDE THE BODY TAG.
           
        win.document.write('<br>');
        win.document.write('</center>');
        win.document.write('<br>');
       
         win.document.write('&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;');
         win.document.write('<center>*******************************Final Report Details:*******************************</center>');
          win.document.write('<br>');
          win.document.write('<hr>');
        win.document.write('&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;');
        win.document.write('Total Number of Inheritance(Direct/Indirect) = <%=c%>');
      
         win.document.write('<br>');
         win.document.write('&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;');
        //win.document.write('&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;');
        win.document.write('Total Number of Ci = <%=d%>');
          win.document.write('<br>');
          win.document.write('<hr>');
           win.document.write('<br>');
        
        win.document.write('</body></center></html>');

        win.document.close(); 	// CLOSE THE CURRENT WINDOW.

        win.print();    // PRINT THE CONTENTS.
    }
</script>                              
                           


                            
                        </div>


                    </div> 
                    <div class="col-md-1"></div> 
                </div>
            </div>
        </div>
        
    </body>
</html>
