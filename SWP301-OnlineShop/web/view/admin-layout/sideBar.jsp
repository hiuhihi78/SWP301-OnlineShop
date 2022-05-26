<%-- 
    Document   : sideBar
    Created on : May 25, 2022, 5:34:33 AM
    Author     : Admin
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>

<aside class="left-side sidebar-offcanvas">
    <!-- sidebar: style can be found in sidebar.less -->
    <section class="sidebar">
        <!-- Sidebar user panel -->
        <div class="user-panel">
            <div class="pull-left image">
                <img src="../assets/img/defaultUserAvatar.png" class="img-circle" alt="User Image" />
            </div>
            <div class="pull-left info">
                <p>${sessionScope.user.fullname}</p>

                <a href="#"><i class="fa fa-circle text-success"></i> Online</a>
            </div>
        </div>
        <!-- sidebar menu: : style can be found in sidebar.less -->
        <ul class="sidebar-menu">
            <li id="nav-dashborad">
                <a href="#">
                    <i class="fa fa-dashboard"></i> <span>Dashboard</span>
                </a>
            </li>
            <li id="nav-user-list">
                <a href="userList">
                    <i class="fa-solid fa-users"></i> <span>User list</span>

                </a>
            </li>

            <li id="nav-setting-list">
                <a href="">
                    <i class="fa-solid fa-gears"></i> <span>Setting list</span>
                </a>
            </li>

        </ul>
    </section>
    <!-- /.sidebar -->
</aside>
