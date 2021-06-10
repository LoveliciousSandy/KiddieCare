<%-- 
    Document   : Admin Panel
    Created on : Apr 5, 2021, 2:06:26 AM
    Author     : Senani
--%>

<%@page import="java.sql.ResultSet"%>
<%@page import="org.json.JSONArray"%>
<%@page import="com.kiddiecare.dbutil.QueryDAO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%      QueryDAO querydao = new QueryDAO();%>
<html>

    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Admin Dashboard</title>
        <jsp:include page="../Links/Links.jsp"></jsp:include>
            <link rel="stylesheet" href="../CSS/AdminUserCss.css">
            <style>
                #hedding{
                    background : linear-gradient(45deg, #3bade3 0%, #576fe6 25%, #9844b7 51%, #ff357f 100%);
                    height: 80px;


                }
                .card-counter{
                    box-shadow: 2px 2px 10px #DADADA;
                    margin: 5px;
                    padding: 20px 10px;
                    background-color: #fff;
                    height: 150px;
                    border-radius: 5px;
                    transition: .3s linear all;
                }

                .card-counter{
                    background: linear-gradient(45deg, #3bade3 0%, #576fe6 25%, #9844b7 51%, #ff357f 100%);
                    color: #FFF;
                }  

                .card-counter i{
                    font-size: 5em;
                    opacity: 0.2;
                }

                .card-counter .count-numbers{
                    position: absolute;
                    right: 35px;
                    top: 20px;
                    font-size: 32px;
                    display: block;
                }

                .card-counter .count-name{
                    position: absolute;
                    right: 35px;
                    top: 65px;
                    font-style: italic;
                    text-transform: capitalize;
                    opacity: 0.5;
                    display: block;
                    font-size: 18px;
                }
            </style>
        </head>
        <body>
            <div class="container-fluid">
                <div class="row">
                    <div class="col-md-2" >
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
                                        <a class="nav-link" href="#tabpanel0" data-toggle="tab"  role="tab">Dashboard</a>
                                    </li>
                                    <li class="nav-item">
                                        <a class="nav-link" href="#tabpanel1" data-toggle="tab"  role="tab">User Registration</a>
                                    </li>
                                    <li class="nav-item">
                                        <a class="nav-link" href="#tabpanel2" data-toggle="tab"  role="tab">Child Registration</a>
                                    </li>
                                    <li class="nav-item">
                                        <a class="nav-link" href="#tabpanel3" data-toggle="tab"  role="tab">Child Growth Tracker</a>
                                    </li>
                                    <li class="nav-item">
                                        <a class="nav-link" href="#tabpanel4" data-toggle="tab"  role="tab">Child Vaccine Tracker</a>
                                    </li>
                                    <li class="nav-item">
                                        <a class="nav-link" href="#tabpanel5" data-toggle="tab"  role="tab">Send Reminder</a>
                                    </li>
                                    <li class="nav-item">
                                        <a class="nav-link" href="#tabpanel6"data-toggle="tab"  role="tab">Search</a>

                                    </li>
                                </ul>
                                <ul class="navbar-nav ml-auto mt-2 mt-md-0">
                                    <li class="nav-item">
                                        <a class="nav-link"  href="<%=request.getContextPath()%>/Logout">
                                        Logout
                                    </a>
                                </li>
                            </ul>
                        </div>
                    </nav>
                </div>
                <div class="col-md-10"> 
                    <div class="tab-content pt-0">
                        <div  style="margin-top: 70px" class="tab-pane fade show active" id="tabpanel0" role="tabpanel">
                            <div class="container-fluid" id="hedding">
                                <h1>Dashboard</h1>
                            </div>
                            <br>
                            <div class="container-fluid">
                                <div class="row">
                                    <%
                                        String q1 = "SELECT 'user' tablename, COUNT(*) rows FROM chdr.user UNION SELECT 'child' tablename, COUNT(*) rows FROM chdr.child UNION SELECT 'records' tablename, COUNT(*) rows FROM chdr.record UNION SELECT 'vaccination' tablename, COUNT(*) rows FROM chdr.child_vaccination_details;";
                                        ResultSet rs1 = querydao.search(q1);
                                        while (rs1.next()) {%>
                                    <div class="col-md-3">
                                        <div class="card-counter">
                                            <i class="fas fa-clipboard-list"></i>
                                            <span class="count-numbers"><%= rs1.getString("rows")%></span>
                                            <span class="count-name"><%= rs1.getString("tablename")%></span>
                                        </div>
                                    </div>
                                    <% } %>
                                </div>
                            </div>
                            <br><br>
                            <div class="container-fluid">
                                <h1>Importans</h1>
                                <div class="row">
                                    <%
                                        String q2 = "SELECT count(*) rows FROM chdr.record WHERE weight <3.5 and date BETWEEN '2015-01-01' AND now() AND totalmonths=0";
                                        ResultSet rs2 = querydao.search(q2);
                                        while (rs2.next()) {%>
                                    <div class="col-md-3">
                                        <div class="card-counter danger">
                                            <i class="fas fa-clipboard-list"></i>
                                            <span class="count-numbers"><%= rs2.getString("rows")%></span>
                                            <span class="count-name">Low Birth Weight Babies </span>
                                        </div>
                                    </div>
                                    <% } %>

                                    <%
                                        String q3 = "SELECT count(*) rows FROM chdr.record WHERE weight >4.4 and date BETWEEN '2015-01-10' AND now() AND totalmonths=0";
                                        ResultSet rs3 = querydao.search(q3);
                                        while (rs3.next()) {%>
                                    <div class="col-md-3">
                                        <div class="card-counter danger">
                                            <i class="fas fa-clipboard-list"></i>
                                            <span class="count-numbers"><%= rs3.getString("rows")%></span>
                                            <span class="count-name">High Birth Weight Babies </span>
                                        </div>
                                    </div>
                                    <% } %>
                                </div>
                            </div>
                        </div>
                        <div  style="margin-top: 70px" class="tab-pane fade  " id="tabpanel1" role="tabpanel">
                            <div class="container-fluid" id="hedding">
                                <h1>Add New User</h1>
                            </div>
                            <div class="container-fluid">
                                <div class="row">
                                    <div class="col-md-4">
                                        <label>
                                            <p class="label-txt">Guardian NIC</p>
                                            <input type="text" class="input" name="guardiannic" id="guardiannic">
                                            <div class="line-box">
                                                <div class="line"></div>
                                            </div>
                                        </label>
                                    </div>	
                                    <div class="col-md-4 ">
                                        <label>
                                            <p class="label-txt">Guardian Name</p>
                                            <input type="text" class="input" name="guardianname" id="guardianname">
                                            <div class="line-box">
                                                <div class="line"></div>
                                            </div>
                                        </label>
                                    </div>	
                                    <div class="col-md-4 ">
                                        <label>
                                            <p class="label-txt">Contact No</p>
                                            <input type="text" class="input" name="contactno" id="contactno">
                                            <div class="line-box">
                                                <div class="line"></div>
                                            </div>
                                        </label>
                                    </div>
                                </div>
                            </div>
                            <div class="container-fluid">
                                <div class="row">
                                    <div class="col-md-4">
                                        <label>
                                            <p class="label-txt">Email</p>
                                            <input type="text" class="input" name="email" id="email">
                                            <div class="line-box">
                                                <div class="line"></div>
                                            </div>
                                        </label>
                                    </div>
                                    <div class="col-md-4">
                                        <label>
                                            <p class="label-txt">Password</p>
                                            <input type="text" class="input" name="password" id="password">
                                            <div class="line-box">
                                                <div class="line"></div>
                                            </div>
                                        </label>
                                    </div>
                                    <div class="col-md-5">
                                        <label>
                                            <p class="label-txt">Address</p>
                                            <input type="text" class="input" name="address" id="address">
                                            <div class="line-box">
                                                <div class="line"></div>
                                            </div>
                                        </label>
                                    </div>	

                                </div>
                            </div>
                            <div class="container-fluid">
                                <div class="row">
                                    <div class="col-md-4 ">
                                        <label>
                                            <p class="label-txt">Mother's Name</p>
                                            <input type="text" class="input" name="mothername" id="mothername">
                                            <div class="line-box">
                                                <div class="line"></div>
                                            </div>
                                        </label>
                                    </div>
                                </div>
                            </div>
                            <center>  
                                <button type="button" onclick="userRegistraion();">Submit</button>
                            </center> 
                        </div>
                        <div  style="margin-top: 70px" class="tab-pane fade" id="tabpanel2" role="tabpanel">
                            <div class="container-fluid" id="hedding">
                                <h1>Add Child</h1>
                            </div>
                            <div  class="container-fluid">
                                <div class="row">
                                    <div class="col-md-4">
                                        <label>
                                            <p class="label-txt">Health Physician No</p>
                                            <input type="text" class="input" name="physicianno1" id="physicianno1">
                                            <div class="line-box">
                                                <div class="line"></div>
                                            </div>
                                        </label>
                                    </div>	
                                    <div class="col-md-4 ">
                                        <label>
                                            <p class="label-txt">Family Health Physician No</p>
                                            <input type="text" class="input" name="physicianno2" id="physicianno2">
                                            <div class="line-box">
                                                <div class="line"></div>
                                            </div>
                                        </label>
                                    </div>	
                                    <div class="col-md-4 ">
                                        <label>
                                            <p class="label-txt">Child Birth Registered No</p>
                                            <input type="text" class="input" name="childbirthregisterno" id="childbirthregisterno">
                                            <div class="line-box">
                                                <div class="line"></div>
                                            </div>
                                        </label>
                                    </div>
                                </div>
                            </div>

                            <div class="container-fluid">
                                <div class="row">
                                    <div class="col-md-3">
                                        <label>
                                            <p class="label-txt">Search by NIC</p>
                                            <input type="text" class="input" id="NICNo">
                                            <div class="line-box">
                                                <div class="line"></div>
                                            </div>
                                        </label>
                                    </div>	
                                    <div class="col-md-2">
                                        <button id="searchnic" type="button" onclick="searchGurdianbyNIC();"><i class="fa fa-search"></i></button>
                                    </div>
                                    <div class="col-md-4">
                                        <label>
                                            <p class="label-txt">Guardian Name</p>
                                            <input type="text" class="input" name="childname" id="guardianName">
                                            <div class="line-box">
                                                <div class="line"></div>
                                            </div>
                                        </label>
                                    </div>
                                    <div  class="container-fluid">
                                        <div class="row">
                                            <div class="col-md-4">
                                                <label>
                                                    <p class="label-txt">Child Name</p>
                                                    <input type="text" class="input" name="childname" id="childname">
                                                    <div class="line-box">
                                                        <div class="line"></div>
                                                    </div>
                                                </label>
                                            </div>
                                            <div class="col-md-2">
                                                <label>
                                                    <p class="label-txt">Gender</p>
                                                    <div  style="color: rgb(120,120,120); padding-top: 28px; padding-left: 20px">
                                                        <input class="form-check-input" type="radio" name="gender" id="boy" value="boy">
                                                        Boy &emsp;&emsp;
                                                        <input class="form-check-input" type="radio" name="gender" id="girl" value="girl">
                                                        Girl
                                                    </div>
                                                </label>
                                            </div>
                                            <div class="col-md-3">
                                                <label>
                                                    <p class="label-txt">Date of Birth</p>
                                                    <input type="text" class="input" name="childbirthday" id="childbirthday">
                                                    <div class="line-box">
                                                        <div class="line"></div>
                                                    </div>
                                                </label>
                                            </div>	

                                        </div>
                                    </div>

                                    <center>  
                                        <button type="button" onclick="childRegistraion();">Submit</button>
                                    </center> 
                                </div>
                            </div>
                            </form>
                            </form>
                        </div>
                        <div  style="margin-top: 70px" class="tab-pane fade" id="tabpanel3" role="tabpanel">
                            <div class="container-fluid" id="hedding">
                                <div class="container-fluid" id="hedding">
                                    <h1>Add Record</h1>
                                </div>
                            </div>
                            <div  class="container-fluid">
                                <div class="row">
                                    <div class="col-md-3">
                                        <label>
                                            <p class="label-txt">Search by NIC</p>
                                            <input type="text" class="input" id="recordNICNo">
                                            <div class="line-box">
                                                <div class="line"></div>
                                            </div>
                                        </label>
                                    </div>	
                                    <div class="col-md-2">
                                        <button id="searchnic" type="submit" onclick="searchgNICforRecord();"><i class="fa fa-search"></i></button>
                                    </div>
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
                                    <div class="col-md-3 ">
                                        <label>
                                            <p class="label-txt">Date of Measurement</p>
                                            <input type="text" class="input" id="dateofMeasurement">
                                            <div class="line-box">
                                                <div class="line"></div>
                                            </div>
                                        </label>
                                    </div>	
                                    <div class="col-md-2 ">
                                        <label>
                                            <p class="label-txt">Weight(in Kg)</p>
                                            <input type="text" class="input" id="weight">
                                            <div class="line-box">
                                                <div class="line"></div>
                                            </div>
                                        </label>
                                    </div>
                                    <div class="col-md-2">
                                        <label>
                                            <p class="label-txt">Height(in cm)</p>
                                            <input type="text" class="input" id="height">
                                            <div class="line-box">
                                                <div class="line"></div>
                                            </div>
                                        </label>
                                    </div>
                                </div>
                                <center>  
                                    <button type="submit" onclick="saveRecord()">Submit</button>
                                </center>
                            </div><br><br>
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
                            </div>
                            <br><br>     <br><br>
                        </div>
                        <div  style="margin-top: 70px" class="tab-pane fade" id="tabpanel4" role="tabpanel">
                            <div class="container-fluid" id="hedding">
                                <h1>Search Child</h1>
                            </div>

                            <!--                            <form>-->
                            <div  class="container-fluid">
                                <div class="row">
                                    <div class="col-md-2">
                                        <label>
                                            <p class="label-txt">Search by NIC</p>
                                            <input type="text" class="input" id="vaccineNicNo">
                                            <div class="line-box">
                                                <div class="line"></div>
                                            </div>
                                        </label>
                                    </div>	
                                    <div class="col-md-1">
                                        <button id="vaccinesearchnic" type="submit" onclick="searchgNICforVacccine();"><i class="fa fa-search"></i></button>
                                    </div>
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
                                            <center>  
                                                <button type="submit" onclick="saveChildVacinationDetails()">Submit</button>
                                            </center>
                                        </div>
                                    </div>

                                </div>
                            </div>
                        </div>
                        <div  style="margin-top: 70px" class="tab-pane fade" id="tabpanel5" role="tabpanel">
                            <div class="container-fluid" id="hedding">
                                <h1>Send Reminder</h1>
                            </div>
                            <div  class="container-fluid">
                                <div class="row">

                                    <div class="col-md-3">
                                        <label>
                                            <p class="label-txt">Clinic Date</p>
                                            <input type="text" class="input" id="ClinicDate">
                                            <div class="line-box">
                                                <div class="line"></div>
                                            </div>
                                        </label>
                                    </div>	
                                    <div class="col-md-2">
                                        <br>
                                        <button type="submit" onclick="searchForMail();">Search Email</button>
                                    </div>
                                    <div class="col-md-8">
                                        <label>
                                            <p class="label-txt">To</p>
                                            <input type="text" class="input" name="to" id="to">
                                            <div class="line-box">
                                                <div class="line"></div>
                                            </div>
                                        </label>
                                        <label>
                                            <p class="label-txt">Subject</p>
                                            <input type="text" class="input" name="subject" id="subject"> Next Clinic Date
                                            <div class="line-box">
                                                <div class="line"></div>
                                            </div>
                                        </label>
                                        <label>
                                            <p class="label-txt">Content</p>
                                            <input type="text" class="input" name="physicianno1" id="content">Please Be At 8.30 
                                            <div class="line-box">
                                                <div class="line"></div>
                                            </div>
                                        </label>
                                        <button type="button" onclick="sendMail();">Submit</button>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div  style="margin-top: 70px" class="tab-pane fade" id="tabpanel6" role="tabpanel">
                            <h2></h2><br>
                            <div class="container-fluid" id="hedding">
                                <h1>Search</h1>
                            </div>
                            <div class="col-md-12">
                                <div class="row">
                                    <div class="col-md-2">
                                        <label>
                                            <p class="label-txt">Date</p>
                                            <input type="text" class="input" name="" id="date1">
                                            <div class="line-box">
                                                <div class="line"></div>
                                            </div>
                                        </label>
                                    </div>
                                    <div class="col-md-2">
                                        <label>
                                            <p class="label-txt">Between</p>

                                        </label>
                                    </div>
                                    <div class="col-md-2">
                                        <label>
                                            <p class="label-txt">Date</p>
                                            <input type="text" class="input" name="" id="date2">
                                            <div class="line-box">
                                                <div class="line"></div>
                                            </div>
                                        </label>
                                    </div>
                                    <div class="col-md-2">
                                        <label>
                                            <!--                                            <select class="custom-select" aria-label="Default select example" id="vaccinenameSelector" onchange="setNameToVaccineTextFeild(this)">-->
                                            <select class="custom-select" aria-label="Default select example" id="weightSelector" onchange="searchWeightDetails(this)">
                                                <option value="0">Search By Weight</option>
                                                <option value="3.5">Birth Weight<3.5</option>
                                                <option value=""></option>
                                            </select>
                                        </label>
                                    </div>
                                </div>

                            </div>
                            <table id="" class="grid table table-bordered table-sortable">
                                <thead>
                                    <tr><th>Birth Registration No</th><th>Weight(Kg)</th><th>Height(cm)</th><th>Child Name</th><th> Gender</th><th>Guardian NIC</th><th>Guardian Name</th><th>Contact no</th></tr>
                                </thead>
                                <tbody id="searchWeightTable">
                                </tbody>
                            </table>
                        </div>
                    </div>
                </div></div>
        </div>

    </body>
    <script>
        $(document).ready(function () {
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
        //     $( "#m" ).click(function(ev) {
        //    ev.stopImmediatePropagation(); // sometimes click event fires twice in jQuery you can prevent it by this method.
        //    $( "#myModal" ).show(); // you should use native function of Bootstrap.
        //});





        function searchgNIC() {
            var nic = document.getElementById('NICNo').value;//get nic value
            alert(recordNICNo);
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
            xmlHttpRequest.open("GET", "../SearchChild?NIC=" + nic, true);
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


        $(document).ready(function () {
            var today = new Date();
            var date = today.getFullYear() + '-' + (today.getMonth() + 1) + '-' + today.getDate();
            document.getElementById('dateofMeasurement').value = date;
        });
        function saveRecord() {
            var nic = document.getElementById("recordNICNo").value;//get nic value
            var childName = $('#childName').val();
            var dateMeasurement = $('#dateofMeasurement').val();
            var weight = $('#weight').val();
            var height = $('#height').val();
            var years = $('#years').val();
            var months = $('#months').val();
            var days = $('#days').val();
            var xmlHttpRequest = new XMLHttpRequest();
            xmlHttpRequest.onreadystatechange = function () {
                if (xmlHttpRequest.readyState === 4 && xmlHttpRequest.status === 200) {

                    var respone = xmlHttpRequest.responseText;
                    if (respone == "OK") {

                        alert('add sucsess');
                        setNameToTextFeild(childName);
                        searchgNIC();
                    } else {

                        alert('Error');
                    }

                }

            };
            xmlHttpRequest.open("GET", "../AddChildRecord?nicNo=" + nic + "&childName=" + childName + "&dateMeasurement=" + dateMeasurement + "&weight=" + weight + "&height=" + height + "&years=" + years + "&months=" + months + "&days=" + days, true);
            xmlHttpRequest.send();
        }

        function searchgNICforVacccine() {
            var nic = $('#vaccineNicNo').val(); //get nic value
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
            xmlHttpRequest.open("GET", "../SearchChild?NIC=" + nic, true);
            xmlHttpRequest.send();
        }



        function saveChildVacinationDetails() {
            var vaccinechildName = $("#vaccinechildName").val();
            var table2 = document.getElementById("tableVaccineRecordDetailsBody2");
            var checkBoxes = table2.getElementsByClassName("checkmark");

            var checkedValue = null;
            var inputElements = table2.getElementsByClassName("checkmark");
            for (var i = 0; inputElements[i]; ++i) {
                if (inputElements[i].checked) {
                    checkedValue = inputElements[i].value;
                    break;
                }
            }


            var xmlHttpRequest = new XMLHttpRequest();
            xmlHttpRequest.onreadystatechange = function () {
                if (xmlHttpRequest.readyState === 4 && xmlHttpRequest.status === 200) {
                    var response = xmlHttpRequest.responseText;
                }
            };
            xmlHttpRequest.open("GET", "../AddChildVaccineDetails?vaccinechildName=" + vaccinechildName, true);
            xmlHttpRequest.send();
        }

        function searchVaccineDetails(name) {
            var nic = $('#vaccineNicNo').val();
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
//                        alert(xx);
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
            xmlHttpRequest.open("GET", "../AdminPanelSearchVaccineDetails?childName=" + childname + "&userNIC=" + nic, true);
            xmlHttpRequest.send();
        }

        var vaccineIdarray = [];

        function checkboxstatus(checkbox) {
            var varray = checkbox.id;
            var checked = checkbox.checked;

            if (checked)
                vaccineIdarray.push(varray);
            else {
                var index = vaccineIdarray.indexOf(varray);
                if (index !== -1) {
                    vaccineIdarray.splice(index, 1);
                }
            }
        }

        function saveChildVacinationDetails() {
            alert(vaccineIdarray);
            var vaccineNicNo = $("#vaccineNicNo").val();
            var vaccinechildName = $("#vaccinechildName").val();
            vaccineIdarray;
            var xmlHttpRequest = new XMLHttpRequest();
            xmlHttpRequest.onreadystatechange = function () {
                if (xmlHttpRequest.readyState === 4 && xmlHttpRequest.status === 200) {
                    var response = xmlHttpRequest.responseText;
                    if (response == "OK") {
                        alert('ok');

                    } else {
                        alert('hfghok');
                    }

                }
            };
            xmlHttpRequest.open("GET", "../ChildVaccineRegistraion?vaccineNicNo=" + vaccineNicNo + "&vaccinechildName=" + vaccinechildName + "&vaccineIds=" + vaccineIdarray, true);
            xmlHttpRequest.send();
        }


        function showWeightAge() {
            var userNIC = document.getElementById("recordNICNo").value;
            var childName = document.getElementById("childName").value;
            window.open("http://localhost:8080/KiddieCare/AdminPanel/WeightAgeGraph.jsp?childName=" + childName + "&userNIC=" + userNIC, "Window Name", "width=900,height=950");

        }

        function showHeightAge() {
            var userNIC = document.getElementById("recordNICNo").value;
            var childName = document.getElementById("childName").value;
            window.open("http://localhost:8080/KiddieCare/AdminPanel/HeightAgeGraph.jsp?childName=" + childName + "&userNIC=" + userNIC, "Window Name", "width=900,height=950");

        }

        function userRegistraion() {

            var guardiannic = document.getElementById("guardiannic").value;
            var guardianName = document.getElementById("guardianname").value;
            var email = document.getElementById("email").value;
            var password = document.getElementById("password").value;
            var contactNo = document.getElementById("contactno").value;
            var address = document.getElementById("address").value;
            var motherName = document.getElementById("mothername").value;

            var xmlHttpRequest = new XMLHttpRequest();
            xmlHttpRequest.onreadystatechange = function () {
                if (xmlHttpRequest.readyState === 4 && xmlHttpRequest.status === 200) {
                    var response = xmlHttpRequest.responseText;
                    if (response == "OK") {
                        alert('User Succesfully Added');
                        location.reload();
                    } else {
                        alert('Error');
                    }

                }
            };
            xmlHttpRequest.open("GET", "../UserRegisration?guardiannic=" + guardiannic + "&guardianName=" + guardianName + "&email=" + email + "&password=" + password + "&contactNo=" + contactNo + "&address=" + address + "&motherName=" + motherName, true);
            xmlHttpRequest.send();
        }

        function searchGurdianbyNIC() {
            var nic = document.getElementById("NICNo").value;
            var xmlHttpRequest = new XMLHttpRequest();
            xmlHttpRequest.onreadystatechange = function () {
                if (xmlHttpRequest.readyState === 4 && xmlHttpRequest.status === 200) {
                    var response = xmlHttpRequest.responseText;
                    if (response != "") {
                        document.getElementById("guardianName").value = response;
                    } else {
                        alert("Not Registed User");
                    }

                }
            };
            xmlHttpRequest.open("GET", "../userName?nic=" + nic, true);
            xmlHttpRequest.send();
        }

        function childRegistraion() {
            var nic = document.getElementById("NICNo").value;
            var physicianno1 = document.getElementById("physicianno1").value;
            var physicianno2 = document.getElementById("physicianno2").value;
            var childbirthregisterno = document.getElementById("childbirthregisterno").value;
            var childname = document.getElementById("childname").value;
            var childbirthday = document.getElementById("childbirthday").value;
            if (document.getElementById("boy").checked) {
                var gender = document.getElementById("boy").value;
            } else {
                var gender = document.getElementById("girl").value;
            }
            var xmlHttpRequest = new XMLHttpRequest();
            xmlHttpRequest.onreadystatechange = function () {
                if (xmlHttpRequest.readyState === 4 && xmlHttpRequest.status === 200) {
                    var response = xmlHttpRequest.responseText;
                    if (response == "Ok") {
                        alert("Child Registed Succsesfully");
                        location.reload();
                    } else {
                        alert("Error");
                    }
                }
            };
            xmlHttpRequest.open("GET", "../ChildRegistraion?userNic=" + nic + "&physicianno1=" + physicianno1 + "&physicianno2=" + physicianno2 + "&childbirthregisterno=" + childbirthregisterno + "&childname=" + childname + "&childbirthday=" + childbirthday + "&gender=" + gender, true);
            xmlHttpRequest.send();
        }


        ////////////////////////////////////////////////////////// 
        $.fn.jQuerySimpleCounter = function (options) {
            var settings = $.extend({
                start: 0,
                end: 100,
                easing: 'swing',
                duration: 400,
                complete: ''
            }, options);

            var thisElement = $(this);

            $({count: settings.start}).animate({count: settings.end}, {
                duration: settings.duration,
                easing: settings.easing,
                step: function () {
                    var mathCount = Math.ceil(this.count);
                    thisElement.text(mathCount);
                },
                complete: settings.complete
            });
        };


        $('#number1').jQuerySimpleCounter({end: 12, duration: 3000});
        $('#number2').jQuerySimpleCounter({end: 55, duration: 3000});
        $('#number3').jQuerySimpleCounter({end: 359, duration: 2000});
        $('#number4').jQuerySimpleCounter({end: 246, duration: 2500});



        /* AUTHOR LINK */
        $('.about-me-img').hover(function () {
            $('.authorWindowWrapper').stop().fadeIn('fast').find('p').addClass('trans');
        }, function () {
            $('.authorWindowWrapper').stop().fadeOut('fast').find('p').removeClass('trans');
        });


        function searchgNICforRecord() {
            var nic = document.getElementById('recordNICNo').value;//get nic value
            alert(nic);
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
            xmlHttpRequest.open("GET", "../SearchChild?NIC=" + nic, true);
            xmlHttpRequest.send();
        }


        function searchWeightDetails() {
            var date1 = document.getElementById('date1').value;
            var date2 = document.getElementById('date2').value;
            var x = document.getElementById("weightSelector").selectedIndex;
            var weightSelector = document.getElementById("weightSelector").options[x].value;
            var xmlHttpRequest = new XMLHttpRequest();
            xmlHttpRequest.onreadystatechange = function () {
                if (xmlHttpRequest.readyState === 4 && xmlHttpRequest.status === 200) {

                    var response = xmlHttpRequest.responseText;
                    var SearchWeightDetails = JSON.parse(response).SearchWeightDetails;
                    console.log(SearchWeightDetails);

                    var rowcount = SearchWeightDetails.length;
                    for (var i = 0; i < rowcount; i++) {
                        var table = document.getElementById("searchWeightTable");
                        var row = table.insertRow(0);
                        var cell1 = row.insertCell(0);
                        var cell2 = row.insertCell(1);
                        var cell3 = row.insertCell(2);
                        var cell4 = row.insertCell(3);
                        var cell5 = row.insertCell(4);
                        var cell6 = row.insertCell(5);
                        var cell7 = row.insertCell(6);
                        var cell8 = row.insertCell(7);
                        cell1.innerHTML = SearchWeightDetails[i]["birthregisterNo"];
                        cell2.innerHTML = SearchWeightDetails[i]["weight"];
                        cell3.innerHTML = SearchWeightDetails[i]["height"];
                        cell4.innerHTML = SearchWeightDetails[i]["child_name"];
                        cell5.innerHTML = SearchWeightDetails[i]["gender"];
                        cell6.innerHTML = SearchWeightDetails[i]["nic"];
                        cell7.innerHTML = SearchWeightDetails[i]["guardian_name"];
                        cell8.innerHTML = SearchWeightDetails[i]["contact_no"];

                    }
                }
            };
            xmlHttpRequest.open("GET", "../SearchWeightDetails?date1=" + date1 + "&date2=" + date2 + "&weightSelector=" + weightSelector, true);
            xmlHttpRequest.send();

        }
        function sendMail() {
            var to = document.getElementById('to').value;
            var subject = document.getElementById('subject').value;
            var content = document.getElementById('content').value;
            var xmlHttpRequest = new XMLHttpRequest();
            xmlHttpRequest.onreadystatechange = function () {
                if (xmlHttpRequest.readyState === 4 && xmlHttpRequest.status === 200) {

                    var response = xmlHttpRequest.responseText;
                }
            };
            xmlHttpRequest.open("POST", "../EmailSendingServlet", true);
            xmlHttpRequest.setRequestHeader("Content-type", "application/x-www-form-urlencoded");
            xmlHttpRequest.send("to=" + to + "&subject=" + subject + "&content=" + content);

        }
        function searchForMail() {
            var ClinicDate = document.getElementById("ClinicDate").value;
            var xmlHttpRequest = new XMLHttpRequest();
            xmlHttpRequest.onreadystatechange = function () {
                if (xmlHttpRequest.readyState === 4 && xmlHttpRequest.status === 200) {

                    var response = xmlHttpRequest.responseText;
                    var emails = JSON.parse(response).emails;
                    for (var i = 0; i < emails.length; i++) {
                        document.getElementById('to').value = emails[i];

                    }

                }
            };
            xmlHttpRequest.open("GET", "../SearchforMail?ClinicDate=" + ClinicDate, true);
            xmlHttpRequest.send();
        }

    </script>
</html>
