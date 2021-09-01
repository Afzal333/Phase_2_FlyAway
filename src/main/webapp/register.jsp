<%-- 
    Document   : register
   Created on : Sep 02, 2021, 9:13:12 PM
    Author     : AFZAL
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <%@include file="components/common_css_js.jsp" %>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Registration</title>
    </head>
    <body>
        <%@include file="components/navbar.jsp" %>
        <div class="container-fluid">
            
                <div class="row mt-5">
            <div class="col-md-4 offset-md-4">



                <div class="card">
                    
                    <%@include file="/components/message.jsp" %>

                    <div class="card-body px-3">
                        <div class="container text-center">
                        <img src="img/sign-up.png" class="img-fluid" style="max-width: 80px"alt=""/></div>

                        <h3 class="text-center my-3">Registration</h3>

                        <form action="RegisterServlet" method="post">
                            <div class="form-group">
                                <label for="name">Name</label>
                                <input name="name"type="text" class="form-control" id="name" aria-describedby="emailHelp" placeholder="Enter Your Name">
                                <small id="emailHelp" class="form-text text-muted">We'll never share your details with anyone else.</small>
                            </div>
                            <div class="form-group">
                                <label for="email">E-Mail</label>
                                <input name="email" type="text" class="form-control" id="email" placeholder="Enter E-Mail">
                            </div>
                            <div class="form-group">
                                <label for="password">Password</label>
                                <input name="password" type="password" class="form-control" id="password" placeholder="Password">
                            </div>
                            <div class="form-group">
                                <label for="phone">Phone</label>
                                <input name="phone" type="number" class="form-control" id="phone" placeholder="Enter Phone No.">
                            </div>
                            <div class="form-group">
                                <label for="address">Address</label>
                                <textarea name="address" style="height: 100px" class="form-control" id="address" placeholder="Enter Address"></textarea>
                            </div>
                          <!--  <div class="form-check">
                                <input type="checkbox" class="form-check-input" id="exampleCheck1">
                                <label class="form-check-label" for="exampleCheck1">Agree terms & Conditions</label>
                            </div> -->
                            <div class="container text-center mt-3"> 

                                <button type="submit" class="btn btn-outline-success">Register</button>
                                <button type="reset" class="btn btn-outline-danger">Reset</button>

                            </div>

                        </form>
                    </div>

                </div>

            </div>
        </div>
        </div>

    </body>
</html>
