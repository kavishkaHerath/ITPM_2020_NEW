
<%@page import="com.itpm.model.ControlStructure"%>
<%@page import="com.itpm.controller.ControlSController"%>
<%@page import="java.util.ArrayList"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Set Weight</title>
        <link rel="stylesheet" href="css/button.css"  >
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css"  >
        <script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
    </head>
    <body>
        
        <div class="row" style="margin-top: 20px; ">
            <div class="col-md-1"></div> 
            <div class="col-md-10">
                <div class="card" style="width: 600px; height: 460px;" >
                    <center><div class="card-heading p-2"><h4>Weights related to the Control Structure</h4></div></center>
                    <div class="card-body" >

                        <form action="UpdateControlStructure" method="POST">

                            <div class="table-responsive-sm" >
                                <center><table class="table table-bordered" style="width: 500px;">
                                        <thead>
                                            <tr>
                                                <th scope="col">Program Component</th>
                                                <th scope="col">Weight</th>
                                            </tr>
                                        </thead>
                                        <tbody id="tbl_body">
                                            <%
                                                ControlSController cs = new ControlSController();
                                                ArrayList<ControlStructure> accounts = cs.getcontrols();
                                                for (ControlStructure account : accounts) {
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




                          
                            <button class="buttonsave button5">Save</button>
                        </form>


                    </div>
                </div>


            </div> 
            <div class="col-md-1"></div> 
        </div>
  
</body>
</html>
