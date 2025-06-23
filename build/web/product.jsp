<%-- 
    Document   : product
    Created on : Mar 4, 2024, 6:03:27 PM
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
        <title>Plant</title>
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
        <!-- Toast MSG -->
        <div id="toast"></div>
        <!-- Sub-nav product page -->
        <div id="search-nav" class="d-flex align-items-center">
            <div class="container text-center">
                <span class="body">
                    <a class="home-page text-white text-decoration-none" href="HomeController">Home page</a>
                    <span class="open-icon txt-m-bold text-white"><i class="bi bi-caret-right-fill"></i></span>
                    <span class="txt-m-bold txt-orange default-cursor text-warning">All products</span>
                </span>
            </div>
        </div>
        <!-- Product List -->
        <div class="container mb-5">
            <div class="row">


                <!--------------------------------->
                <div class="col-md-3 search">
                    <h3 class="mb-4 default-cursor text-black">Categories</h3>
                    <div class="list-group">
                        <a type="button" class="list-group-item list-group-item-action active"  id="${-1}" onclick="setActiveCategory('-1')">All plants</a>
                        <c:forEach items="${sessionScope.listCategories}" var="L">
                            <a type="button" class="list-group-item list-group-item-action" id="${L.key}" onclick="setActiveCategory('${L.key}')">${L.value}</a>
                        </c:forEach>
                    </div>
                    <!--------------------------------->
                    <h3 class="my-4 default-cursor text-black">Search by name</h3>
                    <div class="md-outline mb-4">
                        <input oninput="setTXT(this)" id="txtSearch" value="${txtSearch}" name="txt" type="text" class="form-control" placeholder="Input name...">
                    </div>
                    <!--------------------------------->                   
                    <h3 class="my-3 default-cursor text-black">Search by price</h3>
                    <div class="price-input">
                        <div class="field">
                            <span>Min</span>
                            <input type="number" class="input-min" value="0">
                        </div>
                        <div class="separator">-</div>
                        <div class="field">
                            <span>Max</span>
                            <input type="number" class="input-max" value="200">
                        </div>
                    </div>
                    <div class="slider">
                        <div class="progress"></div>
                    </div>
                    <div class="range-input">
                        <input id="priceMin" onchange="searchAjax()" type="range" class="range-min" min="0" max="200" value="0" step="5">
                        <input id="priceMax" onchange="searchAjax()" type="range" class="range-max" min="0" max="200" value="200" step="5">
                    </div>
                </div>



                <div class="col-md-9 default-cursor">
                    <div class="d-flex align-items-center justify-content-center section-title mb-4 pt-4 pt-md-0 text-black" style="font-size: 35px !important;">
                        <hr class="d-inline-block me-3" width="15%" />
                        List Products
                        <hr class="d-inline-block ms-3" width="15%" />
                    </div>
                    <c:choose>
                        <c:when test="${empty requestScope.NO_PRODUCT}">
                            <!-- Products List -->
                            <div class="row gx-4 gx-lg-5 row-cols-2 row-cols-lg-3 justify-content-center" id="content">
                                <c:forEach items="${requestScope.listPlants}" var="LP">
                                    <!-- Product -->
                                    <div class="col mb-5">
                                        <div class="card h-100">
                                            <!-- Sale badge-->
                                            <div class="position-absolute bg-black text-white default-cursor"
                                                 style="padding: 5px 15px; left: 15px; top: 15px;">
                                                ${LP.status == 1 ? "Available" : "Sold out"}
                                            </div>
                                            <!-- Product image-->  
                                            <c:url var="linkImg" value="PlantDetailController">
                                                <c:param name="pid" value="${LP.id}"></c:param>
                                            </c:url>
                                            <a href="${linkImg}" class="img-h-350"><img src="${LP.imgPath}" class="img-h-350" alt="Plant IMG" class="img-h-350" class="img-fluid" /></a>
                                            <!-- Product details-->
                                            <div class="card-body p-2">
                                                <div class="text-center product-info">
                                                    <div class="category ms-3 mt-3 text-start">
                                                        ${sessionScope.listCategories.get(LP.categoryId)}
                                                    </div>
                                                    <!-- Product name-->
                                                    <div class="name">
                                                        <c:url var="linkName" value="PlantDetailController">
                                                            <c:param name="pid" value="${LP.id}"></c:param>
                                                        </c:url>
                                                        <a href="${linkName}" class="text-decoration-none text-black">
                                                            ${LP.name}
                                                        </a>
                                                    </div>
                                                    <!-- Product reviews-->
                                                    <div class="d-flex justify-content-center small text-warning mb-2">
                                                        <div class="bi-star-fill"></div>
                                                        <div class="bi-star-fill"></div>
                                                        <div class="bi-star-fill"></div>
                                                        <div class="bi-star-fill"></div>
                                                        <div class="bi-star-fill"></div>
                                                    </div>
                                                    <!-- Product price-->
                                                    <div class="price text-center fs-4 fw-bold default-cursor text-black">
                                                        ${LP.price}$
                                                    </div>
                                                </div>
                                            </div>
                                            <!-- Product actions-->
                                            <div class="card-footer p-4 pt-0 border-top-0 bg-transparent">
                                                <div class="text-center">
                                                    <a onclick="addToCartAsync(${LP.id})" class="btn btn-outline-dark mt-auto w-50"><i
                                                            class="bi bi-cart-plus-fill"></i></a>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </c:forEach>
                            </div>
                            <!-- Pagging -->
                            <nav class="d-flex justify-content-center" aria-label="Page navigation">
                                <ul class="pagination">
                                    <c:url var="prepagelink" value="ViewAllController">
                                        <c:param name="pagenumber" value="${page - 1}"></c:param>
                                        <c:param name="category" value="${requestScope.category}"></c:param>
                                    </c:url>
                                    <li class="page-item ${page == 1 ? "disabled" : ""}"><a class="page-link" href="${prepagelink}">Previous</a></li>
                                        <c:forEach begin="1" end="${requestScope.totalPage}" var="i">
                                            <c:url var="curpagelink" value="ViewAllController">
                                                <c:param name="pagenumber" value="${i}"></c:param>
                                                <c:param name="category" value="${requestScope.category}"></c:param>
                                            </c:url>
                                        <li class="page-item ${i == page ? "active" : ""}"><a class="page-link" href="${curpagelink}">${i}</a></li>
                                        </c:forEach>
                                        <c:url var="nextpagelink" value="ViewAllController">
                                            <c:param name="pagenumber" value="${page + 1}"></c:param>
                                            <c:param name="category" value="${requestScope.category}"></c:param>
                                        </c:url>
                                    <li class="page-item ${page == totalPage ? "disabled" : ""}"><a class="page-link" href="${nextpagelink}">Next</a></li>
                                </ul>
                            </nav>
                        </c:when>
                        <c:otherwise>
                            <h3>${requestScope.NO_PRODUCT}</h3>
                        </c:otherwise>
                    </c:choose>

                </div>
            </div>
        </div>
        <!-- Subscribe News Letter -->
        <%@include file="components/subscribeNewsLetterComponent.jsp" %>
        <!-- Footer -->
        <%@include file="components/footerComponent.jsp" %>
        <!-- Bootstrap core JS -->
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
        <!-- Axios Async -->
        <script src="https://cdn.jsdelivr.net/npm/axios/dist/axios.min.js"></script>
        <script src="js/toast-alert.js"></script>
        <script src="js/add-to-cart-async.js"></script>
        <!-- Jquery -->
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
        <!-- Toast Alert script -->
        <script src="js/toast-alert.js"></script>
        <script src="js/subscribe-newsletter.js"></script>
        <!-- Home Slider JS -->
        <script src="vendor/slick/slick.min.js"></script>
        <script src="js/slick-custom.js"></script>
        <script src="vendor/animsition/js/animsition.min.js"></script>
        <script src="vendor/perfect-scrollbar/perfect-scrollbar.min.js"></script>
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

                                                        let activeCate = -1;
                                                        let txtSearch = "";
                                                        function setActiveCategory(categoryId) {

                                                            activeCate = categoryId;
                                                            // Xóa lớp "active" khỏi tất cả các phần tử có class là "list-group-item"
                                                            var categoryItems = document.getElementsByClassName("list-group-item");
                                                            for (var i = 0; i < categoryItems.length; i++) {
                                                                categoryItems[i].classList.remove("active");
                                                            }

                                                            // Thêm lớp "active" cho phần tử có id trùng với categoryId được truyền vào
                                                            var selectedCategory = document.getElementById(categoryId);
                                                            if (selectedCategory) {
                                                                selectedCategory.classList.add("active");
                                                            }
                                                            console.log(categoryId);
                                                            searchAjax();
                                                        }

                                                        function setTXT(txt) {
                                                            txtSearch = txt.value;
                                                            searchAjax();
                                                        }


                                                        function searchAjax() {
//                                                            console.log(activeCate);
//                                                            console.log(txtSearch);

                                                            var numMin = document.getElementById("priceMin").value;
                                                            var numMax = document.getElementById("priceMax").value;
//                                                            console.log(numMin);
//                                                            console.log(numMax);
                                                            $.ajax({
                                                                url: "/PlantShop/SearchAjax",
                                                                type: "get",
                                                                data: {
                                                                    txt: txtSearch,
                                                                    priceMin: numMin,
                                                                    priceMax: numMax,
                                                                    cid: activeCate
                                                                },
                                                                success: function (data) {
                                                                    document.getElementById("content").innerHTML = data;
                                                                }
                                                            });
                                                        }





                                                        const rangeInput = document.querySelectorAll(".range-input input"),
                                                                priceInput = document.querySelectorAll(".price-input input"),
                                                                range = document.querySelector(".slider .progress");
                                                        let priceGap = 5;
                                                        priceInput.forEach(input => {
                                                            input.addEventListener("input", e => {
                                                                let minPrice = parseInt(priceInput[0].value),
                                                                        maxPrice = parseInt(priceInput[1].value);

                                                                if ((maxPrice - minPrice >= priceGap) && maxPrice <= rangeInput[1].max) {
                                                                    if (e.target.className === "input-min") {
                                                                        rangeInput[0].value = minPrice;
                                                                        range.style.left = ((minPrice / rangeInput[0].max) * 100) + "%";
                                                                    } else {
                                                                        rangeInput[1].value = maxPrice;
                                                                        range.style.right = 100 - (maxPrice / rangeInput[1].max) * 100 + "%";
                                                                    }
                                                                }
                                                            });
                                                        });
                                                        rangeInput.forEach(input => {
                                                            input.addEventListener("input", e => {
                                                                let minVal = parseInt(rangeInput[0].value),
                                                                        maxVal = parseInt(rangeInput[1].value);
                                                                if ((maxVal - minVal) < priceGap) {
                                                                    if (e.target.className === "range-min") {
                                                                        rangeInput[0].value = maxVal - priceGap
                                                                    } else {
                                                                        rangeInput[1].value = minVal + priceGap;
                                                                    }
                                                                } else {
                                                                    priceInput[0].value = minVal;
                                                                    priceInput[1].value = maxVal;
                                                                    range.style.left = ((minVal / rangeInput[0].max) * 100) + "%";
                                                                    range.style.right = 100 - (maxVal / rangeInput[1].max) * 100 + "%";
                                                                }
                                                            });
                                                        });
        </script>
        <!-- Main -->
        <script src="js/main.js"></script>
    </body>

</html>