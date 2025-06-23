<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <title>Thống kê</title>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css">
        <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.3.1/css/all.css">
        <link rel="stylesheet" href="https://mdbootstrap.com/previews/ecommerce-demo/css/mdb-pro.min.css">
        <style>
            @media (min-width: 991.98px) {
                main {
                    padding-left: 240px;
                }
            }

            .sidebar {
                position: fixed;
                padding: 58px 0 0;
                box-shadow: 0 2px 5px 0 rgb(0 0 0 / 5%), 0 2px 10px 0 rgb(0 0 0 / 5%);
                width: 240px;
                z-index: 600;
            }
        </style>
    </head>
    <body >
        <header>
            <jsp:include page="leftadmin.jsp"></jsp:include>
            </header>
            <main>
                <div class="container pt-4">
                    <div class="card text-center">
                        <h3 class="card-header">Doanh thu theo tháng</h3>
                        <div class="card-body">
                            <canvas id="horizontalBar"></canvas>
                        </div>
                    </div>
                </div>
            </main>
            <script src="https://mdbootstrap.com/api/snippets/static/download/MDB5-Free_3.8.1/js/mdb.min.js"></script><script src="https://cdn.jsdelivr.net/npm/chart.js@2.9.4/dist/Chart.min.js"></script>

            <script>
                new Chart(document.getElementById("horizontalBar"), {
                    "type": "horizontalBar",
                    "data": {
                        "labels": ["December", "November", "October", "September", "August", "July", "June", "May", "April", "March", "February", "January"],
                        "datasets": [{
                                "label": "Doanh thu(đồng)",
                                "data": [${total12}, ${total11}, ${total10}, ${total9}, ${total8}, ${total7}, ${total6}, ${total5}, ${total4}, ${total3}, ${total2}, ${total1}],
                                "backgroundColor": ["rgba(255, 99, 132, 0.2)", "rgba(255, 159, 64, 0.2)",
                                    "rgba(255, 205, 86, 0.2)", "rgba(75, 192, 192, 0.2)", "rgba(54, 162, 235, 0.2)",
                                    "rgba(153, 102, 255, 0.2)", "rgba(201, 203, 207, 0.2)", "#99FF99", "#FFFF99", "#FFC1C1", "#FFB5C5", "#DDC488"
                                ],
                                "borderColor": ["rgb(255, 99, 132)", "rgb(255, 159, 64)", "rgb(255, 205, 86)",
                                    "rgb(75, 192, 192)", "rgb(54, 162, 235)", "rgb(153, 102, 255)", "rgb(201, 203, 207)", "	#66FF99", "#FFFF66", "#EEB4B4", "#EEA9B8", "#ECAB53"
                                ],
                                "borderWidth": 1
                            }]
                    }
                });
        </script>
    </body>
</html>