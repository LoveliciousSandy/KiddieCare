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
        <title>JSP Page</title>
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
                                    <a class="nav-link" href="#">Growth Monitoring</a>
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
                                        >Item 2</a>
                                    <ul class="nav-second-level collapse" id="collapseSubItems2" data-parent="#navAccordion">
                                        <li class="nav-item">
                                            <a class="nav-link" href="#">
                                                <span class="nav-link-text">Item 2.1</span>
                                            </a>
                                        </li>
                                        <li class="nav-item">
                                            <a class="nav-link" href="#">
                                                <span class="nav-link-text">Item 2.2</span>
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
                                        >Item 4</a>
                                    <ul class="nav-second-level collapse" id="collapseSubItems4" data-parent="#navAccordion">
                                        <li class="nav-item">
                                            <a class="nav-link" href="#">
                                                <span class="nav-link-text">Item 4.1</span>
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
                    <!--        Add Record-->
                    <div  style="margin-top: 70px"class="container">
                        <h2>Growth Monitoring</h2>
                    </div>
                    <div></div>
                </div>
            </div>
        </div> 
    </body>
    <script>
        $(document).ready(function () {
            $('.nav-link-collapse').on('click', function () {
                $('.nav-link-collapse').not(this).removeClass('nav-link-show');
                $(this).toggleClass('nav-link-show');
            });
        });
    </script>
</html>
