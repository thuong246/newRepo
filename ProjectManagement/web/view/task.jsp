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
        <link rel="shortcut icon" href="assets/images/favicon.ico.png">
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
        <link rel="stylesheet" href="../assets/css/toast.style.css"/>
        <script src="../assets/js/jquery.min.js"></script>
        <script src="../assets/js/toast.script.js"></script>
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
                <div class="sidebar-content" data-simplebar style="height: calc(100% - 60px);">
                    <div class="sidebar-brand">
                        <a href="index.html">
                            <h2>TEKLABS</h2>
                        </a>
                    </div>
                </div>
                <!-- sidebar-content  -->
                <%@include file="sidebar.jsp" %>
            </nav>
            <!-- sidebar-wrapper  -->

            <!-- Start Page Content -->
            <main class="page-content bg-light">
                <%@include file="headersidebar.jsp" %>

                <div class="container-fluid">
                    <div class="layout-specing">
                        <div class="row">
                            <div class="col-lg-7 col-md-6">
                                <h3 class="mb-0">Task</h3>
                                <nav aria-label="breadcrumb" class="d-inline-block mt-2">
                                    <ul class="breadcrumb breadcrumb-muted bg-transparent rounded mb-0 p-0">
                                        <li class="breadcrumb-item active" aria-current="page">Task List</li>
                                    </ul>
                                </nav>
                            </div>

                            <div class="col-lg-5">
                                <div class="row">
                                    <div class="col-lg-8 col-md-7">
                                        <div class="search-bar p-0 d-none d-lg-block ms-2">
                                            <div id="search" class="menu-search mb-0">
                                                <form role="search" method="get" id="searchform" class="searchform">
                                                    <div>
                                                        <input type="text" class="form-control border rounded-pill" name="s" id="s" placeholder="Search Keywords...">
                                                        <input type="submit" id="searchsubmit" value="Search">
                                                    </div>
                                                </form>
                                            </div>
                                        </div>
                                    </div>

                                    <div class="col-lg-4 col-md-5" style="">
                                        <div class="justify-content-md-end mt-4 mt-sm-0">
                                            <div class="d-grid">
                                                <a href="/ProjectManagement/addtask" class="btn btn-primary">Add New</a>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>

                        <div class="row">
                            <div class="col-12 mt-60">
                                <div class="table-responsive bg-white shadow rounded">
                                    <table class="table mb-0 table-center">
                                        <thead>
                                            <tr>
                                                <th class="border-bottom p-3" style="min-width: 40px;">#</th>
                                                <th class="border-bottom p-3" style="min-width: 120px;">Task Code</th>
                                                <th class="border-bottom p-3" style="min-width: 130px;">Project Code</th>
                                                <th class="border-bottom p-3" style="min-width: 180px;">Task Name</th>
                                                <th class="border-bottom p-3" style="min-width: 150px;">Start Date</th>
                                                <th class="border-bottom p-3" style="min-width: 150px;">End Date</th>
                                                <th class="border-bottom p-3" style="min-width: 150px;">Employee ID</th>
                                                <th class="border-bottom p-3">Status</th>
                                                <th class="border-bottom p-3" style="min-width: 150px;"></th>
                                            </tr>
                                        </thead>
                                        <tbody>
                                            <c:forEach items="${listtask}" var="i">
                                                <tr class="itemSetting">
                                                    <td class="p-3">${i.getTask_id()}</td>
                                                    <td class="py-3">${i.getTask_code()}</td>
                                                    <td class="p-3">${i.project.project_code}</td>
                                                    <td class="p-3">${i.getTask_name()}</td>
                                                    <td class="p-3">${i.getStart_date()}</td>
                                                    <td class="p-3">${i.getEnd_date()}</td>
                                                    <td class="p-3">${i.employee.employee_code}</td>
                                                    <td class="border-bottom p-3" style="min-width: 70px;">
                                                        ${i.getStatus()}
                                                    </td>
                                                    <td class="border-bottom p-3" style="min-width: 70px;">
                                                        <a href="/ProjectManagement/updatetask?mod=1&task_id=${i.getTask_id()}" class="btn btn-icon btn-pills btn-soft-success"><i class="uil uil-pen"></i></a>
                                                        <a href="#" class="btn btn-icon btn-pills btn-soft-danger" onclick="deleteUser('${i.getTask_id()}')"><i class="uil uil-trash" ></i></a>
                                                    </td>
                                                </tr>
                                            </c:forEach>
                                        </tbody>
                                    </table>
                                    <form id="delete" action="" method="post">
                                        <input id="daleteUserId" type="hidden" name="daleteUserId">
                                    </form>

                                </div>
                            </div>
                        </div><!--end row-->

                        <div class="row text-center">
                            <!-- PAGINATION START -->
                            <div class="col-12 mt-4">
                                <div class="d-md-flex align-items-center text-center justify-content-between">
                                    <span class="text-muted me-3">Showing 1 - 10 out of 50</span>
                                    <ul class="pagination justify-content-center mb-0 mt-3 mt-sm-0">
                                        <li class="page-item"><a class="page-link" href="javascript:void(0)" aria-label="Previous">Prev</a></li>
                                        <li class="page-item active"><a class="page-link" href="javascript:void(0)">1</a></li>
                                        <li class="page-item"><a class="page-link" href="javascript:void(0)">2</a></li>
                                        <li class="page-item"><a class="page-link" href="javascript:void(0)">3</a></li>
                                        <li class="page-item"><a class="page-link" href="javascript:void(0)" aria-label="Next">Next</a></li>
                                    </ul>
                                </div>
                            </div><!--end col-->
                            <!-- PAGINATION END -->
                        </div><!--end row-->
                    </div>
                </div><!--end container-->
            </main>
            <!--End page-content" -->
        </div>
        <!-- page-wrapper -->

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
        <script>
            //delete user
            function deleteUser(x) {
                //confirm
                if (confirm('Do you want to remove the user with Id:' + x) === true) {
                    document.getElementById('daleteUserId').value = x;
                    document.getElementById('delete').submit();
                }

            }
        </script>

    </body>
</html>

