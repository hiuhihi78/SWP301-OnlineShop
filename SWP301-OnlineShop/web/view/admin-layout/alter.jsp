<%-- 
    Document   : alter
    Created on : May 21, 2022, 10:39:51 PM
    Author     : Admin
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<style>
    @keyframes fadeOut {
        from {
            opacity: 1;
        }
        to {
            opacity: 0;
        }
    }
/*    #alter {
        animation: fadeOut 2s forwards;
        animation-delay: 2s;
    }*/

    
    #alter{
        position: relative;
        bottom: 800px     ;
    }
</style>
<script>
    setTimeout(function () {
        const element = document.getElementById('alter');
        element.remove();
    }, 3000);
</script>
<%--<c:if test="${requestScope.alter != null}">
    <div class="fixed col-md-2 float-end" id="alter">
        <div class="alert alert-success alert-dismissible fade show">
            <a href="#" class="close" data-dismiss="alert" aria-label="close">&times;</a>
            <!--<button  onclick="close()" type="button" class="btn-close" data-bs-dismiss="alert"></button>-->
            <strong>Success!</strong> ${requestScope.alter}
        </div>
    </div>
</c:if>--%>

<c:if test="${requestScope.alter != null}">
    <div class="fixed float-end">
        <div class="alert alert-success alert-dismissible fade in">
            <a href="#" class="close" data-dismiss="alert" aria-label="close">&times;</a>
            ${requestScope.alter}
        </div>
    </div>
</c:if>

