<%@page import="com.helper.FactoryProvider"%>
<%@page import="com.dao.BookingsDao"%>
<%@page import="com.entities.Bookings"%>
<%@page import="java.util.List"%>
<%

    User user = (User) session.getAttribute("current-user");
    if (user == null) {

        session.setAttribute("message", "You are not logged In !! Log in First..");
        response.sendRedirect("login.jsp");
        return;
    } else {
        if (user.getUserType().equals("admin")) {

            session.setAttribute("message", "This is a User Page !! navigate to Admin Page");
            response.sendRedirect("admin.jsp");
            return;
        }

    }
%>

<%
    int uid = user.getUserId();

    BookingsDao bdao = new BookingsDao(FactoryProvider.getFactory());
    List<Bookings> b = bdao.getBookingsByUid(uid);

%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <%@include file="components/common_css_js.jsp" %>
        <%@include file="components/message.jsp" %>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Fly Away</title>
    </head>
    <body>
        <%@include file="components/navbar.jsp" %>
        <div class="container-fluid text-center mt-5">



            <span class="fa fa-user-circle fa-4x fa-spin" style="size:24px"></span>
            <h3>Welcome <%= user.getUserName()%></h3>
        </div>
        <div class="container mt-3">
            <div class="row">
                <div class="col-md-12">
                    <h3 class="text-center mb-3">Booking Details</h3>
                    <table class="table">
                        <thead class="thead  text-white bg-info">
                            <tr>
                                <th scope="col">Booking Id</th>
                                <th scope="col">Flight Name</th>
                                <th scope="col">Passenger Name</th>
                                <th scope="col">Payment Mode</th>
                                
                            </tr>
                        </thead>

                        <tbody>
                            <%for (Bookings ub : b) {%>
                            <tr>
                                <th scope="row"><%= ub.getbId()%></th>
                                <td><%= ub.getfName()%></td>
                                <td><%= ub.getpName()%></td>
                                <td class="font-weight-bold"> <%= ub.getpPaymentMode()%></td>
                               
                            </tr>

                            <%}%>
                        </tbody>
                    </table>

                    <div class="container text-center">
                        
                        
                        <a href="index.jsp" class="btn btn-outline-success">Home Page
                            </a>
                    </div>




                </div>


            </div>


        </div>



    </body>
</html>