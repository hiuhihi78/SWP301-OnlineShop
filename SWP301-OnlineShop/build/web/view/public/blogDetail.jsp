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
        <title>Blog List | E-Shopper</title>
    </head>
    <body>
        <c:set var="blog" value="${requestScope.blog}"></c:set>
        <jsp:include page="../home-template/header.jsp"/>
        <section>
            <div class="container">
                <div class="row">
                    <div class="col-sm-3">
                        <div class="left-side"> <!-- left-sidebar -->
                            <h2 class="title text-center">Category</h2>
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
                                <c:if test="${requestScope.listHotPost != null}">
                                    <c:forEach items="${requestScope.listHotPost}" var="i">
                                        <div class="panel panel-default">
                                            <div class="col-sm-12">
                                                <div class="product-image-wrapper">
                                                    <div class="single-products">
                                                        <div class="productinfo text-center">
                                                            <a href="#">
                                                                <img src="${i.thumbnail}" alt="" />
                                                            </a>
                                                            <h2>${i.title}</h2>
                                                            <p>${i.briefInfo}</p>
                                                            <a href="#" class="btn btn-default add-to-cart">Show</a>
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
                        <div class="blog-post-area" style="margin-bottom: 20px;">
                            <h2 class="title text-center">Blog Detail</h2>
                            <div class="single-blog-post">
                                <h3>${blog.title}</h3>
                                <div class="post-meta">
                                    <ul>
                                        <li><i class="fa fa-user"></i>${blog.user.fullname}</li>
                                        <li><i class="fa fa-calendar"></i>${blog.date}</li>
                                        <li><i class="fa-solid fa-ballot"></i>${blog.postCategory.name}</li>
                                    </ul>
                                    <span>
                                        <i class="fa fa-star"></i>
                                        <i class="fa fa-star"></i>
                                        <i class="fa fa-star"></i>
                                        <i class="fa fa-star"></i>
                                        <i class="fa fa-star-half-o"></i>
                                    </span>
                                </div>
                                <a href="">
                                    <img src="${blog.thumbnail}" alt="">
                                </a>
                                <c:forEach items="${requestScope.content}" var="c">
                                    <p>${c}</p>
                                </c:forEach>   
                            </div>
                        </div>-->
                        </div>
                    </div>
                </div>
            </div>
        </section>
        <jsp:include page="../home-template/footer.jsp"/>
        <script src="../../assets/public/js/jquery.js"></script>
        <script src="../../assets/public/js/bootstrap.min.js"></script>
        <script src="../../assets/public/js/jquery.scrollUp.min.js"></script>
        <script src="../../assets/public/js/price-range.js"></script>
        <script src="../../assets/public/js/jquery.prettyPhoto.js"></script>
        <script src="../../assets/public/js/main.js"></script>
        <script>
            var searchContent = `${requestScope.searchContent}`;
            var searchContentCategory = `${requestScope.category}`;
            var pageIndex = ${requestScope.page};

            var categories = document.querySelectorAll('.panel.panel-default .panel-heading .panel-title a');
            console.log(categories);

            // search box
            $("#search-box").on('keyup', function (e) {
                var search = document.querySelector('#search-box').value;
                if (e.key === 'Enter' || e.keyCode === 13) {
                    var url = "bloglist?search=" + search;
                    if (searchContentCategory != -1) {
                        url += "&category=" + searchContentCategory;
                    }
                    window.location.href = url;
                }
            });

            // handle box search
            function handleAttributeBoxSearch(content) {
                if (content) {
                    document.querySelector('#search-box').setAttribute('value', content);
                } else {
                    document.querySelector('#search-box').setAttribute('placeholder', 'Search post');
                }
            }

            //handle category
            function handleCategory() {
                for (var i = 0; i < categories.length; i++) {
                    categories[i].onclick = function (e) {
                        var category = e.target.id;
                        var url = "bloglist?category=" + category;
                        if (category == -1) {
                            url = "bloglist";
                        }
//                        if (searchContent) {
//                            url += "&search=" + searchContent;
//                        }
                        window.location.href = url;
                    };
                }
            }


            $("#next-page").on('click', function () {
                var paging = document.querySelectorAll('.pagination li a');
                for (var i = 0; i < paging.length - 2; i++) {
                    if (paging[i].className.includes("active")) {
                        var indexNextPage = i + 1;
//                        paging[i].classList.remove("active");
//                        paging[indexNextPage].classList.add("active");
                        var url = "bloglist?page=" + paging[indexNextPage].innerHTML;
                        if (searchContentCategory) {
                            if (searchContentCategory != -1) {
                                url += "&category=" + searchContentCategory;
                            }
                        }
                        if (searchContent) {
                            url += "&search=" + searchContent;
                        }

                        window.location.href = url;
                        break;
                    }
                }
            });

            function setActivePaging(page) {
                var paging = document.querySelectorAll('.pagination li a');
                for (var i = 0; i < paging.length - 2; i++) {
                    if (paging[i].className.includes("active")) {
                        paging[i].classList.remove("active");
                        paging[page - 1].classList.add("active");
                        break;
                    }
                }
            }

            function handlePaging() {
                var paging = document.querySelectorAll('.pagination li a');
                for (var i = 0; i < paging.length - 1; i++) {
                    paging[i].onclick = function (e) {
//                        document.querySelector('.pagination li a.active').classList.remove('active');
//                        e.target.classList.add('active');
                        var url = "bloglist?page=" + e.target.innerHTML;
                        if (searchContentCategory) {
                            url += "&category=" + searchContentCategory;
                        }
                        if (searchContent) {
                            url += "&search=" + searchContent;
                        }

                        window.location.href = url;
                    };
                }
            }
//            handlePaging();
//            setActivePaging(${requestScope.page});
//            handleAttributeBoxSearch(`${requestScope.searchContent}`);
//            handleCategory();
            function app(page, searchContent) {
                handlePaging();
                setActivePaging(page);
                handleAttributeBoxSearch(searchContent);
                handleCategory();
            }
            app(${requestScope.page}, `${requestScope.searchContent}`);
        </script>
    </body>
</html>
