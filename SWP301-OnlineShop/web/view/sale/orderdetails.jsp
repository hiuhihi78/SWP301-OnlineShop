<%-- 
    Document   : productList
    Created on : Jun 6, 2022, 7:48:57 AM
    Author     : Admin
--%>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix = "fmt" uri = "http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
    <head>  
        <meta charset="UTF-8">
        <title>Sale | Orders list</title>
        <meta content='width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no' name='viewport'>
        <meta name="description" content="Developed By M Abdur Rokib Promy">
        <meta name="keywords" content="Admin, Bootstrap 3, Template, Theme, Responsive">
        <!-- bootstrap 3.0.2 -->
        <link href="../assets/css/bootstrap.min.css" rel="stylesheet" type="text/css" />
        <!-- font Awesome -->
        <link href="../assets/css/font-awesome.min.css" rel="stylesheet" type="text/css" />

        <!-- Theme style -->
        <link href="../assets/css/style.css" rel="stylesheet" type="text/css" />
        <!--css-->
        <link href="../../assets/css/admin/userList.css" rel="stylesheet" type="text/css"/>
        <link href="../../assets/css/cart/main.css" rel="stylesheet" type="text/css"/>
        <link rel="stylesheet" href="https://unpkg.com/bootstrap-table@1.20.2/dist/bootstrap-table.min.css">

        <!--active button nav in sidebar-->

        <script src="https://cdn.jsdelivr.net/npm/jquery@3.6.0/dist/jquery.slim.min.js"></script>
        <link rel="stylesheet" type="text/css" href="https://cdn.jsdelivr.net/npm/daterangepicker/daterangepicker.css" />
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.1.1/css/all.min.css" integrity="sha512-KfkfwYDsLkIlwQp6LFnl8zNdLGxu9YAA1QvwINks4PhcElQSvqcyVLLD9aMhXd13uQjoXtEKNosOWaZqXgel0g==" crossorigin="anonymous" referrerpolicy="no-referrer" />
    </head>
    <body class="skin-black">

        <!-- header logo: style can be found in header.less -->
        <jsp:include page="../sale-template/header.jsp"></jsp:include>
            <div class="wrapper row-offcanvas row-offcanvas-left">
                <!-- Left side column. contains the logo and sidebar -->
            <jsp:include page="../sale-template/sideBar.jsp"></jsp:include>
                <aside class="right-side">
                <c:set var="orderInfor" value="${requestScope.informationOrder}"/>
                <c:set var="userBuyInfor" value="${requestScope.userOrderInfioramtion}"/>
                <c:if test="${requestScope.alter != null}">
                    <div class="fixed float-end t-55px" id="showAlter" style="    width: 21%;
                         z-index: 1024;
                         right: 36%;
                         top: 6%;
                         position: fixed;
                         ">
                        <div class="alert alert-success alert-dismissible fade in" id="alterfade">
                            <a href="#" class="close" data-dismiss="alert" aria-label="close" style="transform: rotate(90deg); top: 8%;">&times;</a>
                            ${requestScope.alter}
                        </div>
                    </div>
                </c:if>
                <!-- Main content -->
                <section class="content ">
                    <div class ="row d-flex justify-content-center">
                        <h2 class="title text-center">Order Information</h2>
                    </div>
                    <div class="mg-10px" id="toolBar">
                        <label>Action: </label>
                        <button type="button" class="btn btn-info" data-orderid="${orderInfor.id}" data-toggle="modal" data-target="#myModal">Update order status</button>
                        <button type="button" class="btn btn-info">Update note</button>
                    </div>
                    <section class="panel">
                        <div class="panel-body">

                            <div class="row">

                                <div class="col-md-4">
                                    <p>
                                        <label>ID Order: </label>
                                        <span>${orderInfor.id}</span> 
                                    </p>
                                    <p>
                                        <label> Order Date: </label>
                                        <span>${orderInfor.date}</span> 
                                    </p>
                                    <p>
                                        <label> Total: </label>
                                        <span><fmt:formatNumber  maxFractionDigits = "3" type = "currency" value = "${orderInfor.totalcost}"/></span> 
                                    </p>
                                    <p>
                                        <label> Assigned for sale: </label>
                                        <c:if test="${orderInfor.sale.id == sessionScope.user.id}">
                                            <span>${orderInfor.sale.fullname} (You)</span>
                                        </c:if>
                                        <c:if test="${orderInfor.sale.id != sessionScope.user.id}">
                                            <span>${orderInfor.sale.fullname}</span>
                                        </c:if> 
                                    </p>
                                    <p>
                                        <label> Status: </label>
                                        <c:if test="${orderInfor.status == 0}">
                                        <td id="tblStatus">
                                            <span class="label label-default">Cancelled</span>
                                        </td>
                                    </c:if>
                                    <c:if test="${orderInfor.status == 1}">
                                        <td id="tblStatus">
                                            <span class="label label-warning">Waiting for process</span>
                                        </td>
                                    </c:if>
                                    <c:if test="${orderInfor.status == 2}">
                                        <td id="tblStatus">
                                            <span class="label label-info">Processing</span>
                                        </td>
                                    </c:if>
                                    <c:if test="${orderInfor.status == 3}">
                                        <td id="tblStatus">
                                            <span class="label label-primary">Shipping</span>
                                        </td>
                                    </c:if>
                                    <c:if test="${orderInfor.status == 4}">
                                        <td id="tblStatus">
                                            <span class="label label-success">Completed</span>
                                        </td>
                                    </c:if>
                                    </p>

                                </div>

                                <div class="col-md-4">
                                    <p>
                                        <label>Full Name: </label>
                                        <span> ${userBuyInfor.fullname}</span> 
                                    </p><p>
                                        <label> Gender: </label>
                                        <span> ${userBuyInfor.gender == true ? "Male" : "Female"}</span> 
                                    </p>
                                    <p>
                                        <label>Email: </label>
                                        <span> ${userBuyInfor.email}</span> 
                                    </p><p>
                                        <label> Mobile: </label>
                                        <span> ${userBuyInfor.mobile} </span> 
                                    </p>
                                </div>
                                <div class="col-md-4">
                                    <div class="form-group">
                                        <label>Customer note:</label>
                                        <textarea class="form-control rounded-0" id="exampleFormControlTextarea2" rows="3" disabled>${orderInfor.customernote}</textarea>
                                    </div>
                                    <div class="form-group">
                                        <label>Sale note:</label>
                                        <textarea class="form-control rounded-0" id="exampleFormControlTextarea2" rows="3" disabled>${orderInfor.salenote}</textarea>
                                    </div>
                                </div>
                                <div class="col-md-12">
                                    <div class="panel-body table-responsive">
                                        <table class="table table-hover">
                                            <thead>
                                                <tr>
                                                    <th>Thumbnail</th>
                                                    <th>Product Name</th>
                                                    <th>Category</th>
                                                    <th>Unit Price</th>
                                                    <th>Quantity</th>
                                                </tr>
                                            </thead>
                                            <tbody>
                                                <c:forEach items="${requestScope.listOrderProductOfUser}" var="listOrder">
                                                    <tr>
                                                        <td>
                                                            <div style="height: 100px; width: fit-content">
                                                                <img style="width: 100%; height: 100%; object-fit: contain" src="${listOrder.thumbnail}" alt="alt"/>
                                                            </div>
                                                        </td>
                                                        <td>${listOrder.name}</td>
                                                        <td>${listOrder.subCategory.category.name}</td>
                                                        <td><fmt:formatNumber  maxFractionDigits = "3" type = "currency" value = "${listOrder.getUnitPrice()}"/></td>
                                                        <td>${listOrder.quantity}</td>
                                                    </tr>
                                                </c:forEach>
                                            </tbody>
                                        </table>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </section>
                    </div>

                    <!-- Modal -->
                    <div id="myModal" class="modal fade" role="dialog">
                        <div class="modal-dialog">
                            <!-- Modal content-->
                            <div class="modal-content">
                                <div class="modal-header">
                                    <button type="button" class="close" data-dismiss="modal">&times;</button>
                                    <h4 class="modal-title">Edit order status</h4>
                                </div>
                                <div class="modal-body">
                                    <form>
                                        <div class="form-group">
                                            <label>Status: </label>
                                            <select name="status-filter" id="statusorder" class="form-control">
                                                <option value="" selected disabled hidden>Please set a status</option>
                                                <option value="0" ${param["status-filter"] == 0 ? "selected" : ""}>Cancelled</option>
                                                <option value="1" ${param["status-filter"] == 1 ? "selected" : ""}>Waiting for process</option>
                                                <option value="2" ${param["status-filter"] == 2 ? "selected" : ""}>Processing</option>
                                                <option value="3" ${param["status-filter"] == 3 ? "selected" : ""}>Shipping</option>
                                                <option value="4" ${param["status-filter"] == 4 ? "selected" : ""}>Completed</option>
                                            </select>
                                        </div> 
                                        <div class="form-group" id="txtAreaReason">
                                            <label>Please enter the reason:</label>
                                            <textarea class="form-control rounded-0" id="exampleFormControlTextarea2" rows="5"></textarea>
                                        </div>
                                    </form>
                                </div>
                                <div class="modal-footer">
                                    <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
                                    <button id ="btnConfirmProcessOrder" type="button" class="btn btn-primary" data-dismiss="modal">Confirm</button>
                                </div>
                            </div>

                        </div>
                    </div>
                </section> <!--/ Main content -->
            </aside><!-- /.right-side -->
        </div>
        <!--javascrip-->
        <script src="../../assets/js/marketing/productList.js"></script>
        <script src="../../assets/js/admin/main.js"></script>
        <!-- jQuery 2.0.2 -->
        <script src="http://ajax.googleapis.com/ajax/libs/jquery/2.0.2/jquery.min.js"></script>
        <!-- jQuery UI 1.10.3 -->
        <script src="../../assets/js/jquery-ui-1.10.3.min.js" type="text/javascript"></script>
        <!-- Bootstrap -->
        <script src="../../assets/js/bootstrap.min.js" type="text/javascript"></script>
        <!-- Director App -->
        <script src="../../assets/js/Director/app.js" type="text/javascript"></script>
        <script src="https://unpkg.com/bootstrap-table@1.20.2/dist/bootstrap-table.min.js"></script>
        <script type="text/javascript" src="https://cdn.jsdelivr.net/momentjs/latest/moment.min.js"></script>
        <script type="text/javascript" src="https://cdn.jsdelivr.net/npm/daterangepicker/daterangepicker.min.js"></script>
    </body>
</html>
