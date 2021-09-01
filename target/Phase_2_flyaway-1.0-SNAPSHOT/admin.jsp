<%@page import="com.entities.Bookings"%>
<%@page import="com.dao.BookingsDao"%>
<%@page import="com.entities.Flights"%>
<%@page import="com.dao.FlightsDao"%>
<%@page import="com.entities.Airlines"%>
<%@page import="com.dao.AirlinesDao"%>
<%@page import="java.util.Map"%>

<%@page import="java.util.List"%>

<%@page import="com.helper.FactoryProvider"%>
<%@page import="com.entities.User"%>
<%

//    For Filtering User
    User user = (User) session.getAttribute("current-user");

    if (user == null) {

        session.setAttribute("message", "You are not logged In !! Log in First..");
        response.sendRedirect("login.jsp");
        return;
    } else {
        if (user.getUserType().equals("normal")) {

            session.setAttribute("message", "You are not Admin !! Access Denied..");
            response.sendRedirect("login.jsp");
            return;
        }

    }

%>

<%  // Fetching Data Using DAO
    AirlinesDao adao = new AirlinesDao(FactoryProvider.getFactory());
    List<Airlines> list = adao.getAirlines();

    FlightsDao fdao = new FlightsDao(FactoryProvider.getFactory());
    List<Flights> flist = fdao.getAllFlights();

    BookingsDao bdao = new BookingsDao(FactoryProvider.getFactory());
    List<Bookings> blist = bdao.getAllBookings();
%>


