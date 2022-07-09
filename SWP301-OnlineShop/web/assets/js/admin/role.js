/* 
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/JavaScript.js to edit this template
 */
$(document).ready(function () {
    $(".form-select").change(function () {
        window.location.href = "editRole?id=" + $(".form-select").val();
    });

    $('#submitUpdateRole').on('click', function (e) {
        $('#myModal').modal('show');
        e.preventDefault();
    });

    $('#btnSubmitAddRole').on('click', function (e) {
        $('#myModal').modal('show');
        e.preventDefault();
    });

    $('#btnConfirmUpdateRole').on('click', function () {
        $('#form-updaterole').submit();
    });

    $('#btnConfirmAddRole').on('click', function () {
        $('#frmAddRole').submit();
    });

    $('#btnSelectAllAdmin').on('click', function () {
        var checked = $(this).prop('checked');
        $("input[id*='adminFeatures']:checkbox").each(function () {
            this.checked = checked;
        });
    });

    $('#btnSelectAllMarketing').on('click', function () {
        var checked = $(this).prop('checked');
        $("input[id*='marketingFeatures']:checkbox").each(function () {
            this.checked = checked;
        });
    });

    $('#btnSelectAllSale').on('click', function () {
        var checked = $(this).prop('checked');
        $("input[id*='saleFeatures']:checkbox").each(function () {
            this.checked = checked;
        });
    });
});


