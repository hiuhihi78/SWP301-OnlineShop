/* 
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/JavaScript.js to edit this template
 */

$().ready(function () {
    $("#dateForm").validate({
        onfocusout: false,
        onkeyup: false,
        onclick: false,
        rules: {

            "txtStart": {
               
                checkDate: true
            },
            "txtEnd": {
                checkDate: true
            }
        }
    });
});

$.validator.addMethod("checkDate", function(value, element, params) {

    if (!/Invalid|NaN/.test(new Date(value))) {
        return new Date(value) > new Date($(params).val());
    }

    return isNaN(value) && isNaN($(params).val()) 
        || (Number(value) > Number($(params).val())); 
},'Must be greater than {0}.');

