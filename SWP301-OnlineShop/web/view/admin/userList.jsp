<%-- 
    Document   : userList
    Created on : May 25, 2022, 5:57:25 AM
    Author     : Admin
--%>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <meta charset="UTF-8">
    <title>Director | Dashboard</title>
    <meta content='width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no' name='viewport'>
    <meta name="description" content="Developed By M Abdur Rokib Promy">
    <meta name="keywords" content="Admin, Bootstrap 3, Template, Theme, Responsive">
    <!-- bootstrap 3.0.2 -->
    <link href="../assets/css/bootstrap.min.css" rel="stylesheet" type="text/css" />
    <!-- font Awesome -->
    <link href="../assets/css/font-awesome.min.css" rel="stylesheet" type="text/css" />

    <!-- Theme style -->
    <link href="../assets/css/style.css" rel="stylesheet" type="text/css" />
    <style type="text/css">

    </style>

    <script src="https://cdn.jsdelivr.net/npm/jquery@3.6.0/dist/jquery.slim.min.js"></script>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.1.1/css/all.min.css" integrity="sha512-KfkfwYDsLkIlwQp6LFnl8zNdLGxu9YAA1QvwINks4PhcElQSvqcyVLLD9aMhXd13uQjoXtEKNosOWaZqXgel0g==" crossorigin="anonymous" referrerpolicy="no-referrer" />
</head>


