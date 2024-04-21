<%-- 
    Document   : project
    Created on : Apr 3, 2024, 9:00:42 PM
    Author     : ADMIN
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
        <c:if test="${sessionScope.toast == 'true'}">
            <c:remove var="toast" scope="session" /> 
            <script>
                function addToast(title, content, type, count) {
                    $.Toast(title, content, type, {
                        has_icon: true,
                        has_close_btn: true,
                        stack: true,
                        fullscreen: false,
                        position_class: "toast-top-right",
                        timeout: count,
                        sticky: false,
                        has_progress: true,
                        rtl: false
                    });
                }
                ;
                // type: success, warning, error, info or notice
                //            addToast(title, content, type, count)
                window.onload = addToast("Success", "Update Successfully!", "success", 5000);
            </script>
        </c:if>

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
                        <div class="row">
                            <div class="col-lg-7 col-md-6">
                                <h5 class="mb-0">Report</h5>
                                <nav aria-label="breadcrumb" class="d-inline-block mt-2">
                                    <ul class="breadcrumb breadcrumb-muted bg-transparent rounded mb-0 p-0">
                                        <li class="breadcrumb-item active" aria-current="page">Report List</li>
                                    </ul>
                                </nav>
                            </div>

                            <div class="col-lg-5 col-md-6 mt-4 mt-md-0">
                                <div class="row">
                                    <div class="col-lg-8 col-md-7">
                                    </div>

                                    <div class="col-lg-4 col-md-5">
                                        <div class="justify-content-md-end mt-4 mt-sm-0">
                                            <div class="d-grid">
                                                <a href="#" class="btn btn-primary">Add New</a>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>

                        <div class="row">
                            <div class="col-12 mt-4">
                                <div class="table-responsive bg-white shadow rounded">
                                    <table class="table table-center bg-white mb-0" id="myTable">
                                        <thead>
                                            <tr>
                                                <th class="border-bottom p-3" style="min-width: 50px;">#</th>
                                                <th class="border-bottom p-3" style="min-width: 180px;">Project Name</th>
                                                <th class="border-bottom p-3">Job number</th>
                                                <th class="border-bottom p-3">Job Complete</th>
                                                <th class="border-bottom p-3">Time</th>
                                                <th class="border-bottom p-3" style="min-width: 150px;">Employee Code</th>
                                                <th class="border-bottom p-3">Status</th>
                                                <th class="border-bottom p-3" style="min-width: 100px;"></th>
                                            </tr>
                                        </thead>
                                        <tbody>
                                            <tr>
                                                <th class="p-3">1</th>
                                                <td class="p-3">Thiết kế giao diện quản lý phòng khám</td>
                                                <td class="p-3">10</td>
                                                <td class="p-3">10</td>
                                                <td class="p-3">3 tháng</td>
                                                <td class="p-3">EMP01</td>
                                                <td class="p-3">Complete</td>
                                                <td class="text-end p-3">
                                                    <a href="#" class="btn btn-icon btn-pills btn-soft-success" data-bs-toggle="modal" data-bs-target="#editprofile"><i class="uil uil-pen"></i></a>
                                                    <a href="#" class="btn btn-icon btn-pills btn-soft-danger"><i class="uil uil-trash"></i></a>
                                                </td>
                                            </tr>
                                            
                                            <tr>
                                                <th class="p-3">2</th>
                                                <td class="p-3">Thiết kế phần mềm tính lương</td>
                                                <td class="p-3">5</td>
                                                <td class="p-3">4</td>
                                                <td class="p-3">4 tháng</td>
                                                <td class="p-3">EMP02</td>
                                                <td class="p-3">To_do</td>
                                                <td class="text-end p-3">
                                                    <a href="#" class="btn btn-icon btn-pills btn-soft-success" data-bs-toggle="modal" data-bs-target="#editprofile"><i class="uil uil-pen"></i></a>
                                                    <a href="#" class="btn btn-icon btn-pills btn-soft-danger"><i class="uil uil-trash"></i></a>
                                                </td>
                                            </tr>
                                            <tr>
                                                <th class="p-3">3</th>
                                                <td class="p-3">Phần mềm quản lý cho công ty A</td>
                                                <td class="p-3">7</td>
                                                <td class="p-3">7</td>
                                                <td class="p-3">11 tháng</td>
                                                <td class="p-3">EMP03</td>
                                                <td class="p-3">Complete</td>
                                                <td class="text-end p-3">
                                                    <a href="#" class="btn btn-icon btn-pills btn-soft-success" data-bs-toggle="modal" data-bs-target="#editprofile"><i class="uil uil-pen"></i></a>
                                                    <a href="#" class="btn btn-icon btn-pills btn-soft-danger"><i class="uil uil-trash"></i></a>
                                                </td>
                                            </tr>
                                            <tr>
                                                <th class="p-3">4</th>
                                                <td class="p-3">Phần mềm quản lý đặt vé xem phim</td>
                                                <td class="p-3">8</td>
                                                <td class="p-3">1</td>
                                                <td class="p-3">12 tháng</td>
                                                <td class="p-3">EMP04</td>
                                                <td class="p-3">To_do</td>
                                                <td class="text-end p-3">
                                                    <a href="#" class="btn btn-icon btn-pills btn-soft-success" data-bs-toggle="modal" data-bs-target="#editprofile"><i class="uil uil-pen"></i></a>
                                                    <a href="#" class="btn btn-icon btn-pills btn-soft-danger"><i class="uil uil-trash"></i></a>
                                                </td>
                                            </tr>
                                        </tbody>
                                    </table>
                                </div>
                            </div>
                        </div><!--end row-->

                        <div class="row text-center">
                            <!-- PAGINATION START -->
                            <div class="col-12 mt-4">
                                <div class="d-md-flex align-items-center text-center justify-content-between">
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

        <!-- Modal start -->
        <!-- Add New Appointment Start -->
        <div class="modal fade" id="appointmentform" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
            <div class="modal-dialog modal-lg modal-dialog-centered">
                <div class="modal-content">
                    <div class="modal-header border-bottom p-3">
                        <h5 class="modal-title" id="exampleModalLabel">Add new Project</h5>
                        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                    </div>
                    <div class="modal-body p-3 pt-4">
                        <div class="modal-body p-3 pt-4">
                            <form action="project" methot="post">
                                <div class="row">
                                    <div class="col-lg-12">
                                        <div class="mb-3">
                                            <label class="form-label">Project code<span class="text-danger">*</span></label>
                                            <input name="pcode" id="pcode" type="text" class="form-control" placeholder="Project code :">
                                        </div> 
                                    </div><!--end col-->

                                    <div class="col-lg-12">
                                        <div class="mb-3">
                                            <label class="form-label">Project name <span class="text-danger">*</span></label>
                                            <input name="pname" id="pname" type="text" class="form-control" placeholder="Project name :">
                                        </div> 
                                    </div><!--end col-->

                                    <div class="col-lg-6 ">
                                        <div class="mb-3">
                                            <label class="form-label">Start Date : <span class="text-danger">*</span></label>
                                            <input name="startdate" type="date" class="flatpickr flatpickr-input form-control" >
                                        </div>
                                    </div><!--end col-->

                                    <div class="col-lg-6 ">
                                        <div class="mb-3">
                                            <label class="form-label">End Date : <span class="text-danger">*</span></label>
                                            <input name="enddate" type="date" class="flatpickr flatpickr-input form-control" >
                                        </div> 
                                    </div><!--end col-->

                                    <div class="col-lg-6 col-md-6">
                                        <div class="mb-6">
                                            <label class="form-label">Employee code <span class="text-danger">*</span></label>
                                            <input name="empcode" id="empcode" type="text" class="form-control" placeholder="Employee Code :">
                                        </div>
                                    </div><!--end col-->

                                    <div class="col-lg-6 col-md-6">
                                        <div class="mb-6">
                                            <label class="form-label">Status <span class="text-danger">*</span></label>
                                            <select name="status" class="form-select form-control" id="inputGroupSelect01">
                                                
                                            </select>
                                        </div>
                                    </div><!--end col-->

                                    <div class="col-lg-12">
                                        <div class="d-grid" style="margin-top: 10px">
                                            <button type="submit" class="btn btn-primary">Add</button>
                                        </div>
                                    </div><!--end col-->
                                </div><!--end row-->
                            </form>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <!-- Add New Appointment End -->

        <!-- Accept Appointment Start -->
        <div class="modal fade" id="editprofile" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
            <div class="modal-dialog modal-lg modal-dialog-centered">
                <div class="modal-content">
                    <div class="modal-header border-bottom p-3">
                        <h5 class="modal-title" id="exampleModalLabel">Update Project</h5>
                        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                    </div>

                </div>
            </div>
        </div>
        <!-- Accept Appointment End -->

        <!-- Cancel Appointment Start -->
        <div class="modal fade" id="cancelappointment" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
            <div class="modal-dialog modal-dialog-centered">
                <div class="modal-content">
                    <div class="modal-body py-5">
                        <div class="text-center">
                            <div class="icon d-flex align-items-center justify-content-center bg-soft-danger rounded-circle mx-auto" style="height: 95px; width:95px;">
                                <i class="uil uil-times-circle h1 mb-0"></i>
                            </div>
                            <div class="mt-4">
                                <h4>Cancel Appointment</h4>
                                <p class="para-desc mx-auto text-muted mb-0">Great doctor if you need your family member to get immediate assistance, emergency treatment.</p>
                                <div class="mt-4">
                                    <a href="#" class="btn btn-soft-danger">Cancel</a>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <!-- Cancel Appointment End -->
        <!-- Modal end -->

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
