<%-- 
    Document   : GrowthTracker
    Created on : Apr 3, 2021, 1:39:05 AM
    Author     : Senani
--%>

<%@page import="java.sql.ResultSet"%>
<%@page import="com.kiddiecare.dbutil.QueryDAO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%    QueryDAO querydao = new QueryDAO();%>
<html>

    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <jsp:include page="../Links/Links.jsp"></jsp:include>
            <link rel="stylesheet" href="../CSS/AdminUserCss.css">
            <style>
                #hedding{
                    background : linear-gradient(45deg, #3bade3 0%, #576fe6 25%, #9844b7 51%, #ff357f 100%);
                    height: 80px;


                }
            </style>
        </head>
        <body>
            <div class="container-fluid">
                <div class="row">
                    <div class="col-md-2">
                        <!--                            side nav bar-->
                        <nav class="navbar navbar-expand-lg navbar-dark fixed-top bg-dark">
                            <a class="navbar-brand" href="#">Kiddie Care</a>
                            <button
                                class="navbar-toggler"
                                type="button"
                                data-toggle="collapse"
                                data-target="#navbarCollapse"
                                aria-controls="navbarCollapse"
                                aria-expanded="false"
                                aria-label="Toggle navigation"
                                >
                                <span class="navbar-toggler-icon"></span>
                            </button>

                            <div class="collapse navbar-collapse" id="navbarCollapse">
                                <ul class="navbar-nav mr-auto sidenav" id="navAccordion">
                                    <br><br>
                                    <li class="nav-item">
                                        <a class="nav-link" href="#tabpanel2" data-toggle="tab"  role="tab" onclick="searchDetails();">Growth Monitoring</a>
                                    </li>
                                    <li class="nav-item">
                                        <a class="nav-link" href="#tabpanel3" data-toggle="tab"  role="tab" onclick="searchDetailsV();">Vaccination Monitoring</a>
                                    </li>

                                    <li class="nav-item active">
                                        <a class="nav-link" href="#tabpanel4" data-toggle="tab"  role="tab">Health Tips</a>
                                    </li>
                                </ul>
                                <ul class="navbar-nav ml-auto mt-2 mt-md-0">
                                    <li class="nav-item dropdown">
                                        <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                            <i class="fa fa-envelope-o">
                                                
                                            </i>
                                        <%
                                       String userName = (String) request.getSession().getAttribute("userName");
                                          

                                        %>

                                        Hi <%=userName%>
                                    </a>
                                    <div class="dropdown-menu" aria-labelledby="navbarDropdown">
                                        <a class="dropdown-item" href="#">Action</a>
                                        <a class="dropdown-item" href="#">Another action</a>
                                        <div class="dropdown-divider"></div>
                                        <a class="dropdown-item" href="#">Something else here</a>
                                    </div>
                                </li>
                                <li class="nav-item">
                                    <a class="nav-link" href="<%=request.getContextPath()%>/Logout">
                                        <i class="fa fa-sign-out" aria-hidden="true">
                                            <span ></span>
                                        </i>
                                        Logout
                                    </a>
                                </li>
                            </ul>
                        </div>
                    </nav>
                </div>
                <div class="col-md-10"> 
                    <div class="tab-content pt-0">

                        <div  style="margin-top: 70px" class="tab-pane fade " id="tabpanel4" role="tabpanel">
                            <div class="container-fluid" id="hedding">
                                <h1>Tips</h1>
                            </div>
                            <%
                                String userName1 = (String) request.getSession().getAttribute("userName");
                            %>
                            <h2 id="todayDate">Date</h2>
                            <div class="container">
                                <div class="row">
                                    <div class="col-md-3">
                                        <label>
                                            <select class="custom-select" aria-label="Default select example" id="dietdropdown" onchange="selectFood(this);">
                                                <option>Select Child Age</option>
                                                <%
                                                    String q = "SELECT  DISTINCT months FROM chdr.diet_chart ";

                                                    ResultSet rs1 = querydao.search(q);
                                                    while (rs1.next()) {
                                                %>
                                                <option value="<%= rs1.getString("months")%>"><%= rs1.getString("months")%></option>
                                                <% }%>
                                            </select>
                                        </label>
                                    </div>

                                    <div class="table-responsive col-md-12">
                                        <table  class="grid table table-bordered table-sortable">
                                            <thead>
                                                <tr><th>Time</th><th>Food</th></tr>
                                            </thead>
                                            <tbody id="diettable">

                                            </tbody>
                                        </table>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div  style="margin-top: 70px" class="tab-pane fade show active" id="tabpanel2"  role="tabpanel">
                            <div class="container-fluid" id="hedding">
                                <h1>Growth Monitoring</h1>
                            </div>
                            <div class="container-fluid">
                                <div class="row">
                                    <div class="col-md-3">
                                        <label>
                                            <select class="custom-select" aria-label="Default select example" id="nameSelector" onchange="setNameToTextFeild(this)">
                                                <option>Select the Child Name</option>
                                            </select>
                                        </label>
                                    </div>
                                    <div class="col-md-3">
                                        <label>
                                            <p class="label-txt">Child Name</p>
                                            <input type="text" class="input" id="childName" name ="childName">
                                            <div class="line-box">
                                                <div class="line"></div>
                                            </div>
                                        </label>
                                    </div>
                                </div>
                            </div>
                            <!--                            </form>-->
                            <div class="container-fluid">
                                <div class="row">

                                    <div class="col-md-1 ">
                                        <label>
                                            <p class="label-txt">Years</p>
                                            <input type="text" class="input" name="childyears" id="years">
                                            <div class="line-box">
                                                <div class="line"></div>
                                            </div>

                                        </label>
                                    </div>
                                    <div class="col-md-1 ">
                                        <label>
                                            <p class="label-txt">Months</p>
                                            <input type="text" class="input" name="months" id="months">
                                            <div class="line-box">
                                                <div class="line"></div>
                                            </div>

                                        </label>
                                    </div>
                                    <div class="col-md-1 ">
                                        <label>
                                            <p class="label-txt">Days</p>
                                            <input type="text" class="input" name="days" id="days">
                                            <div class="line-box">
                                                <div class="line"></div>
                                            </div>

                                        </label>
                                    </div>
                                </div>
                            </div>
                            <div class="container">
                                <div class="row">
                                    <div class="table-responsive col-md-12">
                                        <table id="tableRecordDetails" class="grid table table-bordered table-sortable">
                                            <thead>
                                                <tr><th>Date</th><th>Weight(Kg)</th><th>Height(cm)</th><th>Age(Months)</th></tr>
                                            </thead>
                                            <tbody id="tableRecordDetailsBody">

                                            </tbody>
                                        </table>
                                    </div>
                                </div>
                            </div>
                            <br><br>
                            <div class="row"> 
                                <div class="col-md-6">
                                    <button type="submit" onclick="showWeightAge()">View Weight/Age Graph</button>
                                </div>   
                                <div class="col-md-6">
                                    <button type="submit" onclick="showHeightAge()">View Height/Age Graph</button>
                                </div>
                                <br><br>     <br><br>
                            </div>
                        </div>
                        <div  style="margin-top: 70px" class="tab-pane fade" id="tabpanel3"  role="tabpanel">
                            <div class="container-fluid" id="hedding">
                                <h1>Vaccination Monitoring</h1><br><br>
                                <div class="container-fluid">
                                    <div class="row">
                                        <div class="col-md-2">
                                            <label>
                                                <!--                                            <select class="custom-select" aria-label="Default select example" id="vaccinenameSelector" onchange="setNameToVaccineTextFeild(this)">-->
                                                <select class="custom-select" aria-label="Default select example" id="vaccinenameSelector" onchange="searchVaccineDetails(this)">
                                                    <option>Child Name</option>
                                                </select>
                                            </label>
                                        </div>
                                        <div class="col-md-2">
                                            <label>
                                                <p class="label-txt">Child Name</p>
                                                <input type="text" class="input" id="vaccinechildName" name="vaccinechildName">
                                                <div class="line-box">
                                                    <div class="line"></div>
                                                </div>
                                            </label>
                                        </div>
                                        <div class="col-md-1 ">
                                            <label>
                                                <p class="label-txt">Age</p>
                                                <input type="text" class="input" name="childage" id="yy">
                                                <div class="line-box">
                                                    <div class="line"></div>
                                                </div>
                                            </label>
                                        </div>
                                        <div class="col-md-1 ">
                                            <label>
                                                <p class="label-txt">Month</p>
                                                <input type="text" class="input" name="month" id="mm">
                                                <div class="line-box">
                                                    <div class="line"></div>
                                                </div>

                                            </label>
                                        </div>
                                        <div class="col-md-1 ">
                                            <label>
                                                <p class="label-txt">Days</p>
                                                <input type="text" class="input" name="days" id="dd">
                                                <div class="line-box">
                                                    <div class="line"></div>
                                                </div>
                                            </label>
                                        </div>
                                    </div>
                                </div>
                                <br><br>
                                <div class="container">
                                    <div class="row">
                                        <div class="col-md-12">
                                            <div id="accordion" class="checkout">
                                                <%
                                                    String vaccinecategotryheaddings = "SELECT * FROM chdr.vaccinecategory";
                                                    ResultSet rs = querydao.search(vaccinecategotryheaddings);
                                                    try {

                                                        while (rs.next()) {


                                                %>
                                                <div class="panel checkout-step">
                                                    <div> <span class="checkout-step-number"><%=rs.getString("idvaccinecategory")%></span>
                                                        <h4 class="checkout-step-title"> <a  role="button" data-toggle="collapse" data-parent="#accordion" href="#collapseOne<%=rs.getString("idvaccinecategory")%>" > <%=rs.getString("vaccinecategory")%></a></h4>
                                                    </div>
                                                    <div id="collapseOne<%=rs.getString("idvaccinecategory")%>" class="collapse in">
                                                        <div class="checkout-step-body">
                                                            <div class="row">
                                                                <div class="table-responsive col-md-12">
                                                                    <table id="tableRecordDetails" class="grid table table-bordered table-sortable">
                                                                        <thead>
                                                                            <tr><th>Due Date</th><th>Given Date</th><th>Vaccine </th><th>Status</th></tr>
                                                                        </thead>
                                                                        <tbody id="tableVaccineRecordDetailsBody<%=rs.getString("idvaccinecategory")%>">

                                                                        </tbody>
                                                                    </table>
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                                <%        }
                                                    } catch (Exception e) {
                                                        e.printStackTrace();
                                                    }
                                                %>
                                            </div>
                                        </div>

                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div> 
