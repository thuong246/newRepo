<%-- 
    Document   : headersidebar
    Created on : Apr 4, 2024, 2:49:30 AM
    Author     : ADMIN
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        
    </head>
    <body>
        <div class="top-header">
            <div class="header-bar d-flex justify-content-between border-bottom">
                <div class="d-flex align-items-center">
                    <a href="#" class="logo-icon">
                        <img src="../assets/images/logo-icon.png" height="30" class="small" alt="">
                        <span class="big">
                            <img src="../assets/images/logo-dark.png" height="24" class="logo-light-mode" alt="">
                            <img src="../assets/images/logo-light.png" height="24" class="logo-dark-mode" alt="">
                        </span>
                    </a>
                    <a id="close-sidebar" class="btn btn-icon btn-pills btn-soft-primary ms-2" href="#">
                        <i class="uil uil-bars"></i>
                    </a>
                    <form  class="searchform" style="margin-left: 10px">
                        <div>
                            <input type="text" class="form-control border rounded-pill" name="s" id="searchInput" onkeyup="searchTable()" placeholder="Search Keywords...">
                        </div>
                    </form>
                    <div class="alert alert-danger" role="alert" id="noMatchFound" style="display: none; margin:10px 10px" >Không có giá trị nào hợp lệ</div>
                </div>

                <ul class="list-unstyled mb-0">


                    <li class="list-inline-item mb-0 ms-1">
                        <div class="dropdown dropdown-primary">
                            <button type="button" class="btn btn-pills btn-soft-primary dropdown-toggle p-0" data-bs-toggle="dropdown" aria-haspopup="true" aria-expanded="false"><img src="../assets/images/avatar-default-symbolic-icon-479x512-n8sg74wg.png" class="avatar avatar-ex-small rounded-circle" alt=""></button>
                            <div class="dropdown-menu dd-menu dropdown-menu-end bg-white shadow border-0 mt-3 py-3" style="min-width: 200px;">
                                <a class="dropdown-item d-flex align-items-center text-dark" href="https://shreethemes.in/doctris/layouts/admin/profile.html">
                                    <img src="../assets/images/avatar-default-symbolic-icon-479x512-n8sg74wg.png" class="avatar avatar-md-sm rounded-circle border shadow" alt="">
                                    <div class="flex-1 ms-2">
                                        <span class="d-block mb-1">${sessionScope.acc}</span>
                                    </div>
                                </a>
                                <div class="dropdown-divider border-top"></div>
                                <a class="dropdown-item text-dark" href="/ProjectManagement/logout"><span class="mb-0 d-inline-block me-1"><i class="uil uil-sign-out-alt align-middle h6"></i></span> Logout</a>
                            </div>
                        </div>
                    </li>
                </ul>
            </div>
        </div>
        <script>
            function searchTable() {
                var input, filter, table, tr, td, i, j, txtValue, found = false;
                input = document.getElementById("searchInput");
                filter = input.value.toUpperCase(); // Chuyển đầu vào thành chữ hoa
                table = document.getElementById("myTable");
                tr = table.getElementsByTagName("tr");

                for (i = 1; i < tr.length; i++) {  // Bắt đầu từ 1 để bỏ qua hàng tiêu đề
                    td = tr[i].getElementsByTagName("td");
                    let visible = false;
                    for (j = 1; j < td.length - 1; j++) { // Bắt đầu từ 1 để bỏ qua cột "#", "-1" để bỏ qua cột cuối
                        if (td[j]) {
                            txtValue = td[j].textContent || td[j].innerText;
                            if (txtValue.toUpperCase().indexOf(filter) > -1) {
                                visible = true;
                                break;
                            }
                        }
                    }
                    if (visible) {
                        tr[i].style.display = "";
                        found = true;
                    } else {
                        tr[i].style.display = "none";
                    }
                }

                // Hiển thị hoặc ẩn thông báo không tìm thấy kết quả
                document.getElementById("noMatchFound").style.display = found ? "none" : "block";
            }
        </script>
    </body>
</html>
