

<%@page import="com.helper.Helper"%>
<%@page import="com.entities.Airlines"%>
<%@page import="com.dao.AirlinesDao"%>
<%@page import="com.entities.Flights"%>
<%@page import="java.util.List"%>
<%@page import="com.dao.FlightsDao"%>
<%@page import="com.helper.FactoryProvider"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <%@include file="components/common_css_js.jsp" %>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>FLyAway</title>
    </head>
    <body>
         <%@include file="components/navbar.jsp" %>
         <%@include file="components/searchbar.jsp" %>
         
        
        
        <%  
            String fromLocation=request.getParameter("fromLocation");
            String toLocation=request.getParameter("toLocation");
           String aline= request.getParameter("airline");
           
        FlightsDao fdao=new FlightsDao(FactoryProvider.getFactory());
        List<Flights> list = null;
        if(aline==null || aline.trim().equals("all")){
           list= fdao.getAllFlights();
        
        
        }else{
        int aid=Integer.parseInt(aline.trim());
         list=fdao.getFlightById(aid);
        
        }
        
        
        
        //List<Flights> slist=fdao.getFlightsByData(fromLocation, toLocation);
        
        AirlinesDao adao=new AirlinesDao(FactoryProvider.getFactory());
        List<Airlines> alist= adao.getAirlines();
        
        
        %>
        
        
        
        
           <div class="container-fluid">
            <div class="row mt-3 mx-2">



                <!--show category-->
                     <div class="col-md-2">

                    <div class="list-group mt-4">
                        <a href="index.jsp?airline=all" class="list-group-item active">All Flights</a>

                        <%     for (Airlines a : alist) {%>


                        <a href="index.jsp?airline=<%=a.getAirlinesId()%>" class="list-group-item"><%= a.getAirlinesTitle() %></a>


                        <%
                            }
                        %>
                    </div>



                </div>

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
                                        <input type="hidden" value="<%= flights.getfId()%>" name="fid">

                                        <img src="img/airlinet.png" style="max-height: 100px;max-width:100%;  width: auto; " class="card-img-top m-2">
                                    </div>
                                    <div class=" container text-center card-body">
                                        
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
