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
        <link rel="stylesheet" type="text/css" href="includes/css/increinput.css">
        <!--<link href="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">-->
        <!--<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">-->
        <link href="https://fonts.googleapis.com/css?family=Roboto:300,400&display=swap" rel="stylesheet">
        <link rel="stylesheet" href="includes/css/table.css" />
        <script nonce="057b92f8-38f9-4206-a78a-072116a5a163">(function(w, d){!function(a, e, t, r){a.zarazData = a.zarazData || {}, a.zarazData.executed = [], a.zaraz = {deferred:[]}, a.zaraz.q = [], a.zaraz._f = function(e){return function(){var t = Array.prototype.slice.call(arguments); a.zaraz.q.push({m:e, a:t})}}; for (const e of["track", "set", "ecommerce", "debug"])a.zaraz[e] = a.zaraz._f(e); a.zaraz.init = () => {var t = e.getElementsByTagName(r)[0], z = e.createElement(r), n = e.getElementsByTagName("title")[0]; for (n && (a.zarazData.t = e.getElementsByTagName("title")[0].text), a.zarazData.x = Math.random(), a.zarazData.w = a.screen.width, a.zarazData.h = a.screen.height, a.zarazData.j = a.innerHeight, a.zarazData.e = a.innerWidth, a.zarazData.l = a.location.href, a.zarazData.r = e.referrer, a.zarazData.k = a.screen.colorDepth, a.zarazData.n = e.characterSet, a.zarazData.o = (new Date).getTimezoneOffset(), a.zarazData.q = []; a.zaraz.q.length; ){const e = a.zaraz.q.shift(); a.zarazData.q.push(e)}z.defer = !0; for (const e of[localStorage, sessionStorage])Object.keys(e || {}).filter((a => a.startsWith("_zaraz_"))).forEach((t => {try{a.zarazData["z_" + t.slice(7)] = JSON.parse(e.getItem(t))} catch {a.zarazData["z_" + t.slice(7)] = e.getItem(t)}})); z.referrerPolicy = "origin", z.src = "/cdn-cgi/zaraz/s.js?z=" + btoa(encodeURIComponent(JSON.stringify(a.zarazData))), t.parentNode.insertBefore(z, t)}, ["complete", "interactive"].includes(e.readyState)?zaraz.init():a.addEventListener("DOMContentLoaded", zaraz.init)}(w, d, 0, "script"); })(window, document);</script>
        <!--Check box-->
        <link href="https://fonts.googleapis.com/css?family=Roboto:300,400&display=swap" rel="stylesheet">
        <link href="https://fonts.googleapis.com/css?family=Poppins:300,400,500&display=swap" rel="stylesheet">
        <link href="https://fonts.googleapis.com/css?family=Source+Serif+Pro:400,600&display=swap" rel="stylesheet">
        <link rel="stylesheet" href="includes/css/checkbox.css" />
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
                <div class="container my-3">
                    <c:if test="${not empty success}">
                        <h1 style="color: white; text-align: center;">${success}</h1>
                    </c:if>
                    <c:if test="${empty success}">
                        <c:if test="${empty basketList}">
                            <h1 style="color: white; text-align: center;">There no ticket here</h1>
                        </c:if>
                        <c:if test="${not empty basketList}">
                        <div class="d-flex py-3"><h3 style="color:white; font-size: 30px;">Total Price: $${TOTAL}</h3> 
                            <form action="https://www.sandbox.paypal.com/cgi-bin/webscr" method="post" >
                                <input type="submit" class="mx-3 btn" value="Check Out"/>
                                <input type="hidden" name="upload" value="1"/>
                                <input type="hidden" name="cmd" value="_cart"/>
                                <input type="hidden" name="return" value="http://localhost:8080/CinemaTicketBooking/AmountServlet?action=checkout"/>
                                <input type="hidden" name="business" value="pncinema@business.example.com"/>
                                <c:set var="count" scope="request" value="0"></c:set>
                                <c:forEach var="order" items="${basketList}">
                                    <c:set var="count" scope="request" value="${count+1}"></c:set>
                                    <input type="hidden" name="item_name_${count}" value="${order.getName()}"/>
                                    <input type="hidden" name="amount_${count}" value="${order.getCost()}"/>
                                    <input type="hidden" name="quantity_${count}" value="${order.getQuantity()}"/>
                                </c:forEach>

                            </form>
                        </div>
                        <table class="table table-striped custom-table">
                            <thead>
                                <tr>
                                    <!--<th scope="col"></th>-->
                                    <th scope="col">Name</th>
                                    <th scope="col">Detail</th>
                                    <th scope="col">Price</th>
                                    <th scope="col">Quantity</th>
                                    <th scope="col"></th>
                                </tr>
                            </thead>
                            <tbody>
                                <c:forEach var="order" items="${basketList}">
                                    <tr>
                                        <td><a href="#">${order.getName()}</a></td>
                                        <td>
                                            ${order.getLocation()}
                                            <small class="d-block">${order.getDate()}  ${order.getTime()}</small>
                                        </td>
                                        <td>$13</td>
                                        <td style="width: 20%">
                                            <div class="qty mt-3 mr-0">
                                                <a href="AmountServlet?action=dec&id=${order.getId()}"><span class="minus bg-dark">-</span></a>
                                                <input type="number" class="count" name="qty" value="${order.getQuantity()}" readonly>
                                                <a href="AmountServlet?action=inc&id=${order.getId()}"><span class="plus bg-dark">+</span></a>
                                            </div>
                                        </td>
                                        <td><a href="AmountServlet?action=remove&id=${order.getId()}" class="more" style="font-size: 15px;">Remove</a></td>
                                    </tr>
                                </c:forEach>
                            </tbody>
                        </table>
                        </c:if>
                        
                    </c:if>

                </div>
            </section>
            <%@include file="includes/footer.jsp" %>
        </div>

        <style type="text/css">
            .qty .count {
                background-color: black;
                color: white;
                text-align: center;
                padding-left: 5px;
                font-size: 20px;
                width: 20px;
            }
            .btn,button,
            input[type=button],
            input[type=submit] {
                color: white;
            }
            .btn-sm{
                padding: auto;
                font-size: 12px;
            }
            .table>tbody>tr>td, .table>tbody>tr>th, .table>tfoot>tr>td, .table>tfoot>tr>th, .table>thead>tr>td, .table>thead>tr>th{
                border: none;
                font-size: 20px;
            }
            .bg-dark{
                font-size: 20px;
                background-color: black !important;
            }
            .bg-dark:hover{
                font-size: 20px;
                background-color: black !important;
            }
            .custom-control.overflow-checkbox .overflow-control-indicator{
                border: 2px solid #fb802d;
            }
