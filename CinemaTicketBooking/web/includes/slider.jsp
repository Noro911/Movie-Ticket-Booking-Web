<%-- 
    Document   : slide
    Created on : Jun 21, 2022, 2:44:40 PM
    Author     : USER
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<div class="fullwidth-slider">
    <div id="headerslider" class="carousel slide"> 
        <ol class="carousel-indicators">
            <li data-target="#headerslider" data-slide-to="0" class="active"></li>
            <li data-target="#headerslider" data-slide-to="1"></li>
            <li data-target="#headerslider" data-slide-to="2"></li>
        </ol>
        <div class="carousel-inner" role="listbox">
            <div class="item active">
                <div class="fill" data-bg-image="includes/images/slider.jpeg">
                    <div class="bs-slider-overlay"></div>
                    <div class="container movie-slider-container"> 
                        <div class="row">
                            <div class="col-sm-12 movie-slider-content"> 
                                <div class="slider-content" >
                                    <ul class="subtitle"  data-animation="animated bounceInRight">
                                        <li>Action</li>
                                        <li>Science Fiction</li>
                                        <li>Adventure</li>
                                    </ul>
                                    <div class="title" data-animation="animated bounceInRight" >Lord of the rings: The return of the kings <i>(2017)</i></div>
                                    <div class="slide_right" data-animation="animated bounceInRight">
                                        <a href="javascript:;" class="btn-trailer">Details</a> <a href="javascript:;" class="btn-ticket">buy ticket</a>
                                    </div>
                                    <div class="chart-cirle">
                                        <div class="chart-circle-l" data-animation="animated bounceInUp">
                                            <div class="circle-chart" data-circle-width="7" data-percent="64" data-text="6.4" >
                                            </div>
                                            <span>IMDB Ratffing</span>
                                        </div>
                                        <div class="chart-circle-r" data-animation="animated bounceInUp">
                                            <div class="circle-chart" data-circle-width="7" data-percent="84" data-text="8.4" >
                                            </div>
                                            <span>Rotten Rating</span>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <c:forEach var="movie" items="${movieList}">
            <div class="item">
                <div class="fill" data-bg-image="${movie.getPoster()}">
                    <div class="bs-slider-overlay"></div>
                    <div class="container movie-slider-container"> 
                        <div class="row">
                            <div class="col-sm-12 movie-slider-content"> 
                                <div class="slider-content" >
                                    <ul class="subtitle"  data-animation="animated bounceInRight">
                                        <li>Action</li>
                                        <li>Science Fiction</li>
                                        <li>Adventure</li>
                                    </ul>
                                    <div class="title" data-animation="animated bounceInRight" >${movie.getName()}</div>
                                    <div class="slide_right" data-animation="animated bounceInRight">
                                        <a href="javascript:;" class="btn-trailer">details</a> <a href="javascript:;" class="btn-ticket">buy ticket</a>
<!--                                        <ul class="award-logo">
                                            <li><img src="includes/images/header/icon1.png" alt="icon" ></li>
                                            <li><img src="includes/images/header/icon2.png" alt="icon"></li>
                                            <li><img src="includes/images/header/icon3.png" alt="icon"></li>
                                            <li><img src="includes/images/header/icon4.png" alt="icon"></li>
                                        </ul>-->
                                    </div>
                                    <div class="chart-cirle">
                                        <div class="chart-circle-l" data-animation="animated bounceInUp">
                                            <div class="circle-chart" data-circle-width="7" data-percent="94" data-text="9.4">
                                            </div>
                                            <span>IMDB Ratffing</span>
                                        </div>
                                        <div class="chart-circle-r" data-animation="animated bounceInUp">
                                            <div class="circle-chart" data-circle-width="7" data-percent="84" data-text="8.4">
                                            </div>
                                            <span>Rotten Rating</span>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            
            
                
            </c:forEach>



        </div>

        <!-- Controls -->
        <a class="carousel-control left" href="#headerslider" data-slide="prev">
            <i class="fa fa-angle-left"></i>
        </a>
        <a class="carousel-control right" href="#headerslider" data-slide="next">
            <i class="fa fa-angle-right"></i>
        </a>
    </div>  
</div>