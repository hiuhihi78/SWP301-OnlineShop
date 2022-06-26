<!DOCTYPE html>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib  prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix = "fmt" uri = "http://java.sun.com/jsp/jstl/fmt" %>
<html lang="en">

    <head>
        <meta charset="UTF-8">
        <title>Product List</title>
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href="../../assets/public/css/bootstrap.min.css" rel="stylesheet">
        <link href="../../assets/public/css/font-awesome.min.css" rel="stylesheet">
        <link href="../../assets/public/css/prettyPhoto.css" rel="stylesheet">
        <link href="../../assets/public/css/price-range.css" rel="stylesheet">
        <link href="../../assets/public/css/animate.css" rel="stylesheet">
        <link href="../../assets/public/css/main.css" rel="stylesheet">
        <link href="../../assets/public/css/responsive.css" rel="stylesheet">
        <!-- font Awesome -->
        <link href="../assets/css/font-awesome.min.css" rel="stylesheet" type="text/css" />
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.1.1/css/all.min.css" integrity="sha512-KfkfwYDsLkIlwQp6LFnl8zNdLGxu9YAA1QvwINks4PhcElQSvqcyVLLD9aMhXd13uQjoXtEKNosOWaZqXgel0g==" crossorigin="anonymous" referrerpolicy="no-referrer" />
        <link href="../../assets/public/css/style.css" rel="stylesheet">
        <link href="../../assets/css/admin/feedback.css" rel="stylesheet">
    </head>
    <!--/head-->

    <body>
        <c:set var="orderInfor" value="${requestScope.informationOrder}"/>
        <c:set var="userBuyInfor" value="${requestScope.userOrderInfioramtion}"/>
        <jsp:include page="../home-template/headerProductlist.jsp"/>
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
        <section>
            <div class="container">
                <div class="row flex-justify">
                    <jsp:include page="../home-template/sidebarForProductList.jsp"/>
                    <!--PRODUCT LIST-->
                    <div class="col-sm-9 padding-right">
                        <div class="features_items">
                            <!--features_items-->
                            <h2 class="title text-center" style="border-bottom: solid 2px; margin-top: 10px">Order Information</h2>
                            <section class="panel">

                                <div class="panel-body">

                                    <div class="row">

                                        <div class="col-md-6 form-group">
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
                                                <label> Status: </label>

                                                <c:if test="${orderInfor.status == 0}">
                                                <td><span class="label label-danger">Cancelled</span></td>
                                            </c:if>
                                            <c:if test="${orderInfor.status == 1}">
                                                <td><span class="label label-success">Submitted</span></td>
                                            </c:if>
                                            <c:if test="${orderInfor.status == 2}">
                                                <td><span class="label label-success">Processing</span></td>
                                            </c:if>
                                            <c:if test="${orderInfor.status == 3}">
                                                <td><span class="label label-success">Shipping</span></td>
                                            </c:if>
                                            <c:if test="${orderInfor.status == 4}">
                                                <td><span class="label label-success">Completed</span></td>
                                            </c:if>
                                            </p>

                                        </div>

                                        <div class="col-md-6 form-group">
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

                                        <div class="col-md-12 form-group">
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
                            <div class="row" >
                                <div class="col-md-6 pull-left" >
                                    <c:if test="${orderInfor.status == 1}">
                                        <a  href="#" onclick="deleteStudent(${orderInfor.id})"  class="btn btn-info"> Feedback </a>
                                        <a  href="#" onclick="deleteStudent(${orderInfor.id})"  class="btn btn-info"> Rebuy </a>
                                    </c:if>
                                </div>
                                <div class="col-md-6 pull-right ">
                                    <c:if test="${orderInfor.status == 1}">
                                        <a  href="#" onclick="deleteStudent(${orderInfor.id})"  class="btn btn-info"> Update </a>
                                        <a  href="#" onclick="deleteStudent(${orderInfor.id})"  class="btn btn-info"> Cancel </a>
                                    </c:if>
                                    <a href="../myorders"  class="btn btn-danger ">Back</a>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>

            </div>

        </section>

        <jsp:include page="../home-template/footer.jsp"/>
        <script>
            function deleteStudent(id) {
                var result = confirm("Are you sure to cancel this order?");
                if (result) {
                    window.location.href = "cancelOrder?orderID=" + id
                }
            }
            setTimeout(function () {
                const element = document.getElementById('showAlter');
                element.remove();
            }, 3000);
        </script>
        <script src="../../assets/js/home/productList.js"></script>
        <script src="../../assets/public/js/jquery.js"></script>
        <script src="../../assets/public/js/bootstrap.min.js"></script>
        <script src="../../assets/public/js/jquery.scrollUp.min.js"></script>
        <script src="../../assets/public/js/price-range.js"></script>
        <script src="../../assets/public/js/jquery.prettyPhoto.js"></script>
        <script src="../../assets/public/js/main.js"></script>
        <script src="../../assets/js/home/home.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-validate/1.19.4/jquery.validate.min.js" integrity="sha512-FOhq9HThdn7ltbK8abmGn60A/EMtEzIzv1rvuh+DqzJtSGq8BRdEN0U+j0iKEIffiw/yEtVuladk6rsG4X6Uqg==" crossorigin="anonymous" referrerpolicy="no-referrer"></script>
    </body>

</html>