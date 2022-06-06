<%-- 
    Document   : productList
    Created on : Jun 6, 2022, 7:48:57 AM
    Author     : Admin
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>  
        <meta charset="UTF-8">
        <title>Marketing | Produt list</title>
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
        <link href="../../assets/css/admin/main.css" rel="stylesheet" type="text/css"/>

        <!--active button nav in sidebar-->

        <script src="https://cdn.jsdelivr.net/npm/jquery@3.6.0/dist/jquery.slim.min.js"></script>
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.1.1/css/all.min.css" integrity="sha512-KfkfwYDsLkIlwQp6LFnl8zNdLGxu9YAA1QvwINks4PhcElQSvqcyVLLD9aMhXd13uQjoXtEKNosOWaZqXgel0g==" crossorigin="anonymous" referrerpolicy="no-referrer" />
    </head>
    <body class="skin-black">
        <!-- header logo: style can be found in header.less -->
        <jsp:include page="../marketing-template/header.jsp"></jsp:include>
            <div class="wrapper row-offcanvas row-offcanvas-left">
                <!-- Left side column. contains the logo and sidebar -->
            <jsp:include page="../marketing-template/sideBar.jsp"></jsp:include>
            <!-- Right side. contains main content -->
            <aside class="right-side">
                <!-- Main content -->
                <section class="content ">
                    <!--Search, add and filter product-->
                    <div class="row d-flex mb-10">
                        <!--form filter-->
                        <form action="" method="POST" class="w-70-percent foat-l">

                        </form><!-- /form filter-->
                        <!--form add new prodct-->
                        <form action="addproduct" method="get"  class="m-0-2percent padding-0 float-r display-inline-block">
                            <input class="btn btn-primary" type="submit" value="Add new Product">
                        </form>
                    </div><!--/Search, add and filter user-->

                    <!--Table list of product-->
                    <div class="row ">
                        <div class="table-responsive">
                            <table class="table table-hover ">
                                <thead>

                                </thead>
                                <tbody>

                                </tbody>
                            </table>
                        </div>
                    </div><!-- /Table list of product-->

                    <!--Pagging-->
                    <div class="row">

                    </div> <!-- / Pagging-->

                </section> <!--/ Main content -->
            </aside><!-- /.right-side -->
        </div>

        <!--javascrip-->
        <script src="../../assets/js/marketing/productList.js"></script>
        <!-- jQuery 2.0.2 -->
        <script src="http://ajax.googleapis.com/ajax/libs/jquery/2.0.2/jquery.min.js"></script>
        <script src="../../js/jquery.min.js" type="text/javascript"></script>
        <!-- jQuery UI 1.10.3 -->
        <script src="../../assets/js/jquery-ui-1.10.3.min.js" type="text/javascript"></script>
        <!-- Bootstrap -->
        <script src="../../assets/js/bootstrap.min.js" type="text/javascript"></script>
        <!-- Director App -->
        <script src="../../assets/js/Director/app.js" type="text/javascript"></script>
    </body>
</html>
