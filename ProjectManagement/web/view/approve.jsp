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
                                <h5 class="mb-0">Project</h5>
                                <nav aria-label="breadcrumb" class="d-inline-block mt-2">
                                    <ul class="breadcrumb breadcrumb-muted bg-transparent rounded mb-0 p-0">
                                        <li class="breadcrumb-item active" aria-current="page">Project List</li>
                                    </ul>
                                </nav>
                            </div>
                        </div>

                        <div class="row">
                            <div class="col-12 mt-4">
                                <div class="table-responsive bg-white shadow rounded">
                                    <table class="table table-center bg-white mb-0" id="myTable">
                                        <thead>
                                            <tr>
                                                <th class="border-bottom p-3" style="min-width: 50px;">#</th>
                                                <th class="border-bottom p-3" style="min-width: 180px;">Status</th>
                                                <th class="border-bottom p-3">Description</th>
                                                <th class="border-bottom p-3">End time</th>
                                                <th class="border-bottom p-3">Employee name</th>
                                                <th class="border-bottom p-3" style="min-width: 150px;">Employee Code</th>
                                                <th class="border-bottom p-3">File</th>
                                                <th class="border-bottom p-3" style="min-width: 100px;"></th>
                                            </tr>
                                        </thead>
                                        <tbody>
                                            <c:forEach items="${listA}" var="i">
                                                <tr class="itemSetting">
                                                    <td class="p-3" >${i.getId()}</td>
                                                    <td class="p-3 status-column" >${i.status}</td>
                                                    <td class="p-3">${i.getDescription()}</td>
                                                    <td class="p-3">${i.date}</td>
                                                    <td class="p-3">${i.employee.employee_name}</td>
                                                    <td class="py-3">
                                                        <span class="ms-2">${i.employee.employee_code}</span>
                                                    </td>
                                                    <td class="p-3">
                                                        <c:choose>
                                                            <c:when test="${not empty i.file}">
                                                                <a href="downloadFile?id=${i.id}">Download File</a>
                                                            </c:when>
                                                            <c:otherwise>
                                                                No Attachment
                                                            </c:otherwise>
                                                        </c:choose>
                                                    </td>
                                                    <td class="border-bottom p-3" style="min-width: 70px;">
                                                        <a href="#" class="btn btn-icon btn-pills btn-soft-success accept-appointment" data-bs-toggle="modal" data-bs-target="#acceptappointment" data-row-id="${i.getId()}"><i class="uil uil-check-circle"></i></a>
                                                        <a href="#" class="btn btn-icon btn-pills btn-soft-danger cancel-appointment" data-bs-toggle="modal" data-bs-target="#cancelappointment" data-row-id="${i.getId()}"><i class="uil uil-times-circle"></i></a>
                                                    </td>
                                                </tr>
                                            </c:forEach>
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
        <!-- Modal Accept Appointment -->
        <div class="modal fade" id="acceptappointment" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
            <div class="modal-dialog modal-dialog-centered">
                <div class="modal-content">
                    <div class="modal-body py-5">
                        <div class="text-center">
                            <div class="icon d-flex align-items-center justify-content-center bg-soft-success rounded-circle mx-auto" style="height: 95px; width:95px;">
                                <i class="uil uil-check-circle h1 mb-0"></i>
                            </div>
                            <div class="mt-4">
                                <h4>Accept</h4>
                                <p class="para-desc mx-auto text-muted mb-0">Are you sure you want to accept this approval?</p>
                                <div class="mt-4">
                                    <!-- Thêm hidden input để lưu rowId -->
                                    <form id="acceptForm" method="post" action="approval">
                                        <input type="hidden" id="acceptRowId" name="rowId" value="">
                                        <input type="hidden" id="acceptAction" name="action" value="accept">
                                        <button type="submit" id="acceptButton" class="btn btn-soft-success">Accept</button>
                                        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Cancel</button>
                                    </form>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>

        <!-- Modal Cancel Appointment -->
        <div class="modal fade" id="cancelappointment" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
            <div class="modal-dialog modal-dialog-centered">
                <div class="modal-content">
                    <div class="modal-body py-5">
                        <div class="text-center">
                            <div class="icon d-flex align-items-center justify-content-center bg-soft-danger rounded-circle mx-auto" style="height: 95px; width:95px;">
                                <i class="uil uil-times-circle h1 mb-0"></i>
                            </div>
                            <div class="mt-4">
                                <h4>Refuse</h4>
                                <p class="para-desc mx-auto text-muted mb-0">Are you sure you want to decline this approval?</p>
                                <div class="mt-4">
                                    <!-- Thêm hidden input để lưu rowId -->
                                    <form id="rejectForm" method="post" action="approval">
                                        <input type="hidden" id="rejectRowId" name="rowId" value="">
                                        <input type="hidden" id="rejectAction" name="action" value="reject">
                                        <button type="submit" id="rejectButton" class="btn btn-soft-danger">Refuse</button>
                                        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Cancel</button>
                                    </form>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
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
        <script>
            // Bắt sự kiện click cho nút Accept
            var acceptButtons = document.querySelectorAll('.accept-appointment');
            acceptButtons.forEach(function (button) {
                button.addEventListener('click', function (event) {
                    var rowId = this.getAttribute('data-row-id');
                    var status = this.closest('tr').querySelector('.status-column').textContent.trim();

                    // Chỉ hiện cảnh báo nếu status là "Pending"
                    if (status === "Pending") {
                        document.getElementById('acceptRowId').value = rowId;
                        $('#acceptappointment').modal('show'); // Hiển thị modal Accept
                    } else {
                        alert("You can only change status when it's Pending.");
                    }
                });
            });

            // Bắt sự kiện click cho nút Refuse
            var refuseButtons = document.querySelectorAll('.cancel-appointment');
            refuseButtons.forEach(function (button) {
                button.addEventListener('click', function (event) {
                    var rowId = this.getAttribute('data-row-id');
                    var status = this.closest('tr').querySelector('.status-column').textContent.trim();

                    // Chỉ hiện cảnh báo nếu status là "Pending"
                    if (status === "Pending") {
                        document.getElementById('rejectRowId').value = rowId;
                        $('#cancelappointment').modal('show'); // Hiển thị modal Cancel
                    } else {
                        alert("You can only change status when it's Pending.");
                    }
                });
            });

            // Xác nhận chấp nhận
            document.getElementById('acceptForm').addEventListener('submit', function (event) {
                // Không chuyển trang mặc định
                event.preventDefault();

                // Lấy rowId và action
                var rowId = document.getElementById('acceptRowId').value;
                var action = document.getElementById('acceptAction').value;

                // Gửi Ajax request để cập nhật trạng thái
                $.ajax({
                    type: "POST",
                    url: "approval",
                    data: {rowId: rowId, action: action},
                    success: function (data) {
                        // Xử lý khi thành công
                        $('#acceptappointment').modal('hide'); // Đóng modal
                        // Cập nhật UI nếu cần
                    },
                    error: function (xhr, status, error) {
                        // Xử lý khi có lỗi
                        console.error(xhr.responseText);
                    }
                });
            });

            // Xác nhận từ chối
            document.getElementById('rejectForm').addEventListener('submit', function (event) {
                // Không chuyển trang mặc định
                event.preventDefault();

                // Lấy rowId và action
                var rowId = document.getElementById('rejectRowId').value;
                var action = document.getElementById('rejectAction').value;

                // Gửi Ajax request để cập nhật trạng thái
                $.ajax({
                    type: "POST",
                    url: "approval",
                    data: {rowId: rowId, action: action},
                    success: function (data) {
                        // Xử lý khi thành công
                        $('#cancelappointment').modal('hide'); // Đóng modal
                        // Cập nhật UI nếu cần
                    },
                    error: function (xhr, status, error) {
                        // Xử lý khi có lỗi
                        console.error(xhr.responseText);
                    }
                });
            });
        </script>

    </body>
</html>