<body class="skin-black">
    <c:set var="roleId" value="${requestScope.roleId}"/>
    <c:set var="gender" value="${requestScope.gender}"/>
    <c:set var="status" value="${requestScope.status}"/>
    <c:set var="page" value="${requestScope.page}"/>

    <!-- header logo: style can be found in header.less -->
    <jsp:include page="../admin-layout/header.jsp"></jsp:include>
        <div class="wrapper row-offcanvas row-offcanvas-left">
            <!-- Left side column. contains the logo and sidebar -->
        <jsp:include page="../admin-layout/sideBar.jsp"></jsp:include>
            <!-- Right side. contains main content -->
            <aside class="right-side">
                <!-- Main content -->
                <section class="content">
                    <!--Search, add and filter user-->
                    <div class="row d-flex" style="margin-bottom: 10px">
                        <form action="userList" method="get">
                            <input type="hidden" name="action" value="all"/>
                            <input type="hidden" name="xpage" value="${page}"/>

                        <select name="roleId" id="roleId" >
                            <option value="0" ${requestScope.roleId == 0 ? "selected='selected'":""} >All</option>
                            <c:forEach items="${requestScope.roles}" var="r">
                                <option  value="${r.id}" ${requestScope.roleId == r.id ? "selected='selected'":""}>${r.name}</option>
                            </c:forEach>
                        </select>
                        <select name="gender" id="gender">
                            <option value="all" ${requestScope.gender == "all" ? "selected='selected'":""}>All</option>
                            <option value="male" ${requestScope.gender == "male" ? "selected='selected'":""}>Male</option>
                            <option value="female" ${requestScope.gender == "female" ? "selected='selected'":""}>Female</option>
                        </select>
                        <select name="status" id="status">
                            <option value="all" ${requestScope.status == "all" ? "selected='selected'":""}>All</option>
                            <option value="active" ${requestScope.status == "active" ? "selected='selected'":""}>active</option>
                            <option value="unactive" ${requestScope.status == "unactive" ? "selected='selected'":""}>unactive</option>
                        </select>
                        <input type="text" id="search" name="search" value="${requestScope.search}"/>
                        </form>
                    <form action="" method="get">
                        <input class="btn btn-primary" type="submit" value="Add new user">
                    </form>
                </div><!--/Search, add and filter user-->
                <!--Table list of user-->
                <div class="row" style="margin-bottom: 10px;">
                    <table class="table table-hover">
                        <thead>
                            <tr>
                                <th>Id</th>
                                <th>Name</th>
                                <th>Gender</th>
                                <th>Email</th>
                                <th>Mobile</th>
                                <th>Address</th>
                                <th>Role</th>
                                <th>Status</th>
                                <th></th>
                            </tr>
                        </thead>
                        <tbody>
                            <c:forEach items="${requestScope.users}" var="u">
                                <tr>
                                    <td>${u.id}</td>
                                    <td>${u.fullname}</td>
                                    <td>${u.gender == true ? "Male" : "Female"}</td>
                                    <td>${u.email}</td>
                                    <td>${u.mobile}</td>
                                    <td>${u.address}</td>
                                    <td>${u.role.name}</td>
                                    <td>
                                        <form action="editUserStatus" id="changeStatus-${u.id}" method="get">
                                            <!--<input type="hidden" name="action" value="changeStatus">-->
                                            <input type="hidden" name="xpage" value="${page}">
                                            <input type="hidden" name="id" value="${u.id}">
                                            <c:if test="${!u.status}">
                                                <input type="hidden" name="newStatus" value="active">
                                                <button type="button" class="btn btn-danger" data-toggle="modal" data-target="#active" onclick="openModal('changeStatus-${u.id}')">Unactive</button>
                                            </c:if>
                                            <c:if test="${u.status}">
                                                <input type="hidden" name="newStatus" value="unactive">
                                                <button type="button" class="btn btn-success" data-toggle="modal" data-target="#active" onclick="openModal('changeStatus-${u.id}')">Active</button>
                                            </c:if>
                                        </form>
                                    </td>
                                    <td>
                                        <button type="button" class="btn btn-primary">
                                            <i class="fa-solid fa-user-pen"></i>
                                            <a href="user?action=edit&id=${u.id}" style="text-decoration: none; color:white">Edit</a>
                                        </button>
                                    </td>
                                </tr>
                            </c:forEach>
                        </tbody>
                    </table>
                </div><!--/Table list of user-->
                <!--Pagging-->
                <div class="row">
                    <ul class="pagination">
                        <c:if test="${page > 2}"><li class="page-item"><a class="page-link" href="userList?xpage=${page -1}&gender=${gender}&status=${status}&roleId=${roleId}&search=${search}">Previous</a></li></c:if>
                            <c:forEach begin="1" end="${requestScope.totalPage}" var = "i">
                            <li class="page-item <c:if test="${page == i}"> active </c:if>" ><a class="page-link" href="userList?xpage=${i}&gender=${gender}&status=${status}&roleId=${roleId}&search=${search}">${i}</a></li>
                            </c:forEach>
                            <c:if test="${page < requestScope.totalPage - 1}"><li class="page-link" class="page-item"><a class="page-link" href="userList?xpage=${page+1}&gender=${gender}&status=${status}&roleId=${roleId}&search=${search}">Next</a></li></c:if>
                        </ul>
                    </div> <!--/Pagging-->
                </section><!-- /.content -->
            </aside><!-- /.right-side -->
        </div><!-- ./wrapper -->


        <!--Submit form onchange-->
        <script type="text/javascript">
            $(document).ready(function () {
                $('#roleId').on('change', function () {
                    this.form.submit();
                });
                $('#gender').on('change', function () {
                    this.form.submit();
                });
                $('#status').on('change', function () {
                    this.form.submit();
                });
                $('#page').on('change', function () {
                    this.form.submit();
                });
                $('#search').on('change', function () {
                    this.form.submit();
                });
            });
        </script>

        <!--Modal-->
        <div class="modal" id="active">
            <div class="modal-dialog">
                <div class="modal-content">
                    <div class="modal-body">
                        Are you sure to change status!
                    </div>
                    <div class="modal-footer">
                        <button id="clickChangeStatus" type="button"></button>
                        <!--<button type="button" class="btn btn-primary" onclick="document.getElementById('changeStatus-2').submit();">Yes</button>-->
                        <button type="button" class="btn btn-danger" data-dismiss="modal">Close</button>
                    </div>

                </div>
            </div>
            <script language="JavaScript" type="text/javascript" >
                function openModal(id) {
                    var button = document.getElementById('clickChangeStatus');
                    button.innerHTML = '';
                    button.setAttribute('class', "btn btn-primary");
                    button.setAttribute('onclick', 'document.getElementById("' + id + '").submit();');
                    button.innerHTML = 'Yes';
                }
            </script>
            <!--/Modal-->


            <!--Alter-->
        <jsp:include page="../admin-layout/alter.jsp"></jsp:include>

        <!-- jQuery 2.0.2 -->
        <script src="http://ajax.googleapis.com/ajax/libs/jquery/2.0.2/jquery.min.js"></script>
        <script src="../js/jquery.min.js" type="text/javascript"></script>
        <!-- jQuery UI 1.10.3 -->
        <script src="../assets/js/jquery-ui-1.10.3.min.js" type="text/javascript"></script>
        <!-- Bootstrap -->
        <script src="../assets/js/bootstrap.min.js" type="text/javascript"></script>
        <!-- daterangepicker -->
        <script src="../assets/js/plugins/daterangepicker/daterangepicker.js" type="text/javascript"></script>
        <script src="../assets/js/plugins/chart.js" type="text/javascript"></script>
        <script src="../assets/js/plugins/iCheck/icheck.min.js" type="text/javascript"></script>
        <!-- calendar -->
        <script src="../assets/js/plugins/fullcalendar/fullcalendar.js" type="text/javascript"></script>
        <!-- Director App -->
        <script src="../assets/js/Director/app.js" type="text/javascript"></script>
</body>
</html>
