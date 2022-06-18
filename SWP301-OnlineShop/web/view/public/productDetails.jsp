<%@page import="model.Image"%>
<%@page import="model.Product"%>
<%@page import="java.util.ArrayList"%>
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
        

               <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
        <!--active button nav in sidebar-->
        
        <%
            ArrayList<Image> attchedImg = ((Product) request.getAttribute("productInfomation")).getImage();
            if (attchedImg == null || attchedImg.size() == 0) {
                Image image = new Image();
                image.setImage("#");
                attchedImg.add(image);
                attchedImg.add(image);
            }
        %>
    </head>
    <!--/head-->

    <body>
        <c:set value="${requestScope.productInfomation}" var="product"/>
        <jsp:include page="../home-template/headerProductlist.jsp"/>
        <section>
            <div class="container">
                <div class="row flex-justify">
                    <div class="col-sm-3 box-shadow height-fit-content border-radius-2" >
                        <div class="left-side"> <!-- left-sidebar -->
                            <h2 class="title text-center " style="border-bottom: solid 2px; margin-top: 10px;">Category</h2>
                           <form action="productlist" method="get">
                                <div class="panel-group category-products" id="accordian"><!--category-products-->
                                    <div class="panel panel-default">
                                        <div class="panel-heading">

                                            <div class="search_box">
                                                <!--<input id="search-box" type="text" placeholder="Search..." name="searchBy" value="${requestScope.searchBy}">-->
                                                 <input type="text" name="searchBy" value="${requestScope.searchBy}"  placeholder="Search"/>
                                            </div>
                                        </div>
                                        <div class="panel-heading">
                                            <h4 class="panel-title">
                                                <a href="productlist">
                                                    <span class="badge pull-right"></span>
                                                    All Category
                                                </a>
                                            </h4>
                                        </div>
                                    </div>
                                    <c:forEach items="${requestScope.listCategorys}" var="list">
                                        <c:if test="${ not empty list.listSubCategory }"> <!-- check empty of list subcategory with that category -->
                                            <div class="panel panel-default">
                                                <div class="panel-heading">
                                                    <h4 class="panel-title">

                                                        <a data-toggle="collapse" data-parent="#accordian" href="#${list.id}">
                                                            <span class="badge pull-right"><i class="fa fa-plus"></i></span>
                                                                ${list.name}
                                                        </a>
                                                    </h4>
                                                </div>
                                                <div id="${list.id}" class="panel-collapse collapse">
                                                    <div class="panel-body">
                                                        <ul>
                                                            <c:forEach items="${list.listSubCategory}" var="listSub">
                                                                <li><a href="productlist?subCategory=${listSub.id}&searchBy=${searchBy}">${listSub.name} </a></li> 
                                                                </c:forEach>
                                                        </ul>
                                                    </div>
                                                </div>
                                            </div>
                                        </c:if>
                                    </c:forEach>
                                </div><!--/category-products-->    
                            </form>

                            <div class="panel-group category-products" id="accordian"><!-- 3 least product -->
                                <h2 class="title text-center" style="border-bottom: solid 2px;">Latest Product</h2>
                                <%--<c:set var="leat" value="" />--%>
                                <c:if test="${requestScope.leastProduct != null}">
                                    <c:forEach items="${requestScope.leastProduct}" var="leastProduct">
                                        <div class="product-image-wrapper">
                                            <div class="single-products">
                                                <div class="productinfo text-center">
                                                    <a href="productdetails?productID=${leastProduct.id}">
                                                        <img src="${leastProduct.thumbnail}" alt="" />
                                                    </a>
                                                    <h2 class="break-down-line">${leastProduct.name}</h2>
                                                    <p class="break-down-line">${leastProduct.description}</p>
                                                    <p>
                                                        <span class="text-line-through">
                                                            <fmt:formatNumber  maxFractionDigits = "3" type = "currency" value = "${leastProduct.price}"/>
                                                        </span>
                                                        <span class="text-danger">
                                                            <fmt:formatNumber  maxFractionDigits = "3" type = "currency" value = "${leastProduct.priceDiscount}"/>
                                                        </span>
                                                    </p>
                                                    <a href="productdetails?productID=${leastProduct.id}" class="btn btn-default add-to-cart">More Information</a>
                                                </div>
                                            </div>
                                        </div>
                                    </c:forEach>
                                </c:if>
                            </div><!-- end two least product --> 
                        </div>                     
                    </div>
                    <!--PRODUCT DETAILS-->
                    <div class="col-sm-9 padding-right">

                        <h2 class="title text-center" style="border-bottom: solid 2px;">Product Details</h2>
                        <div class="product-details"><!--product-details-->
                            <div class="col-sm-6">
                                <!--thumbnail-->
                                <div id="myCarousel" class="carousel slide" data-ride="carousel">
                                            <!-- Indicators -->
                                            <ol class="carousel-indicators">
                                                <li data-target="#myCarousel" data-slide-to="0" class="active"></li>
                                                <li data-target="#myCarousel" data-slide-to="1"></li>
                                                <li data-target="#myCarousel" data-slide-to="2"></li>
                                            </ol>

                                            <!-- Wrapper for slides -->
                                        <div class="carousel-inner">
                                            <div class="item active">
                                                <img src="${requestScope.productInfomation.thumbnail}" alt="thumbnail" style="height: 350px; width: 120%; object-fit: cover;">
                                            </div>
                                            <div class="item">
                                                 <img src="<%= attchedImg.get(1).getImage()%>" alt="thumbnail" style="height: 350px; width: 120%; object-fit: cover;">
                                            </div>
                                            <div class="item">
                                                <img src="<%= attchedImg.get(0).getImage()%>" alt="thumbnail" style="height: 350px; width: 124530%; object-fit: cover;">
                                            </div>
                                        </div>

                                        <!-- Left and right controls -->
                                        <a class="left carousel-control" href="#myCarousel" data-slide="prev">
                                            <span class="glyphicon glyphicon-chevron-left"></span>
                                            <span class="sr-only">Previous</span>
                                        </a>
                                        <a class="right carousel-control" href="#myCarousel" data-slide="next">
                                            <span class="glyphicon glyphicon-chevron-right"></span>
                                            <span class="sr-only">Next</span>
                                        </a>
                                    </div>

                            </div>
                            <!--Information here-->
                            <div class="col-sm-6">
                                <div class="product-information"><!--/product-information-->
                                   
                                    <h2><b>${product.name}</b></h2>
                                                            

                                    <p>
                                        <label>Seller: </label>
                                        <span> ${product.user.fullname}</span> 
                                    </p>
                                    <p> 
                                        <label>Description: </label>
                                        <span> ${product.description}</span> 
                                    </p>
                                    <p>
                                        <label>Price: </label>
                                        <span class="text-line-through">
                                            <fmt:formatNumber  maxFractionDigits = "3" type = "currency" value = "${product.price}"/>
                                        </span>
                                        <span class="text-danger">
                                            <fmt:formatNumber  maxFractionDigits = "3" type = "currency" value = "${product.priceDiscount}"/>
                                        </span>
                                    </p>
                                    <p> <label>Total Quantity: ${product.quantity}</label> </p>
                                    <div class="row">
                                        <div class="col-sm-12">
                                            <p> 
                                                <label>Choice Your Quantity: </label>
                                                <input type="number" id="quantityOrder" name="quantityOrder" style="width: 4em;"  class="chose-quantity"
                                                       min="1" max="${product.quantity}" value = "1" required>
                                            </p>
                                            <button  style="width: 10em; " class="form-control add-to-cart" onclick="addToCartFunction();" >
                                                <i class="fa fa-shopping-cart"></i>
                                                Add to cart
                                            </button>
                                                
                                        </div>
                                    </div><!-- comment -->
                                </div><!--/product-information-->
                            </div>
                        </div>

                        <c:if test="${not empty requestScope.listFeedbacks }">
                            <!-- FEEDBACK -->
                            <h2 class="title text-center" style="border-bottom: solid 2px; margin-top: 10px">Feedback</h2>
                            <div class="category-tab shop-details-tab">
                                <div class="tab-pane fade active in" id="reviews">
                                    <c:forEach items="${requestScope.listFeedbacks}" var="feedback">
                                        <div class="feedback-detail">
                                            <div class="feedback-detail__avatar">
                                                <div class="customer-avatar">
                                                    <div class="customer-avatar__placeholder">
                                                        <c:if test="${feedback.user.avatar == null}">
                                                            <img class="customer-avatar__img" src="../assets/img/defaultUserAvatar.png" style="width: 40px;height: 40px">
                                                        </c:if>
                                                        <c:if test="${feedback.user.avatar != null}">
                                                            <img class="customer-avatar__img" src="${feedback.user.avatar}" style="width: 40px;height: 40px">
                                                        </c:if>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="feedback-detail__main">
                                                <div class="feedback-detail__author-name">
                                                    ${feedback.user.fullname}
                                                </div>
                                                <div class="repeat-purchase-con">
                                                    <div class="feedback-detail__rating">
                                                        <c:forEach begin="0" end="${feedback.start}">
                                                            <span style=" font-size: 20px; color: #ffe500; opacity: 1; transform: rotateX(0deg);text-shadow: 0 0 30px #ffc;">★</span>
                                                        </c:forEach>
                                                    </div>
                                                    <div class="feedback-detail__time">
                                                        ${feedback.date}
                                                    </div>
                                                </div>
                                                <div class="feedback-detail__comment">
                                                    <div >${feedback.comment}</div>
                                                </div>
                                                <div class="rating-media-list">
                                                    <div class="rating-media-list__container">
                                                        <c:forEach items="${feedback.image}" var="image">
                                                            <div class="rating-media-list__image-wrapper">
                                                                <img class="feedback-img" src="${image.image}" alt="he" onclick="openFeedbackImg(${feedback.id})"/>
                                                            </div>
                                                        </c:forEach>
                                                    </div>
                                                    <div id="feedback-img-zoom-${feedback.id}" style="width: 50%;"></div>
                                                </div>
                                            </div>
                                        </div>
                                    </c:forEach>
                                    </div>
                                </div>
                            </div>
                        </div>                
                            <div class="pagging" style="clear: both">
                                <ul class="pagination pull-right">
                                    <c:if test="${requestScope.totalpage > 1}">
                                        <li><a href="productdetails?page=1&productID=${product.id}">Frist</a></li>
                                        </c:if>
                                        <c:forEach begin="1" end="${requestScope.totalpage}" var="page">
                                        <li class="${pageindex == page ? "active =" : ""}" ><a href="productdetails?page=${page}&productID=${product.id}">${page}</a></li>    
                                        </c:forEach>
                                        <c:if test="${requestScope.totalpage > 1}">
                                        <li><a href="productdetails?page=${requestScope.totalpage}&productID=${product.id}">Last</a></li>
                                        </c:if>
                                </ul>
                            </div>
                            <!--/END FEEDBACK-->
                        </c:if>
                        <c:if test="${empty requestScope.listFeedbacks}">
                            <!-- FEEDBACK -->
                            <h2 class="title text-center" style="border-bottom: solid 2px; margin-top: 10px">Feedback</h2>
                            <div style="text-align: center;">
                                <b>This Product Have No Feedback</b>
                            </div>
                            <!--/END FEEDBACK-->
                        </c:if>
                    </div>
                    <!--END PRODCUT DETAILS-->
                    <div id="add-to-cart-alter"></div>
                    <input type="hidden" id="customerId" value="${sessionScope.user.id}">
                    <input type="hidden" id="productId" value="${product.id}">
        </section>
                                
                                            
        
                                               
                                                
        <script language="JavaScript" type="text/javascript">
            
          
        </script>
        <jsp:include page="../home-template/footer.jsp"/>
        
        
        <script src="../../assets/js/home/productDetail.js"></script>
        <script src="../../assets/public/js/jquery.js"></script>
        <script src="../../assets/public/js/bootstrap.min.js"></script>
        <script src="../../assets/public/js/jquery.scrollUp.min.js"></script>
        <script src="../../assets/public/js/price-range.js"></script>
        <script src="../../assets/public/js/jquery.prettyPhoto.js"></script>
        <script src="../../assets/js/home/home.js"></script>
    </body>

</html>