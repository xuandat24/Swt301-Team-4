<%-- 
    Document   : orderAgain
    Created on : Feb 22, 2024, 8:46:04 AM
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
        <title>Checkout</title>
        <!-- Favicon -->
        <link rel="icon" type="image/x-icon" href="./assets/favicon.png"/>
        <!-- Bootstrap icons-->
        <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.5.0/font/bootstrap-icons.css" rel="stylesheet" />
        <!-- Core theme CSS (includes Bootstrap)-->
        <link href="css/styles.css" rel="stylesheet" />
        <link href="css/my-styles.css" rel="stylesheet">
<link rel="stylesheet" type="text/css" href="fonts/iconic/css/material-design-iconic-font.min.css">
<link rel="stylesheet" type="text/css" href="vendor/animate/animate.css">
<link rel="stylesheet" type="text/css" href="vendor/css-hamburgers/hamburgers.min.css">
<link rel="stylesheet" type="text/css" href="vendor/animsition/css/animsition.min.css">
<link rel="stylesheet" type="text/css" href="vendor/slick/slick.css">
<link rel="stylesheet" type="text/css" href="css/util.css">
        <link rel="stylesheet" type="text/css" href="css/main.css">
    </head>

    <body class="animsition">
        <!-- Home Menu -->
        <%@include file="components/headerComponent.jsp" %>
        <!-- Sub-nav checkout page -->
        <div id="search-nav" class="d-flex align-items-center">
            <div class="container text-center">
                <span class="body">
                    <a class="home-page text-white text-decoration-none" href="HomeController">Home page</a>
                    <span class="open-icon txt-m-bold text-white"><i class="bi bi-caret-right-fill"></i></span>
                    <span class="txt-m-bold txt-orange default-cursor text-warning">Order Again</span>
                </span>
            </div>
        </div>
        <!-- Checkout Session -->
        <section class="mb-5" style="min-height: 250px">
            <div class="container">
                <h1 class="pb-4 default-cursor text-black" style="font-size: 50px;">Checkout</h1>
                <div class="row">
                    <div class="col-lg-8 p-0 pb-3 pe-0 pe-lg-2 pb-lg-0">
                        <div class="rounded shadow p-3 bg-body">
                            <h3 class="default-cursor text-black mb-4">List Products</h3>
                            <table class="table text-center default-cursor">
                                <thead>
                                    <tr>
                                        <th scope="col">#</th>
                                        <th scope="col">Image</th>
                                        <th scope="col">Name</th>
                                        <th scope="col">Price</th>
                                        <th scope="col">Quantity</th>
                                        <th scope="col">Total Price</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <c:set var="total" scope="request" value="${0}"/>
                                    <c:forEach items="${subCarts}" var="C">
                                    <tr>
                                    <td>
                                        <c:url var="linkPlant" value="PlantDetailController">
                                            <c:param name="pid" value="${C.value.plant.id}"></c:param>
                                        </c:url>
                                        <a href="${linkPlant}" class="text-decoration-none">${C.value.plant.id}</a>
                                    </td><input type="hidden" name="productId" value="${C.value.plant.id}">
                            
                            <div class="mb-3">
                                <label for="note" class="form-label">Note</label>
                                <textarea type="text" class="form-control" id="note" name="note"></textarea>
                            </div>
                            <button type="submit" class="btn btn-primary w-100">Check out</button>
                        </form>
                    </div>
                </div>
            </div>
        </section>
        <!-- Footer -->
        <%@include file="components/footerComponent.jsp" %>
        <!-- Bootstrap core JS -->
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
        <!-- Core theme JS -->
        <script src="js/srollbar/perfect-scrollbar.min.js"></script>
        <script>
                                                    $('.js-pscroll').each(function () {
                                                        $(this).css('position', 'relative');
                                                        $(this).css('overflow', 'hidden');
                                                        var ps = new PerfectScrollbar(this, {
                                                            wheelSpeed: 1,
                                                            scrollingThreshold: 1000,
                                                            wheelPropagation: false,
                                                        });

                                                        $(window).on('resize', function () {
                                                            ps.update();
                                                        })
                                                    });
        </script>
        <!-- Main -->
        <script src="js/main.js"></script>
    </body>

</html>

