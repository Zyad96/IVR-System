(function ($) {
    "use strict";

    // Spinner
    var spinner = function () {
        setTimeout(function () {
            if ($('#spinner').length > 0) {
                $('#spinner').removeClass('show');
            }
        }, 1);
    };
    spinner();
    
    
    // Back to top button
    $(window).scroll(function () {
        if ($(this).scrollTop() > 300) {
            $('.back-to-top').fadeIn('slow');
        } else {
            $('.back-to-top').fadeOut('slow');
        }
    });
    $('.back-to-top').click(function () {
        $('html, body').animate({scrollTop: 0}, 1500, 'easeInOutExpo');
        return false;
    });


    // Sidebar Toggler
    $('.sidebar-toggler').click(function () {
        $('.sidebar, .content').toggleClass("open");
        return false;
    });


    // Progress Bar
    $('.pg-bar').waypoint(function () {
        $('.progress .progress-bar').each(function () {
            $(this).css("width", $(this).attr("aria-valuenow") + '%');
        });
    }, {offset: '80%'});


    // Calender
    $('#calender').datetimepicker({
        inline: true,
        format: 'L'
    });


    // Testimonials carousel
    $(".testimonial-carousel").owlCarousel({
        autoplay: true,
        smartSpeed: 1000,
        items: 1,
        dots: true,
        loop: true,
        nav : false
    });


    // Chart Global Color
    Chart.defaults.color = "#6C7293";
    Chart.defaults.borderColor = "#000000";


    $(document).ready(function () {
        $.ajax({
            url: "Chart",
            type: "GET",
            dataType: "json",
            success: function (data) {
                var ctx3 = $("#line-chart").get(0).getContext("2d");

                // Prepare chart configuration using the received JSON data
                var chartConfig = {
                    type: "line",
                    data: {
                        labels: data.labels,
                        datasets: [{
                                label: "Calls",
                                fill: false,
                                backgroundColor:  ["rgba(255, 0, 0, .7)", 
                                                "rgba(0, 128, 0, .7)",
                                                "rgba(0, 0, 255, .7)",
                                                "rgba(22, 220, 178, .7)", 
                                                "rgba(255, 0, 255, .7)"],
                                data: data.datasets.map(function (item) {
                                    return item.data;
                                })
                            }]
                    },
                    options: {
                        responsive: true
                    }
                };

                // Create the chart using the configuration
                new Chart(ctx3, chartConfig);
            },
            error: function (xhr, status, error) {
                console.error("Error occurred:", error);
            }
        });
    });



    // Single Bar Chart
    $(document).ready(function () {
        $.ajax({
            url: "Chart",
            type: "GET",
            dataType: "json",
            success: function (data) {
                var ctx4 = $("#bar-chart").get(0).getContext("2d");
                var chartConfig = {
                    type: "bar",
                    data: {
                        labels: data.labels,
                        datasets: [{
                                label: "Calls",
                                fill: false,
                                backgroundColor:  ["rgba(255, 0, 0, .7)", 
                                                "rgba(0, 128, 0, .7)",
                                                "rgba(0, 0, 255, .7)",
                                                "rgba(22, 220, 178, .7)", 
                                                "rgba(255, 0, 255, .7)"],
                                data: data.datasets.map(function (item) {
                                    return item.data;
                                })
                            }]
                    },
                    options: {
                        responsive: true
                    }
                };

                // Create the chart using the configuration
                new Chart(ctx4, chartConfig);
            },
            error: function (xhr, status, error) {
                console.error("Error occurred:", error);
            }
        });
    });


    // Pie Chart
    $(document).ready(function () {
        $.ajax({
            url: "Chart",
            type: "GET",
            dataType: "json",
            success: function (data) {
                var ctx5 = $("#pie-chart").get(0).getContext("2d");
                var chartConfig = {
                    type: "pie",
                    data: {
                        labels: data.labels,
                        datasets: [{
                                label: "Calls",
                                fill: false,
                                backgroundColor: ["rgba(255, 0, 0, .7)", 
                                                "rgba(0, 128, 0, .7)",
                                                "rgba(0, 0, 255, .7)",
                                                "rgba(22, 220, 178, .7)", 
                                                "rgba(255, 0, 255, .7)"],
                                data: data.datasets.map(function (item) {
                                    return item.data;
                                })
                            }]
                    },
                    options: {
                        responsive: true
                    }
                };

                // Create the chart using the configuration
                new Chart(ctx5, chartConfig);
            },
            error: function (xhr, status, error) {
                console.error("Error occurred:", error);
            }
        });
    });


    $(document).ready(function () {
        $.ajax({
            url: "Chart",
            type: "GET",
            dataType: "json",
            success: function (data) {
                var ctx6 = $("#doughnut-chart").get(0).getContext("2d");
                var chartConfig = {
                    type: "doughnut",
                    data: {
                        labels: data.labels,
                        datasets: [{
                                label: "Calls",
                                fill: false,
                                 backgroundColor: [
                                                "rgba(255, 0, 0, .7)", 
                                                "rgba(0, 128, 0, .7)",
                                                "rgba(0, 0, 255, .7)",
                                                "rgba(22, 220, 178, .7)", 
                                                "rgba(255, 0, 255, .7)"], 
                                data: data.datasets.map(function (item) {
                                    return item.data;
                                })
                            }]
                    },
                    options: {
                        responsive: true
                    }
                };

                // Create the chart using the configuration
                new Chart(ctx6, chartConfig);
            },
            error: function (xhr, status, error) {
                console.error("Error occurred:", error);
            }
        });
    });
    
})(jQuery);

