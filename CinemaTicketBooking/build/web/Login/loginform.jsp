<%-- 
    Document   : loginform
    Created on : Jun 21, 2022, 9:39:45 PM
    Author     : USER
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en" >
    <head>
        <meta charset="UTF-8">
        <title>Sign Up Login</title>
        <link rel="stylesheet" href="Login/style.css">

    </head>
    <body>
        <!-- partial:index.partial.html -->
    <html lang="en">
        <head>
            <!-- Latest compiled and minified CSS -->
            <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.min.css">
        </head>

        <body>
            <div id="form">
                <div class="container">
                    <div class="col-lg-6 col-lg-offset-3 col-md-6 col-md-offset-3 col-md-8 col-md-offset-2">
                        <c:if test="${ACTION=='login'}">
                        <div id="userform">
                            <ul class="nav nav-tabs nav-justified" role="tablist">
                                <li class="active"><a href="#login"  role="tab" data-toggle="tab">Login</a></li>
                                <li><a href="#signup"  role="tab" data-toggle="tab">Sign up</a></li>
                            </ul>
                            <div class="tab-content">
                                <div class="tab-pane fade in" id="signup">
                                    <h2 class="text-uppercase text-center"> Sign Up</h2>
                                    <c:if test="${usernameError!='no'}">
                                        <p style="color: red; text-align: center;">${usernameError}</p>
                                    </c:if>
                                    <form id="signup" action="RegisterServlet" method="post">
                                        <div class="form-group">
                                            <label><span class="req"></span> </label>
                                            <input placeholder=" Your Name" type="text" name="name_regis" class="form-control" id="first_name" required data-validation-required-message="Please enter your name." autocomplete="off">
                                            <p class="help-block text-danger"></p>
                                        </div>
                                        <div class="form-group">
                                            <label><span class="req"></span> </label>
                                            <input placeholder=" Username" type="tel" name="username_regis" class="form-control" id="first_name" required data-validation-required-message="Please enter your username." autocomplete="off">
                                            <p class="help-block text-danger"></p>
                                        </div>
                                        <div class="form-group">
                                            <label><span class="req"></span> </label>
                                            <input placeholder=" Password" type="password" name="password_regis" class="form-control" id="password" required data-validation-required-message="Please enter your password" autocomplete="off">
                                            <p class="help-block text-danger"></p>
                                        </div>
                                        <div class="mrgn-30-top">
                                            <input type="submit" value="Sign up" class="btn btn-larger btn-block"/>
                                        </div>
                                    </form>
                                </div>
                                <div class="tab-pane fade active in" id="login">
                                    <h2 class="text-uppercase text-center"> Log in</h2>
                                    <c:if test="${fail!='no'}">
                                        <p style="color: red; text-align: center;">${fail}</p>
                                    </c:if>
                                    
                                    <form id="login" action="LoginServlet?doing=${doing}&movieName=${movieName}" method="post">
                                        <div class="form-group">
                                            <label><span class="req"></span> </label>
                                            <input placeholder=" Username" type="text" name="username_login" class="form-control" id="first_name" required data-validation-required-message="Please enter your name." autocomplete="off">
                                            <p class="help-block text-danger"></p>
                                        </div>
                                        <div class="form-group">
                                            <label><span class="req"></span> </label>
                                            <input placeholder=" Password" type="password" name="password_login" class="form-control" id="password" required data-validation-required-message="Please enter your password" autocomplete="off">
                                            <p class="help-block text-danger"></p>
                                        </div>
                                        <div class="mrgn-30-top">
                                            <input type="submit" value="Login" class="btn btn-larger btn-block"/>
                                        </div>
                                    </form>
                                </div>
                            </div>
                        </div>    
                        </c:if>
                        <c:if test="${ACTION=='regis'}">
                        <div id="userform">
                            <ul class="nav nav-tabs nav-justified" role="tablist">
                                <li class="active"><a href="#signup"  role="tab" data-toggle="tab">Sign up</a></li>
                                <li><a href="#login"  role="tab" data-toggle="tab">Login</a></li>
                            </ul>
                            <div class="tab-content">
                                <div class="tab-pane fade active in" id="signup">
                                    <h2 class="text-uppercase text-center"> Sign Up</h2>
                                    <c:if test="${usernameError!='no'}">
                                        <p style="color: red; text-align: center;">${usernameError}</p>
                                    </c:if>
                                    <form id="signup" action="RegisterServlet" method="post">
                                        <div class="form-group">
                                            <label><span class="req"></span> </label>
                                            <input placeholder=" Your Name" type="text" name="name_regis" class="form-control" id="first_name" required data-validation-required-message="Please enter your name." autocomplete="off">
                                            <p class="help-block text-danger"></p>
                                        </div>
                                        <div class="form-group">
                                            <label><span class="req"></span> </label>
                                            <input placeholder=" Username" type="tel" name="username_regis" class="form-control" id="first_name" required data-validation-required-message="Please enter your username." autocomplete="off">
                                            <p class="help-block text-danger"></p>
                                        </div>
                                        <div class="form-group">
                                            <label><span class="req"></span> </label>
                                            <input placeholder=" Password" type="password" name="password_regis" class="form-control" id="password" required data-validation-required-message="Please enter your password" autocomplete="off">
                                            <p class="help-block text-danger"></p>
                                        </div>
                                        <div class="mrgn-30-top">
                                            <input type="submit" value="Sign up" class="btn btn-larger btn-block"/>
                                        </div>
                                    </form>
                                </div>
                                <div class="tab-pane fade in" id="login">
                                    <h2 class="text-uppercase text-center"> Log in</h2>
                                    <form id="login" action="LoginServlet" method="post">
                                        <div class="form-group">
                                            <label><span class="req"></span> </label>
                                            <input placeholder=" Username" type="text" name="username_login" class="form-control" id="first_name" required data-validation-required-message="Please enter your name." autocomplete="off">
                                            <p class="help-block text-danger"></p>
                                        </div>
                                        <div class="form-group">
                                            <label><span class="req"></span> </label>
                                            <input placeholder=" Password" type="password" name="password_login" class="form-control" id="password" required data-validation-required-message="Please enter your password" autocomplete="off">
                                            <p class="help-block text-danger"></p>
                                        </div>
                                        <div class="mrgn-30-top">
                                            <input type="submit" value="Login" class="btn btn-larger btn-block"/>
                                        </div>
                                    </form>
                                </div>
                            </div>
                        </div>
                        </c:if>
                    </div>
                </div>
                <!-- /.container --> 

            </div>
            <script src="//code.jquery.com/jquery-1.11.3.min.js"></script>
            <!-- Latest compiled and minified JavaScript -->
            <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.min.js"></script>
        </body>
        <!-- partial -->
        <script  src="./script.js"></script>

    </body>
</html>
