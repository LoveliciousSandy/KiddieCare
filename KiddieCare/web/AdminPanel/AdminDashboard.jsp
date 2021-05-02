<%-- 
    Document   : Admin Panel
    Created on : Apr 5, 2021, 2:06:26 AM
    Author     : Senani
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>

<html>

    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Admin Dashboard</title>
        <jsp:include page="../Links/Links.jsp"></jsp:include>

        <style>
            #mainbutton{
                width: 200px;
                height: 200px;
            }

            .nav-link:hover {
                transition: all 0.4s;
            }

            .nav-link-collapse:after {
                float: right;
                content: '\f067';
                font-family: 'FontAwesome';
            }

            .nav-link-show:after {
                float: right;
                content: '\f068';
                font-family: 'FontAwesome';
            }

            .nav-item ul.nav-second-level {
                padding-left: 0;
            }

            .nav-item ul.nav-second-level > .nav-item {
                padding-left: 20px;
            }
            .navbar-icon-top .navbar-nav .nav-link > .fa {
                position: relative;
                width: 36px;
                font-size: 24px;
            }

            .navbar-icon-top .navbar-nav .nav-link > .fa > .badge {
                font-size: 0.75rem;
                position: absolute;
                right: 0;
                font-family: sans-serif;
            }

            .navbar-icon-top .navbar-nav .nav-link > .fa {
                top: 3px;
                line-height: 12px;
            }

            .navbar-icon-top .navbar-nav .nav-link > .fa > .badge {
                top: -10px;
            }


            @media (min-width: 992px) {
                .sidenav {
                    position: absolute;
                    top: 0;
                    left: 0;
                    width: 230px;
                    height: calc(100vh - 3.5rem);
                    margin-top: 3.5rem;
                    background: #343a40;
                    box-sizing: border-box;
                    border-top: 1px solid rgba(0, 0, 0, 0.3);
                }

                .navbar-expand-lg .sidenav {
                    flex-direction: column;
                }
            }

            @media (min-width: 576px) {
                .navbar-icon-top.navbar-expand-sm .navbar-nav .nav-link {
                    text-align: center;
                    display: table-cell;
                    height: 70px;
                    vertical-align: middle;
                    padding-top: 0;
                    padding-bottom: 0;
                }

                .navbar-icon-top.navbar-expand-sm .navbar-nav .nav-link > .fa {
                    display: block;
                    width: 48px;
                    margin: 2px auto 4px auto;
                    top: 0;
                    line-height: 24px;
                }

                .navbar-icon-top.navbar-expand-sm .navbar-nav .nav-link > .fa > .badge {
                    top: -7px;
                }
            }

            @media (min-width: 768px) {
                .navbar-icon-top.navbar-expand-md .navbar-nav .nav-link {
                    text-align: center;
                    display: table-cell;
                    height: 70px;
                    vertical-align: middle;
                    padding-top: 0;
                    padding-bottom: 0;
                }

                .navbar-icon-top.navbar-expand-md .navbar-nav .nav-link > .fa {
                    display: block;
                    width: 48px;
                    margin: 2px auto 4px auto;
                    top: 0;
                    line-height: 24px;
                }

                .navbar-icon-top.navbar-expand-md .navbar-nav .nav-link > .fa > .badge {
                    top: -7px;
                }
            }

            @media (min-width: 992px) {
                .navbar-icon-top.navbar-expand-lg .navbar-nav .nav-link {
                    text-align: center;
                    display: table-cell;
                    height: 70px;
                    vertical-align: middle;
                    padding-top: 0;
                    padding-bottom: 0;
                }

                .navbar-icon-top.navbar-expand-lg .navbar-nav .nav-link > .fa {
                    display: block;
                    width: 48px;
                    margin: 2px auto 4px auto;
                    top: 0;
                    line-height: 24px;
                }

                .navbar-icon-top.navbar-expand-lg .navbar-nav .nav-link > .fa > .badge {
                    top: -7px;
                }
            }

            @media (min-width: 1200px) {
                .navbar-icon-top.navbar-expand-xl .navbar-nav .nav-link {
                    text-align: center;
                    display: table-cell;
                    height: 70px;
                    vertical-align: middle;
                    padding-top: 0;
                    padding-bottom: 0;
                }

                .navbar-icon-top.navbar-expand-xl .navbar-nav .nav-link > .fa {
                    display: block;
                    width: 48px;
                    margin: 2px auto 4px auto;
                    top: 0;
                    line-height: 24px;
                }

                .navbar-icon-top.navbar-expand-xl .navbar-nav .nav-link > .fa > .badge {
                    top: -7px;
                }
            }

            /*            /////////////////////////////////*/
            label {
                display: block;
                position: relative;
                margin: 40px 0px;
            }
            .label-txt {
                position: absolute;
                top: -1.6em;
                padding: 10px;
                /*                font-family: initial;
                                font-size: large;*/
                letter-spacing: 1px;
                color: rgb(120,120,120);
                transition: ease .3s;
            }
            .input {
                width: 100%;
                padding: 10px;
                background: transparent;
                border: none;
                outline: none;
                /*                font-family: initial;
                                font-size: larger;*/

            }

            .line-box {
                position: relative;
                width: 100%;
                height: 2px;
                background: #BCBCBC;
            }

            .line {
                position: absolute;
                width: 0%;
                height: 2px;
                top: 0px;
                left: 50%;
                transform: translateX(-50%);
                background:  blueviolet;
                transition: ease .6s;
            }

            .input:focus + .line-box .line {
                width: 100%;
            }

            .label-active {
                top: -3em;
            }
            button {
                display: inline-block;
                padding: 15px 120px;
                background: rgb(220,220,220);
                font-weight: bold;
                color: rgb(120,120,120);
                border: none;
                outline: none;
                border-radius: 3px;
                cursor: pointer;
                transition: ease .3s;
            }

            button:hover {
                background: blueviolet;
                color: #ffffff;
            }
            .btn-gender{
                display: inline-block;
                padding: 120px 120px;
                background: rgb(220,220,220);
                font-weight: bold;
                color: rgb(120,120,120);
                border: none;
                outline: none;
                border-radius: 3px;
                cursor: pointer;
                transition: ease .3s;
                margin-left: 20px;
            }

            #boy:hover{
                background-color: dodgerblue;
            }
            #girl:hover{
                background-color: deeppink;
            }

            #searchnic{
                padding: 10px 25px;
                margin-top: 40px;
                margin-left: -30px;
                background-color: blueviolet;
                border: none;
            }
        </style>
    </head>
    <body>
        <div class="container-fluid">
            <div class="row">
                <div class="col-md-2" style="background-color:yellow;">
                    <!--                            side nav bar-->
                    <nav class="navbar navbar-expand-lg navbar-dark fixed-top bg-dark">
                        <a class="navbar-brand" href="#">Sidebar Nav</a>
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
                                <!--                                <li class="nav-item active">
                                                                    <a class="nav-link" href="#"> <i class="fa fa-dashboard fa-lg"></i> Dashboard</a>
                                                                </li>-->
                                <br><br>
                                <li class="nav-item">
                                    <a class="nav-link" href="#tabpanel1" data-toggle="tab"  role="tab">Dashboard</a>
                                </li>
                                <li class="nav-item">
                                    <a
                                        class="nav-link nav-link-collapse"
                                        href="#"
                                        id="hasSubItems"
                                        data-toggle="collapse"
                                        data-target="#collapseSubItems2"
                                        aria-controls="collapseSubItems2"
                                        aria-expanded="false"
                                        >Child</a>
                                    <ul class="nav-second-level collapse" id="collapseSubItems2" data-parent="#navAccordion">
                                        <li class="nav-item" data-toggle="modal" data-target="#myModal">
                                            <a class="nav-link" href="#tabpanel2" data-toggle="tab" data-target="#tabpanel2" role="tab" aria-selected="true">
                                                <span class="nav-link-text" >Add Child</span>
                                            </a>
                                        </li>
                                        <li class="nav-item">
                                            <a class="nav-link" href="#tabpanel3" data-toggle="tab" role="tab">
                                                <span class="nav-link-text">Search Child</span>
                                            </a>
                                        </li>
                                    </ul>
                                </li>
                                <li class="nav-item">
                                    <a class="nav-link" href="#">Item 3</a>
                                </li>
                                <li class="nav-item">
                                    <a
                                        class="nav-link nav-link-collapse"
                                        href="#"
                                        id="hasSubItems"
                                        data-toggle="collapse"
                                        data-target="#collapseSubItems4"
                                        aria-controls="collapseSubItems4"
                                        aria-expanded="false"
                                        >Growth Tracker</a>
                                    <ul class="nav-second-level collapse" id="collapseSubItems4" data-parent="#navAccordion">
                                        <li class="nav-item" >
                                            <a class="nav-link" href="#tabpaneladdrecord" data-toggle="tab" data-target="tabpaneladdrecord" role="tab" aria-selected="true">
                                                <span class="nav-link-text">Add Record</span>
                                            </a>
                                        </li>
                                        <li class="nav-item">
                                            <a class="nav-link" href="#">
                                                <span class="nav-link-text">Item 4.2</span>
                                            </a>
                                        </li>
                                        <li class="nav-item">
                                            <a class="nav-link" href="#">
                                                <span class="nav-link-text">Item 4.2</span>
                                            </a>
                                        </li>
                                    </ul>
                                </li>
                                <li class="nav-item">
                                    <a class="nav-link" href="#">Item 5</a>
                                </li>
                            </ul>
                            <ul class="navbar-nav ml-auto mt-2 mt-md-0"">
                                <li class="nav-item">
                                    <a class="nav-link" href="#">
                                        <i class="fa fa-bell">
                                            <span class="badge badge-info">11</span>
                                        </i>
                                        Test
                                    </a>
                                </li>
                                <li class="nav-item">
                                    <a class="nav-link" href="#">
                                        <i class="fa fa-globe">
                                            <span class="badge badge-success">11</span>
                                        </i>
                                        Test
                                    </a>
                                </li>
                                <li class="nav-item dropdown">
                                    <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                        <i class="fa fa-envelope-o">
                                            <span class="badge badge-primary">11</span>
                                        </i>
                                        Dropdown
                                    </a>
                                    <div class="dropdown-menu" aria-labelledby="navbarDropdown">
                                        <a class="dropdown-item" href="#">Action</a>
                                        <a class="dropdown-item" href="#">Another action</a>
                                        <div class="dropdown-divider"></div>
                                        <a class="dropdown-item" href="#">Something else here</a>
                                    </div>
                                </li>
                            </ul>
                        </div>
                    </nav>
                </div>
                <div class="col-md-10"> 
                    <div class="tab-content pt-0">


                        <div  style="margin-top: 70px" class="tab-pane fade  " id="tabpanel1" role="tabpanel">
                            <h2>Dashboard</h2>
                        </div>
                        <div  style="margin-top: 70px" class="tab-pane fade" id="tabpanel2" role="tabpanel">
                            <h2>Add Child</h2><br>
                            <form action="../ChildRegistraion" method="POST">
                                <div  class="container-fluid">
                                    <div class="row">
                                        <div class="col-md-4">
                                            <label>
                                                <p class="label-txt">Health Physician No</p>
                                                <input type="text" class="input" name="physicianno1">
                                                <div class="line-box">
                                                    <div class="line"></div>
                                                </div>
                                            </label>
                                        </div>	
                                        <div class="col-md-4 ">
                                            <label>
                                                <p class="label-txt">Family Health Physician No</p>
                                                <input type="text" class="input" name="physicianno2">
                                                <div class="line-box">
                                                    <div class="line"></div>
                                                </div>
                                            </label>
                                        </div>	
                                        <div class="col-md-4 ">
                                            <label>
                                                <p class="label-txt">Child Birth Registered No</p>
                                                <input type="text" class="input" name="childbirthregisterno">
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
                                                <p class="label-txt">Guardian NIC</p>
                                                <input type="text" class="input" name="guardiannic">
                                                <div class="line-box">
                                                    <div class="line"></div>
                                                </div>
                                            </label>
                                        </div>	
                                        <div class="col-md-4 ">
                                            <label>
                                                <p class="label-txt">Guardian Name</p>
                                                <input type="text" class="input" name="guardianname">
                                                <div class="line-box">
                                                    <div class="line"></div>
                                                </div>
                                            </label>
                                        </div>	
                                        <div class="col-md-4 ">
                                            <label>
                                                <p class="label-txt">Contact No</p>
                                                <input type="text" class="input" name="contactno">
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
                                                <input type="text" class="input" name="email">
                                                <div class="line-box">
                                                    <div class="line"></div>
                                                </div>
                                            </label>
                                        </div>
                                        <div class="col-md-4">
                                            <label>
                                                <p class="label-txt">Password</p>
                                                <input type="text" class="input" name="password">
                                                <div class="line-box">
                                                    <div class="line"></div>
                                                </div>
                                            </label>
                                        </div>
                                        <div class="col-md-5">
                                            <label>
                                                <p class="label-txt">Address</p>
                                                <input type="text" class="input" name="address">
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
                                                <input type="text" class="input" name="mothername">
                                                <div class="line-box">
                                                    <div class="line"></div>
                                                </div>
                                            </label>
                                        </div>
                                        <div class="col-md-2 ">
                                            <label>
                                                <p class="label-txt">Mother's Age</p>
                                                <input type="text" class="input" name="motherage">
                                                <div class="line-box">
                                                    <div class="line"></div>
                                                </div>

                                            </label>
                                        </div>
                                        <div class="col-md-3 ">
                                            <label>
                                                <p class="label-txt">Number of Children</p>
                                                <input type="text" class="input" name="nochildren">
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
                                                <p class="label-txt">Child Name</p>
                                                <input type="text" class="input" name="childname">
                                                <div class="line-box">
                                                    <div class="line"></div>
                                                </div>
                                            </label>
                                        </div>
                                        <div class="col-md-2">
                                            <label>
                                                <p class="label-txt">Gender</p>
                                                <div  style="color: rgb(120,120,120); padding-top: 28px; padding-left: 20px">
                                                    <input class="form-check-input" type="radio" name="gender" id="boy">
                                                    Boy &emsp;&emsp;
                                                    <input class="form-check-input" type="radio" name="gender" id="girl">
                                                    Girl
                                                </div>
                                            </label>
                                        </div>
                                        <div class="col-md-3">
                                            <label>
                                                <p class="label-txt">Date of Birth</p>
                                                <input type="text" class="input" name="childbirthday">
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
                                                <p class="label-txt">Age</p>
                                                <input type="text" class="input" name="childage">
                                                <div class="line-box">
                                                    <div class="line"></div>
                                                </div>

                                            </label>
                                        </div>
                                        <div class="col-md-1 ">
                                            <label>
                                                <p class="label-txt">Month</p>
                                                <input type="text" class="input" name="month">
                                                <div class="line-box">
                                                    <div class="line"></div>
                                                </div>

                                            </label>
                                        </div>
                                        <div class="col-md-1 ">
                                            <label>
                                                <p class="label-txt">Days</p>
                                                <input type="text" class="input" name="days">
                                                <div class="line-box">
                                                    <div class="line"></div>
                                                </div>

                                            </label>
                                        </div>
                                        <div class="col-md-1 ">

                                        </div>
                                        <div class="col-md-2">
                                            <label>
                                                <p class="label-txt">Birth Weight(Kg)</p>
                                                <input type="text" class="input" name="birthweight">
                                                <div class="line-box">
                                                    <div class="line"></div>
                                                </div>
                                            </label>
                                        </div>
                                        <div class="col-md-2">
                                            <label>
                                                <p class="label-txt">Birth Length(cm)</p>
                                                <input type="text" class="input" name="birthlength">
                                                <div class="line-box">
                                                    <div class="line"></div>
                                                </div>
                                            </label>
                                        </div>
                                    </div>
                                </div>
                                <center>  
                                    <button type="submit">Submit</button>
                                </center> 

                            </form>
                        </div>
                        <br><br>
                        <div  style="margin-top: 70px" class="tab-pane fade" id="tabpanel3" role="tabpanel">
                            <h2>Search Child</h2>

                        </div>
                        <div  style="margin-top: 70px" class="tab-pane fade show active" id="tabpaneladdrecord" role="tabpanel">
                            <h2>Add Record</h2><br>
                            <!--                            <form>-->
                            <div  class="container-fluid">
                                <div class="row">
                                    <div class="col-md-4">
                                        <label>
                                            <p class="label-txt">Search by NIC</p>
                                            <input type="text" class="input" id="NICNo">
                                            <div class="line-box">
                                                <div class="line"></div>
                                            </div>
                                        </label>
                                    </div>	
                                    <div class="col-md-2">
                                        <button id="searchnic" type="submit" onclick="searchgNIC();"><i class="fa fa-search"></i></button>
                                    </div>
                                    <div class="col-md-3">
                                        <label>
                                            <select class="custom-select" aria-label="Default select example">
                                                <option value="1">One</option>
                                                <option value="2">Two</option>
                                                <option value="3">Three</option>
                                            </select>
                                        </label>
                                    </div>	
                                </div>
                            </div>
                            <!--                            </form>-->
                            <div class="container-fluid">
                                <div class="row">
                                    <div class="col-md-4">
                                        <label>
                                            <p class="label-txt">Child Name</p>
                                            <input type="text" class="input">
                                            <div class="line-box">
                                                <div class="line"></div>
                                            </div>
                                        </label>
                                    </div>	
                                    <div class="col-md-3 ">
                                        <label>
                                            <p class="label-txt">Date of Measurement</p>
                                            <input type="text" class="input">
                                            <div class="line-box">
                                                <div class="line"></div>
                                            </div>
                                        </label>
                                    </div>	
                                    <div class="col-md-2 ">
                                        <label>
                                            <p class="label-txt">Weight(in Kg)</p>
                                            <input type="text" class="input">
                                            <div class="line-box">
                                                <div class="line"></div>
                                            </div>
                                        </label>
                                    </div>
                                    <div class="col-md-2">
                                        <label>
                                            <p class="label-txt">Height(in cm)</p>
                                            <input type="text" class="input">
                                            <div class="line-box">
                                                <div class="line"></div>
                                            </div>
                                        </label>
                                    </div>
                                </div>
                                <center>  
                                    <button type="submit">Submit</button>
                                </center>
                            </div><br><br>
                            <div class="container">
                                <div class="row">
                                    <div class="table-responsive col-md-12">
                                        <table id="sort2" class="grid table table-bordered table-sortable">
                                            <thead>
                                                <tr><th>Date</th><th>Weight(Kg)</th><th>Height(cm)</th></tr>
                                            </thead>
                                            <tbody>
                                                <tr>
                                                    <td data-id="11">2021/04/07</td>
                                                    <td><input type="text" value="name 1" class="form-control"></td>
                                                    <td><input type="text" value="email 1" class="form-control"></td>
                                                    <td><button class="btn btn-primary"><i class="far fa-edit"></i>Update</button></td>
                                                </tr>

                                            </tbody>
                                        </table>
                                    </div>
                                </div>
                            </div>

                        </div>
                    </div>

                </div>
            </div>
        </div>
        <!-- Static Modal -->
        <!--        <div class="modal modal-static fade" id="myModal" role="dialog" aria-hidden="true">
                    <div class="modal-dialog modal-dialog-centered modal-lg">
                        <div class="modal-content">
        
                             Modal Header 
                            <div class="modal-header">
                                <h4 class="modal-title">Modal Heading</h4>
                                <button type="button" class="close" data-dismiss="modal">&times;</button>
                            </div>
        
                             Modal body 
                            <div class="modal-body">
                                <div class="container"><div class="row">
                                        <div class="col-md-6 ">
                                            <button id="boy"class="btn btn-gender" name="boy">Its a Boy</button></div>
                                        <div class="col-md-6 ">
                                            <button id="girl" class="btn btn-gender" name="girl">Its a Girl</button></div>
                                    </div>
                                </div>
                            </div>
        
                             Modal footer 
                            <div class="modal-footer">
                                <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
                            </div>
        
                        </div>
                    </div>
                </div>-->

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

            var nic = $('#NICNo').val();
            alert($('#NICNo').val());

            var xmlHttpRequest = new XMLHttpRequest();
            xmlHttpRequest.onreadystatechange = function () {
                if (xmlHttpRequest.readyState === 4 && xmlHttpRequest.status === 200) {
                    alert('hshryrhghd');
                }
            };
            xmlHttpRequest.open("GET", "../SearchChild?NIC=" + nic, true);
            alert('hsh3444444444');
            xmlHttpRequest.send();
            alert('hsh');

        }
    </script>
</html>
