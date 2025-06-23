<%-- 
    Document   : manageCategory
    Created on : Mar 8, 2024, 10:47:31 PM
    Author     : nofom
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <%@include file="components/adminHeadComponent.jsp" %>
        <title>Manage Category</title>
        <!--        <script type="text/javascript">
                    function doDelete(id) {
                        if (confirm("Are you sure to delete this category?")) {
                            window.location = "DeleteCategory?id=" + id;
                        }
                    }
                </script>-->
    </head>
    <body class="sb-nav-fixed">
        <!-- Admin navbar -->
        <%@include file="components/adminNavBarComponent.jsp" %>
        <div id="layoutSidenav">
            <!-- Admin Slidenav -->
            <%@include file="components/adminSlideNavComponent.jsp" %>
            <div id="layoutSidenav_content" class="row">
                <main>
                    <div class="container-fluid px-4">
                        <h1 class="mt-4">Manage Categories</h1>
                        <ol class="breadcrumb mb-4">
                            <li class="breadcrumb-item active">All current Categories in system</li>
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
                        <!-- Category table -->
                        <div class="card mb-4 col-12 col-md-8">
                            <div class="card-header fw-bold">
                                <i class="bi bi-table"></i>
                                All Categories Table
                                <!-- Block btn -->
                                <span class="float-end">
                                    <!-- Button trigger modal -->
                                    <button type="button" class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#blockBtnXYZC">
                                        <i class="bi bi-plus-square"></i> Add new category
                                    </button>
                                    <!-- Modal -->
                                    <div class="modal fade" id="blockBtnXYZC" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
                                        <div class="modal-dialog modal-dialog-centered">
                                            <div class="modal-content">
                                                <div class="modal-header">
                                                    <h5 class="modal-title" id="exampleModalLabel">New Category</h5>
                                                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                                                </div>
                                                <form action="UpdateCategoryController" method="POST">
                                                    <div class="modal-body">
                                                        <div class="form-outline mb-3">
                                                            <label class="form-label" for="name3Example">Name <span style="color: red; font-weight: bold">*</span></label>
                                                            <input type="text" id="name3Example" class="form-control form-control-lg"
                                                                   required name="cateName"/>
                                                        </div>
                                                    </div>
                                                    <div class="modal-footer">
                                                        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Cancel</button>
                                                        <button id="update-profile-btn" type="submit" class="btn btn-danger" name="action" value="createCategory">Create</button>
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
                                            <th>Action</th>
                                            <th>Action</th>
                                        </tr>
                                    </thead>

                                    <tbody>
                                        <c:forEach items="${sessionScope.listCategories}" var="o">
                                            <tr>
                                                <td>${o.key}</td>
                                                <td>${o.value}</td>
                                                <td>
                                                    <!-- Block btn -->
                                                    <span>
                                                        <!-- Button trigger modal -->
                                                        <button type="button" class="btn btn-outline-success w-100" data-bs-toggle="modal" data-bs-target="#blockBtn${o.key}">
                                                            Update
                                                        </button>
                                                        <!-- Modal -->
                                                        <div class="modal fade" id="blockBtn${o.key}" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
                                                            <div class="modal-dialog modal-dialog-centered">
                                                                <div class="modal-content">
                                                                    <div class="modal-header">
                                                                        <h5 class="modal-title" id="exampleModalLabel">Category Information</h5>
                                                                        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                                                                    </div>
                                                                    <form action="UpdateCategoryController" method="POST">
                                                                        <div class="modal-body">
                                                                            <div class="form-outline mb-3">
                                                                                <label class="form-label" for="id3Example">Id</label>
                                                                                <input type="text" id="id3Example" class="form-control form-control-lg" name="cateId" value="${o.key}" readonly/>
                                                                            </div>
                                                                            <div class="form-outline mb-3">
                                                                                <label class="form-label" for="name3Example">Name <span style="color: red; font-weight: bold">*</span></label>
                                                                                <input type="text" id="name3Example" class="form-control form-control-lg"
                                                                                       required name="cateName" value="${o.value}"/>
                                                                            </div>
                                                                        </div>
                                                                        <div class="modal-footer">
                                                                            <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
                                                                            <button id="update-profile-btn" type="submit" class="btn btn-danger" name="action" value="updateCategory">Update</button>
                                                                        </div>
                                                                    </form>
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </span>                      
                                                </td>
                                                <td>
                                                    <button type="button" class="btn btn-outline-danger w-100" data-bs-toggle="modal" data-bs-target="#deleteBtn${o.key}">
                                                        Delete
                                                    </button>
                                                    <div class="modal fade" id="deleteBtn${o.key}" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
                                                        <div class="modal-dialog modal-dialog-centered">
                                                            <div class="modal-content">
                                                                <div class="modal-header">
                                                                    <h5 class="modal-title" id="exampleModalLabel">Delete product</h5>
                                                                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                                                                </div>
                                                                <form action="DeleteCategory">

                                                                    <div class="modal-body">
                                                                        Do you want to delete this category?
                                                                        <input type="hidden" name="id" value="${o.key}"/>
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
    </body>
</html>
