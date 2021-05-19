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

            /*             background: linear-gradient(45deg, #3bade3 0%, #576fe6 25%, #9844b7 51%, #ff357f 100%);*/


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
                background:linear-gradient(45deg, #3bade3 0%, #576fe6 25%, #9844b7 51%, #ff357f 100%);
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
                background-color:rgb(220,220,220);
                border: none;
            }

            #vaccinesearchnic{
                padding: 10px 25px;
                margin-top: 40px;
                margin-left: -30px;
                background-color:rgb(220,220,220);
                border: none;
            }
            .checkout-wrapper{padding-top: 40px; padding-bottom:40px; background-color: #fafbfa;}
            .checkout{    background-color: #fff;
                          border:1px solid #eaefe9;

                          font-size: 14px;}
            .panel{margin-bottom: 0px;}
            .checkout-step {

                border-top: 1px solid #f2f2f2;
                color: #666;
                font-size: 14px;
                padding: 30px;
                position: relative;
            }

            .checkout-step-number {
                border-radius: 50%;
                border: 1px solid #666;
                display: inline-block;
                font-size: 12px;
                height: 32px;
                margin-right: 26px;
                padding: 6px;
                text-align: center;
                width: 32px;
            }
            .checkout-step-title{ font-size: 18px;
                                  font-weight: 500;
                                  vertical-align: middle;display: inline-block; margin: 0px;
            }

            .checout-address-step{}
            .checout-address-step .form-group{margin-bottom: 18px;display: inline-block;
                                              width: 100%;}

            .checkout-step-body{padding-left: 60px; padding-top: 30px;}

            .checkout-step-active{display: block;}
            .checkout-step-disabled{display: none;}

            .checkout-login{}
            .login-phone{display: inline-block;}
            .login-phone:after {
                content: '+91 - ';
                font-size: 14px;
                left: 36px;
            }
            .login-phone:before {
                content: "";
                font-style: normal;
                color: #333;
                font-size: 18px;
                left: 12px;
                display: inline-block;
                font: normal normal normal 14px/1 FontAwesome;
                font-size: inherit;
                text-rendering: auto;
                -webkit-font-smoothing: antialiased;
                -moz-osx-font-smoothing: grayscale;
            }
            .login-phone:after, .login-phone:before {
                position: absolute;
                top: 50%;
                -webkit-transform: translateY(-50%);
                transform: translateY(-50%);
            }
            .login-phone .form-control {
                padding-left: 68px;
                font-size: 14px;

            }
            .checkout-login .btn{height: 42px;     line-height: 1.8;}

            .otp-verifaction{margin-top: 30px;}
            .checkout-sidebar{background-color: #fff;
                              border:1px solid #eaefe9; padding: 30px; margin-bottom: 30px;}
            .checkout-sidebar-merchant-box{background-color: #fff;
                                           border:1px solid #eaefe9; margin-bottom: 30px;}
            .checkout-total{border-bottom: 1px solid #eaefe9; padding-bottom: 10px;margin-bottom: 10px; }
            .checkout-invoice{display: inline-block;
                              width: 100%;}
            .checout-invoice-title{    float: left; color: #30322f;}
            .checout-invoice-price{    float: right; color: #30322f;}
            .checkout-charges{display: inline-block;
                              width: 100%;}
            .checout-charges-title{float: left; }
            .checout-charges-price{float: right;}
            .charges-free{color: #43b02a; font-weight: 600;}
            .checkout-payable{display: inline-block;
                              width: 100%; color: #333;}
            .checkout-payable-title{float: left; }
            .checkout-payable-price{float: right;}

            .checkout-cart-merchant-box{ padding: 20px;display: inline-block;width: 100%; border-bottom: 1px solid #eaefe9;
                                         padding-bottom: 20px; }
            .checkout-cart-merchant-name{color: #30322f; float: left;}
            .checkout-cart-merchant-item{ float: right; color: #30322f; }
            .checkout-cart-products{}

            .checkout-cart-products .checkout-charges{ padding: 10px 20px;
                                                       color: #333;}
            .checkout-cart-item{ border-bottom: 1px solid #eaefe9;
                                 box-sizing: border-box;
                                 display: table;
                                 font-size: 12px;
                                 padding: 22px 20px;
                                 width: 100%;}
            .checkout-item-list{}
            .checkout-item-count{ float: left; }
            .checkout-item-img{width: 60px; float: left;}
            .checkout-item-name-box{ float: left; }
            .checkout-item-title{ color: #30322f; font-size: 14px;  }
            .checkout-item-unit{  }
            .checkout-item-price{float: right;color: #30322f; font-size: 14px; font-weight: 600;}


            .checkout-viewmore-btn{padding: 10px; text-align: center;}

            .header-checkout-item{text-align: right; padding-top: 20px;}
/*//*/
.customcheck {
    display: block;
    position: relative;
    padding-left: 35px;
    margin-bottom: 12px;
    margin-top: 0px;
    cursor: pointer;
    font-size: 22px;
    -webkit-user-select: none;
    -moz-user-select: none;
    -ms-user-select: none;
    user-select: none;
}

/* Hide the browser's default checkbox */
.customcheck input {
    position: absolute;
    opacity: 0;
    cursor: pointer;
}

/* Create a custom checkbox */
.checkmark {
    position: absolute;
    top: 0;
    left: 0;
    height: 25px;
    width: 25px;
    background-color: #eee;
    border-radius: 5px;
}

/* On mouse-over, add a grey background color */
.customcheck:hover input ~ .checkmark {
    background-color: #ccc;
}

/* When the checkbox is checked, add a blue background */
.customcheck input:checked ~ .checkmark {
    background-color: #02cf32;
    border-radius: 5px;
}

/* Create the checkmark/indicator (hidden when not checked) */
.checkmark:after {
    content: "";
    position: absolute;
    display: none;
}

/* Show the checkmark when checked */
.customcheck input:checked ~ .checkmark:after {
    display: block;
}

/* Style the checkmark/indicator */
.customcheck .checkmark:after {
    left: 9px;
    top: 5px;
    width: 5px;
    height: 10px;
    border: solid white;
    border-width: 0 3px 3px 0;
    -webkit-transform: rotate(45deg);
    -ms-transform: rotate(45deg);
    transform: rotate(45deg);
}
        </style>
    </head>
    <body>
        <div class="container-fluid">
            <div class="row">
                <div class="col-md-2" >
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
                                    <a class="nav-link" href="#tabpanel2" data-toggle="tab"  role="tab">Add New Child </a>
                                </li>
                                <li class="nav-item">
                                    <a class="nav-link" href="#tabpanel3" data-toggle="tab"  role="tab">Add Child Record </a>
                                </li>
                                <li class="nav-item">
                                    <a class="nav-link" href="#tabpanel4" data-toggle="tab"  role="tab">Search Child </a>
                                </li>
                                <!--                                <li class="nav-item">
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
                                                                </li>-->
                                <li class="nav-item">
                                    <a class="nav-link" href="#">Item 3</a>
                                </li>
                                <!--                                <li class="nav-item">
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
                                                                </li>-->
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
                        <div  style="margin-top: 70px" class="tab-pane fade show active" id="tabpanel3" role="tabpanel">
                            <h2>Add Record</h2><br>
                            <!--                            <form>-->
                            <div  class="container-fluid">
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
                                        <button id="searchnic" type="submit" onclick="searchgNIC();"><i class="fa fa-search"></i></button>
                                    </div>
                                    <div class="col-md-3">
                                        <label>
                                            <select class="custom-select" aria-label="Default select example" id="nameSelector" onchange="setNameToTextFeild(this)">
                                                <option>Select the Child Name</option>
                                            </select>
                                        </label>
                                    </div>	
                                </div>
                            </div>
                            <!--                            </form>-->
                            <div class="container-fluid">
                                <div class="row">
                                    <div class="col-md-3">
                                        <label>
                                            <p class="label-txt">Child Name</p>
                                            <input type="text" class="input" id="childName">
                                            <div class="line-box">
                                                <div class="line"></div>
                                            </div>
                                        </label>
                                    </div>
                                    <div class="col-md-2 ">
                                        <label>
                                            <p class="label-txt">Age of Child</p>
                                            <input type="text" class="input" id="ageofchild">
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
                                                <tr><th>Date</th><th>Weight(Kg)</th><th>Height(cm)</th><th>Age(Years)</th></tr>
                                            </thead>
                                            <tbody id="tableRecordDetailsBody">
                                                <!--                                                <tr>
                                                                                                    <td id="dateid">2021/04/07</td>
                                                                                                    <td><input id="idweight" type="text" value="name 1" class="form-control"></td>
                                                                                                    <td><input id="idheight" type="text" value="email 1" class="form-control"></td>
                                                                                                    <td><button class="btn btn-primary"><i class="far fa-edit"></i>Update</button></td>
                                                                                                </tr>-->

                                            </tbody>
                                        </table>
                                    </div>
                                </div>
                            </div>

                        </div>
                        <div  style="margin-top: 70px" class="tab-pane fade" id="tabpanel4" role="tabpanel">
                            <h2>Search Child</h2>

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
                                            <select class="custom-select" aria-label="Default select example" id="vaccinenameSelector" onchange="setNameToVaccineTextFeild(this)">
                                                <option>Child Name</option>
                                            </select>
                                        </label>
                                    </div>
                                    <div class="col-md-2">
                                        <label>
                                            <p class="label-txt">Child Name</p>
                                            <input type="text" class="input" id="vaccinechildName">
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
                                    <!--                                    <div class="col-md-2 ">
                                                                            <label>
                                                                                <select class="custom-select" aria-label="Default select example" id="vaccinecategorySelector" onchange="loadVaccineDetails(this)">
                                                                                    <option>Vaccine Category</option>
                                                                                    <option>At Birth</option>
                                                                                    <option>2 Months</option>
                                                                                </select>
                                                                            </label>
                                                                        </div>-->
                                </div>
                            </div>
                            <br><br>
                            <div class="container">
                                <div class="row">
                                    <div class="col-md-12">
                                        <div id="accordion" class="checkout">
                                            <div class="panel checkout-step">
                                                <div> <span class="checkout-step-number">1</span>
                                                    <h4 class="checkout-step-title"> <a role="button" data-toggle="collapse" data-parent="#accordion" href="#collapseOne" >At Birth</a></h4>
                                                </div>
                                                <div id="collapseOne" class="collapse in">
                                                    <div class="checkout-step-body">
                                                        <div class="row">
                                                            <div class="table-responsive col-md-12">
                                                                <table id="tableRecordDetails" class="grid table table-bordered table-sortable">
                                                                    <thead>
                                                                        <tr><th>Due Date</th><th>Given Date</th><th>Vaccine </th><th>Status</th></tr>
                                                                    </thead>
                                                                    <tbody id="tableVaccineRecordDetailsBody1">

                                                                    </tbody>
                                                                </table>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="panel checkout-step">
                                                <div role="tab" id="headingTwo"> <span class="checkout-step-number">2</span>
                                                    <h4 class="checkout-step-title"> <a class="collapsed" role="button" data-toggle="collapse" data-parent="#accordion" href="#collapseTwo" >2 Months </a> </h4>
                                                </div>
                                                <div id="collapseTwo" class="panel-collapse collapse">
                                                    <div class="checkout-step-body">
                                                        <table class="grid table table-bordered table-sortable">
                                                            <thead>
                                                                <tr><th>Due Date</th><th>Given Date</th><th>Vaccine </th><th>Status</th></tr>
                                                            </thead>
                                                            <tbody id="tableVaccineRecordDetailsBody2">

                                                            </tbody>
                                                        </table>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="panel checkout-step">
                                                <div role="tab" id="headingThree"> <span class="checkout-step-number">3</span>
                                                    <h4 class="checkout-step-title"> <a class="collapsed" role="button" data-toggle="collapse" data-parent="#accordion" href="#collapseThree"  > 4 Months </a> </h4>
                                                </div>
                                                <div id="collapseThree" class="panel-collapse collapse">
                                                    <div class="checkout-step-body">
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="panel checkout-step">
                                                <div role="tab" id="headingFour"> <span class="checkout-step-number">4</span>
                                                    <h4 class="checkout-step-title"> <a class="collapsed" role="button" data-toggle="collapse" data-parent="#accordion" href="#collapseFour"  > 6 Months </a> </h4>
                                                </div>
                                                <div id="collapseFour" class="panel-collapse collapse">
                                                    <div class="checkout-step-body">
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <!--                                <div class="row">
                                                                    <div class="table-responsive col-md-12">
                                                                        <table id="tableRecordDetails" class="grid table table-bordered table-sortable">
                                                                            <thead>
                                                                                <tr><th>Due Date</th><th>Given Date</th><th>Vaccine </th><th>Status</th></tr>
                                                                            </thead>
                                                                            <tbody id="tableVaccineRecordDetailsBody">
                                
                                                                            </tbody>
                                                                        </table>
                                                                    </div>
                                                                </div>-->
                            </div>
                        </div>

                    </div>

                </div>
            </div></div>

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
            var nic = $('#NICNo').val();//get nic value
            $('#nameSelector option:gt(0)').remove(); // remove dropdown load options
            var xmlHttpRequest = new XMLHttpRequest();
            xmlHttpRequest.onreadystatechange = function () {
                if (xmlHttpRequest.readyState === 4 && xmlHttpRequest.status === 200) {

                    var response = xmlHttpRequest.responseText;
                    var child = JSON.parse(response).childName;// get json object values 
                    for (var i = 0; i < child.length; i++) {// get array values 

                        document.getElementById('nameSelector').appendChild(new Option(child[i], child[i]));//set values to dropdwon option
                    }
                }
            };
            xmlHttpRequest.open("GET", "../SearchChild?NIC=" + nic, true);
            xmlHttpRequest.send();
        }

        function setNameToTextFeild(name) {

            $('#tableRecordDetailsBody tr').remove();// remove tabe rows
            var childname = document.getElementById('childName').value = name.value;      // set values for textfeild
            var xmlHttpRequest = new XMLHttpRequest();
            xmlHttpRequest.onreadystatechange = function () {
                if (xmlHttpRequest.readyState === 4 && xmlHttpRequest.status === 200) {
                    var response = xmlHttpRequest.responseText;
                    var rDetails = JSON.parse(response).recordDetails;
                    var rowcount = rDetails.length;
                    document.getElementById('ageofchild').value = rDetails[0]['childage'];
                    for (var i = 0; i < rowcount; i++) {
                        var table = document.getElementById("tableRecordDetailsBody");
                        var row = table.insertRow(0);
                        var cell1 = row.insertCell(0);
                        var cell2 = row.insertCell(1);
                        var cell3 = row.insertCell(2);
                        var cell4 = row.insertCell(3);
                        cell1.innerHTML = rDetails[i]["date"];
                        cell2.innerHTML = rDetails[i]["weight"];
                        cell3.innerHTML = rDetails[i]["height"];
                        cell4.innerHTML = rDetails[i]["age"];
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
            var nic = $('#NICNo').val();//get nic value
            var childName = $('#childName').val();
            var dateMeasurement = $('#dateofMeasurement').val();
            var weight = $('#weight').val();
            var height = $('#height').val();
            var ageofchild = $('#ageofchild').val();

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
            xmlHttpRequest.open("GET", "../AddChildRecord?NIC=" + nic + "&childName=" + childName + "&dateMeasurement=" + dateMeasurement + "&weight=" + weight + "&height=" + height + "&ageofchild=" + ageofchild, true);
            xmlHttpRequest.send();


        }

        function searchgNICforVacccine() {
            var nic = $('#vaccineNicNo').val();//get nic value
            $('#vaccinenameSelector option:gt(0)').remove(); // remove dropdown load options
            var xmlHttpRequest = new XMLHttpRequest();
            xmlHttpRequest.onreadystatechange = function () {
                if (xmlHttpRequest.readyState === 4 && xmlHttpRequest.status === 200) {

                    var response = xmlHttpRequest.responseText;
                    var child = JSON.parse(response).childName;// get json object values 
                    for (var i = 0; i < child.length; i++) {// get array values 

                        document.getElementById('vaccinenameSelector').appendChild(new Option(child[i], child[i]));//set values to dropdwon option
                    }
                }
            };
            xmlHttpRequest.open("GET", "../SearchChild?NIC=" + nic, true);
            xmlHttpRequest.send();
        }


        function setNameToVaccineTextFeild(name) {
            // $('#tableRecordDetailsBody tr').remove();// remove tabe rows
            var childname = document.getElementById('vaccinechildName').value = name.value;      // set values for textfeild
            var xmlHttpRequest = new XMLHttpRequest();
            xmlHttpRequest.onreadystatechange = function () {
                if (xmlHttpRequest.readyState === 4 && xmlHttpRequest.status === 200) {
                    var response = xmlHttpRequest.responseText;
                    console.log(response);
                    var vaccineDetails = JSON.parse(response).vaccinedetails;
                    var today = new Date();
                    var date = today.getFullYear() + '-' + (today.getMonth() + 1) + '-' + today.getDate();
                    for (var i = 0; i < vaccineDetails.length; i++) {
                        document.getElementById('yy').value = vaccineDetails[i]['year'];
                        document.getElementById('mm').value = vaccineDetails[i]['month'];
                        document.getElementById('dd').value = vaccineDetails[i]['days'];

                        if (i === 0) {
                            var table = document.getElementById("tableVaccineRecordDetailsBody1");

                            var row = table.insertRow(0);
                            var cell1 = row.insertCell(0);
                            var cell2 = row.insertCell(1);
                            var cell3 = row.insertCell(2);
                            var cell4 = row.insertCell(3);
                            cell1.innerHTML = vaccineDetails[i]["duedate"];
                            cell2.innerHTML = date;
                            cell3.innerHTML = vaccineDetails[i]["vaccinename"];
                            cell4.innerHTML = ('<label class="customcheck"><input type="checkbox" checked="checked"><span class="checkmark"></span></label>');
                        } else if (i === 1) {
                            var table = document.getElementById("tableVaccineRecordDetailsBody2");
                            var row = table.insertRow(0);
                            var cell1 = row.insertCell(0);
                            var cell2 = row.insertCell(1);
                            var cell3 = row.insertCell(2);
                             var cell4 = row.insertCell(3);
                            cell1.innerHTML = vaccineDetails[i]["duedate"];
                            cell2.innerHTML = date;
                            cell3.innerHTML = vaccineDetails[i]["vaccinename"];
                             cell4.innerHTML = ('<label class="customcheck"><input type="checkbox" checked="checked"><span class="checkmark"></span></label>');
                        } else if (i === 2) {
                            var table = document.getElementById("tableVaccineRecordDetailsBody2");
                            var row = table.insertRow(0);
                            var cell1 = row.insertCell(0);
                            var cell2 = row.insertCell(1);
                            var cell3 = row.insertCell(2);
                             var cell4 = row.insertCell(3);
                            cell1.innerHTML = vaccineDetails[i]["duedate"];
                            cell2.innerHTML = date;
                            cell3.innerHTML = vaccineDetails[i]["vaccinename"];
                             cell4.innerHTML = ('<label class="customcheck"><input type="checkbox" checked="checked"><span class="checkmark"></span></label>');
                        } else if (i === 3) {
                            var table = document.getElementById("tableVaccineRecordDetailsBody2");
                            var row = table.insertRow(0);
                            var cell1 = row.insertCell(0);
                            var cell2 = row.insertCell(1);
                            var cell3 = row.insertCell(2);
                             var cell4 = row.insertCell(3);
                            cell1.innerHTML = vaccineDetails[i]["duedate"];
                            cell2.innerHTML = date;
                            cell3.innerHTML = vaccineDetails[i]["vaccinename"];
                             cell4.innerHTML = ('<label class="customcheck"><input type="checkbox" checked="checked"><span class="checkmark"></span></label>');
                        } else if (i === 4) {
                            var table = document.getElementById("tableVaccineRecordDetailsBody2");
                            var row = table.insertRow(0);
                            var cell1 = row.insertCell(0);
                            var cell2 = row.insertCell(1);
                            var cell3 = row.insertCell(2);
                             var cell4 = row.insertCell(3);
                            cell1.innerHTML = vaccineDetails[i]["duedate"];
                            cell2.innerHTML = date;
                            cell3.innerHTML = vaccineDetails[i]["vaccinename"];
                             cell4.innerHTML = ('<label class="customcheck"><input type="checkbox" checked="checked"><span class="checkmark"></span></label>');
                        } else if (i === 5) {
                            var table = document.getElementById("tableVaccineRecordDetailsBody2");
                            var row = table.insertRow(0);
                            var cell1 = row.insertCell(0);
                            var cell2 = row.insertCell(1);
                            var cell3 = row.insertCell(2);
                             var cell4 = row.insertCell(3);
                            cell1.innerHTML = vaccineDetails[i]["duedate"];
                            cell2.innerHTML = date;
                            cell3.innerHTML = vaccineDetails[i]["vaccinename"];
                             cell4.innerHTML = ('<label class="customcheck"><input type="checkbox" checked="checked"><span class="checkmark"></span></label>');
                        } else if (i === 6) {
                            var table = document.getElementById("tableVaccineRecordDetailsBody2");
                            var row = table.insertRow(0);
                            var cell1 = row.insertCell(0);
                            var cell2 = row.insertCell(1);
                            var cell3 = row.insertCell(2);
                             var cell4 = row.insertCell(3);
                            cell1.innerHTML = vaccineDetails[i]["duedate"];
                            cell2.innerHTML = date;
                            cell3.innerHTML = vaccineDetails[i]["vaccinename"];
                        } else if (i === 7) {
                            var table = document.getElementById("tableVaccineRecordDetailsBody2");
                            var row = table.insertRow(0);
                            var cell1 = row.insertCell(0);
                            var cell2 = row.insertCell(1);
                            var cell3 = row.insertCell(2);
                             var cell4 = row.insertCell(3);
                            cell1.innerHTML = vaccineDetails[i]["duedate"];
                            cell2.innerHTML = date;
                            cell3.innerHTML = vaccineDetails[i]["vaccinename"];
                             cell4.innerHTML = ('<label class="customcheck"><input type="checkbox" checked="checked"><span class="checkmark"></span></label>');
                        } else if (i === 8) {
                            var table = document.getElementById("tableVaccineRecordDetailsBody2");
                            var row = table.insertRow(0);
                            var cell1 = row.insertCell(0);
                            var cell2 = row.insertCell(1);
                            var cell3 = row.insertCell(2);
                             var cell4 = row.insertCell(3);
                            cell1.innerHTML = vaccineDetails[i]["duedate"];
                            cell2.innerHTML = date;
                            cell3.innerHTML = vaccineDetails[i]["vaccinename"];
                             cell4.innerHTML = ('<label class="customcheck"><input type="checkbox" checked="checked"><span class="checkmark"></span></label>');
                        } else {

                        }



                    }
                }
            };
            xmlHttpRequest.open("GET", "../SearchChildAge?name=" + childname, true);
            xmlHttpRequest.send();

        }

//        function loadVaccineDetails(category) {
//            var nic = $('#vaccineNicNo').val();//get nic value
//            $('#tableVaccineRecordDetailsBody tr').remove();// remove tabe rows
//            var xmlHttpRequest = new XMLHttpRequest();
//            xmlHttpRequest.onreadystatechange = function () {
//                if (xmlHttpRequest.readyState === 4 && xmlHttpRequest.status === 200) {
//                    var response = xmlHttpRequest.responseText;
//                    var vaccineNames = JSON.parse(response).due_date;
//                    for (var i = 0; i < due_date.length; i++) {
//                        var table = document.getElementById("tableVaccineRecordDetailsBody");
//                        alert();
//                        var row = table.insertRow(0);
//                        var cell3 = row.insertCell(0);
//                        //                        cell1.innerHTML = rDetails[i]["date"];
//                        //                        cell2.innerHTML = rDetails[i]["weight"];
//                        cell3.innerHTML = vaccineNames[i];
//                        //                        cell4.innerHTML = rDetails[i]["age"];
//                    }
//
//
//
//                }
//            };
//            xmlHttpRequest.open("GET", "../SearchChildforVaccine?NIC=" + nic + "&vaccinecategory=" + category.value, true);
//            xmlHttpRequest.send();
//
//        }

        //        function SearchChildforVaccine() {
        //            var nic = $('#vaccineNicNo').val();//get nic value
        //            $('#vaccinenameSelector option:gt(0)').remove(); // remove dropdown load options
        //            var xmlHttpRequest = new XMLHttpRequest();
        //            xmlHttpRequest.onreadystatechange = function () {
        //                if (xmlHttpRequest.readyState === 4 && xmlHttpRequest.status === 200) {
        //
        //                    var response = xmlHttpRequest.responseText;
        //                    var child = JSON.parse(response).childName;// get json object values 
        //                    for (var i = 0; i < child.length; i++) {// get array values 
        //
        //                        document.getElementById('vaccinenameSelector').appendChild(new Option(child[i], child[i]));//set values to dropdwon option
        //                    }
        //                }
        //            }
        //            ;
        //                    xmlHttpRequest.open("GET", "../SearchChildforVaccine?NIC=" + nic + "&vaccine=" + , true);
        //            xmlHttpRequest.send();
        //            }


    </script>
</html>
