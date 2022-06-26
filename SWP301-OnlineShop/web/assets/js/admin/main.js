/* 
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/JavaScript.js to edit this template
 */


setTimeout(function () {
    const element = document.getElementById('showAlter');
    element.remove();
}, 3000);


setTimeout(function () {
    const element = document.getElementById('showAlterSuccess');
    element.remove();
}, 3000);
setTimeout(function () {
    const element = document.getElementById('showAlterFail');
    element.remove();
}, 3000);

$(document).ready(function () {
    $(function () {
        var start = moment();
        var end = moment();
        const params = new Proxy(new URLSearchParams(window.location.search), {
            get: (searchParams, prop) => searchParams.get(prop),
        });
        var startTime = params.startTime;
        var endTime = params.endTime;
        if (startTime === null || endTime === null)
        {
            $('#startTime').prop('value', start.format('YYYY-MM-DD'));
            $('#endTime').prop('value', end.format('YYYY-MM-DD'));
            $('#reportrange span').html(start.format('YYYY-MM-DD') + ' -> ' + end.format('YYYY-MM-DD'));
        } else
        {
            $('#startTime').prop('value', startTime);
            $('#endTime').prop('value', endTime);
            $('#reportrange span').html(startTime + ' -> ' + endTime);
        }
        $('#reportrange').daterangepicker({
            startDate: start,
            endDate: end,
            ranges: {
                'Today': [moment(), moment()],
                'Yesterday': [moment().subtract(1, 'days'), moment().subtract(1, 'days')],
                'Last 7 Days': [moment().subtract(6, 'days'), moment()],
                'Last 30 Days': [moment().subtract(29, 'days'), moment()],
                'This Month': [moment().startOf('month'), moment().endOf('month')],
                'Last Month': [moment().subtract(1, 'month').startOf('month'), moment().subtract(1, 'month').endOf('month')]
            }
        });
    });

    $('#reportrange').on('apply.daterangepicker', function (ev, picker) {
        const startTime = picker.startDate.format('YYYY-MM-DD');
        const endTime = picker.endDate.format('YYYY-MM-DD');
        $('#startTime').prop('value', startTime);
        $('#endTime').prop('value', endTime);
        $('#reportrange span').html(startTime + ' -> ' + endTime);
    });

    $('.confirm-process').on('click', function () {
        var orderid = $(this).data("orderid");
        $("#myModal").data('orderid', orderid).modal('show');
    });

    $('#btnConfirmProcessOrder').on('click', function () {
        var orderid = $('#myModal').data("orderid");
        var url = '/sale/order/updatestatus';
        //set status = 2 mean processing
        $.post(url, {orderid: orderid, status: 2}, function () {
            $('#alertSuccessInfo').html("Delete match order successfully");
        })
                .fail(function () {

                    $('#alertErrorInfo').html("Delete match order failed");
                });
    });
});