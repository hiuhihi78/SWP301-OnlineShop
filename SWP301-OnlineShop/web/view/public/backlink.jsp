<%-- 
    Document   : backlink
    Created on : Jun 13, 2022, 4:36:07 PM
    Author     : Admin
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib  prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix = "fmt" uri = "http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="utf-8">
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

        <link href="../../assets/public/css/style.css" rel="stylesheet">
        <title>Backlink | E-Shopper</title>
    </head>
    <body>
        <jsp:include page="../home-template/header.jsp"/>
        <div >
        <div style="margin: 0 auto; width: 80%;">
        <img src="../../assets/img/backlink1.jpg"/>
        <div class="brands_product "> 
                            <!--products_featured-->
                            <h2 class="title text-center">Product Sale</h2>
                            <c:forEach items="${listProduct}" var="i">
                                <div class="col-sm-4">
                                    <div class="product-image-wrapper">
                                        <div class="single-products">
                                            <div class="productinfo text-center">
                                                <a href="#${i.id}">
                                                    <img class="img-height-255" src="${i.thumbnail}" alt="" />
                                                </a>
                                                <h2 class="break-down-line">${i.name}</h2>
                                                <p>
                                                    <span class="text-line-through">
                                                        <fmt:formatNumber  maxFractionDigits = "3" type = "currency" value = "${i.price}"/>
                                                    </span>
                                                    <span class="text-danger">
                                                        <fmt:formatNumber  maxFractionDigits = "3" type = "currency" value = "${i.price - (i.price*i.discount/100)}"/>
                                                    </span>
                                                </p>
                                                <a href="productdetails?productID=${i.id}" class="btn btn-default add-to-cart">Show</a>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </c:forEach>
                        </div>
        </div>
             </div>
    </body>
</html>