</body>
<script>
//        $(document).ready(function () {
//            $('.nav-link-collapse').on('click', function () {
//                $('.nav-link-collapse').not(this).removeClass('nav-link-show');
//                $(this).toggleClass('nav-link-show');
//            });
//        });
    $(document).ready(function () {
        var d = (new Date()).toString().split(' ').splice(1, 3).join(' ');
        document.getElementById('todayDate').innerHTML = d;
        $('.nav-link-collapse').on('click', function () {
            $('.nav-link-collapse').not(this).removeClass('nav-link-show');
            $(this).toggleClass('nav-link-show');
        });
    });
    //        $(document).ready(function () {
    //            $('.nav-link').click(function () {
    //                $('nav-link').not(this).removeClass('active');
    //                //$(this).add('aria-selected="true"');
    //                $(this).toggleClass('active');
    //                 
    //            });
    //        });

    $(document).ready(function () {
        $('.nav-link').click(function () {
            $('.tab-pane fade').not(this).removeClass('tab-pane fade show active ');
            $(this).toggleClass('show active');
        });
    });
    $(document).ready(function () {

        $('.input').focus(function () {
            $(this).parent().find(".label-txt").addClass('label-active');
        });
        $(".input").focusout(function () {
            if ($(this).val() == '') {
                $(this).parent().find(".label-txt").removeClass('label-active');
            }
            ;
        });
    });


    function  searchDetails() {
        $('#nameSelector option:gt(0)').remove(); // remove dropdown load options
        var xmlHttpRequest = new XMLHttpRequest();
        xmlHttpRequest.onreadystatechange = function () {
            if (xmlHttpRequest.readyState === 4 && xmlHttpRequest.status === 200) {

                var response = xmlHttpRequest.responseText;
                var child = JSON.parse(response).childName; // get json object values 
                for (var i = 0; i < child.length; i++) {// get array values 

                    document.getElementById('nameSelector').appendChild(new Option(child[i], child[i])); //set values to dropdwon option
                }
            }
        };
        xmlHttpRequest.open("GET", "../SearchCildforUser", true);
        xmlHttpRequest.send();
    }
    function  searchDetailsV() {
        $('#vaccinenameSelector option:gt(0)').remove(); // remove dropdown load options
        var xmlHttpRequest = new XMLHttpRequest();
        xmlHttpRequest.onreadystatechange = function () {
            if (xmlHttpRequest.readyState === 4 && xmlHttpRequest.status === 200) {

                var response = xmlHttpRequest.responseText;
                var child = JSON.parse(response).childName; // get json object values 
                for (var i = 0; i < child.length; i++) {// get array values 

                    document.getElementById('vaccinenameSelector').appendChild(new Option(child[i], child[i])); //set values to dropdwon option
                }
            }
        };
        xmlHttpRequest.open("GET", "../SearchCildforUser", true);
        xmlHttpRequest.send();
    }

    function setNameToTextFeild(name) {

        $('#tableRecordDetailsBody tr').remove(); // remove tabe rows
        var childname = document.getElementById('childName').value = name.value; // set values for textfeild
        var xmlHttpRequest = new XMLHttpRequest();
        xmlHttpRequest.onreadystatechange = function () {
            if (xmlHttpRequest.readyState === 4 && xmlHttpRequest.status === 200) {
                var response = xmlHttpRequest.responseText;
                var rDetails = JSON.parse(response).recordDetails;
                var rowcount = rDetails.length;
                for (var i = 0; i < rowcount; i++) {
                    document.getElementById('years').value = rDetails[i]['years'];
                    document.getElementById('months').value = rDetails[i]['months'];
                    document.getElementById('days').value = rDetails[i]['days'];
                    var table = document.getElementById("tableRecordDetailsBody");
                    var row = table.insertRow(0);
                    var cell1 = row.insertCell(0);
                    var cell2 = row.insertCell(1);
                    var cell3 = row.insertCell(2);
                    var cell4 = row.insertCell(3);
                    cell1.innerHTML = rDetails[i]["date"];
                    cell2.innerHTML = rDetails[i]["weight"];
                    cell3.innerHTML = rDetails[i]["height"];
                    cell4.innerHTML = rDetails[i]["totalmonths"];
                }
            }
        };
        xmlHttpRequest.open("GET", "../AddedRecordDetails?name=" + childname, true);
        xmlHttpRequest.send();
    }
    function showWeightAge() {
        <% String userNIC = (String) request.getSession().getAttribute("userNIC"); %>
        var userNIC = <%=userNIC %>
        var childName = document.getElementById("childName").value;
        window.open("http://localhost:8080/KiddieCare/AdminPanel/WeightAgeGraph.jsp?childName=" + childName + "&userNIC=" + userNIC, "Window Name", "width=900,height=950");

    }

    function showHeightAge() {
        var userNIC = <%=userNIC %>
        var childName = document.getElementById("childName").value;
        window.open("http://localhost:8080/KiddieCare/AdminPanel/HeightAgeGraph.jsp?childName=" + childName + "&userNIC=" + userNIC, "Window Name", "width=900,height=950");

    }

    function selectFood(month) {
        $('#diettable tr').remove();
        var foodMonth = month.value;
        alert(foodMonth);
        var xmlHttpRequest = new XMLHttpRequest();
        xmlHttpRequest.onreadystatechange = function () {
            if (xmlHttpRequest.readyState === 4 && xmlHttpRequest.status === 200) {
                var response = xmlHttpRequest.responseText;
                var data = JSON.parse(response).food;
                var table = document.getElementById("diettable");
                var rowcount = data.length;
                for (var i = 0; i < rowcount; i++) {
                    var row = table.insertRow(0);
                    var cell1 = row.insertCell(0);
                    var cell2 = row.insertCell(1);
                    cell1.innerHTML = data[i]["time"];
                    cell2.innerHTML = data[i]["food"];
                }
                console.log(data);
            }
        };
        xmlHttpRequest.open("GET", "../SelectFoods?foodMonth=" + foodMonth, true);
        xmlHttpRequest.send();
    }
    function searchVaccineDetails(name) {
        var childname = document.getElementById('vaccinechildName').value = name.value; // set values for textfeild
        var xmlHttpRequest = new XMLHttpRequest();
        xmlHttpRequest.onreadystatechange = function () {
            if (xmlHttpRequest.readyState === 4 && xmlHttpRequest.status === 200) {
                var response = xmlHttpRequest.responseText;
                console.log(response);
                var vaccinedetails = JSON.parse(response).loadvaccinedetails;
                var today = new Date();
                var date = today.getFullYear() + '-' + (today.getMonth() + 1) + '-' + today.getDate();
                document.getElementById('yy').value = vaccinedetails.years;
                document.getElementById('mm').value = vaccinedetails.months;
                document.getElementById('dd').value = vaccinedetails.days;

                for (var i = 1; i < 9; i++) {
                    var table = document.getElementById("tableVaccineRecordDetailsBody" + i);
                    if (i === 1) {
                        for (var j = 0; j < 1; j++) {
                            var row = table.insertRow(0);
                            var cell1 = row.insertCell(0);
                            var cell2 = row.insertCell(1);
                            var cell3 = row.insertCell(2);
                            var cell4 = row.insertCell(3);
                            cell1.innerHTML = vaccinedetails.duedates[0];
                            cell2.innerHTML = date;
                            cell3.innerHTML = vaccinedetails.vaccinesName[0][j][1];
                            cell4.innerHTML = ('<label class="customcheck"><input id="' + vaccinedetails.vaccinesName[0][j][0] + '" type="checkbox" onclick="checkboxstatus(this);"><span class="checkmark"></span></label>');
                        }
                    } else if (i === 2) {
                        for (var j = 0; j < 2; j++) {
                            var row = table.insertRow(0);
                            var cell1 = row.insertCell(0);
                            var cell2 = row.insertCell(1);
                            var cell3 = row.insertCell(2);
                            var cell4 = row.insertCell(3);
                            cell1.innerHTML = vaccinedetails.duedates[1];
                            cell2.innerHTML = date;
                            cell3.innerHTML = vaccinedetails.vaccinesName[1][j][1];
                            cell4.innerHTML = ('<label class="customcheck"><input id="' + vaccinedetails.vaccinesName[1][j][0] + '" type="checkbox" onclick="checkboxstatus(this);"><span class="checkmark"></span></label>');
                        }
                    } else if (i === 3) {
                        for (var j = 0; j < 3; j++) {
                            var row = table.insertRow(0);
                            var cell1 = row.insertCell(0);
                            var cell2 = row.insertCell(1);
                            var cell3 = row.insertCell(2);
                            var cell4 = row.insertCell(3);
                            cell1.innerHTML = vaccinedetails.duedates[2];
                            cell2.innerHTML = date;
                            cell3.innerHTML = vaccinedetails.vaccinesName[2][j][1];
                            cell4.innerHTML = ('<label class="customcheck"><input id="' + vaccinedetails.vaccinesName[2][j][0] + '" type="checkbox" onclick="checkboxstatus(this);"><span class="checkmark"></span></label>');
                        }

                    } else if (i === 4) {
                        for (var j = 0; j < 2; j++) {
                            var row = table.insertRow(0);
                            var cell1 = row.insertCell(0);
                            var cell2 = row.insertCell(1);
                            var cell3 = row.insertCell(2);
                            var cell4 = row.insertCell(3);
                            cell1.innerHTML = vaccinedetails.duedates[3];
                            cell2.innerHTML = date;
                            cell3.innerHTML = vaccinedetails.vaccinesName[3][j][1];
                            cell4.innerHTML = ('<label class="customcheck"><input id="' + vaccinedetails.vaccinesName[3][j][0] + '" type="checkbox" onclick="checkboxstatus(this);"><span class="checkmark"></span></label>');
                        }

                    }

                }

                vaccinedetails.vaccineCompleted.forEach(function (id) {
//                        if (id != 1)
                    document.getElementById(id).checked = true;
                });

            }
        };
        xmlHttpRequest.open("GET", "../SearchVaccineDetails?childName=" + childname , true);
        xmlHttpRequest.send();
    }

</script>
</html>
