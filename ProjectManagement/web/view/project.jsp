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
                                <h5 class="mb-0">Project</h5>
                                <nav aria-label="breadcrumb" class="d-inline-block mt-2">
                                    <ul class="breadcrumb breadcrumb-muted bg-transparent rounded mb-0 p-0">
                                        <li class="breadcrumb-item active" aria-current="page">Project List</li>
                                    </ul>
                                </nav>
                            </div>

                            <div class="col-lg-5 col-md-6 mt-4 mt-md-0">
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

                                    <div class="col-lg-4 col-md-5">
                                        <div class="justify-content-md-end mt-4 mt-sm-0">
                                            <div class="d-grid">
                                                <a href="/ProjectManagement/addproject" class="btn btn-primary">Add New</a>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>

                        <div class="row">
                            <div class="col-12 mt-4">
                                <div class="table-responsive bg-white shadow rounded">
                                    <table class="table mb-0 table-center">
                                        <thead>
                                            <tr>
                                                <th class="border-bottom p-3" style="min-width: 50px;">#</th>
                                                <th class="border-bottom p-3" style="min-width: 180px;">Project Code</th>
                                                <th class="border-bottom p-3" style="min-width: 150px;">Project Name</th>
                                                <th class="border-bottom p-3" style="min-width: 150px;">Start Date</th>
                                                <th class="border-bottom p-3" style="min-width: 150px;">End Date</th>
                                                <th class="border-bottom p-3">Employee ID</th>
                                                <th class="border-bottom p-3">Status</th>
                                                <th class="border-bottom p-3" style="min-width: 150px;"></th>
                                            </tr>
                                        </thead>
                                        <tbody>
                                            <c:forEach items="${listproject}" var="i">
                                                <tr class="itemSetting">
                                                    <td class="p-3">${i.getProject_id()}</td>
                                                    <td class="py-3">
                                                        <span class="ms-2">${i.getProject_code()}</span>
                                                    </td>
                                                    <td class="p-3">${i.getProject_name()}</td>
                                                    <td class="p-3">${i.getStart_date()}</td>
                                                    <td class="p-3">${i.getEnd_date()}</td>
                                                    <td class="p-3">${i.employee.employee_code}</td>
                                                    <td class="border-bottom p-3" style="min-width: 70px;">
                                                        ${i.getStatus()}
                                                    </td>
                                                    <td class="border-bottom p-3" style="min-width: 70px;">
                                                        <a href="/ProjectManagement/updateproject?mod=1&project_id=${i.getProject_id()}" class="btn btn-icon btn-pills btn-soft-success"><i class="uil uil-pen"></i></a>
                                                        <a href="#" class="btn btn-icon btn-pills btn-soft-danger" data-bs-toggle="modal" data-bs-target="#cancelappointment"><i class="uil uil-trash"></i></a>

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
                                                <c:forEach items="${listproject}" var="i"> 
                                                    <option>${i.getStatus()}</option>
                                                </c:forEach>
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
        <script>
                (function () {
                    "use strict";
                    $.Toast = function (title, message, type, options) {
                        var defaultOptions = {
                            appendTo: "body",
                            stack: false,
                            position_class: "toast-bottom-right",
                            fullscreen: false,
                            width: 250,
                            spacing: 20,
                            timeout: 4000,
                            has_close_btn: true,
                            has_icon: true,
                            sticky: false,
                            border_radius: 6,
                            has_progress: false,
                            rtl: false
                        }

                        var $element = null;

                        var $options = $.extend(true, {}, defaultOptions, options);

                        var spacing = $options.spacing;

                        var css = {
                            "position": ($options.appendTo == "body") ? "fixed" : "absolute",
                            "min-width": $options.width,
                            "display": "none",
                            "border-radius": $options.border_radius,
                            "z-index": 99999
                        }

                        $element = $('<div class="toast-item-wrapper ' + type + ' ' + $options.position_class + '"></div>');
                        $('<p class="toast-title">' + title + '</p>').appendTo($element);
                        $('<p class="toast-message">' + message + '</p>').appendTo($element);

                        if ($options.fullscreen) {
                            $element.addClass("fullscreen");
                        }

                        if ($options.rtl) {
                            $element.addClass("rtl");
                        }

                        if ($options.has_close_btn) {
                            $('<span class="toast-close">&times;</span>').appendTo($element);
                            if ($options.rtl) {
                                css["padding-left"] = 20;
                            } else {
                                css["padding-right"] = 20;
                            }
                        }

                        if ($options.has_icon) {
                            $('<i class="toast-icon toast-icon-' + type + '"></i>').appendTo($element);
                            if ($options.rtl) {
                                css["padding-right"] = 50;
                            } else {
                                css["padding-left"] = 50;
                            }
                        }

                        if ($options.has_progress && $options.timeout > 0) {
                            $('<div class="toast-progress"></div>').appendTo($element);
                        }

                        if ($options.sticky) {
                            $options.spacing = 0;
                            spacing = 0;

                            switch ($options.position_class) {
                                case "toast-top-left" :
                                {
                                    css["top"] = 0;
                                    css["left"] = 0;
                                    break;
                                }
                                case "toast-top-right" :
                                {
                                    css["top"] = 0;
                                    css["left"] = 0;
                                    break;
                                }
                                case "toast-top-center" :
                                {
                                    css["top"] = 0;
                                    css["left"] = css["right"] = 0;
                                    css["width"] = "100%";
                                    break;
                                }
                                case "toast-bottom-left" :
                                {
                                    css["bottom"] = 0;
                                    css["left"] = 0;
                                    break;
                                }
                                case "toast-bottom-right" :
                                {
                                    css["bottom"] = 0;
                                    css["right"] = 0;
                                    break;
                                }
                                case "toast-bottom-center" :
                                {
                                    css["bottom"] = 0;
                                    css["left"] = css["right"] = 0;
                                    css["width"] = "100%";
                                    break;
                                }
                                default :
                                {
                                    break;
                                }
                            }
                        }

                        if ($options.stack) {
                            if ($options.position_class.indexOf("toast-top") !== -1) {
                                $($options.appendTo).find('.toast-item-wrapper').each(function () {
                                    css["top"] = parseInt($(this).css("top")) + this.offsetHeight + spacing;
                                });
                            } else if ($options.position_class.indexOf("toast-bottom") !== -1) {
                                $($options.appendTo).find('.toast-item-wrapper').each(function () {
                                    css["bottom"] = parseInt($(this).css("bottom")) + this.offsetHeight + spacing;
                                });
                            }
                        }

                        $element.css(css);

                        $element.appendTo($options.appendTo);

                        if ($element.fadeIn) {
                            $element.fadeIn();
                        } else {
                            $alert.css({display: 'block', opacity: 1});
                        }

                        function removeToast() {
                            $.Toast.remove($element);
                        }

                        if ($options.timeout > 0) {
                            setTimeout(removeToast, $options.timeout);
                            if ($options.has_progress) {
                                $(".toast-progress", $element).animate({"width": "100%"}, $options.timeout);
                            }
                        }

                        $(".toast-close", $element).click(removeToast)

                        return $element;
                    }

                    $.Toast.remove = function ($element) {
                        "use strict";
                        if ($element.fadeOut)
                        {
                            $element.fadeOut(function () {
                                return $element.remove();
                            });
                        } else {
                            $element.remove();
                        }
                    }
                })();

        </script>

    </body>
</html>
