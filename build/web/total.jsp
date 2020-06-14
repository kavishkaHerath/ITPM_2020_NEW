<%-- 
    Document   : total
    Created on : May 16, 2020, 5:08:41 PM
    Author     : IT18153750  Herath H.M.R.K.R 
--%>

<%@page import="java.io.File"%>
<%@page import="java.util.Date"%>
<%@page import="com.itpm.model.TotalDTO"%>
<%@page import="com.itpm.controller.Total"%>
<%@page import="com.itpm.model.SizeDTO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.itpm.controller.SizeController"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
      <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Total</title>
        <link rel="stylesheet" href="css/styl2.css"  >
        
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css"  >
        <script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>

   <link rel="stylesheet" href="css/button.css"  >
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
      <div class="logo">Total</div>
      <div class="logo"><button onclick="window.location.href = 'svmSetting.jsp';">Setting</button>
    </div>
    </div>
  </div>
            <br>
              <div>    
                                        <p>
                                            
                                            <button class="buttonn" onclick="createPDF()">Create PDF</button>

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
                                    <form action="total.jsp">
      <select id="filenames" name="filena" value="filenames" class="form-control form-control-sm">
    <%
        Total svm = new Total();
        
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
                                               
                                                Total total = new Total();
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
                                    <table class="table table-bordered">
                                        <thead>
                                            <tr>
                                                <th scope="col">Line no</th>
                                                <th scope="col">Program statements</th>
                                                <th scope="col">Cs</th>
                                                <th scope="col">Cv</th>
                                                <th scope="col">Cm</th>
                                                <th scope="col">Ci</th>
                                                <th scope="col">Ccp</th>
                                                <th scope="col">Ccs</th>
                                                 <th scope="col">TCps</th>
                                            </tr>
                                        </thead>
                                        <tbody>
                                            <%
                                                Date date = new Date();
                                               
                                                ArrayList<Integer> sizeList1 = total.measureTotal(filename).getLineNo();
                                                ArrayList<Integer> sizeList = total.measureTotal(filename).getFCs();
                                                ArrayList<String> sizeList2 = total.measureTotal(filename).getCodeLine();
                                                ArrayList<Integer> veribleList=total.measureTotal(filename).getFCv();
                                                ArrayList<Integer> methodList = total.measureTotal(filename).getFCm();
                                                ArrayList<Integer> inherList = total.measureTotal(filename).getFCi();
                                                ArrayList<Integer> contList = total.measureTotal(filename).getFCCs();
                                                ArrayList<Integer> cuptList = total.measureTotal(filename).getFCcp();
                                                
                                                int lineNo = 0;
                                            
                                                for(Integer j:sizeList1){
                                                    lineNo++;
                                                  
                                                }
                                                int TotalCs = 0;
                                                int TotalCv = 0;
                                                int TotalCm = 0;
                                                int TotalCi = 0;
                                                int TotalCCs= 0;
                                                int TotalCcp = 0;
                                                
                                               
                                                
                                                 for (int i=0;i < lineNo;i++) {
                                                  TotalCs = TotalCs + sizeList.get(i);
                                                  TotalCv = TotalCv + veribleList.get(i);
                                                  TotalCm = TotalCm + methodList.get(i);
                                                  TotalCi = TotalCi + inherList.get(i);
                                                  TotalCCs = TotalCCs + contList.get(i);
                                                  TotalCcp = TotalCcp + cuptList.get(i);

                                            %>
                                            <tr>
                                                <th scope="row"><%=sizeList1.get(i)%></th>
                                                <td><%=sizeList2.get(i) %></td>
                                                <td><%=sizeList.get(i) %></td>
                                                <td><%=veribleList.get(i)%></td>
                                                <td><%=methodList.get(i)%></td>
                                                <td><%=inherList.get(i)%></td>
                                                <td><%=cuptList.get(i)%></td>
                                                <td><%=contList.get(i)%></td>
                                                <td><%=inherList.get(i) + inherList.get(i) + veribleList.get(i) +sizeList.get(i)+cuptList.get(i) +contList.get(i) %></td>
                                               
                                                
                                                 <%
                                                }
                                                    %>
                                            </tr>
                                            <tr>
                                                <th scope="row"></th>
                                                <td ><center><b>Total</b></center></td>
                                                    <td><b><%= TotalCs%></b></td>
                                                    <td><b><%= TotalCv%></b></td>
                                                    <td><b><%= TotalCm%></b></td>
                                                    <td><b><%= TotalCi%></b></td>
                                                    <td><%= TotalCcp%></td>
                                                    <td><%= TotalCCs%></td>
                                                    <td><b><%= TotalCs + TotalCv + TotalCm + TotalCi + TotalCcp +TotalCCs%></b> </td>
                                            </tr>

                                          

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

        
      
        win.document.write('<center><h2>CodeME-Final-Report</h2></center>');
        win.document.write('<br>');
        win.document.write('<h3>File Name: <%=filename%></h3>');
       
        win.document.write('<h3>Date and Time: <%=date%><h3>');
       
        
        win.document.write('<hr>');   
        win.document.write('<br>');
        win.document.write(style);          // ADD STYLE INSIDE THE HEAD TAG.
      
        win.document.write('<center><body>');
        win.document.write(sTable);         // THE TABLE CONTENTS INSIDE THE BODY TAG.
        win.document.write('</center>');   
        win.document.write('<br>');
     
        win.document.write('<br>');
       
        win.document.write('&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;');
        win.document.write('<br>');
        win.document.write('*****************************************************************************************************************************************************************');
        win.document.write('<center>All Factor Table Summary</center>');
        win.document.write('<br>');
       win.document.write('*****************************************************************************************************************************************************************');
        
        win.document.write('<ul>');
     
        win.document.write('&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;');
        win.document.write('&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<li>Total Complexity of Size(Cs) : <%= TotalCs%></li>');
        
        win.document.write('&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;');
        win.document.write('&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;');
        win.document.write('<li>Total Complexity of Variables(Cv) : <%= TotalCv%></li>');
     
        win.document.write('&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;');
        win.document.write('&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;');
        win.document.write('<li>Total Complexity of Methods(Cm) : <%= TotalCm%></li>');
      
        win.document.write('&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;');
        win.document.write('&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;');
        win.document.write('<li>Total Complexity of Inheritance(Ci) : <%= TotalCi%></li>');
     
        win.document.write('&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;');
        win.document.write('&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;');
        win.document.write('<li>Total Complexity of Coupling(Ccp) : <%= TotalCcp%></li>');
     
        win.document.write('&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;');
        win.document.write('&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;');
        win.document.write('<li>Total Complexity of Control Structure(Ccs) : <%= TotalCCs%></li>');
       
        win.document.write('&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;');
        win.document.write('&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;');
        win.document.write('<li>Total Program Complexity(Tcp) : <%= TotalCs + TotalCv + TotalCm + TotalCi +TotalCCs +TotalCcp  %></li>');
        win.document.write('<br>');
       win.document.write('</ul>');
       win.document.write('****************************************************************************************************************************************************************');
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

</html>
