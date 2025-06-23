<%-- 
    Document   : managePlant
    Created on : Mar 8, 2024, 9:09:21 PM
    Author     : nofom
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <%@include file="components/adminHeadComponent.jsp" %>
        <title>Manage Plant</title>
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
                        <h1 class="mt-4">Manage Plants</h1>
                        <ol class="breadcrumb mb-4">
                            <li class="breadcrumb-item active">All current plants in system</li>
                        </ol>
                        <c:choose>
                            <c:when test="${not empty requestScope.MSG_SUCCESS}">
                                <div class="alert alert-success fs-3" role="alert">
                                    ${requestScope.MSG_SUCCESS}
                                </div>
                            </c:when>
                            <c:when test="${not empty requestScope.MSG_ERROR}">
                                <div class="alert alert-danger fs-3" role="alert">
                                    ${requestScope.MSG_ERROR}
                                </div>
                            </c:when>
                        </c:choose>
                        <!-- Plant table -->
                        <div class="card mb-4">
                            <div class="card-header fw-bold">
                                <i class="bi bi-table"></i>
                                All Plants Table
                                <!-- Block btn -->
                                <span class="float-end">
                                    <!-- Button trigger modal -->
                                    <button type="button" class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#blockBtnXYZC">
                                        <i class="bi bi-plus-square"></i> Add new plant
                                    </button>
                                    <!-- Modal -->
                                    <div class="modal fade" id="blockBtnXYZC" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
                                        <div class="modal-dialog modal-dialog-centered modal-lg">
                                            <div class="modal-content">
                                                <div class="modal-header">
                                                    <h5 class="modal-title" id="exampleModalLabel">Product Information</h5>
                                                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                                                </div>
                                                <form action="UpdatePlantController" method="POST">
                                                    <div class="modal-body">
                                                        <input type="hidden" name="pid"/>
                                                        <div class="form-outline mb-3">
                                                            <label class="form-label" for="name3Example">Name <span style="color: red; font-weight: bold">*</span></label>
                                                            <input type="text" id="name3Example" class="form-control form-control-lg"
                                                                   required name="name"/>
                                                        </div>
                                                        <div class="form-outline mb-3">
                                                            <label class="form-label" for="img3Example">Image Path <span style="color: red; font-weight: bold">*</span></label>
                                                            <input type="text" id="img3Example" class="form-control form-control-lg"
                                                                   required name="imgPath"/>
                                                        </div>
                                                        <div class="form-outline mb-3">
                                                            <label class="form-label" for="price3Example">Price <span style="color: red; font-weight: bold">*</span></label>
                                                            <input type="number" min="0" max="999" pattern="^[1-9]\d*$" id="price3Example" class="form-control form-control-lg"
                                                                   required name="price"/>
                                                        </div>
                                                        <div class="form-outline mb-3">
                                                            <label class="form-label" for="descr3Example">Description <span style="color: red; font-weight: bold">*</span></label>
                                                            <textarea type="text" id="descr3Example" class="form-control form-control-lg"
                                                                      required name="description"></textarea>
                                                        </div>
                                                        <div class="form-outline mb-3">
                                                            <label class="form-label" for="status3Example">Status <span style="color: red; font-weight: bold">*</span></label>
                                                            <select name="status" class="form-select form-select-lg" id="status3Example">
                                                                <option value="1">Available</option>
                                                                <option value="0">Unavailable</option>
                                                            </select>
                                                        </div>
                                                        <div class="form-outline mb-3">
                                                            <label class="form-label" for="cate3Example">Category <span style="color: red; font-weight: bold">*</span></label>
                                                            <select name="cateId" class="form-select form-select-lg" id="cate3Example">
                                                                <c:forEach items="${sessionScope.listCategories}" var="LC">
                                                                    <option value="${LC.key}">${LC.value}</option>
                                                                </c:forEach>
                                                            </select>
                                                        </div>
                                                    </div>
                                                    <div class="modal-footer">
                                                        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Cancel</button>
                                                        <button id="update-profile-btn" type="submit" class="btn btn-danger" name="action" value="createPlant">Create</button>
                                                    </div>
                                                </form>
                                            </div>
                                        </div>
                                    </div>
                                </span>
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
                                            <th>Action</th>
                                            <th>Action</th>
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
                                                <td>
                                                    <!-- Block btn -->
                                                    <span>
                                                        <!-- Button trigger modal -->
                                                        <button type="button" class="btn btn-outline-success w-100" data-bs-toggle="modal" data-bs-target="#blockBtn${o.id}">
                                                            Update
                                                        </button>
                                                        <!-- Modal -->
                                                        <div class="modal fade" id="blockBtn${o.id}" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
                                                            <div class="modal-dialog modal-dialog-centered">
                                                                <div class="modal-content">
                                                                    <div class="modal-header">
                                                                        <h5 class="modal-title" id="exampleModalLabel">Product Information</h5>
                                                                        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                                                                    </div>
                                                                    <form action="UpdatePlantController" method="POST">
                                                                        <div class="modal-body">
                                                                            <input type="hidden" name="pid" value="${o.id}"/>
                                                                            <div class="form-outline mb-3">
                                                                                <label class="form-label" for="name3Example">Name <span style="color: red; font-weight: bold">*</span></label>
                                                                                <input type="text" id="name3Example" class="form-control form-control-lg"
                                                                                       required name="name" value="${o.name}"/>
                                                                            </div>
                                                                            <div class="form-outline mb-3">
                                                                                <label class="form-label" for="img3Example">Image Path <span style="color: red; font-weight: bold">*</span></label>
                                                                                <input type="text" id="img3Example" class="form-control form-control-lg"
                                                                                       required name="imgPath" value="${o.imgPath}"/>
                                                                            </div>
                                                                            <div class="form-outline mb-3">
                                                                                <label class="form-label" for="price3Example">Price <span style="color: red; font-weight: bold">*</span></label>
                                                                                <input type="number" min="0" max="999" pattern="^[1-9]\d*$" id="price3Example" class="form-control form-control-lg"
                                                                                       required name="price" value="${o.price}"/>
                                                                            </div>
                                                                            <div class="form-outline mb-3">
                                                                                <label class="form-label" for="descr3Example">Description <span style="color: red; font-weight: bold">*</span></label>
                                                                                <textarea type="text" id="descr3Example" class="form-control form-control-lg"
                                                                                          required name="description">${o.description}</textarea>
                                                                            </div>
                                                                            <div class="form-outline mb-3">
                                                                                <label class="form-label" for="status3Example">Status <span style="color: red; font-weight: bold">*</span></label>
                                                                                <select name="status" class="form-select form-select-lg" id="status3Example">
                                                                                    <option ${o.status eq 1 ? "selected" : ""} value="1">Available</option>
                                                                                    <option ${o.status eq 0 ? "selected" : ""} value="0">Unavailable</option>
                                                                                </select>
                                                                            </div>
                                                                            <div class="form-outline mb-3">
                                                                                <label class="form-label" for="cate3Example">Category <span style="color: red; font-weight: bold">*</span></label>
                                                                                <select name="cateId" class="form-select form-select-lg" id="cate3Example">
                                                                                    <c:forEach items="${sessionScope.listCategories}" var="LC">
                                                                                        <option ${o.categoryId eq LC.key ? "selected" : ""} value="${LC.key}">${LC.value}</option>
                                                                                    </c:forEach>
                                                                                </select>
                                                                            </div>
                                                                        </div>
                                                                        <div class="modal-footer">
                                                                            <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
                                                                            <button id="update-profile-btn" type="submit" class="btn btn-danger" name="action" value="updatePlant">Update</button>
                                                                        </div>
                                                                    </form>
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </span>
                                                </td>
                                                <td>
                                                    <button type="button" class="btn btn-outline-danger w-100" data-bs-toggle="modal" data-bs-target="#deleBtn${o.id}">
                                                        Delete
                                                    </button>
                                                    <div class="modal fade" id="deleBtn${o.id}" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
                                                        <div class="modal-dialog modal-dialog-centered">
                                                            <div class="modal-content">
                                                                <div class="modal-header">
                                                                    <h5 class="modal-title" id="exampleModalLabel">Delete product</h5>
                                                                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                                                                </div>
                                                                <form action="DeletePlant">

                                                                    <div class="modal-body">
                                                                        Do you want to delete this plant?
                                                                        <input type="hidden" name="pid" value="${o.id}"/>
                                                                    </div>
                                                                    <div class="modal-footer">  
                                                                        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Cancel</button>
                                                                        <button type="submit" class="btn btn-danger">Delete</button>
                                                                    </div>
                                                                </form>
                                                            </div>
                                                        </div>
                                                    </div>
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
        <script src="https://cdn.jsdelivr.net/npm/simple-datatables@latest" crossorigin="anonymous"></script>
        <script src="js/datatables-simple-demo.js"></script>
        <script src="js/my-scripts.js"></script>
    </body>
</html>