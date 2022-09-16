<%-- 
    Document   : movieForm
    Created on : Jun 25, 2022, 6:43:04 PM
    Author     : USER
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<html lang="en">

<head>
    <!-- Required meta tags-->
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="Colorlib Templates">
    <meta name="author" content="Colorlib">
    <meta name="keywords" content="Colorlib Templates">

    <!-- Title Page-->
    <title>Add new Movie</title>

    <!-- Font special for pages-->
    <link href="https://fonts.googleapis.com/css?family=Open+Sans:300,300i,400,400i,600,600i,700,700i,800,800i" rel="stylesheet">

    <!-- Main CSS-->
    <link href="form/movie/main.css" rel="stylesheet" media="all">
</head>

<body>
    <div class="page-wrapper bg-dark p-t-100 p-b-50">
        <div class="wrapper wrapper--w900">
            <div class="card card-6">
                <div class="card-heading">
                    <c:if test="${empty id}">
                        <h2 class="title">Add new Movie</h2>
                    </c:if>
                    <c:if test="${not empty id}">
                        <h2 class="title">Update Movie</h2>
                    </c:if>
                </div>
                <div class="card-body">
                    <c:if test="${empty id}">
                    <form action="tableServlet?action=movie&subact=add" method="POST">
                    </c:if>
                    <c:if test="${not empty id}">
                    <form action="tableServlet?action=movie&subact=update&id=${id}" method="POST">
                    </c:if>
                        <c:if test="${empty id}">
                            <div class="form-row">
                                <div class="name">Movie ID</div>
                                <div class="value">
                                    <input class="input--style-6" type="text" name="id" placeholder="ID of movie" value="${availID}">
                                </div>
                        </div>
                        </c:if>
                        <c:if test="${not empty id}">
                            <div class="form-row">
                                <div class="name">Movie ID</div>
                                <div class="value">
                                    <input class="input--style-6" type="text" name="id" value="${id}" disabled="true">
                                </div>
                        </div>
                        </c:if>
                        <div class="form-row">
                            <div class="name">Movie Name</div>
                            <div class="value">
                                <input class="input--style-6" type="text" name="name" placeholder="Name of movie" required>
                            </div>
                        </div>
                        <div class="form-row">
                            <div class="name">Movie Length</div>
                            <div class="value">
                                <input class="input--style-6" type="text" name="length" placeholder="Length of movie" required>
                            </div>
                        </div>
                        <div class="form-row">
                            <div class="name">Synopsis</div>
                            <div class="value">
                                <div class="input-group">
                                    <textarea class="textarea--style-6" name="syn" placeholder="Synopsis of this movie" required></textarea>
                                </div>
                            </div>
                        </div>
                        <div class="form-row">
                            <div class="name">Image URL</div>
                            <div class="value">
                                <input class="input--style-6" type="text" name="img" placeholder="Copy URL of image" required>
                            </div>
                        </div>
                        <div class="form-row">
                            <div class="name">Banner URL</div>
                            <div class="value">
                                <input class="input--style-6" type="text" name="poster" placeholder="Copy URL of banner" required>
                            </div>
                        </div>
                        <div class="form-row">
                            <button class="btn btn--radius-2 btn--blue-2" type="submit">Send Application</button>
                        </div>
                    </form>
                </div>
<!--                <div class="card-footer">
                    <button class="btn btn--radius-2 btn--blue-2" type="submit">Send Application</button>
                    <input type="submit" class="btn btn--radius-2 btn--blue-2" value="Add" name="add"/>
                </div>-->
            </div>
        </div>
    </div>

    <!-- Jquery JS-->
    <script src="form/movie/jquery.min.js"></script>


    <!-- Main JS-->
    <script src="form/movie/global.js"></script>

</body><!-- This templates was made by Colorlib (https://colorlib.com) -->

</html>