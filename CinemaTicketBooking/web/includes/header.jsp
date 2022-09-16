<%-- 
    Document   : header
    Created on : Jun 20, 2022, 5:20:38 PM
    Author     : Kim Phu
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<header id="header" class="menu-top-left">
    <div class="container">
        <div class="row">
            <div class="col-md-5 col-sm-6 col-xs-4">
                <a href="./HomeServlet" id="logo" title="PNCine" class="logo-image" data-bg-image="includes/images/logo.png">
                </a>
            </div>
            <c:if test="${empty user}">
            <div class="col-md-4 col-md-offset-2 col-sm-6 col-xs-8 phl0">
                <div class="header_author">
                    <a href="HomeServlet?action=login">Login</a>
                </div>
                <div class="header_ticket">
                    <a href="HomeServlet?action=regis">Register</a>  
                </div>
                <a  href="javascript:;" id="header-search"><i class="fa fa-search"></i></a>
            </div>
            </c:if>
            <c:if test="${not empty user}">
            <div class="col-md-5 col-md-offset-2 col-sm-6 col-xs-8 phl0">
                <div class="header_author">
                    <a href="#">${user.getName()}</a>
                </div>
                <div class="header_ticket">
                    <c:if test="${user.getRole() == 'user'}">
                        <a href="AmountServlet?action=view">My tickets</a>
                        <c:if test="${not empty AMOUNT}">
                            <span>${AMOUNT}</span>
                        </c:if>
                        <c:if test="${empty AMOUNT}">
                            <span>0</span>
                        </c:if>
                    </c:if>

                    <c:if test="${user.getRole() == 'admin'}">
                        <c:url var="lo" value="LogoutServlet">
                            <c:param name="username" value="${user.getUsername()}"></c:param>
                        </c:url>
                        <a href="${lo}">Logout</a>
                    </c:if>   
                </div>
                <a  href="javascript:;" id="header-search"><i class="fa fa-search"></i></a>
                <div class="button_container" id="toggle">
                    <span class="top"></span>
                    <span class="middle"></span>
                    <span class="bottom"></span>
                </div>
                <div class="overlay" id="overlay">
                    <a href="javascript:;" class="close-window"></a>
                    <nav class="overlay-menu">
                        <ul>
                            <c:if test="${user.getRole() == 'user'}">
                                <li ><a href="HomeServlet">Home</a></li>
                                <li ><a href="HistoryServlet">Order History</a></li>
                                    <c:url var="lo" value="LogoutServlet">
                                        <c:param name="username" value="${user.getUsername()}"></c:param>
                                    </c:url>
                                <li><a href="${lo}">Logout</a></li>
                                </c:if>
                                <c:if test="${user.getRole() == 'admin'}">
                                <li ><a href="tableServlet?action=movie&page=1&subact=view">Movies</a></li>
                                <li ><a href="tableServlet?action=order&page=1&subact=view">Orders</a></li>
                                </c:if>
                        </ul>
                    </nav>
                </div>
            </div>    
            </c:if>
            </header>
            <div id="overlay-search">
                <form method="get" action="SearchServlet">
                    <input type="text" name="s" placeholder="Search..." autocomplete="off">
                    <button type="submit">
                        <i class="fa fa-search"></i>
                    </button>
                </form>
                <a href="javascript:;" class="close-window"></a>
            </div>