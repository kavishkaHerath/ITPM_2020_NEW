
<%@page import="com.itpm.controller.VeriableConrtoller"%>
<%@page import="com.itpm.model.SizeVariableMetod"%>

<%@page import="java.util.ArrayList"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
   
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Variable</title>
           <link rel="stylesheet" href="css/button.css"  >
         <link rel="stylesheet" href="css/styl2.css"  >
        <link rel="stylesheet" type="text/css" href="css/bootstrap.css">
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css"  >
        <script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
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
      <div class="logo">Variable Setting </div>
      <di></di>
    </div>
    </div>
  </div>
        <br>
<div class="row" style="margin-top: 20px; margin-right: 14px; float: center;">
    <div class="col-md-1"></div> 
    <div class="col-md-10">
        <div class="card" style="width: 600px; height: 460px;" >
            <center><div class="card-heading p-2"><h4>Weights related to the variable factor</h4></div></center>
            <div class="card-body" >
                
                <form action="UpdateVariable" method="POST">
                <div class="table-responsive-sm" >
                    <center><table class="table table-bordered" style="width: 500px;">
                            <thead>
                                <tr>
                                    <th scope="col">Program Component</th>
                                    <th scope="col">Weight</th>
                                </tr>
                            </thead>
                            <tbody>
                                <%
                                    VeriableConrtoller variable = new VeriableConrtoller();
                                    ArrayList<SizeVariableMetod> vaccounts = variable.getvariablemethod();
                                    for (SizeVariableMetod account : vaccounts) {
                                %>
                                
                                
                                <tr>
                                    <td id="labl<%=account.getId()%>"><%=account.getProgramComponent()%></td>
                                    <td><center><input type="text" id="<%=account.getId()%>" name="<%=account.getId()%>" style="width: 50px; text-align: center;" value="<%=account.getWeight()%>"></center></td>
                            </tr>
                            <%
                                }
                            %>


                            </tbody>
                        </table></center>
                </div>
                <br>
                <br>

                <button class="buttonsave button5">Save</button>
                </form>
            </div>
        </div>


    </div> 
    <div class="col-md-1"></div> 
</div>

</body>
</html>
