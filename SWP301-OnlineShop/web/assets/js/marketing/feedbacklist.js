/* 
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/JavaScript.js to edit this template
 */




$(document).ready(function () {
    $('#categoryId').on('change', function () {
        this.form.submit();
    });
    $('#subCategoryId').on('change', function () {
        this.form.submit();
    });
    $('#star').on('change', function () {
        this.form.submit();
    });
    $('#status').on('change', function () {
        this.form.submit();
    });

    $('#orderBy').on('change', function () {
        this.form.submit();
    });
    $('#sort').on('change', function () {
        this.form.submit();
    });
    $('#search').on('change', function () {
        this.form.submit();
    });
    $('#page').on('change', function () {
        this.form.submit();
    });
});


function submitForm(id) {
    document.getElementById(id).submit();
}




function paggerPageIndex(page, content) {
    var href = 'feedbacklist?xpage=' + page + '&' + content;
    window.location.href = href;
}


// modal for change status
function openModals(id) {
    var button = document.getElementById('btn-change');
    document.getElementById('message-modal').innerHTML = "Are you sure to change status?";
    var btn_status = document.querySelector('#btn-status-' + id).parentNode;
    var btn_name_status = document.querySelector('#btn-status-' + id).innerHTML.toLowerCase();
    console.log(btn_status);
    console.log(btn_name_status);

    button.onclick = function () {
        $.ajax({
            type: "GET",
            url: "../marketing/handlePost",
            data: {
                idPost: id,
                idStatus: btn_name_status,
                action: "editStatusFeedback"
            },
            success: function (data, textStatus, jqXHR) {
                btn_status.innerHTML = data;
            },
            error: function (jqXHR, textStatus, errorThrown) {

            }
        });
//        document.getElementById('showAlter').innerHTML = "Change Successfuly";
    };
}
