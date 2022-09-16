<%-- 
    Document   : orderHistory
    Created on : Jul 7, 2022, 3:57:00 PM
    Author     : USER
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/functions" prefix = "fn" %>
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
        <link href="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
        <link href="https://fonts.googleapis.com/css?family=Poppins:300,400,500,600,700,800,900" rel="stylesheet">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/ionicons/4.5.6/css/ionicons.min.css">
        <link rel="stylesheet" href="includes/css/history.css">
        <script nonce="83724a69-6b33-4f10-9af1-c4ef8f5533a5">(function(w, d){!function(a, e, t, r){a.zarazData = a.zarazData || {}, a.zarazData.executed = [], a.zaraz = {deferred:[]}, a.zaraz.q = [], a.zaraz._f = function(e){return function(){var t = Array.prototype.slice.call(arguments); a.zaraz.q.push({m:e, a:t})}}; for (const e of["track", "set", "ecommerce", "debug"])a.zaraz[e] = a.zaraz._f(e); a.zaraz.init = () => {var t = e.getElementsByTagName(r)[0], z = e.createElement(r), n = e.getElementsByTagName("title")[0]; for (n && (a.zarazData.t = e.getElementsByTagName("title")[0].text), a.zarazData.x = Math.random(), a.zarazData.w = a.screen.width, a.zarazData.h = a.screen.height, a.zarazData.j = a.innerHeight, a.zarazData.e = a.innerWidth, a.zarazData.l = a.location.href, a.zarazData.r = e.referrer, a.zarazData.k = a.screen.colorDepth, a.zarazData.n = e.characterSet, a.zarazData.o = (new Date).getTimezoneOffset(), a.zarazData.q = []; a.zaraz.q.length; ){const e = a.zaraz.q.shift(); a.zarazData.q.push(e)}z.defer = !0; for (const e of[localStorage, sessionStorage])Object.keys(e || {}).filter((a => a.startsWith("_zaraz_"))).forEach((t => {try{a.zarazData["z_" + t.slice(7)] = JSON.parse(e.getItem(t))} catch {a.zarazData["z_" + t.slice(7)] = e.getItem(t)}})); z.referrerPolicy = "origin", z.src = "/cdn-cgi/zaraz/s.js?z=" + btoa(encodeURIComponent(JSON.stringify(a.zarazData))), t.parentNode.insertBefore(z, t)}, ["complete", "interactive"].includes(e.readyState)?zaraz.init():a.addEventListener("DOMContentLoaded", zaraz.init)}(w, d, 0, "script"); })(window, document);</script></head>
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
            <section class="ftco-section">
                <div class="container">
                    <div class="row">
                        <div class="col-md-12 text-center">
                            <h2 style="color: white;" class="heading-section mb-5 pb-md-4">ORDER HISTORY</h2>
                        </div>
                    </div>
                    <div class="row justify-content-center">
                        <div class="col-md-12">
                            <div id="accordion" class="myaccordion w-100">
                                <c:set var="count" value="0"></c:set>
                                <c:forEach var="time" items="${Invoices}">
                                <c:set var="count" value="${count+1}"></c:set>    
                                <div class="card">
                                    <div class="card-header p-0" id="heading${count}">
                                        <h2 class="mb-0">
                                            <button class="d-flex py-3 px-4 align-items-center justify-content-between btn btn-link" data-toggle="collapse" data-target="#collapse${count}" aria-expanded="false" aria-controls="collapse${count}">
                                                <div class="heading d-flex align-items-center">
                                                    <div class="icon d-flex align-items-center justify-content-center">
                                                        <span class="ion-ios-cart"></span>
                                                    </div>
                                                    <h3 class="mb-0 ml-3">Date: ${fn:substring(time.key, 0, 10)}</h3><br>
                                                    <h3 class="mb-0 ml-3">Time: ${fn:substring(time.key, 10,19)}</h3>
                                                </div>
                                                    <c:set var="total" value="0"></c:set>
                                                    <c:forEach var="item" items="${time.value}">
                                                        <c:set var="total" value="${total+item.getTotal()}"></c:set>
                                                    </c:forEach>
                                                <p class="mb-0 num">Total: ${total}$</p>

                                            </button>
                                        </h2>
                                    </div>
                                    <div id="collapse${count}" class="collapse" aria-labelledby="heading${count}" data-parent="#accordion">
                                        <div class="card-body p-0 py-3">
                                            <ul>
                                                <c:forEach var="item" items="${time.value}">
                                                    <li class="list-item">
                                                        <div class="container">
                                                            <div class="row">
                                                                <div class="col-md-2">
                                                                    <img class="item-poster" src="${item.getImg()}" alt="${item.getName()}">
                                                                </div>
                                                                <div class="col-md-9">
                                                                    <h1 style="color: white; font-size: 20px;">${item.getName()}</h1>
                                                                    <p style="color: #b5b3b3;">Location: ${item.getLocation()}</p>
                                                                    <p style="color: #b5b3b3;">Time: ${item.getTime()} ${item.getDate()}</p>
                                                                    <p style="color: #b5b3b3;">Price: ${item.getCost()}$</p>
                                                                    <h1 style="color: white; font-size: 20px;">x ${item.getQuantity()}</h1>
                                                                </div>
                                                            </div>
                                                        </div>
                                                            
                                                    </li>
                                                </c:forEach>    
                                            </ul>
                                        </div>
                                    </div>
                                </div>
                                </c:forEach>
                            </div>
                        </div>
                    </div>
                </div>
            </section
        </section>
        <%@include file="includes/footer.jsp" %>
    </div>
    <style>
        .btn, button, input[type=button], input[type=submit]{
            color: black;
        }
        .list-item{
            color: white;
            padding: 15px;
        }
        .item-poster{
            margin-left: 5px;
            width: 80%;
            border: 1px solid white;
        }
        .section-content .heading:after{
            display: none;
        }
    </style>
    <!-- Include jQuery and Scripts -->
    <script src="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/js/bootstrap.min.js"></script>
    <script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
    <script type="text/javascript" src="includes/js/jquery.min.js"></script>
    <script type="text/javascript" src="includes/js/packages.min.js"></script>
    <script type="text/javascript" src="includes/js/scripts.min.js"></script>
    <!-- jQuery easing plugin -->
    <script src="includes/js/history1.js"></script><script>eval(mod_pagespeed_lMeLAAOZN6);</script>
    <script>eval(mod_pagespeed_FgiWUnWM1l);</script>
    <script src="includes/js/history2.js"></script><script>eval(mod_pagespeed_dXDs3Obd7d);</script>
    <script>eval(mod_pagespeed_33U9L6IHRo);</script>
    <script defer src="https://static.cloudflareinsights.com/beacon.min.js/v652eace1692a40cfa3763df669d7439c1639079717194" integrity="sha512-Gi7xpJR8tSkrpF7aordPZQlW2DLtzUlZcumS8dMQjwDHEnw9I7ZLyiOj/6tZStRBGtGgN6ceN6cMH8z7etPGlw==" data-cf-beacon='{"rayId":"726f5de0bd5cb435","token":"cd0b4b3a733644fc843ef0b185f98241","version":"2022.6.0","si":100}' crossorigin="anonymous"></script>
</html> 