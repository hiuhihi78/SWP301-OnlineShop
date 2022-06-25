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
        function cb(start, end) {
            const params = new Proxy(new URLSearchParams(window.location.search), {
                get: (searchParams, prop) => searchParams.get(prop),
            });
            var startTime = params.startTime;
            var endTime = params.endTime;
            if (startTime == null || endTime == null)
            {
                $('#reportrange span').html(start.format('YYYY-MM-DD') + ' -> ' + end.format('YYYY-MM-DD'));
            } else
            {
                console.log()
                $('#reportrange span').html(startTime + ' -> ' + endTime);
            }

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
        }, cb);
        cb(start, end);
    });

    $('#reportrange').on('apply.daterangepicker', function (ev, picker) {
        window.location.href = window.location.pathname + "?" + $.param({'startTime': picker.startDate.format('YYYY-MM-DD'), 'endTime': picker.endDate.format('YYYY-MM-DD')})
    });
});