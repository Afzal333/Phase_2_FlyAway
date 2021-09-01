

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <%@include file="components/common_css_js.jsp" %>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Login-MyCart</title>
    </head>
    <body>

        <%@include file="components/navbar.jsp" %>

        <div class="container mt-5">
            <div class="row">
                <div class="col-md-6 offset-md-3">

                    <div clas="card mt-3">
                        <%@include file="/components/message.jsp" %>
                        <div class="card-header bg-info text-white">
                            <h3>Login</h3>
                        </div>
                        <div class="card-body">
                            <form action="LoginServlet" method="post">
                                <div class="form-group">
                                    <label for="email">Email address</label>
                                    <input name="email"type="email" class="form-control" id="exampleInputEmail1" aria-describedby="emailHelp" placeholder="Enter email">
                                    <small id="emailHelp" class="form-text text-muted">We'll never share your email with anyone else.</small>
                                </div>
                                <div class="form-group">
                                    <label for="exampleInputPassword1">Password</label>
                                    <input name="password" type="password" class="form-control" id="exampleInputPassword1" placeholder="Password">
                                </div>
                                
                                <a href="register.jsp" class="text-center d-block mb-3">If not registered click here.</a>
                                <div class="container text-center">
                                      <button type="submit" class="btn btn-outline-success">Login</button>
                                <button type="reset" class="btn btn-outline-danger">Reset</button>
                                </div>
                            </form>

                        </div>

                        <div class="card-footer">


                        </div>

                    </div>



                </div>

            </div>


        </div>

    </body>

</html>
