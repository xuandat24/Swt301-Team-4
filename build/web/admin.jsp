<%-- 
    Document   : admin
    Created on : Mar 5, 2024, 6:58:11 PM
    Author     : nofom
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <%@include file="components/adminHeadComponent.jsp" %>
        <title>Admin - Dashboard</title>
        <style>

            .widget-small {
                background-color: #f2f2f2;
                border-radius: 5px;
                padding: 15px;
                display: flex;
                align-items: center;
                justify-content: flex-start;
                margin: 0 1px 30px 1px;
            }

            .widget-small.primary {
                background-color: #007bff;
                color: #fff;
            }

            .widget-small.info {
                background-color: #17a2b8;
                color: #fff;
            }

            .widget-small.warning {
                background-color: #ffc107;
                color: #fff;
            }

            .widget-small.danger {
                background-color: #dc3545;
                color: #fff;
            }

            .widget-small i {
                font-size: 5em;
                padding: 0 30px;
            }

            .info {
                text-align: left;
            }

            .info h4 {
                margin-top: 0;
                font-size: 18px;
            }

            .info p b {
                margin-bottom: 5px;
                font-size: 30px;
            }
        </style>
        <script src="https://cdn.jsdelivr.net/npm/chart.js@2.9.4/dist/Chart.min.js"></script>
    </head>
    <body class="sb-nav-fixed">
        <!-- Admin navbar -->
        <%@include file="components/adminNavBarComponent.jsp" %>

        <div id="layoutSidenav">
            <!-- Admin Slidenav -->
            <%@include file="components/adminSlideNavComponent.jsp" %>
            <div id="layoutSidenav_content">
                <main>
                    <div class="container-fluid px-4">
                        <h1 class="mt-4">Dashboard</h1>
                        <ol class="breadcrumb mb-4">
                            <li class="breadcrumb-item active">Overview</li>
                        </ol>

                        <!--COUNT-->
                        <div class="row">
                            <!-- col-6 -->
                            <div class="col-md-4">
                                <a href="AdminManageAccountController" style="text-decoration: none">

                                    <div class="widget-small primary">
                                        <i class="bi bi-person"></i>
                                        <div class="info">
                                            <h4>Accounts</h4>
                                            <p><b>${requestScope.listAccounts.size()} accounts</b></p>
                                            <p class="info-tong">Total number of accounts</p>
                                        </div>
                                    </div>

                                </a>
                            </div>

                            <div class="col-md-4">
                                <a href="AdminManagePlantController" style="text-decoration: none"><div class="widget-small info">
                                        <i class="bi bi-tree-fill"></i>
                                        <div class="info">
                                            <h4>Products</h4>
                                            <p><b>${requestScope.listPlants.size()} products</b></p>
                                            <p class="info-tong">Total number of products</p>
                                        </div>
                                    </div></a>
                            </div>

                            <div class="col-md-4">
                                <a href="AdminManageOrderController" style="text-decoration: none">

                                    <div class="widget-small warning">
                                        <i class="bi bi-cart3"></i> 
                                        <div class="info">
                                            <h4>Orders</h4>
                                            <p><b>${requestScope.listOrders.size()} orders</b></p>
                                            <p class="info-tong">Total number of orders</p>
                                        </div>
                                    </div>

                                </a>
                            </div>
                        </div>       


                        <div class="row">
                            <div class="col-xl-6">
                                <div class="card mb-4">
                                    <div class="card-header">
                                        <i class="fas fa-chart-area me-1"></i>
                                        Revenue by days of week
                                    </div>
                                    <div class="card-body"><canvas id="myAreaChart" width="100%" height="40"></canvas></div>
                                </div>
                            </div>

                            <script>
                                var a = document.getElementById("myAreaChart");
                                var myLineChart = new Chart(a, {
                                    type: 'pie',
                                    data: {
                                        labels: ["Sunday", "Saturday", "Friday", "Thursday", "Wednesday", "Tuesday", "Monday"],
                                        datasets: [{
                                                data: [${wd1}, ${wd7}, ${wd6}, ${wd5}, ${wd4}, ${wd3}, ${wd2}],
                                                backgroundColor: ["#F7464A", "#46BFBD", "#FDB45C", "#949FB1", "#4D5360", "#1874CD", "#CDB5CD"]
                                            }]
                                    }
                                });
                            </script>

                            <div class="col-xl-6">
                                <div class="card mb-4">
                                    <div class="card-header">
                                        <i class="fas fa-chart-bar me-1"></i>
                                        Revenue by month 
                                    </div>
                                    <div class="card-body"><canvas id="myBarChart" width="100%" height="40"></canvas></div>
                                </div>
                            </div>
                        </div>
                        <script>

                            var b = document.getElementById("myBarChart");
                            var myLineChart = new Chart(b, {
                                type: 'bar',
                                data: {
                                    labels: ["December", "November", "October", "September", "August", "July", "June", "May", "April", "March", "February", "January"],
                                    datasets: [{
                                            label: "Revenue",
                                            backgroundColor: "rgba(2,117,216,1)",
                                            borderColor: "rgba(2,117,216,1)",
                                            data: [${month12}, ${month11}, ${month10}, ${month9}, ${month8}, ${month7}, ${month6}, ${month5}, ${month4}, ${month3}, ${month2}, ${month1}],
                                        }]
                                }
                            }
                            );
                        </script>


                        <!-- Account Table -->
                        <div class="card mb-4">
                            <div class="card-header">
                                <i class="bi bi-table"></i>
                                Accounts table
                            </div>
                            <div class="card-body">
                                <table id="accountsTable">
                                    <thead>
                                        <tr>
                                            <th>Id</th>
                                            <th>Email</th>
                                            <th>Name</th>
                                            <!--                                            <th>Password</th>-->
                                            <th>Phone</th>
                                            <th>Status</th>
                                            <th>Role</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                        <c:forEach items="${requestScope.listAccounts}" var="o">
                                            <tr>
                                                <td>${o.accId}</td>
                                                <td>${o.email}</td>
                                                <td>${o.fullName}</td>
                                                <!--<td>${o.password}</td>-->
                                                <td>${o.phone}</td>
                                                <c:choose>
                                                    <c:when test="${o.status == 1}">
                                                        <td style="color: blue;">Active</td>
                                                    </c:when>
                                                    <c:otherwise>
                                                        <td style="color: red;">inActive</td>
                                                    </c:otherwise>
                                                </c:choose>
                                                <c:choose>
                                                    <c:when test="${o.role == 1}">
                                                        <td style="color: purple;">Admin</td>
                                                    </c:when>
                                                    <c:otherwise>
                                                        <td>User</td>
                                                    </c:otherwise>
                                                </c:choose>
                                            </tr>
                                        </c:forEach>
                                    </tbody>
                                </table>
                            </div>
                        </div>
                        <!-- Orders Table -->
                        <div class="card mb-4">
                            <div class="card-header">
                                <i class="bi bi-table"></i>
                                Orders table
                            </div>
                            <div class="card-body">
                                <table id="ordersTable">
                                    <thead>
                                        <tr>
                                            <th>Id</th>
                                            <th>Order Date</th>
                                            <th>Ship Date</th>
                                            <th>Note</th>
                                            <th>Total Price</th>
                                            <th>Acc Id</th>
                                            <th>Status</th>
                                            <th>Shipping Id</th><th>Detail</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                        <c:forEach items="${requestScope.listOrders}" var="LO">
                                            <tr>
                                                <td>${LO.orderId}</td>
                                                <td>${LO.orderDate}</td>
                                                <td>
                                                    <c:choose>
                                                        <c:when test="${not empty LO.shipDate}">
                                                            ${LO.shipDate}
                                                        </c:when>
                                                        <c:otherwise>
                                                            <span class="fst-italic">Null</span>
                                                        </c:otherwise>
                                                    </c:choose>
                                                </td>
                                                <td>${LO.note}</td>
                                                <td>$${LO.totalPrice}</td>
                                                <td>${LO.accId}</td>
                                                <td>
                                                    <c:choose>
                                                        <c:when test="${LO.status == 1}">
                                                            <span class="text-warning">Processing</span>
                                                        </c:when>
                                                        <c:when test="${LO.status == 2}">
                                                            <span class="text-primary">Completed</span>
                                                        </c:when>
                                                        <c:when test="${LO.status == 3}">
                                                            <span class="text-danger">Canceled</span>
                                                        </c:when>
                                                    </c:choose>
                                                </td>
                                                <td>${LO.shippingId}</td>
                                            </tr>
                                        </c:forEach>
                                    </tbody>
                                </table>
                            </div>
                        </div>
                        <!-- Plant table -->
                        <div class="card mb-4">
                            <div class="card-header">
                                <i class="bi bi-table"></i>
                                Plants table
                            </div>
                            <div class="card-body">
                                <table id="plantsTable">
                                    <thead>
                                        <tr>
                                            <th>Id</th>
                                            <th>Name</th>
                                            <th style="width: 100px;">Image</th>
                                            <th>Price</th>
                                            <th>Description</th>
                                            <th>Status</th>
                                            <th>Category</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                        <c:forEach items="${requestScope.listPlants}" var="o">
                                            <tr>
                                                <td>${o.id}</td>
                                                <td>${o.name}</td>
                                                <td style="width: 100px;"><img src="${o.imgPath}" style="width: 50%;"></td>
                                                <td>$${o.price}</td>
                                                <td>${o.description}</td>
                                                <c:choose>
                                                    <c:when test="${o.status == 1}">
                                                        <td style="color: blue;">Available</td>
                                                    </c:when>
                                                    <c:otherwise>
                                                        <td style="color: red;">Unavailable</td>
                                                    </c:otherwise>
                                                </c:choose>
                                                <td>
                                                    ${sessionScope.listCategories.get(o.categoryId)}
                                                </td>
                                            </tr>
                                        </c:forEach>
                                    </tbody>
                                </table>
                            </div>
                        </div>
                    </div>
                </main>
                <!-- Footer -->
                <jsp:include page="components/adminFooter.jsp"></jsp:include>
            </div>
        </div>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" crossorigin="anonymous"></script>
        <script src="js/scripts.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.8.0/Chart.min.js" crossorigin="anonymous"></script>
        <!--                <script src="demo/chart-area-demo.js"></script>
                        <script src="demo/chart-bar-demo.js"></script>-->
        <script src="https://cdn.jsdelivr.net/npm/simple-datatables@latest" crossorigin="anonymous"></script>
        <script src="js/datatables-simple-demo.js"></script>
    </body>
</html>
