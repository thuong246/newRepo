<%-- 
    Document   : addproject
    Created on : Apr 12, 2024, 2:38:21 AM
    Author     : ADMIN
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page language="java" contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>TEKLABS</title>
        <!-- favicon -->
        <link rel="shortcut icon" href="../assets/images/favicon.ico.png">
        <!-- Bootstrap -->
        <link href="assets/css/bootstrap.min.css" rel="stylesheet" type="text/css" />
        <!-- simplebar -->
        <link href="assets/css/simplebar.css" rel="stylesheet" type="text/css" />
        <!-- Select2 -->
        <link href="assets/css/select2.min.css" rel="stylesheet" />
        <!-- Date picker -->
        <link rel="stylesheet" href="assets/css/flatpickr.min.css">
        <link href="assets/css/jquery.timepicker.min.css" rel="stylesheet" type="text/css" />
        <!-- Icons -->
        <link href="assets/css/materialdesignicons.min.css" rel="stylesheet" type="text/css" />
        <link href="assets/css/remixicon.css" rel="stylesheet" type="text/css" />
        <link href="https://unicons.iconscout.com/release/v3.0.6/css/line.css"  rel="stylesheet">
        <!-- Css -->
        <link href="assets/css/style.min.css" rel="stylesheet" type="text/css" id="theme-opt" />
        <script src="https://code.jquery.com/jquery-3.6.0.min.js" integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4=" crossorigin="anonymous"></script>
    </head>
    <body>
        <!-- Loader -->
        <div id="preloader">
            <div id="status">
                <div class="spinner">
                    <div class="double-bounce1"></div>
                    <div class="double-bounce2"></div>
                </div>
            </div>
        </div>
        <!-- Loader -->

        <div class="page-wrapper doctris-theme toggled">
            <nav id="sidebar" class="sidebar-wrapper">
                <!-- sidebar-content  -->
                <%@include file="sidebar.jsp" %>
            </nav>
            <!-- sidebar-wrapper  -->

            <!-- Start Page Content -->
            <main class="page-content bg-light">
                <%@include file="headersidebar.jsp" %>

                <div class="container-fluid">
                    <div class="layout-specing">
                        <div class="d-md-flex justify-content-between">
                            <h3 class="mb-0">Add Employee</h3>
                            <nav aria-label="breadcrumb" class="d-inline-block mt-4 mt-sm-0">
                                <ul class="breadcrumb bg-transparent rounded mb-0 p-0">
                                    <li class="breadcrumb-item"><a href="/ProjectManagement/employee">Employee List</a></li>
                                    <li class="breadcrumb-item"><a href="#">Add Employee</a></li>
                                </ul>
                            </nav>
                        </div>
                        <div class="modal-body p-3 pt-4">
                            <div class="modal-body p-3 pt-4">
                                <form action="addemployee" method="post" accept-charset="UTF-8">
                                    <div class="row">
                                        <input name="employee_id" type="hidden">
                                        <div class="col-md-6">
                                            <div class="mb-3">
                                                <label class="form-label">Employee code<span class="text-danger">*</span></label>
                                                <input name="ecode"  type="text" class="form-control" required>
                                            </div>
                                        </div><!--end col-->

                                        <div class="col-md-6">
                                            <div class="mb-3">
                                                <label class="form-label">Employee name</label>
                                                <input name="ename"  type="text" class="form-control" >
                                            </div>
                                        </div><!--end col-->
                                        <div class="col-lg-3">
                                            <div class="d-grid" style="margin-top: 10px">
                                                <button type="submit" class="btn btn-primary">Add</button>
                                            </div>

                                        </div><!--end col-->
                                        <div class="col-lg-3">
                                            <div class="d-grid" style="margin-top: 10px">
                                                <a href="/ProjectManagement/employee" class="btn btn-primary" >Back</a>
                                            </div>
                                        </div>
                                    </div>
                                  
                                </form><!--end form-->
                            </div>
                        </div>
                    </div>
                </div>
            </main>
        </div>
        <!-- javascript -->
        <script src="assets/js/jquery.min.js"></script>
        <script src="assets/js/bootstrap.bundle.min.js"></script>
        <!-- simplebar -->
        <script src="assets/js/simplebar.min.js"></script>
        <!-- Select2 -->
        <script src="assets/js/select2.min.js"></script>
        <script src="assets/js/select2.init.js"></script>
        <!-- Datepicker -->
        <script src="assets/js/flatpickr.min.js"></script>
        <script src="assets/js/flatpickr.init.js"></script>
        <!-- Datepicker -->
        <script src="assets/js/jquery.timepicker.min.js"></script> 
        <script src="assets/js/timepicker.init.js"></script> 
        <!-- Icons -->
        <script src="assets/js/feather.min.js"></script>
        <!-- Main Js -->
        <script src="assets/js/app.js"></script>

    </body>
</html>

