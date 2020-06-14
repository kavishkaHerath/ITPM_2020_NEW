
<%@page import="com.itpm.model.InheritanceMethod"%>
<%@page import="com.itpm.controller.InheritanceController"%>
<%@page import="com.itpm.model.SizeVariableMetod"%>
<%@page import="com.itpm.controller.SizeVMController"%>
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

        <div class="row" style="margin-top: 20px; float: left;">
            <div class="col-md-1"></div> 
            <div class="col-md-10">
                <div class="card" style="width: 700px; height: 500px;" >
                    <center><div class="card-heading p-2"><h4>Weights related to the Inheritance factor</h4></div></center>
                    <div class="card-body" >

                        <form action="UpdateInheritance" method="POST">

                            <div class="table-responsive-sm" >
                                <center><table class="table table-bordered" style="width: 600px;">
                                        <thead>
                                            <tr>
                                                <th scope="col">Inherited_Pattern</th>
                                                <th scope="col">Weight</th>
                                            </tr>
                                        </thead>
                                        <tbody id="tbl_body">
                                            <%
                                                InheritanceController size = new InheritanceController();
                                                ArrayList<InheritanceMethod> accounts = size.getinheritance();
                                                for (InheritanceMethod account : accounts) {
                                            %>
                                            <tr>
                                                <td id="labl<%=account.getID()%>"><%=account.getInherited_Pattern()%></td>
                                                <td><center><input type="text" id="<%=account.getID()%>" name="<%=account.getID()%>" style="width: 50px; text-align: center;" value="<%=account.getWeight()%>"></center></td>
                                            </tr>

                                        <%
                                            }
                                        %>


                                        </tbody>
                                        
                                       
                                    </table></center>
                              
                                     
                                          
                            <button class="buttonsave button5">Save</button>  
                           
                                        
                          
                            </div>




                        </form>


                    </div>
                </div>


            </div> 
            <div class="col-md-1"></div> 
        </div>
    </div>
</div>




 
</div>
</div>

</body>
</html>