<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>

        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Admin Panel</title>

        <!--Common CSS & JS-->

        <%@include file="components/common_css_js.jsp" %>

    </head>
    <body>

        <!--Nav bar From Common Components-->
        <%@include file="components/navbar.jsp" %>


        <div class="container admin">
            <div class="container-fluid mt-3">

                <!--Message Notification From common component-->

                <%@include file="components/message.jsp" %>

            </div>

            <div class="row mt-3">
                <!-- first column -->
                <div class="col-md-4">

                    <div class="card" data-toggle="modal" data-target="#Booking-List">

                        <div class="card-body text-center">
                            <div class="container">

                                <img style="max-width: 100px" class="img-fluid" src="img/worker.png" alt="" />
                            </div>
                            <h2><%= blist.size()%></h2>
                            <h2 class="text-uppercase text-muted">User Bookings</h2>
                        </div>
                    </div>


                </div>
                <!-- second column -->
                <div class="col-md-4">
                    <div class="card" data-toggle="modal" data-target="#Flight-List">

                        <div class="card-body text-center">
                            <div class="container">

                                <img style="max-width: 100px" class="img-fluid" src="img/flist.png" alt="" />
                            </div>
                            <!--                            For showing Dynamic Flight List Count-->


                            <h2><%= flist.size()%></h2>
                            <h2 class="text-uppercase text-muted">Flight List</h2>
                        </div>
                    </div>

                </div>
                <!-- third column -->
                <div class="col-md-4">
                    <div class="card" data-toggle="modal" data-target="#change-password">

                        <div class="card-body text-center">
                            <div class="container">

                                <img style="max-width: 100px" class="img-fluid" src="img/profilesettings.png" alt="" />
                            </div>
                            <p>Click to Change Login Credentials !!</p>
                            <h2 class="text-uppercase text-muted">Password</h2>
                        </div>
                    </div>

                </div>

            </div>

            <!-- Second row-->

            <div class="row text-center mt-3">

                <!--second row first col-->


                <div class="col-md-6">
                    <div class="card" data-toggle="modal" data-target="#add-category">

                        <div class="card-body text-center">
                            <div class="container">

                                <img style="max-width: 100px" class="img-fluid" src="img/airline.png" alt="" />
                            </div>
                            <!--                            <h2>1234</h2>-->
                            <p>Click here to add new airline </p>
                            <h2 class="text-uppercase text-muted">Add Airline</h2>
                        </div>
                    </div>

                </div>

                <!--second row second col-->


                <div class="col-md-6">

                    <div class="card"data-toggle="modal" data-target="#add-product">

                        <div class="card-body text-center">
                            <div class="container">

                                <img style="max-width: 100px" class="img-fluid" src="img/global.png" alt="" />
                            </div>
                            <!--                            <h2>1234</h2>-->
                            <p>Click here to add new flights</p>
                            <h2 class="text-uppercase text-muted">Add Flights</h2>
                        </div>
                    </div>
                </div>


            </div>
        </div>

        <!--start of Modal-->



        <!-- Airlines Modal -->
        <div class="modal fade" id="add-category" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
            <div class="modal-dialog modal-md" role="document">
                <div class="modal-content">
                    <div class="modal-header bg-info text-white">
                        <h5 class="modal-title" id="exampleModalLabel">Fill Airlines Details.</h5>
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                            <span aria-hidden="true">&times;</span>
                        </button>
                    </div>
                    <div class="modal-body">
                        <form action="FlightOperationServlet" method="post">
                            <input type="hidden" value="addairlines" name="operation"/>
                            <div class="form-group">


                                <input type="text" placeholder="Enter Airline Name" class="form-control" required name="airlinesTitle"/>
                            </div>


                            <div class="container text-center">

                                <button class="btn btn-outline-success">Add category</button>
                                <button type="reset" class="btn btn-outline-danger">Reset</button>
                            </div>

                        </form>
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>

                    </div>
                </div>
            </div>
        </div>

        <!--end of modal-->

        <!--add flight modal-->


        <div class="modal fade" id="add-product" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
            <div class="modal-dialog modal-lg" role="document">
                <div class="modal-content">
                    <div class="modal-header bg-info text-white">
                        <h5 class="modal-title" id="exampleModalLabel">Fill Flight Details.</h5>
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                            <span aria-hidden="true">&times;</span>
                        </button>
                    </div>
                    <div class="modal-body">
                        <form action="FlightOperationServlet" method="post" enctype="multipart/form-data">
                            <input type="hidden" value="addflight" name="operation"/>

                            <!--Airlines Menu Drop down-->



                            <select class="form-control mb-3" name="airlinesId"  id="">

                                <option selected disabled>---Select Airlines---</option>
                                <% for (Airlines a : list) {%>

                                <option value="<%= a.getAirlinesId()%>"><%= a.getAirlinesTitle()%></option>

                                <%}%>

                            </select>




                            <!--Flight Title-->
                            <div class="form-group">


                                <input type="text" placeholder="Enter Flight Name" class="form-control" required name="fName" required />
                            </div>


                            <!--Flight departure date-->

                            <div class="form-group">

                                <label for="Date">Departure Date:</label>
                                <input class="form-control  col-md-4 " type="date" id="fDate" name="fDate" required>
                            </div>

                            <!--Flight Ticket price-->
                            <div class="form-group">


                                <input type="number" placeholder="Enter Fare Price" class="form-control" required name="fPrice" required />
                            </div>

                            <!--Flight From-To Locations-->

                            <!--<form>-->
                            <div class="row">
                                <div class="col">
                                    <input type="text" name="fromLocation" class="form-control" placeholder="Enter From Location" required>
                                </div>
                                <div class="col">
                                    <input type="text" name="toLocation" class="form-control" placeholder="Enter To Location" required>
                                </div>
                            </div>
                            <!--</form>-->
                            <br>

                            <!--Flight quantity-->

                            <div class="form-group">


                                <input type="number" placeholder="Enter Available Quantity" class="form-control" required name="fQuantity" required />
                            </div>






                            <!--buttons-->
                            <div class="container text-center">

                                <button type="submit" class="btn btn-outline-success">Add Product</button>
                                <button type="reset" class="btn btn-outline-danger">Reset</button>
                            </div>


                        </form>
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>

                    </div>
                </div>
            </div>
        </div>

        <!--end of add Flight Modal-->

        <!-- Password Modal -->
        <div class="modal fade" id="change-password" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
            <div class="modal-dialog modal-md" role="document">
                <div class="modal-content">
                    <div class="modal-header bg-info text-white">
                        <h5 class="modal-title" id="exampleModalLabel">Update Password</h5>
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                            <span aria-hidden="true">&times;</span>
                        </button>
                    </div>
                    <div class="modal-body">
                        <form action="UpdateProfileServlet" method="post">

                            <div class="form-group">


                                <input class=" form-control text-center " type="text" value="<%= user.getUserEmail()%>" placeholder="Enter Email Name" class="form-control" required name="email"/>
                            </div>
                            <div class="form-group">


                                <input class=" form-control text-center" type="password" value="" placeholder="Enter  Password" class="form-control" required name="password"/>
                            </div>


                            <div class="container text-center">

                                <button class="btn btn-outline-success">Submit</button>
                                <button type="reset" class="btn btn-outline-danger">Reset</button>
                            </div>

                        </form>
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>

                    </div>
                </div>
            </div>
        </div>

        <!--end of modal-->
        <!-- Flight List Modal -->
        <div class="modal fade" id="Flight-List" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
            <div class="modal-dialog modal-lg" role="document">
                <div class="modal-content text-center">
                    <div class="modal-header bg-info text-white">
                        <div class="container text-center">
                            <h5 class="modal-title" id="exampleModalLabel">All Flight Details.</h5></div>
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                            <span aria-hidden="true">&times;</span>
                        </button>
                    </div>
                    <div class="modal-body">
                        <table class="table table-striped">
                            <thead>
                                <tr>
                                    <th scope="col">F.SN.</th>

                                    <th scope="col">Flight Name</th>
                                    <th scope="col">Source</th>
                                    <th scope="col">Destination</th>
                                    <th scope="col">Fare Price</th>
                                    <th scope="col">Airline Name</th>
                                </tr>
                            </thead>
                            <tbody>
                                <% for (Flights f : flist) {%>
                                <tr>
                                    <th scope="row"><%=f.getfId()%></th>
                                    <td><%=f.getfName()%></td>
                                    <td><%=f.getFromLocation()%></td>
                                    <td><%=f.getToLocation()%></td>
                                    <td><%=f.getfPrice()%></td>
                                    <td><%=f.getAirlines().getAirlinesTitle()%></td>
                                </tr>
                                <%}%>
                            </tbody>
                        </table>
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>

                    </div>
                </div>
            </div>
        </div>

        <!--end of modal-->
        <!-- Booking List Modal -->
        <div class="modal fade" id="Booking-List" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
            <div class="modal-dialog modal-lg" role="document">
                <div class="modal-content text-center">
                    <div class="modal-header bg-info text-white">
                        <div class="container text-center">
                            <h5 class="modal-title" id="exampleModalLabel">All Booking Details.</h5></div>
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                            <span aria-hidden="true">&times;</span>
                        </button>
                    </div>
                    <div class="modal-body">
                        <table class="table table-striped">
                            <thead>
                                <tr>
                                    <th scope="col">SN.</th>

                                    <th scope="col">Flight Name</th>
                                    <th scope="col">Passenger Name</th>
                                    <th scope="col">Gender</th>
                                    <th scope="col">Mode Of Payment Price</th>
                                    <th scope="col">Booked By U.ID.</th>
                                </tr>
                            </thead>
                            <tbody>
                                <% for (Bookings b : blist) {%>
                                <tr>
                                    <th scope="row"><%=b.getbId()%></th>
                                    <td><%=b.getfName()%></td>
                                    <td><%=b.getpName()%></td>
                                    <td><%=b.getpGender()%></td>
                                    <td><%=b.getpPaymentMode()%></td>
                                    <td><%=b.getUser().getUserEmail()%></td>
                                </tr>
                                <%}%>
                            </tbody>
                        </table>
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>

                    </div>
                </div>
            </div>
        </div>

        <!--end of modal-->






    </body>
</html>
