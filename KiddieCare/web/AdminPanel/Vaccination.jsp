<%-- 
    Document   : Vaccination
    Created on : Apr 9, 2021, 2:52:28 AM
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
            /*process-box*/
            body{
                background: #eee;
            }
            .process-box{
                background: #fff;
                padding: 10px;
                border-radius: 15px;
                position: relative;
                box-shadow: 2px 2px 7px 0 #00000057;
            }
            .process-left:after{
                content: "";
                border-top: 15px solid #ffffff;
                border-bottom: 15px solid #ffffff;
                border-left: 15px solid #ffffff;
                border-right: 15px solid #ffffff;
                display: inline-grid;
                position: absolute;
                right: -15px;
                top: 42%;
                transform: rotate(45deg);
                box-shadow: 3px -2px 3px 0px #00000036;
                z-index: 1;
            }
            .process-right:after{
                content: "";
                border-top: 15px solid #ffffff00;
                border-bottom: 15px solid #ffffff;
                border-left: 15px solid #ffffff;
                border-right: 15px solid #ffffff00;
                display: inline-grid;
                position: absolute;
                left: -15px;
                top: 42%;
                transform: rotate(45deg);
                box-shadow: -1px 1px 3px 0px #0000001a;
                z-index: 1;
            }
            .process-step{
                background: blueviolet;
                text-align: center;
                width: 80%;
                margin: 0 auto;
                color: #fff;
                height: 100%;
                padding-top: 8px;
                position: relative;
                top: -26px;
                border-radius: 0px 0px 10px 10px;
                box-shadow: -6px 8px 0px 0px #00000014;
            }
            .process-point-right{
                background: #ffffff;
                width: 25px;
                height: 25px;
                border-radius: 50%;
                border: 8px solid #00bcd4;
                box-shadow: 0 0 0px 4px #5c5c5c;
                margin: auto 0;
                position: absolute;
                bottom: 40px;
                left: -63px;
            }
            .process-point-right:before{
                content: "";
                height: 144px;
                width: 11px;
                background: #5c5c5c;
                display: inline-grid;
                transform: rotate(36deg);
                position: relative;
                left: -50px;
                top: -0px;
            }
            .process-point-left{
                background: #ffffff;
                width: 25px;
                height: 25px;
                border-radius: 50%;
                border: 8px solid #00bcd4;
                box-shadow: 0 0 0px 4px #5c5c5c;
                margin: auto 0;
                position: absolute;
                bottom: 40px;
                right: -63px;
            }
            .process-point-left:before {
                content: "";
                height: 144px;
                width: 11px;
                background: #5c5c5c;
                display: inline-grid;
                transform: rotate(-38deg);
                position: relative;
                left: 50px;
                top: 0px;

            }

            .process-last:before{
                display: none;
            }
            .process-box p{
                z-index: 9;
            }
            .process-step p{
                font-size: 20px;
            }
            .process-step h2{
                font-size: 39px;
            }
            .process-step:after{
                content: "";
                border-top: 8px solid #04889800;
                border-bottom: 8px solid #048898;
                border-left: 8px solid #04889800;
                border-right: 8px solid #048898;
                display: inline-grid;
                position: absolute;
                left: -16px;
                top: 0;
            }
            .process-step:before{
                content: "";
                border-top: 8px solid #ff000000;
                border-bottom: 8px solid #048898;
                border-left: 8px solid #048898;
                border-right: 8px solid #ff000000;
                display: inline-grid;
                position: absolute;
                right: -16px;
                top: 0;
            }
            .process-line-l{
                background: white;
                height: 4px;
                position: absolute;
                width: 136px;
                right: -153px;
                top: 64px;
                z-index: 9;
            }
            .process-line-r{
                background: white;
                height: 4px;
                position: absolute;
                width: 136px;
                left: -153px;
                top: 63px;
                z-index: 9;
            }

            /*check box*/
.btn.active span.nonCheckBoxAllow {
  display: none;
}

.btn.active span.checkBoxAllow {
  display: inline;
}

.btn span.nonCheckBoxAllow {
  display: inline;
}

