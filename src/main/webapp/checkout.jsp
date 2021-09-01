
<%@page import="java.util.List"%>
<%@page import="com.entities.Flights"%>
<% User user = (User) session.getAttribute("current-user");
    if (user == null) {

        session.setAttribute("message", "You are not logged In !! Log In to Book ..");
        response.sendRedirect("login.jsp");
        return;
    }%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <!--css & js-->
        <%@include file="components/common_css_js.jsp" %>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Checkout</title>
    </head>
    <body>
        <!--Common Components-->
        <%--<%@include file="components/common_modals.jsp" %>--%>
        <%@include file="components/navbar.jsp" %>
        <%@include file="components/message.jsp" %>

        <div class="container">

            <div class="row mt-5">
                
                               <div class="col-md-6">

                    <div class="card">
                        <h3 class="text-center mb-4 mt-3"> Booking Details</h3>
                        <div class="card-body">
                            <%List<Flights> list = (List<Flights>) session.getAttribute("f-checkout"); %>
                            <div class="container text-center">
                                <table class="table">
                                    <thead class="thead bg-info text-white">
                                        <tr>
                                            <th scope="col">Flight No</th>
                                            <th scope="col">Source</th>
                                            <th scope="col">Destination</th>
                                            <th scope="col">Price</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                        <tr>
                                            <% for (Flights flights : list) {%>
                                            <th scope="row"> <%=flights.getfName()%></th>
                                            <td><%=flights.getFromLocation()%></td>
                                            <td><%=flights.getToLocation()%></td>
                                            <td><b>&#8377; <%=flights.getfPrice()%></b></td>
                                        </tr>
                                        <%}%>
                                    </tbody>
                                </table>
                            </div>

                        </div>

                    </div>
                </div>
 
                <div class="col-md-6">
                    <div class="card">
                        <h3 class="text-center mt-3 mb-4"> Enter Details For Booking</h3>
                        <div class="card-body">
                            <form action="BookingServlet" method="post">
                                <% for (Flights flights : list) {%>
                                <input name="fName" type="hidden" value="<%= flights.getfName() %>">
                                                                        <%}%>

                                <div class="form-group">
                                    <label for="name">Name</label>
                                    <input name="pName" value="<%= user.getUserName()%>" type="text" class="form-control" id="exampleInputEmail1" aria-describedby="nameHelp" placeholder="Passanger Name">
                                    <small id="nameHelp" class="form-text text-muted">Order will be booked on to Passenger Name</small>
                                </div>
                                    
                                    <h6>Gender</h6>
                                <div class="form-check">
                                    <input class="form-check-input" type="radio" name="pGender" id="exampleRadios1" value="Male" checked>
                                    <label class="form-check-label" for="exampleRadios1">
                                        Male
                                    </label>
                                </div>
                                <div class="form-check">
                                    <input class="form-check-input" type="radio" name="pGender" id="exampleRadios2" value="Female">
                                    <label class="form-check-label" for="exampleRadios2">
                                        Female
                                    </label>
                                </div>


                                
                                <div class="form-group">
                                    <label for="exampleInputPassword1">Phone No</label>
                                    <input name="pContact" value="<%= user.getUserPhone()%>" type="number" class="form-control" id="exampleInputPassword1" placeholder="Phone Number">
                                </div>
                                
                                <h6>Payment Method</h6>
                                <div class="form-check">
                                    <input class="form-check-input" type="radio" name="pMethod" id="exampleRadios1" value="Netbanking" checked>
                                    <label class="form-check-label" for="exampleRadios1">
                                        Net Banking
                                    </label>
                                </div>
                                <div class="form-check">
                                    <input class="form-check-input" type="radio" name="pMethod" id="exampleRadios2" value="Debit/Credit Card">
                                    <label class="form-check-label" for="exampleRadios2">
                                        Debit/Credit Card
                                    </label>
                                </div>
                                <div class="container text-center mt-3">
                                    <button type="submit" class="btn btn-outline-success">Pay Now</button>
                                    <a href="index.jsp"  type="submit" class="btn btn-outline-warning">Modify Booking</a>

                                </div>
                            </form>
                        </div>
                    </div>

                </div>


            </div>


        </div>
    </div>
</body>
</html>
