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
        <link href="https://netdna.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css" rel="stylesheet">
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
                    <div class="row ng-scope">
                        <div class="col-md-3">
                            <h4 style="color: white; font-weight: bold;">Searching Results</h4>
                            <p class="text-muted fs-mini">Sort by: </p>
                            <ul class="nav nav-pills nav-stacked search-result-categories mt">
                                <li><a href="SearchServlet?action=sortName&s=${search}">Movie Name </a>
                                </li>
                                <li><a href="SearchServlet?action=sortLength&s=${search}">Movie Length</a>
                                </li>
                            </ul>
                        </div>
                        <div class="col-md-9 col-md-pull-0">
                            <p class="search-results-count">About ${amount} results</p>
                            <c:forEach var="movie" items="${SearchResult}">
                            <section class="search-result-item">
                                <a class="image-link" href="#"><img class="image" src="${movie.getImg()}">
                                </a>
                                <div class="search-result-item-body">
                                    <div class="row">
                                        <div class="col-sm-9">
                                            <h4 class="search-result-item-heading"><a href="#">${movie.getName()}</a></h4>
                                            <p class="info">${movie.getLength()}</p>
                                            <p class="description">${movie.getSyn()}</p>
                                        </div>
                                        <div class="col-sm-3 text-align-center">
                                            <p class="value3 mt-sm">${movie.getCost()} $</p>
                                            <c:url var="toDetail" value="DetailServlet">
                                                <c:param name="name" value="${movie.getName()}"></c:param>
                                                <c:param name="length" value="${movie.getLength()}"></c:param>
                                                <c:param name="syn" value="${movie.getSyn()}"></c:param>
                                                <c:param name="img" value="${movie.getImg()}"></c:param>
                                            </c:url>
                                            <a class="btn btn-primary btn-info btn-sm" href="${toDetail}">Learn More</a>
                                        </div>
                                    </div>
                                </div>
                            </section>
                            </c:forEach>
                            
                            
                            <div class="text-align-center">
                                <ul class="pagination pagination-sm">
                                    <c:forEach var="i" begin="1" end="${totalPage}">
                                        <c:if test="${i==active}">
                                            <li class="active"><a href="SearchServlet?action=${action}&page=${i}&s=${search}">${i}</a></li>
                                        </c:if>
                                        <c:if test="${i!=active}">
                                            <li><a href="SearchServlet?action=${action}&page=${i}&s=${search}">${i}</a></li>
                                        </c:if>
                                    </c:forEach>
                                </ul>
                            </div>
                        </div>
                    </div>
                </div>
            </section>
            <iframe src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d3835.8638222962977!2d108.25836811367344!3d15.96848634637417!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x3142116949840599%3A0x365b35580f52e8d5!2zxJDhuqFpIGjhu41jIEZQVCDEkMOgIE7hurVuZw!5e0!3m2!1svi!2s!4v1656511833145!5m2!1svi!2s" width="1580" height="400" style="border:0;" allowfullscreen="" loading="lazy" referrerpolicy="no-referrer-when-downgrade"></iframe>
            <style type="text/css">
                .pagination li a{
                    color: black;
                    background-color: white;
                    border: 1px solid white;
                }
                
                .pagination li a:hover{
                    color: black;
                }
                
                .pagination .active a{
                    color: white;
                    background-color: #fb802d;
                    border-color: #fb802d;
                }
                
                .pagination .active a:hover{
                    color: white;
                    background-color: #fb802d;
                    border-color: #fb802d;
                }
                
                .btn-info{
                    background-color: #fb802d;
                    border-color: #fb802d;
                }
                
                .btn-info:hover{
                    background-color: transparent;
                    border-color: #fb802d;
                }
                
                body{
                    margin-top:20px;
                    background-color: rgb(46, 46, 46);
                }

                .value3{
                    color: white;
                }
                .search-result-categories>li>a {
                    color: #b6b6b6;
                    font-weight: 400
                }

                .search-result-categories>li>a:hover {
                    background-color: #ddd;
                    color: #555
                }

                .search-result-categories>li>a>.glyphicon {
                    margin-right: 5px
                }

                .search-result-categories>li>a>.badge {
                    float: right
                }

                .search-results-count {
                    color: white;
                    margin-top: 10px
                }

                .search-result-item {
                    padding: 20px;
                    background-color: rgba(255, 255, 255, 0);
                    border-radius: 4px
                }

                .search-result-item:after,
                .search-result-item:before {
                    content: " ";
                    display: table
                }

                .search-result-item:after {
                    clear: both
                }

                .search-result-item .image-link {
                    display: block;
                    overflow: hidden;
                    border-top-left-radius: 4px;
                    border-bottom-left-radius: 4px
                }

                @media (min-width:768px) {
                    .search-result-item .image-link {
                        display: inline-block;
                        margin: -20px 0 -20px -20px;
                        float: left;
                        width: 200px
                    }
                }

                @media (max-width:767px) {
                    .search-result-item .image-link {
                        max-height: 200px
                    }
                }

                .search-result-item .image {
                    max-width: 100%
                }

                .search-result-item .info {
                    margin-top: 2px;
                    font-size: 12px;
                    color:rgb(255, 255, 255)
                }

                .search-result-item .description {
                    font-size: 13px;
                    color: white;
                }

                .search-result-item+.search-result-item {
                    margin-top: 20px
                }

                @media (min-width:768px) {
                    .search-result-item-body {
                        margin-left: 200px
                    }
                }

                .search-result-item-heading {
                    font-weight: 400
                }

                .search-result-item-heading>a {
                    color: rgb(255, 255, 255)
                }

                @media (min-width:768px) {
                    .search-result-item-heading {
                        margin: 0
                    }
                }
            </style>

            <script type="text/javascript"></script>
            <%@include file="includes/footer.jsp" %>
        </div>
        <!-- Overlay Search -->
        <!--        <div id="overlay-search">
                    <form method="get" action="./">
                        <input type="text" name="s" placeholder="Search..." autocomplete="off">
                        <button type="submit">
                            <i class="fa fa-search"></i>
                        </button>
                    </form>
                    <a href="javascript:;" class="close-window"></a>
                </div>-->


        <!-- Include jQuery and Scripts -->
        <script type="text/javascript" src="includes/js/jquery.min.js"></script>
        <script type="text/javascript" src="includes/js/packages.min.js"></script>
        <script type="text/javascript" src="includes/js/scripts.min.js"></script>
        <script src="https://code.jquery.com/jquery-1.10.2.min.js"></script>
        <script src="https://netdna.bootstrapcdn.com/bootstrap/3.3.6/js/bootstrap.min.js"></script>
        <!-- jQuery easing plugin -->
    </body>
</html> 