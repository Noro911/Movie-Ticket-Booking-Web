<%-- 
    Document   : footer
    Created on : Jun 20, 2022, 5:56:11 PM
    Author     : Kim Phu
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<footer id="footer">
    <div class="container footer-container">
        <div class="row">
            <div class="col-md-2 col-sm-6">
                <div class="widget">
                    <h5 class="widget-title">Menu</h5>
                    <ul class="menu">
                        <li><a href="#">Home</a></li>
                        <li><a href="#">Coming soon</a></li>
                        <li><a href="#">Order</a></li>
                        <li><a href="#">Terms of service</a></li>
                        <li><a href="#">Pricing</a></li>
                    </ul>
                </div>
                <div class="widget">
                    <div class="social-links">
                        <a href="javascript:;"><i class="fa fa-facebook"></i></a>
                        <a href="javascript:;"><i class="fa fa-twitter"></i></a>
                        <a href="javascript:;"><i class="fa fa-google-plus"></i></a>
                    </div>
                </div>
            </div>
            <div class="col-md-3 col-sm-6">
                <div class="widget">
                    <h5 class="widget-title">Address information</h5>
                    <p>
                        California. AMC Dine-In Theatres Marina,
                        Street 26, Distritc 543 #108
                    </p> 
                    <p>
                        <i class="fa fa-mail"></i>Example@mail.com<br>
                        <i class="fa fa-phone"></i> + 123 456 7890
                    </p> 
                </div>
            </div>
            <div class="col-md-1"></div>
            <div class="col-md-6">
                <div class="widget">
                    <h5 class="widget-title">Leave a message</h5>
                    <form class="contact_form transparent">
                        <div class="row">
                            <div class="col-sm-12">
                                <input type="text" class="inputValidation" name="name" placeholder="Name *">
                            </div>
                            <div class="col-sm-12">
                                <input type="text" class="inputValidation" name="email" placeholder="Email *">
                            </div>
                            <div class="col-sm-12 ">
                                <textarea class="inputValidation" placeholder="Message *"></textarea>
                                <button type="submit" class="button fill rectangle">Send to us</button>
                            </div>
                        </div>
                    </form>
                    <div class="errorMessage"></div>
                </div>
            </div>
        </div>
    </div>
    <div class="sub-footer">
        <div class="container">
            <div class="row copyright-text">
                <div class="col-sm-12 text-center">
                    <p class="mv3 mvt0">&copy; Copyrights 2017 Tenguu. All rights reserved</p>
                </div>
            </div>
        </div>
    </div>
</footer>