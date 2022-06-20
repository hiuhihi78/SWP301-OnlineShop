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
    $('#featured').on('change', function () {
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


function handleShowSubCategory() {
    $.ajax({
        url: '/marketing/addSubCategoryProduct',
        type: 'GET',
        data: {
            categoryId: document.getElementById('categoryId').value
        },
        success: function (data, textStatus, jqXHR) {
            document.getElementById('subCategoryId').innerHTML = data;
        }
    });
}



function paggerPageIndex(page, content) {
    var href = 'productlist?xpage=' + page + '&' + content;
    window.location.href = href;
}


// modal for change status
function openModals(id) {
    var button = document.getElementById('btn-change');
    document.getElementById('message-modal').innerHTML = "Are you sure to change featured post?";
    var btn_status = document.querySelector('#btn-status-' + id).parentNode;
    var btn_name_status = document.querySelector('#btn-status-' + id).innerHTML.toLowerCase();
    console.log(btn_status);
    console.log(btn_name_status);

    button.onclick = function () {
        $.ajax({
            type: "GET",
            url: "../marketing/editStatusProduct",
            data: {
                idPost: id,
                idStatus: btn_name_status
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
// modal for chang featured
function openAnnouceAccept(id) {
    var button = document.getElementById('btn-change');
    document.getElementById('message-modal').innerHTML = "Are you sure to change featured post?";
    var btn_featured = document.querySelector('#btn-featured-' + id).parentNode;
    var btn_name_featured = document.querySelector('#btn-featured-' + id).innerHTML.toLowerCase();

//    button.innerHTML = '';
//    button.setAttribute('class', "btn btn-primary");
//    button.setAttribute('onclick', 'document.getElementById("' + id + '").submit();');
    button.onclick = function () {
        $.ajax({
            type: "GET",
            url: "/marketing/editFeaturedProduct",
            data: {
                idPost: id,
                idFeatured: btn_name_featured
            },
            success: function (data, textStatus, jqXHR) {
                btn_featured.innerHTML = "" + data;
            },
            error: function (jqXHR, textStatus, errorThrown) {

            }
        });
        document.getElementById('showAlter').innerHTML = "Change Successfuly";
    };
}