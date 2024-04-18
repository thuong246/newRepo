<%-- 
    Document   : sidebar
    Created on : Apr 3, 2024, 9:18:06 PM
    Author     : ADMIN
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.2/css/all.min.css"/>
    </head>
    <body>

        <!--<div class="page-wrapper doctris-theme toggled">-->
        <nav id="sidebar" class="sidebar-wrapper">
            <div class="sidebar-content" data-simplebar style="height: calc(100% - 60px);">
                <div class="sidebar-brand">
                    <a href="index.html">
                        <h2>TEKLABS</h2>
                    </a>
                </div>
                <ul class="sidebar-menu pt-3">
                    <li class="sidebar-dropdown">
                        <a href="/ProjectManagement/menu" >
                             <i class="fa-solid fa-house"><div class="bg-primary"></div></i>Menu 
                        </a>                
                    </li>
                    <li class="sidebar-dropdown">
                        <a href="/ProjectManagement/project">
                           <i class="fa-solid fa-diagram-project"><div class="bg-primary"></div></i>Project
                        </a>     

                    </li>
                    <li class="sidebar-dropdown">
                        <a href="/ProjectManagement/task">
                            <i class="fa-solid fa-thumbtack"><div class="bg-primary"></div></i>Task
                        </a>     

                    </li>
                    <li class="sidebar-dropdown">  
                        <a href="/ProjectManagement/workprogress">
                            <i class="fa-solid fa-list-check"><div class="bg-primary"></div></i>Work progress
                        </a>
                    </li>
                    <li class="sidebar-dropdown">  
                        <a href="/ProjectManagement/risk">
                            <i class="fa-solid fa-asterisk"><div class="bg-primary"></div></i>Risk
                        </a>
                    </li>
                    <li class="sidebar-dropdown">  
                        <a href="/ProjectManagement/employee">
                            <i class="fa-solid fa-user"><div class="bg-primary"></div></i>Employee
                        </a>
                    </li>
                    <li class="sidebar-dropdown">  
                        <a href="/ProjectManagement/approved">
                            <i class="fa-solid fa-calendar-check"><div class="bg-primary"></div></i>Approved Jobs
                        </a>
                    </li>
                    <li class="sidebar-dropdown">  
                        <a href="/ProjectManagement/report">
                            <i class="fa-solid fa-bug"><div class="bg-primary"></div></i>Report
                        </a>
                    </li>
                </ul>
            </div>
        </nav>
    </body>
</html>

