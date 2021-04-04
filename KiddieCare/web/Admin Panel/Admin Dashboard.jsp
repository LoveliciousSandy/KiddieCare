<%-- 
    Document   : Admin Panel
    Created on : Apr 5, 2021, 2:06:26 AM
    Author     : Senani
--%>


<%@page contentType="text/html" pageEncoding="UTF8"%>
<!DOCTYPE html>

<html>

    <head>
        <meta httpequiv="ContentType" content="text/html; charset=UTF8">
        <title>JSP Page</title>
        <jsp:include page="../Links/Links.jsp"></jsp:include>

        <style>
            #mainbutton{
                width: 200px;
                height: 200px;
            }

            .navlink:hover {
                transition: all 0.4s;
            }

            .navlinkcollapse:after {
                float: right;
                content: '\f067';
                fontfamily: 'FontAwesome';
            }

            .navlinkshow:after {
                float: right;
                content: '\f068';
                fontfamily: 'FontAwesome';
            }

            .navitem ul.navsecondlevel {
                paddingleft: 0;
            }

            .navitem ul.navsecondlevel > .navitem {
                paddingleft: 20px;
            }
            .navbaricontop .navbarnav .navlink > .fa {
                position: relative;
                width: 36px;
                fontsize: 24px;
            }

            .navbaricontop .navbarnav .navlink > .fa > .badge {
                fontsize: 0.75rem;
                position: absolute;
                right: 0;
                fontfamily: sansserif;
            }

            .navbaricontop .navbarnav .navlink > .fa {
                top: 3px;
                lineheight: 12px;
            }

            .navbaricontop .navbarnav .navlink > .fa > .badge {
                top: 10px;
            }


            @media (minwidth: 992px) {
                .sidenav {
                    position: absolute;
                    top: 0;
                    left: 0;
                    width: 230px;
                    height: calc(100vh  3.5rem);
                    margintop: 3.5rem;
                    background: #343a40;
                    boxsizing: borderbox;
                    bordertop: 1px solid rgba(0, 0, 0, 0.3);
                }

                .navbarexpandlg .sidenav {
                    flexdirection: column;
                }
            }

            @media (minwidth: 576px) {
                .navbaricontop.navbarexpandsm .navbarnav .navlink {
                    textalign: center;
                    display: tablecell;
                    height: 70px;
                    verticalalign: middle;
                    paddingtop: 0;
                    paddingbottom: 0;
                }

                .navbaricontop.navbarexpandsm .navbarnav .navlink > .fa {
                    display: block;
                    width: 48px;
                    margin: 2px auto 4px auto;
                    top: 0;
                    lineheight: 24px;
                }

                .navbaricontop.navbarexpandsm .navbarnav .navlink > .fa > .badge {
                    top: 7px;
                }
            }

            @media (minwidth: 768px) {
                .navbaricontop.navbarexpandmd .navbarnav .navlink {
                    textalign: center;
                    display: tablecell;
                    height: 70px;
                    verticalalign: middle;
                    paddingtop: 0;
                    paddingbottom: 0;
                }

                .navbaricontop.navbarexpandmd .navbarnav .navlink > .fa {
                    display: block;
                    width: 48px;
                    margin: 2px auto 4px auto;
                    top: 0;
                    lineheight: 24px;
                }

                .navbaricontop.navbarexpandmd .navbarnav .navlink > .fa > .badge {
                    top: 7px;
                }
            }

            @media (minwidth: 992px) {
                .navbaricontop.navbarexpandlg .navbarnav .navlink {
                    textalign: center;
                    display: tablecell;
                    height: 70px;
                    verticalalign: middle;
                    paddingtop: 0;
                    paddingbottom: 0;
                }

                .navbaricontop.navbarexpandlg .navbarnav .navlink > .fa {
                    display: block;
                    width: 48px;
                    margin: 2px auto 4px auto;
                    top: 0;
                    lineheight: 24px;
                }

                .navbaricontop.navbarexpandlg .navbarnav .navlink > .fa > .badge {
                    top: 7px;
                }
            }

            @media (minwidth: 1200px) {
                .navbaricontop.navbarexpandxl .navbarnav .navlink {
                    textalign: center;
                    display: tablecell;
                    height: 70px;
                    verticalalign: middle;
                    paddingtop: 0;
                    paddingbottom: 0;
                }

                .navbaricontop.navbarexpandxl .navbarnav .navlink > .fa {
                    display: block;
                    width: 48px;
                    margin: 2px auto 4px auto;
                    top: 0;
                    lineheight: 24px;
                }

                .navbaricontop.navbarexpandxl .navbarnav .navlink > .fa > .badge {
                    top: 7px;
                }
            }

        </style>
    </head>
    <body>
        <div class="containerfluid">
            <div class="row">
                <div class="colmd2" style="backgroundcolor:yellow;">
                    <!                            side nav bar>
                    <nav class="navbar navbarexpandlg navbardark fixedtop bgdark">
                        <a class="navbarbrand" href="#">Sidebar Nav</a>
                        <button
                            class="navbartoggler"
                            type="button"
                            datatoggle="collapse"
                            datatarget="#navbarCollapse"
                            ariacontrols="navbarCollapse"
                            ariaexpanded="false"
                            arialabel="Toggle navigation"
                            >
                            <span class="navbartogglericon"></span>
                        </button>

                        <div class="collapse navbarcollapse" id="navbarCollapse">
                            <ul class="navbarnav mrauto sidenav" id="navAccordion">
