<%-- 
    Document   : alter
    Created on : May 21, 2022, 10:39:51 PM
    Author     : Admin
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>




<c:if test="${requestScope.alter != null}">
    <div class="fixed float-end" id="showAlter">
        <div class="alert alert-success alert-dismissible fade in" id="alterfade">
            <a href="#" class="close" data-dismiss="alert" aria-label="close">&times;</a>
            ${requestScope.alter}
        </div>
    </div>
</c:if>

<style>
    @keyframes fadeOut {
        from {
            opacity: 1;
        }
        to {
            opacity: 0;
        }
    }
    #alterfade {
        animation: fadeOut 2s forwards;
        animation-delay: 2s;
    }

    
    #showAlter{
        position: absolute;
        width: 20%;
        left: 78%;
        z-index: 1024;
    }
</style>


<script>
    setTimeout(function () {
        const element = document.getElementById('showAlter');
        element.remove();
    }, 3000);
</script>
