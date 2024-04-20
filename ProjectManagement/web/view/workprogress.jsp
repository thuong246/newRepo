<%-- 
    Document   : task
    Created on : Apr 4, 2024, 2:52:40 AM
    Author     : ADMIN
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Project Management</title>
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <meta name="description" content="Premium Bootstrap 4 Landing Page Template" />
        <meta name="keywords" content="Appointment, Booking, System, Dashboard, Health" />
        <meta name="author" content="Shreethemes" />
        <meta name="email" content="support@shreethemes.in" />
        <meta name="website" content="../../../index.html" />
        <meta name="Version" content="v1.2.0" />
        <!-- favicon -->
        <link rel="shortcut icon" href="../assets/images/favicon.ico.png">
        <!-- Bootstrap -->
        <link href="../assets/css/bootstrap.min.css" rel="stylesheet" type="text/css" />
        <!-- simplebar -->
        <link href="../assets/css/simplebar.css" rel="stylesheet" type="text/css" />
        <!-- Icons -->
        <link href="../assets/css/materialdesignicons.min.css" rel="stylesheet" type="text/css" />
        <link href="https://unicons.iconscout.com/release/v3.0.6/css/line.css"  rel="stylesheet">
        <!-- Css -->
        <link href="../assets/css/style.min.css" rel="stylesheet" type="text/css" id="theme-opt" />
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/admin-lte@3.1/dist/css/adminlte.min.css">
        <script src="https://cdn.jsdelivr.net/npm/admin-lte@3.1/dist/js/adminlte.min.js"></script>

    </head>
    <body>

        <div class="page-wrapper doctris-theme toggled">
            <!-- Start Page Content -->
            <main class="page-content bg-light">
                <div class="wrapper">
                    <aside class="main-sidebar ">
                        <%@include file="sidebar.jsp" %>
                    </aside>

                    <div class="layout-specing">
                        <div class="kanban">
                            <%@include file="headersidebar.jsp" %>
                            <section class="content-header">
                                <div class="container-fluid">
                                    <div class="row">
                                        <div class="col-sm-6">
                                            <h1>Board</h1>
                                        </div>
                                    </div>
                                </div>
                            </section>
                            <section class="content pb-3">
                                <div class="container-fluid h-100">
                                    <div class="row">
                                        <div class="col-md-3">
                                            <div class="card card-row card-secondary">
                                                <div class="card-header">
                                                    <h3 class="card-title">
                                                        Backlog
                                                    </h3>

                                                </div>
                                                <div class="card-body">
                                                    <div class="card card-info card-outline">
                                                        <div class="card-header">
                                                            <h5 class="card-title">Create Labels</h5>
                                                            <div class="card-tools">
                                                                <a href="#" class="btn btn-tool btn-link">#3</a>
                                                                <a href="#" class="btn btn-tool">
                                                                    <i class="fas fa-pen"></i>
                                                                </a>
                                                            </div>
                                                        </div>
                                                    </div>
                                                    <div class="card card-primary card-outline">
                                                        <div class="card-header">
                                                            <h5 class="card-title">Create Issue template</h5>
                                                            <div class="card-tools">
                                                                <a href="#" class="btn btn-tool btn-link">#4</a>
                                                                <a href="#" class="btn btn-tool">
                                                                    <i class="fas fa-pen"></i>
                                                                </a>
                                                            </div>
                                                        </div>
                                                    </div>

                                                </div>
                                            </div>
                                        </div>
                                        <div class="col-md-3">
                                            <div  class="card card-row card-primary">
                                                <div class="card-header">
                                                    <h3 class="card-title">
                                                        To Do
                                                    </h3>
                                                </div>
                                                <div class="card-body">
                                                    <div class="card card-primary card-outline">
                                                        <div class="card-header">
                                                            <h5 class="card-title">Create first milestone</h5>
                                                            <div class="card-tools">
                                                                <a href="#" class="btn btn-tool btn-link">#5</a>
                                                                <a href="#" class="btn btn-tool">
                                                                    <i class="fas fa-pen"></i>
                                                                </a>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="col-md-3">
                                            <div  class="card card-row card-default">
                                                <div class="card-header bg-info">
                                                    <h3 class="card-title">
                                                        In Progress
                                                    </h3>
                                                </div>
                                                <div class="card-body">
                                                    <div class="card card-light card-outline">
                                                        <div class="card-header">
                                                            <h5 class="card-title">Update Readme</h5>
                                                            <div class="card-tools">
                                                                <a href="#" class="btn btn-tool btn-link">#2</a>
                                                                <a href="#" class="btn btn-tool">
                                                                    <i class="fas fa-pen"></i>
                                                                </a>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="col-md-3" >
                                            <div class="card card-row card-success">
                                                <div class="card-header">
                                                    <h3 class="card-title">
                                                        Done
                                                    </h3>
                                                </div>
                                                <div class="card-body">
                                                    <div class="card card-primary card-outline">
                                                        <div class="card-header">
                                                            <h5 class="card-title">Create repo</h5>
                                                            <div class="card-tools">
                                                                <a href="#" class="btn btn-tool btn-link">#1</a>
                                                                <a href="#" class="btn btn-tool">
                                                                    <i class="fas fa-pen"></i>
                                                                </a>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </section>
                        </div>
                    </div>
                    <!--End page-content" -->
                </div>
            </main>
        </div>

        <!--End page-content" -->
    </div>
    <!-- page-wrapper -->
    <!-- javascript -->
    <script src="../assets/js/jquery.min.js"></script>
    <script src="../assets/js/bootstrap.bundle.min.js"></script>

    <!-- simplebar -->
    <script src="../assets/js/simplebar.min.js"></script>
    <!-- Icons -->
    <script src="../assets/js/feather.min.js"></script>
    <!-- Main Js -->
    <script src="../assets/js/app.js"></script>
    <script src="../assets/js/script.js"></script>
</body>
</html>

