<%-- 
    Document   : bloglist.jsp
    Created on : May 26, 2022, 8:54:44 AM
    Author     : DELL
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib  prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href="../../assets/public/css/bootstrap.min.css" rel="stylesheet">
        <link href="../../assets/public/css/font-awesome.min.css" rel="stylesheet">
        <link href="../../assets/public/css/prettyPhoto.css" rel="stylesheet">
        <link href="../../assets/public/css/price-range.css" rel="stylesheet">
        <link href="../../assets/public/css/animate.css" rel="stylesheet">
        <link href="../../assets/public/css/main.css" rel="stylesheet">
        <link href="../../assets/public/css/responsive.css" rel="stylesheet">
        <title>Blog Detail</title>
    </head>
    <body>
        <c:set var="blog" value="${requestScope.blog}"></c:set>
        <jsp:include page="../home-template/header.jsp"/>
        <input type="hidden" value="${requestScope.searchContent}" id="search-content"/>
        <section>
            <div class="container">
                <div class="row">
                    <div class="col-sm-3">
                        <div class="left-side"> <!-- left-sidebar -->
                            <h2 class="title text-center">Category</h2>
                            <input type="hidden" value="${requestScope.idCategory}" id="search-category"/>
                            <div class="panel-group category-products" id="accordian"><!--category-productsr-->
                                <div class="panel panel-default">
                                    <div class="panel-heading">
                                        <h4 class="panel-title"><a id="-1" href="#">All Category</a></h4>
                                    </div>
                                </div>
                                <c:forEach items="${requestScope.listAllCateogry}" var="i">
                                    <div class="panel panel-default">
                                        <div class="panel-heading">
                                            <h4 class="panel-title"><a id="${i.id}" href="#">${i.name}</a></h4>
                                        </div>
                                    </div>
                                </c:forEach>
                            </div><!--/category-products-->
                            <div class="panel-group category-products" id="accordian">
                                <h2 class="title text-center">Latest Posts</h2>
                                <c:if test="${requestScope.listLatestPost != null}">
                                    <c:forEach items="${requestScope.listLatestPost}" var="i">
                                        <div class="panel panel-default">
                                            <div class="col-sm-12">
                                                <div class="product-image-wrapper">
                                                    <div class="single-products">
                                                        <div class="productinfo text-center">
                                                            <a href="blogDetail?blogId=${i.id}">
                                                                <img src="${i.thumbnail}" alt="" />
                                                            </a>
                                                                <h2 class="break-down-line">${i.title}</h2>
                                                            <p class="break-down-line">${i.briefInfo}</p>
                                                            <a href="blogDetail?blogId=${i.id}" class="btn btn-default add-to-cart">Read more</a>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </c:forEach>
                                </c:if>
                            </div>
                        </div>                     
                    </div>
                    <div class="col-sm-9">
                        <div class="blog-post-area mb-20" ">
                            <h2 class="title text-center">Blog Detail</h2>
                            <div class="single-blog-post">
                                <h3>${blog.title}</h3>
                                <div class="post-meta">
                                    <ul>
                                        <li><i class="fa fa-user"></i>${blog.user.fullname}</li>
                                        <li><i class="fa fa-calendar"></i>${blog.date}</li>
                                        <li><i class="fa-solid fa-ballot"></i>${blog.postCategory.name}</li>
                                    </ul>
                                </div>
                                <a href="#">
                                    <img class="img-height-500" src="${blog.thumbnail}" alt="">
                                </a>
                                <c:forEach items="${requestScope.content}" var="c">
                                    <p>${c}</p>
                                </c:forEach>   
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </section>
        <input type="hidden" value="${requestScope.pageIndex}" id="search-page-index"/>
        <jsp:include page="../home-template/footer.jsp"/>
        <script src="../../assets/public/js/jquery.js"></script>
        <script src="../../assets/public/js/bootstrap.min.js"></script>
        <script src="../../assets/public/js/jquery.scrollUp.min.js"></script>
        <script src="../../assets/public/js/price-range.js"></script>
        <script src="../../assets/public/js/jquery.prettyPhoto.js"></script>
        <script src="../../assets/public/js/main.js"></script>
        <c:set var="searchContent" value="${requestScope.searchContent}"></c:set>
        <c:set var="searchContentCategory" value="${requestScope.category}"></c:set>
        <c:set var="pageIndex" value="${requestScope.page}"></c:set>
        <script src="../../assets/js/blog/bloglist.js"></script>
    </body>
</html>
