/* 
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/JavaScript.js to edit this template
 */

console.log(document.querySelector('#file'));
function btnClosePreviewImage() {
    var previewBox = document.querySelector('#preview-box');
    var valueFile = document.querySelector('#file');
    previewBox.style = "display: none;";
    valueFile.removeAttribute('value');
    valueFile.setAttribute('value', '');
}
function handleSaveCategory() {
    var valueCategory = document.querySelector('#newCategory1').value;
    var valuesubCategory = document.querySelector('#newSubCategory1').value;
    var listCategory = document.querySelector('#listCategory');
    var listCategory2 = document.querySelector('#category2');
    $.ajax({
        type: "GET",
        url: "../marketing/handlePost",
        data: {
            nameCategory: valueCategory,
            nameSubCategory: valuesubCategory,
            action: "addNewCategory"
        },
        success: function (data, textStatus, jqXHR) {
            listCategory.innerHTML += data;
            listCategory2.innerHTML += data;
        },
        error: function (jqXHR, textStatus, errorThrown) {

        }
    });
}
function handleSaveSubcategory() {
    var category = document.querySelectorAll('#category2 option');
    var valueCategory;
    var subCategory = document.querySelector('#newSubcategory2');
    for (var i = 0; i < category.length; i++) {
        if (category[i].selected) {
            valueCategory = category[i].value;
            break;
        }
    }
    $.ajax({
        type: "GET",
        url: "../marketing/handlePost",
        data: {
            idCategory: valueCategory,
            nameSubCategory: subCategory.value,
            action: "addNewSubCategory"
        },
        success: function (data, textStatus, jqXHR) {
            console.log("status ", textStatus);
        },
        error: function (jqXHR, textStatus, errorThrown) {

        }
    });
}
function selectSubCategory() {
    var list = document.querySelectorAll("#listCategory option");
    var listSub = document.querySelector("#subCatePost");
    console.log(list);
    for (var i = 0; i < list.length; i++) {
        if (list[i].selected) {
            $.ajax({
                type: "GET",
                url: "../marketing/handlePost",
                data: {
                    idCategory: list[i].value,
                    action: "subcategory"
                },
                success: function (data, textStatus, jqXHR) {
                    console.log(data);
                    listSub.innerHTML = "" + data;
                },
                error: function (jqXHR, textStatus, errorThrown) {

                }
            });
            break;
        }
    }
}
//                            var list = document.querySelectorAll("#listCategory option");
//                            var listSub = document.querySelector("#subCatePost");
//                            console.log(list);
//                            for (var i = 0; i < list.length; i++) {
//                                if (list[i].selected) {
//                                    $.ajax({
//                                        type: "GET",
//                                        url: "../marketing/handlePost",
//                                        data: {
//                                            idCategory: list[i].value,
//                                            action: "subcategory"
//                                        },
//                                        success: function (data, textStatus, jqXHR) {
//                                            console.log(data);
//                                            listSub.innerHTML = "" + data;
//                                        },
//                                        error: function (jqXHR, textStatus, errorThrown) {
//
//                                        }
//                                    });
//                                    break;
//                                }
//                            }
function checkFileInput(e) {
    console.log(document.querySelector('#file').value);
    var reader = new FileReader();
    reader.onload = function (e) {
        document.querySelector('#previewImage').parentNode.style.display = 'block';
        $("#previewImage").attr("src", e.target.result);
    };
    //Imagepath.files[0] is blob type
    reader.readAsDataURL(e.files[0]);
}