<!                                <li class="navitem active">
                                    <a class="navlink" href="#"> <i class="fa fadashboard falg"></i> Dashboard</a>
                                </li>>
                                <br><br>
                                <li class="navitem">
                                    <a class="navlink" href="#">Growth Monitoring</a>
                                </li>
                                <li class="navitem">
                                    <a
                                        class="navlink navlinkcollapse"
                                        href="#"
                                        id="hasSubItems"
                                        datatoggle="collapse"
                                        datatarget="#collapseSubItems2"
                                        ariacontrols="collapseSubItems2"
                                        ariaexpanded="false"
                                        >Item 2</a>
                                    <ul class="navsecondlevel collapse" id="collapseSubItems2" dataparent="#navAccordion">
                                        <li class="navitem">
                                            <a class="navlink" href="#">
                                                <span class="navlinktext">Item 2.1</span>
                                            </a>
                                        </li>
                                        <li class="navitem">
                                            <a class="navlink" href="#">
                                                <span class="navlinktext">Item 2.2</span>
                                            </a>
                                        </li>
                                    </ul>
                                </li>
                                <li class="navitem">
                                    <a class="navlink" href="#">Item 3</a>
                                </li>
                                <li class="navitem">
                                    <a
                                        class="navlink navlinkcollapse"
                                        href="#"
                                        id="hasSubItems"
                                        datatoggle="collapse"
                                        datatarget="#collapseSubItems4"
                                        ariacontrols="collapseSubItems4"
                                        ariaexpanded="false"
                                        >Item 4</a>
                                    <ul class="navsecondlevel collapse" id="collapseSubItems4" dataparent="#navAccordion">
                                        <li class="navitem">
                                            <a class="navlink" href="#">
                                                <span class="navlinktext">Item 4.1</span>
                                            </a>
                                        </li>
                                        <li class="navitem">
                                            <a class="navlink" href="#">
                                                <span class="navlinktext">Item 4.2</span>
                                            </a>
                                        </li>
                                        <li class="navitem">
                                            <a class="navlink" href="#">
                                                <span class="navlinktext">Item 4.2</span>
                                            </a>
                                        </li>
                                    </ul>
                                </li>
                                <li class="navitem">
                                    <a class="navlink" href="#">Item 5</a>
                                </li>
                            </ul>
                            <ul class="navbarnav mlauto mt2 mtmd0"">
                                <li class="navitem">
                                    <a class="navlink" href="#">
                                        <i class="fa fabell">
                                            <span class="badge badgeinfo">11</span>
                                        </i>
                                        Test
                                    </a>
                                </li>
                                <li class="navitem">
                                    <a class="navlink" href="#">
                                        <i class="fa faglobe">
                                            <span class="badge badgesuccess">11</span>
                                        </i>
                                        Test
                                    </a>
                                </li>
                                <li class="navitem dropdown">
                                    <a class="navlink dropdowntoggle" href="#" id="navbarDropdown" role="button" datatoggle="dropdown" ariahaspopup="true" ariaexpanded="false">
                                        <i class="fa faenvelopeo">
                                            <span class="badge badgeprimary">11</span>
                                        </i>
                                        Dropdown
                                    </a>
                                    <div class="dropdownmenu" arialabelledby="navbarDropdown">
                                        <a class="dropdownitem" href="#">Action</a>
                                        <a class="dropdownitem" href="#">Another action</a>
                                        <div class="dropdowndivider"></div>
                                        <a class="dropdownitem" href="#">Something else here</a>
                                    </div>
                                </li>
                            </ul>
                        </div>
                    </nav>
                </div>
                <div class="colmd10"> 
                    <!        Add Record>
                    <div  style="margintop: 70px"class="container">
                        <h2>Growth Monitoring</h2>
                    </div>
                    <div></div>
                </div>
            </div>
        </div> 
    </body>
    <script>
        $(document).ready(function () {
            $('.navlinkcollapse').on('click', function () {
                $('.navlinkcollapse').not(this).removeClass('navlinkshow');
                $(this).toggleClass('navlinkshow');
            });
        });
    </script>
</html>