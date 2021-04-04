<%-- 
    Document   : UserHome
    Created on : Apr 2, 2021, 6:46:35 PM
    Author     : Senani
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>

<html>
   
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
   <jsp:include page="../Links/Links.jsp"></jsp:include>
   <style>
       #mainbutton{
           width: 200px;
           height: 200px;
       }
 
   </style>
    </head>
    <body>
       <script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>
<div class="page-content page-container" id="page-content">
    <div class="padding">
        <div class="row">
            <div class="container-fluid d-flex justify-content-center mt-100">
                <div class="col-sm-8 col-md-8">
                    <div class="card">
                        <div class="card-header">Line chart</div>
                        <div class="card-body" style="height: 420px">
                            <div id="linechart"></div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div> 

    <center>
        <br><br>
        <div class="container">
         <button id="mainbutton"type="button" class="btn" onclick="location.href='GrowthTracker.jsp'">Growth Tracker</button>
         <button id="mainbutton" type="button" class="btn">Vaccination Tracker</button>
         <button id="mainbutton" type="button" class="btn">Vaccination Tracker</button>
        </div>
    </center>
    </body>
    <script>
        $(document).ready(function() {
  $('.nav-link-collapse').on('click', function() {
    $('.nav-link-collapse').not(this).removeClass('nav-link-show');
    $(this).toggleClass('nav-link-show');
  });
});


$(document).ready(function(){


google.charts.load('current', {'packages':['line']});
google.charts.setOnLoadCallback(drawChart);

function drawChart() {

var data = new google.visualization.DataTable();
data.addColumn('number', 'Day');
data.addColumn('number', 'Guardians of the Galaxy');
data.addColumn('number', 'The Avengers');
data.addColumn('number', 'Transformers: Age of Extinction');

data.addRows([
[1, 37.8, 80.8, 41.8],
[2, 30.9, 69.5, 32.4],
[3, 25.4, 57, 25.7],
[4, 11.7, 18.8, 10.5],
[5, 11.9, 17.6, 10.4],
[6, 8.8, 13.6, 7.7],
[7, 7.6, 12.3, 9.6],
[8, 12.3, 29.2, 10.6],
[9, 16.9, 42.9, 14.8],
[10, 12.8, 30.9, 11.6],
[11, 5.3, 7.9, 4.7],
[12, 6.6, 8.4, 5.2]
//[13, 4.8, 6.3, 3.6],
//[14, 4.2, 6.2, 3.4]
]);

var options = {
chart: {
title: 'Box Office Earnings in First Two Weeks of Opening',
subtitle: 'in millions of dollars (USD)'
},
width: 750,
height: 390
};

var chart = new google.charts.Line(document.getElementById('linechart'));

chart.draw(data, google.charts.Line.convertOptions(options));
}

});
    </script>
</html>
