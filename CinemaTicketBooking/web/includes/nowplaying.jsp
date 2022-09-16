<%-- 
    Document   : nowplaying
    Created on : Jun 22, 2022, 3:10:50 PM
    Author     : USER
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<div class="container-fluid pv11 ">
    <div class="row">
        <div class="col-sm-12">
            <h3 class="heading text-center">Now playing</h3>
            <!-- ------------------------------------------------------------------------------- -->
            <div class="ticket-carousel pvt85">
                <div class="swiper-container carousel-container movie-images" data-col="5">
                    <div class="swiper-wrapper">
                        <c:forEach var="movie" items="${movieList}">
                            <div class="swiper-slide">
                                <div class="movie-image" data-bg-image="${movie.getImg()}">
                                    <div class="entry-hover">
                                        <div class="entry-actions">
<!--                                            <a href="#detail" class="btn-trailers order_btn">details</a>-->
                                            <c:url var="toDetail" value="DetailServlet">
                                                <c:param name="name" value="${movie.getName()}"></c:param>
                                                <c:param name="length" value="${movie.getLength()}"></c:param>
                                                <c:param name="syn" value="${movie.getSyn()}"></c:param>
                                                <c:param name="img" value="${movie.getImg()}"></c:param>
                                            </c:url>
                                            <a href="${toDetail}" class="btn-trailers">details</a>
                                            <c:url var="toBuy" value="BuyTicketServlet">
                                                <c:param name="name" value="${movie.getName()}"></c:param>
                                            </c:url>
                                            <a href="${toBuy}" class="btn-ticket">buy ticket</a>
                                            <!--<a href="#order" class="btn-ticket order_btn">buy ticket</a>-->
                                        </div>
                                    </div>
                                    <div class="entry-desc">
                                        <div class="rating">
                                            <input name="stars" type="radio">
                                            <label>☆</label>
                                            <input name="stars" type="radio">
                                            <label>☆</label>
                                            <input name="stars" type="radio">
                                            <label>☆</label>
                                            <input name="stars" type="radio">
                                            <label>☆</label>
                                            <input name="stars" type="radio">
                                            <label>☆</label>
                                        </div>
                                        <h3 class="entry-title">${movie.getName()}</h3>
                                        <ul class="entry-date">
                                            <c:forEach var="time" items="${timeList}">
                                                <li>${time.getTime()}</li>  
                                            </c:forEach>
                                        </ul>
                                    </div>
                                </div>
                            </div>
                        </c:forEach>    
                    </div>
                </div>
                <div class="swiper-button-prev"></div>
                <div class="swiper-button-next"></div>
            </div>
            <!-- ------------------------------------------------------------------------------- -->
        </div>
    </div>
</div> 