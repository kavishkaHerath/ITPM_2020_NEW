<%-- 
    Document   : newjsp
    Created on : FEB 15, 2020, 11:35:10 PM
    Author     : IT18153750  Herath H.M.R.K.R
--%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>CodeMe</title>
   <link rel="stylesheet" href="css/button.css"  >
        <link rel="stylesheet" href="css/style.css"  >
      
       
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
      <div class="logo">CodeME</div>
    
    </div>
  </div>
 <div class="sidebar">
      <ul>
  
    
          <li> <a href="size.jsp" id="btnsize" class="btn left">
                <span class="title">Size </span>
          </a><li>
            <li> <a href="Variable.jsp" id="btnsize" class="btn left">
                <span class="title">Variables</span>
          </a><li>
               <li> <a href="Method.jsp" id="btnsize" class="btn left">
                <span class="title">Mathods</span>
          </a><li>
                
               <li> <a href="inheritance.jsp" id="btnsize" class="btn left">
                <span class="title">Inheritance</span>
          </a><li>
                <li> <a href="cupling.jsp" id="btnsize" class="btn left">
                <span class="title">Cupling</span>
          </a><li>
                <li> <a href="control_structures.jsp" id="btnsize" class="btn left">
                <span class="title">Control structures</span>
          </a><li>
                 <li> <a href="total.jsp" id="btnsize" class="btn left">
                <span class="title">Total</span>
          </a></li>
                <li> <a href="Chart.jsp" id="btnsize" class="btn left">
                <span class="title">Chart</span>
          </a></li>
	
          
          
       
    </ul>
  </div>
</div>
        
        <div id="result">

<div style="margin-left:25%;padding:1px 16px;height:1000px;">
  <div class="row">
  <br>
  <br>
  <br>
  <br>
   <div>
            <div class="container">

            
              
        <br>
        <br>
        <br>
          <form action="UploadFile" enctype="multipart/form-data" method="post" style="margin-right: 54%;" >
                    <label for="myfile">Choose file:</label>
                    <input type="file" id="myfile" name="file2"  multiple="multiple"><input type="submit" value="upload" /><br>
                </form>

            <div class="row">
                <div class="col-md-1"></div>
                <div class="col-md-10">
                    <div class="form-group">
                        <label for="exampleFormControlTextarea1" style = "margin-right: 72%;"></label>
                        <br>
                        <textarea class="form-control rounded-0" id="txtcode" rows="12" style="width: 80%; height: 80%"></textarea>
                    </div>
                </div>
            </div>
            <br>
           
        </div>
        
          

                <div class="col-md-1">
                    <button type="button" class="clear" onclick="document.getElementById('txtcode').value = ''" style="margin-left: 76%">Clear</button>
                </div>
            </div>
       
           
         


        </div>

    </body>
</html>
