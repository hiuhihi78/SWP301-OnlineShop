/* 
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/JavaScript.js to edit this template
 */
$(document).ready(function () {
    $(".form-select").change(function () {
        window.location.href = "editRole?id=" + $(".form-select").val();
    });

    $('#submitUpdateRole').on('click', function (e) {
        console.log("clicked");
        $('#myModal').modal('show');
        e.preventDefault();
    });
    
    $('#btnConfirmUpdateRole').on('click', function(){
        $('#form-updaterole').submit();
    });
});


