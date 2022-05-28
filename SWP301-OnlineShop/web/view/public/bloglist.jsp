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
        <jsp:include page="../home-template/header.jsp"/>
        <section>
            <div class="container">
                <div class="row">
                    <div class="col-sm-3">
                        <div class="left-sidebar">
                            <h2>Category</h2>
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

                        </div>
                    </div>
                    <div class="col-sm-9">
                        <div class="blog-post-area">
                            <h2 class="title text-center">Blog List</h2>
                            <c:forEach items="${requestScope.listPostFiltered}" var="i">
                                <div class="single-blog-post">
                                    <h3>${i.title}</h3>
                                    <div class="post-meta">
                                        <ul>
                                            <li><i class="fa fa-user"></i>Hieu</li>
                                            <!--<li><i class="fa fa-clock-o"></i> 1:33 pm</li>-->
                                            <li><i class="fa fa-calendar"></i>${i.date}</li>
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
                                        <img src="${i.thumbnail}" alt="">
                                    </a>
                                    <p>${i.briefInfo}</p>
                                    <a  class="btn btn-primary" href="">Read More</a>
                                </div>
                            </c:forEach>
                            
                            <div class="pagination-area">
                                <c:if test="${requestScope.totalPage >= 2}">
                                <ul class="pagination">
                                    <c:forEach var="i" begin="1" end="${requestScope.totalPage}">
                                        <li><a href="#" class="${(i == 1)? "active":""}">${i}</a></li>
                                    </c:forEach>
                                    <li><a id="next-page" href="#"><i class="fa fa-angle-double-right"></i></a></li>
                                </ul>
                                </c:if>
                            </div>
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
                    if (searchContentCategory) {
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
                            url += "&category=" + searchContentCategory;
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
