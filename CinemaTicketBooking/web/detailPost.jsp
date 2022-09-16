<%-- 
    Document   : home
    Created on : Jun 20, 2022, 5:19:06 PM
    Author     : Kim Phu
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
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
                <div class="container">
                    <div class="row">
                        <div class="col-md-12">
                            <article class="blog-item single" >
                                <div class="col-md-4 col-sm12 post-image hover-dark" data-bg-image="${MovieDetail.getImg()}">
                                </div> 
                                <div class="col-md-8 col-sm-12 col-xs-12 ph0">
                                    <div class="post-content bg-cover" data-bg-image="images/blog/post-single.jpg">
                                        <div class="content-meta"> 
                                            <h2 class="entry-title"> ${MovieDetail.getName()}
                                                <span>Synopsis</span>
                                            </h2>
                                            <div class="social-links">
                                                <a href="javascript:;"><i class="fa fa-facebook"></i></a>
                                                <a href="javascript:;"><i class="fa fa-twitter"></i></a>
                                                <a href="javascript:;"><i class="fa fa-user"></i></a>
                                            </div>
                                        </div>

                                        <p class="entry-text">${MovieDetail.getSyn()}</p>
                                        <div class="info-content">
                                            <ul class="item-info">
                                                <li><span>Running Time:</span>  <p>${MovieDetail.getLength()}</p></li>
                                                <li><span>Genre:</span>  <p>Action ,triller</p></li>
                                                <li><span>Director:</span>  <p>Timothy Miller</p></li>
                                                <li><span>Cast:</span>  <p>Monica Baccarin , Ryan Ray</p></li>
                                                <li><span>Release Date:</span>  <p>Fabruary 12,2016</p></li>
                                            </ul>
                                            <div class="item-info-rate">
                                                <div class="chart-cirle">
                                                    <div class="chart-circle-l">
                                                        <div class="circle-chart" data-circle-width="7" data-percent="64" data-text="6.4">
                                                        </div>
                                                        <span>AMDB Rating</span>
                                                    </div>
                                                    <div class="chart-circle-r">
                                                        <div class="circle-chart" data-circle-width="7" data-percent="84" data-text="8.4">
                                                        </div>
                                                        <span>Rotten Rating</span>
                                                    </div>
                                                </div>

                                                <div class="wpc-skills animated">
                                                    <div class="skill-block">
                                                        <span class="timer" data-to="70" data-speed="500">70 - Metacritic </span>
                                                        <div class="skill-line">
                                                            <div class="line-fill" data-width-pb="70%" style="width: 70%;"></div>
                                                        </div>
                                                    </div>
                                                    <div class="skill-block">
                                                        <span class="timer" data-to="56" data-speed="500"> 5.6 - Metacritic </span>
                                                        <div class="skill-line">
                                                            <div class="line-fill" data-width-pb="56%" style="width: 56%;"></div>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="content-footer"> 
                                            <span>Available time:</span>
                                            <ul class="mdate">
                                            <c:forEach var="time" items="${timeList}">
                                                <li><a href="#"><i>${time.getTime()}</i></a></li>
                                            </c:forEach>
                                            </ul>
                                            <a href="BuyTicketServlet?name=${MovieDetail.getName()}" class="btn order text-right" style="color: white;"> Buy ticket</a>
                                        </div>
                                    </div>

                                </div>
                            </article>     
                        </div> 
                    </div>

                </div> 
            </section>
            <section class="section-content">
            </section>
            <iframe src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d3835.8638222962977!2d108.25836811367344!3d15.96848634637417!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x3142116949840599%3A0x365b35580f52e8d5!2zxJDhuqFpIGjhu41jIEZQVCDEkMOgIE7hurVuZw!5e0!3m2!1svi!2s!4v1656511833145!5m2!1svi!2s" width="1580" height="400" style="border:0;" allowfullscreen="" loading="lazy" referrerpolicy="no-referrer-when-downgrade"></iframe>
            <%@include file="includes/footer.jsp" %>
        </div>

        <!-- Include jQuery and Scripts -->
        <script type="text/javascript" src="includes/js/jquery.min.js"></script>
        <script type="text/javascript" src="includes/js/packages.min.js"></script>
        <script type="text/javascript" src="includes/js/scripts.min.js"></script>
        <!-- jQuery easing plugin -->
    </body>
</html> 