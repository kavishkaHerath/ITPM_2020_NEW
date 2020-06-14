<%-- 
    Document   : sizeChart
    Created on : May 20, 2020, 11:38:55 PM
    Author     : IT18153750  Herath H.M.R.K.R
--%>

<%@page import="java.io.File"%>
<%@page import="com.itpm.model.SizeDTO"%>
<%@page import="com.itpm.controller.SizeController"%>
<%@page import="java.util.ArrayList"%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
 <style>
       
/*div.container {


  float: left;
 
}*/
    </style>  
       <link rel="stylesheet" href="css/button.css"  >
         <link rel="stylesheet" href="css/styl2.css"  >
        <link rel="stylesheet" type="text/css" href="css/bootstrap.css">
        
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css"  >
        <script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>

        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <%--<mata name="viewport" content="width=device-width, initial-scale=1.0">
        --%> 
          <title>JSP Page</title>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.9.3/Chart.min.js"></script>
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css">
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
      <div class="logo">Size</div>
      <div class="logo">
    </div>
    </div>
  </div>
       <%  if(session.getAttribute("filetype").toString().equals("zip")){ %>   
       <br>       
        <div class="wrapper">
            <div class="container-fluid">
            
          
                <div class="row">
                    <div class="col-md-1"></div> 
                    <div class="col-md-10">
                        <div class="card">
                            <div class="card-body">
                                <div class="table-responsive-sm">
                                    <form action="sizeChart.jsp">
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
    
    
    
        
         <%
                    int Nkw=0;
                    int Nid=0;
                    int Nop=0;
                    int Nnv=0;
                    int Nsl=0;
             
                      SizeController svm1 = new SizeController();
                      String filename = request.getParameter("filena") == null ? session.getAttribute("filename1").toString():
                      request.getParameter("filena") ;
                                                //String productSelected = request.getParameter("filenames");
                                                ArrayList<SizeDTO> sizeList = svm1.measureSize(filename);
                                               
                                                int lineNo = 0;
                                                int a = 0;
                                                
                          for (SizeDTO s : sizeList) {
                          Nkw = Nkw + s.getNkw();
                          Nid = Nid + s.getNid();
                          Nop = Nop + s.getNop();
                          Nnv = Nnv + s.getNnv();
                          Nsl = Nsl + s.getNsl();
             
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
                                    <h6> <B>File Name : <%=filename%></B> </h6> 
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        </div>
         
         
         <div class="container" style="height: 100px; width: 70%;">
            <canvas id="myChart"></canvas>
             
        </div>
         
            <br>
         <br>
         <br>
           
            
        </div>
         
        <script>
            let myChart = document.getElementById('myChart').getContext('2d');
            //GLobaL Options
            Chart.defaults.global.defaulFontFamily = 'Lato',
            Chart.defaults.global.defaulFontSize = 18;
            Chart.defaults.global.defaulFontColor = '#777';
            let massPopChart = new Chart(myChart, {
                type:'horizontalBar',//bar,horizontalBar,pie,Line,doughnut,
                data:{ 
                    labels:['Nkw', 'Nid', 'Nop','Nnv','Nsl'],
                    datasets:[{
                            label:'Compatity',
                            data:[
                            "<%=Nkw%>",
                            "<%=Nid%>",
                            "<%=Nop%>",
                            "<%=Nnv%>",
                            "<%=Nsl%>"
                            ],
                            //backgroundColor:'green',
                            backgroundColor:[
                                'rgba(54, 162, 235, 0.6)',
                                'rgba(255, 99, 132, 0.6)',
                                'rgba(255, 206, 86, 0.6)',
                                'rgba(196, 242, 150)',
                                'rgba(198, 142, 255)'
                            ],
                            borderWidth:4,
                            borderColor:'#777',
                            hoverBorderWidith:3,
                            hoverBordeColor:'#000'
                    }]
                },
                options:{
                
                 
                    legend:{
                        display:true,
                        position:'right',
                        labels:{
                            forntColor:'#000'
                        }
                    },
                    layout:{
                        padding:{
                            left:50,
                            right:0,
                            bottom:0,
                            top:0
                    }
                },
                tooltips:{
                    enabled:true
                    
                        
                    }
                }
            });
        
        </script>
        
        
        
        
        
        
    </body>
</html>