.btn span.checkBoxAllow {
  display: none;
  
  
  input .ckc{
   position: absolute;
                top: 0;
                left: 0;
                height: 25px;
                width: 25px;
                background-color: #eee;
                border-radius: 5px;   
  }
  input #ck{
      
      height: 25px;
                width: 25px;
  }
  
}
        </style>
    </head>

    <body>
        <section class="our-blog p-0 m-0 bg-silver">
            <div class="container work-process  pb-5 pt-5">
                <div class="title mb-5 text-center">
                    <h3>Our <span class="site-color">Few Process</span></h3>
                    <input checked  type="checkbox" style="width: 30px; height: 30px;">
                </div>
                <!-- ============ step 1 =========== -->
                <div class="row">
                    <div class="col-md-5">
                        <div class="process-box process-left" data-aos="fade-right" data-aos-duration="1000">
                            <div class="row">
                                <div class="col-md-5">
                                    <div class="process-step">
                                        <p class="m-0 p-0">2021/03/15</p>
                                        <h2 class="m-0 p-0">At Birth</h2>
                                    </div>
                                </div>
                                <div class="col-md-7">
                                    <h5>What is Lorem Ipsum?</h5>
                                    <div class="btn-group" data-toggle="buttons">
                                        <label class="btn btn-success active" style="width: 56px">
                                            <span class="checkBoxAllow fas fa-check"></span>
                                            <span class="nonCheckBoxAllow fas fa-times"></span>
                                        </label>
                                    </div>
                                   BCG
                                   <div class="btn-group" data-toggle="buttons">
                                        <label class="btn btn-success active" style="width: 56px">
                                            <span class="checkBoxAllow fas fa-check"></span>
                                            <span class="nonCheckBoxAllow fas fa-times"></span>
                                        </label>
                                    </div>
                                   BCG
                                   <div class="btn-group" data-toggle="buttons">
                                        <label class="btn btn-success active" style="width: 56px">
                                            <span class="checkBoxAllow fas fa-check"></span>
                                            <span class="nonCheckBoxAllow fas fa-times"></span>
                                        </label>
                                    </div>
                                   BCG
                                </div>
                            </div>
                            <div class="process-line-l"></div>
                        </div>
                    </div>
                    <div class="col-md-2"></div>
                    <div class="col-md-5">
                        <div class="process-point-right"></div>
                    </div>
                </div>
                <!-- ============ step 2 =========== -->
                <div class="row">

                    <div class="col-md-5">
                        <div class="process-point-left"></div>
                    </div>
                    <div class="col-md-2"></div>
                    <div class="col-md-5">
                        <div class="process-box process-right" data-aos="fade-left" data-aos-duration="1000">
                            <div class="row">
                                <div class="col-md-5">
                                    <div class="process-step">
                                        <p class="m-0 p-0">2021/05/14</p>
                                        <h2 class="m-0 p-0">2 nd Month</h2>
                                    </div>
                                </div>
                                <div class="col-md-7">
                                    <h5>What is Lorem Ipsum?</h5>
                                    <p><small>Lorem Ipsum is simply dummy text of the printing and typesetting industry. </small></p>
                                </div>
                            </div>
                            <div class="process-line-r"></div>
                        </div>
                    </div>

                </div>
                <!-- ============ step 3 =========== -->
                <div class="row">
                    <div class="col-md-5">
                        <div class="process-box process-left" data-aos="fade-right" data-aos-duration="1000">
                            <div class="row">
                                <div class="col-md-5">
                                    <div class="process-step">
                                        <p class="m-0 p-0">Step</p>
                                        <h2 class="m-0 p-0">4 th Month</h2>
                                    </div>
                                </div>
                                <div class="col-md-7">
                                    <h5>What is Lorem Ipsum?</h5>
                                    <p><small>Lorem Ipsum is simply dummy text of the printing and typesetting industry. </small></p>
                                </div>
                            </div>
                            <div class="process-line-l"></div>
                        </div>
                    </div>
                    <div class="col-md-2"></div>
                    <div class="col-md-5">
                        <div class="process-point-right"></div>
                    </div>
                </div>
                <!-- ============ step 4 =========== -->
                <div class="row">
                    <div class="col-md-5">
                        <div class="process-point-left"></div>
                    </div>
                    <div class="col-md-2"></div>
                    <div class="col-md-5">
                        <div class="process-box process-right" data-aos="fade-left" data-aos-duration="1000">
                            <div class="row">
                                <div class="col-md-5">
                                    <div class="process-step">
                                        <p class="m-0 p-0">Step</p>
                                        <h2 class="m-0 p-0">6 th Month</h2>
                                    </div>
                                </div>
                                <div class="col-md-7">
                                    <h5>What is Lorem Ipsum?</h5>
                                    <p><small>Lorem Ipsum is simply dummy text of the printing and typesetting industry. </small></p>
                                </div>
                            </div>
                            <div class="process-line-r"></div>
                        </div>
                    </div>
                </div>
                <!-- ============ step 1 =========== -->
                <div class="row">
                    <div class="col-md-5">
                        <div class="process-box process-left" data-aos="fade-right" data-aos-duration="1000">
                            <div class="row">
                                <div class="col-md-5">
                                    <div class="process-step">
                                        <p class="m-0 p-0">2021/March/15</p>
                                        <h2 class="m-0 p-0">9 th Month</h2>
                                    </div>
                                </div>
                                <div class="col-md-7">
                                    <h5>What is Lorem Ipsum?</h5>
                                    <p><small>Lorem Ipsum is simply dummy text of the printing and typesetting industry. </small></p>
                                </div>
                            </div>
                            <div class="process-line-l"></div>
                        </div>
                    </div>
                    <div class="col-md-2"></div>
                    <div class="col-md-5">
                        <div class="process-point-right"></div>
                    </div>
                </div>
                <!-- =======step 4===== -->
                <div class="row">
                    <div class="col-md-5">
                        <div class="process-point-left"></div>
                    </div>
                    <div class="col-md-2"></div>
                    <div class="col-md-5">
                        <div class="process-box process-right" data-aos="fade-left" data-aos-duration="1000">
                            <div class="row">
                                <div class="col-md-5">
                                    <div class="process-step">
                                        <p class="m-0 p-0">Step</p>
                                        <h2 class="m-0 p-0">1 Year</h2>
                                    </div>
                                </div>
                                <div class="col-md-7">
                                    <h5>What is Lorem Ipsum?</h5>
                                    <p><small>Lorem Ipsum is simply dummy text of the printing and typesetting industry. </small></p>
                                </div>
                            </div>
                            <div class="process-line-r"></div>
                        </div>
                    </div>


                </div>
                <!-- =======step 5===== -->
                <!-- ============ step 1 =========== -->
                <div class="row">
                    <div class="col-md-5">
                        <div class="process-box process-left" data-aos="fade-right" data-aos-duration="1000">
                            <div class="row">
                                <div class="col-md-5">
                                    <div class="process-step">
                                        <p class="m-0 p-0">2021/March/15</p>
                                        <h2 class="m-0 p-0">18 th Month</h2>
                                    </div>
                                </div>
                                <div class="col-md-7">
                                    <h5>What is Lorem Ipsum?</h5>
                                    <p><small>Lorem Ipsum is simply dummy text of the printing and typesetting industry. </small></p>
                                </div>
                            </div>
                            <div class="process-line-l"></div>
                        </div>
                    </div>
                    <div class="col-md-2"></div>
                    <div class="col-md-5">
                        <div class="process-point-right"></div>
                    </div>
                </div>
                <!------------->
                <div class="row">
                    <div class="col-md-5">
                        <div class="process-point-left"></div>
                    </div>
                    <div class="col-md-2"></div>
                    <div class="col-md-5">
                        <div class="process-box process-right" data-aos="fade-left" data-aos-duration="1000">
                            <div class="row">
                                <div class="col-md-5">
                                    <div class="process-step">
                                        <p class="m-0 p-0">Step</p>
                                        <h2 class="m-0 p-0">3 Year</h2>
                                    </div>
                                </div>
                                <div class="col-md-7">
                                    <h5>What is Lorem Ipsum?</h5>
                                    <p><small>Lorem Ipsum is simply dummy text of the printing and typesetting industry. </small></p>
                                </div>
                            </div>
                            <div class="process-line-r"></div>
                        </div>
                    </div>


                </div>

                <!-- =======step 5===== -->
                <div class="row">
                    <div class="col-md-5">
                        <div class="process-box process-left" data-aos="fade-right" data-aos-duration="1000">
                            <div class="row">
                                <div class="col-md-5">
                                    <div class="process-step">
                                        <p class="m-0 p-0">Step</p>
                                        <h2 class="m-0 p-0">5 Year</h2>
                                    </div>
                                </div>
                                <div class="col-md-7">
                                    <h5>What is Lorem Ipsum?</h5>
                                    <p><small>Lorem Ipsum is simply dummy text of the printing and typesetting industry. </small></p>
                                </div>
                            </div>
                            <div class="process-line-l"></div>
                        </div>
                    </div>
                    <div class="col-md-2"></div>
                    <div class="col-md-5">
                        <div class="process-point-right process-last"></div>
                    </div>
                </div>
            </div>
        </section>
        <script>
            AOS.init();
        </script>

    </body>
</html>
