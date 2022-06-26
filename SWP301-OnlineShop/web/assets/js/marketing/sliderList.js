/* 
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/JavaScript.js to edit this template
 */


$('.btn-id').click(function (e) {
    var sid = $(e.target).data('id');
    var status = $(e.target).data('status');
    if (status == true) {
        $('#ct').html('If the status is changed to <b>HIDE</b>, the Slider will not appear on the homepage.');
    } else {
        $('#ct').html('If the status is changed to <b>SHOW</b>, the Slider will be displayed on the homepage.');
    }
    $('#hSid').val(sid);
    $('#hStatus').val(status);
    $('#confirm-show-slider').modal('show');
});

$('.btn-change').click(function () {
    var sid = $('#hSid').val();
    var status = $('#hStatus').val();

    
    $.ajax({
        url: "/marketing/sliderList",
        type: "post", //send it through get method
        data: {
            id: sid,
            status: status
        },
        success: function (response) {
            //Do Something
            $('#confirm-show-slider').modal('toggle');
            location.reload();

        },
        error: function (xhr) {
   
        }
    });
});