/*            .qty .minus, .qty .plus{
                font-size: 20px;
            }*/
        </style>

        <script type="text/javascript" src="includes/js/jquery.min.js"></script>
        <script type="text/javascript" src="includes/js/packages.min.js"></script>
        <script type="text/javascript" src="includes/js/scripts.min.js"></script>
        <!-- jQuery easing plugin -->
        <script src="includes/js/jquery.min.js"></script>
        <script src="includes/js/table.js"></script>
        <script>eval(mod_pagespeed_NzFjroNuEU);</script>
        <script>eval(mod_pagespeed_vOJXBHXVIL);</script>
        <script>eval(mod_pagespeed_wsa5uZD8Sq);</script>
        <script defer src="https://static.cloudflareinsights.com/beacon.min.js/v652eace1692a40cfa3763df669d7439c1639079717194" integrity="sha512-Gi7xpJR8tSkrpF7aordPZQlW2DLtzUlZcumS8dMQjwDHEnw9I7ZLyiOj/6tZStRBGtGgN6ceN6cMH8z7etPGlw==" data-cf-beacon='{"rayId":"7277f7ed8d522398","token":"cd0b4b3a733644fc843ef0b185f98241","version":"2022.6.0","si":100}' crossorigin="anonymous"></script>

    </body>
</html> 