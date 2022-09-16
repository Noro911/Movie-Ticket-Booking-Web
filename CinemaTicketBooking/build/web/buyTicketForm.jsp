<%-- 
    Document   : home
    Created on : Jun 20, 2022, 5:19:06 PM
    Author     : Kim Phu
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>


<%-- 
    Document   : home
    Created on : Jun 20, 2022, 5:19:06 PM
    Author     : Kim Phu
--%>

<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1.0, user-scalable=no">
        <title>NPCinema</title>
        <meta name="keywords" content="HTML5,CSS3,HTML,Template,Themeton" >
        <meta name="description" content="Tenguu Cinema - Movie Theater Template">
        <meta name="author" content="Themeton">
        <!-- Favicon -->
        <link rel="shortcut icon" type="image/x-icon" href="includes/images/favicon.png"/>
        <link href='http://fonts.googleapis.com/css?family=Roboto:400,100,100italic,300,300ita‌​lic,400italic,500,500italic,700,700italic,900italic,900' rel='stylesheet' type='text/css'>
        <link rel="stylesheet" type="text/css" href="//fonts.googleapis.com/css?family=Open+Sans" />
        <link rel="stylesheet" type="text/css" href="includes/css/packages.min.css">
        <link rel="stylesheet" type="text/css" href="includes/css/default.css">
        <link rel="stylesheet" type="text/css" href="includes/css/increinput.css">
        <link href="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
    </head>
    <body class="sticky-menu">
        <div id="loader">
            <div class="loader-ring">
                <div class="loader-ring-light"></div>
                <div class="loader-ring-track"></div>
            </div>
        </div>
        <div class="wrapper">
            <%@include file="includes/header.jsp" %>
            <section class="section-content pv12 bg-cover" data-bg-image="https://images.pexels.com/videos/3045163/free-video-3045163.jpg?auto=compress&cs=tinysrgb&dpr=1&w=500">
                <div id="order">
                    <div class="container">
                        <div class="row order-content">
                            <div class="col-sm-8 col-xs-12 seat_content ph0">
                                <h2>order a ticket</h2>
                                <div class="entry-order-content">
                                    <form id="msform" name="msform" action="BuyTicketServlet"+${movieName} method="get">
                                        <!-- fieldsets -->
                                        <fieldset>
                                            <div class="wpc-content">
                                                <h3>location</h3>
                                                <select name="location">
                                                    <c:forEach var="cine" items="${cinemaList}">
                                                        <option>${cine.getName()}</option>
                                                    </c:forEach>
                                                </select>
                                                <h3 class="mt3">Movie - ${movieName}</h3>
                                                <h3 class="mt3">Date</h3>
                                                <input type='date' class="datetime" name="date" min="${CURRENT}" required/>
                                                <h3 class="mt3">TIME</h3>
                                                <select name="time">
                                                    <c:forEach var="time" items="${timeList}">
                                                        <option>${time.getTime()}</option>
                                                    </c:forEach>
                                                </select>
                                            </div>
                                            <input type="submit" name="next"  value="Next" />
                                        </fieldset>
                                    </form>
                                </div>
                            </div>
                            <div class="col-sm-4 col-xs-12 order_sidebar ph0">
                                <h2>Your Information</h2>
                                <div class="order-details">
                                    <p> Name: ${movieName}<p>
                                    <p> Location: ${movieLocation}<p>
                                    <p>Date: ${movieDate}<p>
                                    <p>Time: ${movieTime}<p>
                                    <p>Cost: 13$<p>
                                        <c:url var="toOrder" value="OrderServlet">
                                            <c:param name="movieName" value="${movieName}"></c:param>
                                            <c:param name="movieLocation" value="${movieLocation}"></c:param>
                                            <c:param name="movieDate" value="${movieDate}"></c:param>
                                            <c:param name="movieTime" value="${movieTime}"></c:param>
                                        </c:url>
                                    <form action="${toOrder}" method="post">
                                        <input type="submit" name="next"  value="Confirm" />
                                    </form>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </section>
            <section class="section-content">
            </section>
            <%@include file="includes/footer.jsp" %>
        </div>
        <style>
            .btn, button, input[type=button], input[type=submit]{
                color: black;
            }
        </style>
        <!-- Include jQuery and Scripts -->
        <script src="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/js/bootstrap.min.js"></script>
        <script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
        <script type="text/javascript" src="includes/js/jquery.min.js"></script>
        <script type="text/javascript" src="includes/js/packages.min.js"></script>
        <script type="text/javascript" src="includes/js/scripts.min.js"></script>
        <!-- jQuery easing plugin -->
    </body>
</html> 