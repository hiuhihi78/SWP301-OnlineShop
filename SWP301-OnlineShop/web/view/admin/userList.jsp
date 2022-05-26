<%-- 
    Document   : userList
    Created on : May 25, 2022, 5:57:25 AM
    Author     : Admin
--%>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>  
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
        
        <!--active button nav in sidebar-->
        <script>
            document.getElementById('nav-user-list').classList.add('active');
        </script>

        <script src="https://cdn.jsdelivr.net/npm/jquery@3.6.0/dist/jquery.slim.min.js"></script>
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.1.1/css/all.min.css" integrity="sha512-KfkfwYDsLkIlwQp6LFnl8zNdLGxu9YAA1QvwINks4PhcElQSvqcyVLLD9aMhXd13uQjoXtEKNosOWaZqXgel0g==" crossorigin="anonymous" referrerpolicy="no-referrer" />
    </head>


<body class="skin-black">
    <c:set var="roleId" value="${requestScope.roleId}"/>
    <c:set var="gender" value="${requestScope.gender}"/>
    <c:set var="status" value="${requestScope.status}"/>
    <c:set var="sort" value="${requestScope.sort}"/>
    <c:set var="orderBy" value="${requestScope.orderBy}"/>
    <c:set var="page" value="${requestScope.page}"/>

    <!-- header logo: style can be found in header.less -->
    <jsp:include page="../admin-layout/header.jsp"></jsp:include>
        <div class="wrapper row-offcanvas row-offcanvas-left">
            <!-- Left side column. contains the logo and sidebar -->
        <jsp:include page="../admin-layout/sideBar.jsp"></jsp:include>
            <!-- Right side. contains main content -->
            <aside class="right-side">
                <!-- Main content -->
                <section class="content" style="margin: 0px 20px;">
                    <!--Alter-->
                    <jsp:include page="../admin-layout/alter.jsp"></jsp:include>
                    <!--Search, add and filter user-->
                    <div class="row d-flex" style="margin-bottom: 10px">
                        <form action="userList" method="get" style="width: 70%; float: left;" class="form-inline">
                            <input type="hidden" name="action" value="all"/>
                            <input type="hidden" name="xpage" value="${page}"/>
                        <select name="roleId" id="roleId" class="form-control">
                            <option value="0" ${requestScope.roleId == 0 ? "selected='selected'":""} >All role</option>
                            <c:forEach items="${requestScope.roles}" var="r">
                                <option  value="${r.id}" ${requestScope.roleId == r.id ? "selected='selected'":""}>${r.name}</option>
                            </c:forEach>
                        </select>
                        <select name="gender" id="gender" class="form-control">
                            <option value="all" ${requestScope.gender == "all" ? "selected='selected'":""}>All gender</option>
                            <option value="male" ${requestScope.gender == "male" ? "selected='selected'":""}>Male</option>
                            <option value="female" ${requestScope.gender == "female" ? "selected='selected'":""}>Female</option>
                        </select>
                        <select name="status" id="status" class="form-control">
                            <option value="all" ${requestScope.status == "all" ? "selected='selected'":""}>All status</option>
                            <option value="active" ${requestScope.status == "active" ? "selected='selected'":""}>Active</option>
                            <option value="unactive" ${requestScope.status == "unactive" ? "selected='selected'":""}>Unactive</option>
                        </select>
                        <span>Sort by</span>
                        <select name="sort" id="sort" class="form-control">
                            <option value="id" ${requestScope.sort == "id" ? "selected='selected'":""}>ID</option>
                            <option value="fullname" ${requestScope.sort == "fullname" ? "selected='selected'":""}>Full name</option>
                            <option value="gender" ${requestScope.sort == "gender" ? "selected='selected'":""}>Gender</option>
                            <option value="email" ${requestScope.sort == "email" ? "selected='selected'":""}>Email</option>
                            <option value="mobile" ${requestScope.sort == "mobile" ? "selected='selected'":""}>Mobile</option>
                            <option value="status" ${requestScope.sort == "status" ? "selected='selected'":""}>Status</option>
                        </select>
                        <select name="orderBy" id="orderBy" class="form-control">
                            <option value="asc" ${requestScope.orderBy == "asc" ? "selected='selected'":""}>Asc</option>
                            <option value="desc" ${requestScope.orderBy == "desc" ? "selected='selected'":""}>Desc</option>
                        </select>
                        <input type="text" id="search" name="search" value="${requestScope.search}" placeholder="Enter part of name, phone or email" style="width: 30rem" class="form-control"/>
                    </form>
                    <form action="addNewUser" method="get" style="margin: 0 2%;padding: 0;display: inline-block; float: right">
                        <input class="btn btn-primary" type="submit" value="Add new user">
                    </form>
                </div><!--/Search, add and filter user-->

                <!--Table list of user-->
                <div class="row ">
                    <div class="table-responsive">
                        <table class="table table-hover ">
                            <thead>
                                <tr>
                                    <th onclick="">Id</th>
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
                                            <a href="editUserProfile?id=${u.id}" style="text-decoration: none; color:white">
                                                <button type="button" class="btn btn-primary">
                                                    <i class="fa-solid fa-user-pen"></i>Edit
                                                </button>
                                                </a>
                                        </td>
                                    </tr>
                                </c:forEach>
                            </tbody>
                        </table>
                    </div><!--Table list of user-->
                </div> 
                <!--Pagging-->
                <div class="row">
                    <ul class="pagination">
                        <c:if test="${page > 2}"><li class="page-item"><a class="page-link" href="userList?xpage=${page -1}&gender=${gender}&status=${status}&roleId=${roleId}&search=${search}&sort=${sort}&orderBy=${orderBy}">Previous</a></li></c:if>
                            <c:forEach begin="1" end="${requestScope.totalPage}" var = "i">
                            <li class="page-item <c:if test="${page == i}"> active </c:if>" ><a class="page-link" href="userList?xpage=${i}&gender=${gender}&status=${status}&roleId=${roleId}&search=${search}&sort=${sort}&orderBy=${orderBy}">${i}</a></li>
                            </c:forEach>
                            <c:if test="${page < requestScope.totalPage - 1}"><li class="page-link" class="page-item"><a class="page-link" href="userList?xpage=${page+1}&gender=${gender}&status=${status}&roleId=${roleId}&search=${search}&sort=${sort}&orderBy=${orderBy}">Next</a></li></c:if>
                        </ul>
                    </div> <!--/Pagging-->
                </section>

            
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
            $('#sort').on('change', function () {
                this.form.submit();
            });
            $('#orderBy').on('change', function () {
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



    <!-- jQuery 2.0.2 -->
    <script src="http://ajax.googleapis.com/ajax/libs/jquery/2.0.2/jquery.min.js"></script>
    <script src="../js/jquery.min.js" type="text/javascript"></script>
    <!-- jQuery UI 1.10.3 -->
    <script src="../assets/js/jquery-ui-1.10.3.min.js" type="text/javascript"></script>
    <!-- Bootstrap -->
    <script src="../assets/js/bootstrap.min.js" type="text/javascript"></script>
    <!-- Director App -->
    <script src="../assets/js/Director/app.js" type="text/javascript"></script>
</body>
</html>
