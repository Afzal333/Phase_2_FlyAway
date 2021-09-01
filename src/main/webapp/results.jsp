<%-- 
    Document   : result
    Created on : Sep 02, 2021, 9:13:12 PM
    Author     : AFZAL
--%>

<%@page import="com.helper.Helper"%>
<%@page import="java.util.List"%>
<%@page import="com.entities.Flights"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <%@include file="components/common_css_js.jsp" %>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Result</title>
    </head>
    <body>
        <%@include file="components/navbar.jsp" %>
        <%List<Flights> list = (List<Flights>) session.getAttribute("fslist"); %>
         <div class="container-fluid ml-5">
             <div class="row mt-3 mx-2">
                 
                               <!--show Product-->
                <div class="col-md-10">

                    <!--row-->
                    <div class="row mt-4">


                        <!--col-12 grid-->




                        <div class="col-md-12">

                            <div class="card-columns">
                               

                                <!--fetch data-->
                                <% for(Flights flights:list){%>
                                
                                <!--product card-->
                                <form action="CheckoutServlet" method="post">
                                <div class="card">
                                    <div class="container text-center">

                                        <img src="img/airlinet.png" style="max-height: 100px;max-width:100%;  width: auto; " class="card-img-top m-2">
                                    </div>
                                    <div class=" container text-center card-body">
                                        
                                        
                                        <!--Data to be fetched on Servlet-->
                                        
                                        <input type="hidden" value="<%= flights.getAirlines().getAirlinesTitle() %>" name="airlines">
                                        <input type="hidden" value="<%= flights.getfName() %>" name="fname">
                                        <input type="hidden" value="<%= flights.getFromLocation() %>" name="flocation">
                                        <input type="hidden" value="<%= flights.getToLocation() %>" name="tlocation">
                                        <input type="hidden" value="<%= flights.getfPrice() %>" name="fprice">
                                        <input type="hidden" value="<%= flights.getfId()%>" name="fid">
                                        
                                        <h5  class="card-title"><%= flights.getAirlines().getAirlinesTitle() %> </h5>
                                        <h6 class="card-title"> <%= flights.getfName() %> </h6><h7> Date: <%= Helper.getOnlyDate(flights.getfDate()) %></h7>
                                        <br><h7> From: <%= flights.getFromLocation() %> To: <%= flights.getToLocation()%> </h7>
                                       
                                    </div>

                                    <div class="card-footer text-center">
                                        <button class="btn btn-outline-info"> &#8377; <%= flights.getfPrice()%>/-<span class="text-secondary discount-lable"></span> </button>
                                        <button class="btn btn-outline-success"> Book Now</button>
                                        

                                    </div>


                                </div>
                                </form>
                                
                                
                                
                               <% } %>
                               
                               
<!--                                For no Flights In Airlines-->
                                <% if (list.size() == 0) {
                                %>

                                <div class="container-fluid mt-4 text-center">

                                    <span class="fa fa-exclamation-triangle"style="font-size:48px;"> No Flights !!</span>
                                </div>

                                <%}


                                %>

                              
                          

                               
                            </div>


                        </div>

                    </div>



                </div>
                 
                 
                 
                 
             </div>
             </div>
    </body>
</html>
