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
        <link rel="stylesheet" type="text/css" href="includes/css/admin.css">
        <link href="https://rsms.me/inter/inter-ui.css" rel="stylesheet">

        <!--vendors styles-->
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/slick-carousel/1.8.1/slick.min.css">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/slick-carousel/1.8.1/slick-theme.min.css">

        <!-- Bootstrap CSS / Color Scheme -->
        <link rel="stylesheet" href="form/homepage/orange.css" id="theme-color">
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
            <section class="py-7 py-md-0 bg-hero" id="home">
                <div class="container">
                    <div class="row vh-md-100">
                        <div class="col-md-8 col-sm-10 col-12 mx-auto my-auto text-center">
                            <h1 class="heading-black text-capitalize">Welcome</h1>
                            <a href="tableServlet?action=movie&page=1&subact=view">
                                <button type="submit" class="btn btn-primary d-inline-flex flex-row align-items-center">
                                    Manage Movies
                                    <em class="ml-2" data-feather="arrow-right"></em>
                                </button>
                            </a> <br> <br>
                            <a href="tableServlet?action=order&page=1&subact=view">
                                <button type="submit" class="btn btn-primary d-inline-flex flex-row align-items-center">
                                    Manage Orders
                                    <em class="ml-2" data-feather="arrow-right"></em>
                                </button>
                            </a>
                        </div>
                    </div>
<!--                    <div class="row vh-md-100">
                        <div class="col-md-4">
                            <div class="card-box tilebox-one"><i class="icon-layers float-right text-muted"></i>
                                <h6 class="text-muted text-uppercase mt-0">Orders</h6>
                                <h2 class="" data-plugin="counterup">1,587</h2><span class="badge badge-custom">+11% </span><span class="text-muted">From previous period</span></div>
                        </div>
                         end col 
                        <div class="col-md-4">
                            <div class="card-box tilebox-one"><i class="icon-paypal float-right text-muted"></i>
                                <h6 class="text-muted text-uppercase mt-0">Revenue</h6>
                                <h2 class="">$<span data-plugin="counterup">46,782</span></h2><span class="badge badge-danger">-29% </span><span class="text-muted">From previous period</span></div>
                        </div>
                         end col 
                        <div class="col-md-4">
                            <div class="card-box tilebox-one"><i class="icon-rocket float-right text-muted"></i>
                                <h6 class="text-muted text-uppercase mt-0">Product Sold</h6>
                                <h2 class="" data-plugin="counterup">1,890</h2><span class="badge badge-custom">+89% </span><span class="text-muted">Last year</span></div>
                        </div>
                    </div>-->
                </div>
            </section>
        </div>
        <style>
            .text-muted{
                color: white !important;
                font-size: 25px;
            }
            .badge-custom {
                background: #02c0ce;
                color: #fff;
                width: 55px;
                height: 25px;
                font-size: 15px;
                margin-right: 10px;
            }
            .badge-danger {
                color: #ffffff;
                background-color: #ff1744;
                width: 55px;
                height: 25px;
                font-size: 15px;
                margin-right: 10px;
            }
/*            .vh-md-100 {
                height: 70vh;
            }*/
        </style>
        <!-- Include jQuery and Scripts -->
        <script type="text/javascript" src="includes/js/jquery.min.js"></script>
        <script type="text/javascript" src="includes/js/packages.min.js"></script>
        <script type="text/javascript" src="includes/js/scripts.min.js"></script>
        <!-- jQuery first, then Popper.js, then Bootstrap JS -->
        <script src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/feather-icons/4.7.3/feather.min.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/slick-carousel/1.8.1/slick.min.js"></script>
        <!--<script src="form/homepage/scripts.js"></script>-->
    </body>
</html> 