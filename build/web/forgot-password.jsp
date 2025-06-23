<%-- 
    Document   : registration
    Created on : Mar 5, 2024, 7:11:13 PM
    Author     : nofom
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

    <head>
        <meta charset="utf-8"/>
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
        <meta name="description" content=""/>
        <meta name="author" content=""/>
        <title>Registration</title>
        <!-- Favicon -->
        <link rel="icon" type="image/x-icon" href="./assets/favicon.png"/>
        <!-- Bootstrap icons-->
        <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.5.0/font/bootstrap-icons.css" rel="stylesheet" />
        <!-- Core theme CSS (includes Bootstrap)-->
        <link href="css/styles.css" rel="stylesheet" />
        <link href="css/my-styles.css" rel="stylesheet">
        <!-- Show hide password -->
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css"
              integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
        <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.8.2/css/all.css"
              integrity="sha384-oS3vJWv+0UjzBfQzYUhtDYW+Pj2yciDJxpsK1OYPAYjqT085Qq/1cq5FLXAZQ7Ay" crossorigin="anonymous">

        <script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
        <script src="https://unpkg.com/bootstrap-show-password@1.2.1/dist/bootstrap-show-password.min.js"></script>
    </head>

    <body>
        <!-- Contact Head -->
        <%@include file="components/contactHeadComponent.jsp" %>
        <!-- Navigation -->
        <%@include file="components/registrationNavComponent.jsp" %>
        <!-- Registration Session -->
        <section class="bg-image"
                 style="background-image: url('https://media.istockphoto.com/id/638730224/vector/heart-pattern.jpg?s=612x612&w=0&k=20&c=px-vGXGmt3dSSa854-GroCNhPByaaWr5w_kJWrjd7Es=');">
            <!--<div class="mask d-flex align-items-center gradient-custom-3">-->
            <div class="container">
                <div class="row d-flex justify-content-center align-items-center h-100">
                    <div class="col-12 col-md-9 col-lg-7 col-xl-6 pt-5 pb-5">
                        <div class="card" style="border-radius: 15px;">
                            <div class="card-body p-5">
                                <h2 class="text-uppercase text-center mb-2 default-cursor">Forgot password
                                </h2>


                                <c:if test="${error!=null }">
                                    <div class="alert alert-danger" role="alert">${error}</div>
                                </c:if>
                                <c:if test="${mess!=null}">
                                    <div class="alert alert-success" role="alert">
                                        ${mess}
                                    </div>
                                </c:if>
                                    
                                <form action="ForgotPassword" method="POST" id="register-form">
                                    <!-- Email -->
                                    <div class="form-outline mb-5">
                                        <label class="form-label" for="register-mail-input">Your Email <span
                                                style="color: red; font-weight: bold">*</span></label>
                                        <input id="register-mail-input" type="text"
                                               class="form-control form-control-lg" required
                                               placeholder="example@gmail.com"
                                               name="email" value="${requestScope.email}"/>
                                    </div>
                                    <div id="register-mail-input-error" class="form-outline mb-2 fst-italic"
                                         style="margin-top: -35px; color: red; font-size: 14px;">
                                    </div>
                                    <!-- Registion Btn -->
                                    <div class="d-flex justify-content-center">
                                        <button type="submit"
                                                class="btn btn-success btn-block btn-lg gradient-custom-4 text-body border-0">
                                            Give me password</button>
                                    </div>
                                    <p class="text-center text-muted mt-4 mb-0">
                                        Rememberd your password? 
                                        <a href="login.jsp" class="fw-bold text-body"><u>Login here</u></a></p>
                                </form>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <!--</div>-->
        </section>
        <!-- Footer -->
        <%@include file="components/footerComponent.jsp" %>
        <!-- Bootstrap core JS -->
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
        <!-- Core theme JS -->
        <script src="js/scripts.js"></script>
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
        <script src="js/register.js"></script>
    </body>

</html>


