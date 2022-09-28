<%@ Page Title="" Language="C#" MasterPageFile="~/ViewMaster.Master" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="BiduthKarmi.Default" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentTitle" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentHead" runat="server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentBody" runat="server">


    <!-- [ Modal #1 ] -->
    <div class="modal fade" id="demo-1" tabindex="-1">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                </div>
                <div class="modal-body">
                    <span id="NotificationId1"></span>
                    <span id="NotificationIdText"></span>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-danger" id="close1" style="display: none" data-dismiss="modal">&times;Close</button>
                    <button type="button" class="btn btn-info" id="closeclose1" data-toggle="modal" data-target="#demo-2" data-dismiss="modal">Close</button>
                </div>
            </div>
        </div>
    </div>

    <!-- [ Modal #2 ] -->
    <div class="modal fade" id="demo-2" tabindex="-1">
        <div class="modal-dialog">
            <div class="modal-content">
                <button type="button" class="close" data-dismiss="modal"><i class="icon-xs-o-md"></i></button>
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>

                </div>
                <div class="modal-body">
                    <span id="NotificationId2"></span>
                    <span id="NotificationIdText2"></span>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-danger" id="close2" style="display: none" data-dismiss="modal">&times;</button>
                    <button type="button" class="btn btn-default" id="closeclose2" data-toggle="modal" data-target="#demo-3" data-dismiss="modal">Close</button>
                </div>
            </div>
        </div>
    </div>

    <!-- [ Modal #3 ] -->
    <div class="modal fade" id="demo-3" tabindex="-1">
        <div class="modal-dialog">
            <div class="modal-content">
                <button type="button" class="close" data-dismiss="modal"><i class="icon-xs-o-md"></i></button>
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                </div>
                <div class="modal-body">
                    <div class="modal-body">
                        <span id="NotificationId3"></span>
                        <span id="NotificationIdText3"></span>
                    </div>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-danger" data-dismiss="modal">&times;</button>
                </div>
            </div>
        </div>
    </div>

    <!-- end .container -->

    <section>
        <%--<div class="modal fade" id="myModal" role="dialog">
            <div class="modal-dialog modal-xl">
                <div class="modal-content ">

                    <button type="button" class="close" data-dismiss="modal">&times;</button>

                    <div class="modal-body">
                        <span id="NotificationId"></span>
                       
                    </div>
                    <div class="modal-footer">
                        <button type="button" id="ModelClose" class="btn btn-default" data-dismiss="modal">Close</button>
                    </div>
                </div>
            </div>
        </div>--%>

        <button data-toggle='modal' id="ButtonNotification" data-target='#demo-1' style="display: none"></button>
    </section>
    <section id="home">

        <div class="slider">
            <div class="container">
                <div class="flexslider">
                    <ul class="slides" id="slidepicture">
                    </ul>
                </div>
            </div>
            <div class="nav navbar-nav" style="background-color: #1b0f5a; height: 40px">
                <marquee style="margin-top: 5px; color: white; font-size: 15px"><strong> विद्यूतकर्मी बहूउ२ेश्यीय सहकारी संस्था लि.             2. संस्थाको कार्यक्षेत्र: नेपाल अधिराज्य भर ।    3.  कार्यालय रहेको स्थान: काठमाडौं महानगरपालिका व८ा नं.२८, बागबजार, काठमाडौं ।     4.  सदस्य संख्या तथा शेयर पुंजी : उर्जा बचत तथा ऋ०ा सहकारी संस्था लि. लाई आफूमा समाहित गरेप५ि द्दण्ठठ आषा९ मसान्तको सदस्य संख्या छज्ञटघ तथा शेयर पुंजी रु द्ध,टछ,घड,द्धण्ण्पूगेको ५ ।</strong></marquee>
            </div>
            <%--</div>--%>
        </div>


        <%--<div class="container">
               <div class="flexslider">
                    <ul class="slides"  id="slidepicture">
                        <li data-thumb="assets/img/slider/1.jpg">
                            <img src="assets/img/slider/1.jpg" />
                            <p class="flex-caption">Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et. Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et. Lorem ipsum dolor sit amet, consectetur.</p>
                        </li>
                        <li data-thumb="assets/img/slider/2.jpg">
                            <img src="assets/img/slider/2.jpg" />
                            <p class="flex-caption">Ut wisi enim ad minim veniam, quis nostrud exerci tation ullamcorper suscipit lobortis nisl ut aliquip ex ea commodo consequat.</p>
                        </li>
                        <li data-thumb="assets/img/slider/5.jpg">
                            <img src="assets/img/slider/5.jpg" />
                            <p class="flex-caption">Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et. Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et. Lorem ipsum dolor sit amet, consectetur.</p>
                        </li>
                        <li data-thumb="assets/img/slider/6.jpg">
                            <img src="assets/img/slider/6.jpg" />
                            <p class="flex-caption">Ut wisi enim ad minim veniam, quis nostrud exerci tation ullamcorper suscipit lobortis nisl ut aliquip ex ea commodo consequat.</p>
                        </li>
                    </ul>
                </div>
            </div>--%>
    </section>
    <section id="Services" style="background-color: #808080">
        <div class="super_container">
            <div class="container   animated">
                <div class="row" style="align-content: center;">
                    <div class="span5 offset5">
                        <h2 style="align-content: center; color: white"><u><b>
                            <asp:Label Text="OUR SERVICES" ID="LabelOurService" runat="server" />
                        </b></u></h2>
                    </div>
                </div>

                <div class="portfolio portfolio-page container">
                    <div class="row">
                        <div class="span4">
                            <ul class="portfolio-img">
                                <li>
                                    <div class="">
                                        <a href="loanscheme.aspx" rel="prettyPhoto">
                                            <img src="images/LOANS.jpg" height="500" />
                                        </a>
                                        <h4><a href="loanscheme.aspx" target="_blank" style="color: white"><b>
                                            <asp:Label Text="LOANS" ID="LabelLOANS" runat="server" /></b></a></h4>

                                        <%--<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor.</p>--%>
                                    </div>
                                </li>
                            </ul>
                        </div>
                        <%--<div class="span3">
                            <ul class="portfolio-img">
                                <li>
                                    <div class="work">
                                        <a href="images/savigsaccout.jpg" rel="prettyPhoto">
                                            <img src="images/savigsaccout.jpg" />
                                        </a>
                                        <h4><b>SAVIG ACCOUNTS</b></h4>

                                       
                                    </div>
                                </li>
                            </ul>
                        </div>--%>
                        <div class="span4">
                            <ul class="portfolio-img">
                                <li>
                                    <div class="">
                                        <a href="DepositScheme.aspx" rel="prettyPhoto">
                                            <img src="images/deposits.jpg" height="500" />
                                        </a>
                                        <h4><a href="DepositScheme.aspx" target="_blank" style="color: white"><b>
                                            <asp:Label Text="DEPOSITS" ID="LabelDEPOSITS" runat="server" /></b></a></h4>

                                        <%--<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor.</p>--%>
                                    </div>
                                </li>
                            </ul>
                        </div>
                        <div class="span4">
                            <ul class="portfolio-img">
                                <li>
                                    <div class="">
                                        <a href="ShareScheme.aspx" rel="prettyPhoto">
                                            <img src="images/shareacc.jpg" height="500" />
                                        </a>
                                        <h4><a href="ShareScheme.aspx" target="_blank" style="color: white"><b>
                                            <asp:Label Text="SHARES" ID="LabelSHARES" runat="server" /></b></a></h4>

                                        <%--<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor.</p>--%>
                                    </div>
                                </li>
                            </ul>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>
    <section id="Downloads" style="background-color: #88938b;">
        <div class="super_container">
            <div class="container">
                <div class="row" style="align-content: center;">
                    <div class="span4 offset5">
                        <h2 style="color: white"><u><b>
                            <asp:Label Text="NEWS" ID="LabelNEWS" runat="server" /></b></u></h2>
                    </div>

                    <%-- <div class="span2 offset4">
                        <h2 style="color: white"><u><b>
                            <asp:Label Text="DOWNLOADS" ID="LabelDOWNLOADS" runat="server" /></b></u></h2>
                    </div>--%>
                </div>
                <div class="row">
                    <div class="span6   offset2" id="newspanel">
                    </div>
                    <%-- <div class="span6">
                        <table id="TableMain" class="table table-bordered table-primary border-left-primary border-bottom-primary table-dark display responsive nowrap dataTable no-footer dtr-inline" style="color: black;" role="grid" aria-describedby="TableMain_info">
                            <thead>
                                <tr role="row">
                                    <th class="sorting_asc" tabindex="0" aria-controls="TableMain" rowspan="1" colspan="1" aria-sort="ascending" aria-label="SNo: activate to sort column descending" style="width: 63px;">
                                        <h3><b>#</b></h3>
                                    </th>
                                    <th class="sorting" tabindex="0" aria-controls="TableMain" rowspan="1" colspan="1" aria-label="PictureName: activate to sort column ascending" style="width: 157px;">
                                        <h3><b>FileDescription</b></h3>
                                    </th>
                                    <th class="sorting" tabindex="0" aria-controls="TableMain" rowspan="1" colspan="1" aria-label="Created On: activate to sort column ascending" style="width: 260px;">
                                        <h3><b>Action</b></h3>
                                    </th>
                                </tr>
                            </thead>
                            <tbody>
                            </tbody>
                        </table>
                    </div>--%>
                </div>
            </div>
        </div>
    </section>
    <section>
        <div class="container">
            <div class="row" style="padding:20px 0px;">

                <div class="span3 offset1">
                    <iframe src="https://www.ashesh.com.np/forex/widget2.php?api=3112z0k447&header_color=38b45e&background_color=faf8ee&header_title=Nepal%20Exchange%20Rates" frameborder="0" scrolling="no" marginwidth="0" marginheight="0" style="border: none; overflow: hidden; width: 100%; height: 383px; border-radius: 5px;" allowtransparency="true"></iframe>
                    <br>
                    <span style="text-align: left">© <a href="https://www.ashesh.com.np/forex/" title="Forex Nepal for Nepalese Rupee" target="_top" style="text-decoration: none;">Forex Nepal</a></span>
                    <%--<div id="oanda_ecc">
                        <!-- Note: If you alter or remove the following code, the embedded currency widget will not work-->
                        <span style="color: #000; text-decoration: none; font-size: 9px; float: left;">Currency Converter <a id="oanda_cc_link" style="color: #000; font-size: 9px;" href="https://www.oanda.com/currency/converter/">by OANDA</a></span>
                        <script src="https://www.oanda.com/embedded/converter/get/b2FuZGFlY2N1c2VyLy9kZWZhdWx0/?lang=en"></script>
                    </div>--%>
                </div>
                <div class="span3 offset1">
                    <iframe src="https://www.hamropatro.com/widgets/calender-small.php" frameborder="0" scrolling="no" marginwidth="0" marginheight="0" style="border: none; overflow: hidden; width: 200px; height: 290px;" allowtransparency="true"></iframe>
                </div>
                <div class="span4">
                    <%--<iframe src="https://www.hamropatro.com/widgets/dateconverter.php" style="margin-top: 70px;" frameborder="0" scrolling="no" marginwidth="0" marginheight="0" style="border: none; overflow: hidden; width: 350px; height: 150px;" allowtransparency="true"></iframe>--%>

                    <iframe src="https://www.ashesh.com.np/gold/widget.php?api=3112z6k463&header_color=0077e5" frameborder="0" scrolling="no" marginwidth="0" marginheight="0" style="border: none; overflow: hidden; width: 100%; height: 265px; border-radius: 5px;" allowtransparency="true"></iframe>
                    <br>
                    <span style="text-align: left">© <a href="https://www.ashesh.com.np/gold/" title="Gold Rates Nepal" target="_top" style="text-decoration: none;">Gold Rates Nepal</a></span>
                </div>
            </div>
        </div>
    </section>
    <section id="Contact" style="background-color: #403c3c">
        <div class="container">
            <div class="row" style="align-content: center;">
                <div class="span10 offset5">
                    <h2 style="color: white"><u><b>
                        <asp:Label Text="CONTACT US" ID="LabelCONTACTUS" runat="server" /></b></u></h2>
                </div>
            </div>
            <%--<div style="margin-top: 30px">
                <div class="row">
                    <div class="span4 offset-4">
                        <div id="message-show">
                            <button data-hide="alert" class="close" type="button">
                                <i class="ace-icon fa fa-times"></i>
                            </button>
                            <span class="session-msg"></span>
                        </div>
                    </div>
                </div>
            </div>--%>

            <div class="row">
                <div class="span5">
                    <h4 style="color: white">Send Us Message</h4>

                    <div class="row">
                        <div class=" span8 ">
                            <input id="name" type="text" style="width: 690px;" name="name" placeholder="Enter your name..." />
                        </div>
                        <%--<div class=" span4">

                    <p style="color: white"><i class="icon-map-marker"></i>&nbsp;&nbsp;&nbsp;Address: Bagbazar-28,Kathmandu,Nepal</p>


                </div>--%>
                    </div>
                    <div class="row">

                        <div class=" span8 ">
                            <input id="email" type="text" style="width: 690px;" name="email" placeholder="Enter your email..." />

                        </div>
                        <%-- <div class=" span4">
                    <p style="color: white"><i class="icon-phone"></i>&nbsp;&nbsp;&nbsp;Phone: 014251401,04258014</p>
                </div>--%>
                    </div>
                    <div class="row">
                        <div class=" span8  ">
                            <input id="subject" type="text" style="width: 690px;" name="subject" placeholder="Your subject..." />

                        </div>
                        <%-- <div class=" span4">
                    <p style="color: white"><i class="icon-user"></i>&nbsp;&nbsp;&nbsp;FaceBook: <a style="color: white" href="https://www.facebook.com/biddhutkarmi.sahakari" target="_blank">Biddhutkarmi Sahakari</a></p>

                </div>--%>
                    </div>
                    <div class="row">
                        <div class=" span8 ">
                            <textarea id="message" rows="10" cols="20" name="message" style="width: 690px;" placeholder="Your message..."></textarea>
                        </div>
                        <%--<div class=" span4">
                    <p style="color: white"><i class="icon-envelope-alt"></i>&nbsp;&nbsp;&nbsp;Email: <a href="#" style="color: white">bkbssl1@gmail.com</a></p>
                </div>--%>
                    </div>
                    <div class="row">
                        <div class=" span8 ">
                            <input type="button" class="btn btn-primary" value="Sign in using Facebook to send message" onclick="checkFacebookLogin();" />
                        </div>
                    </div>
                </div>
                <div class="span5    offset2">
                    <div class="contact-address span5">
                        <h4 style="color: white">We Are Here</h4>
                        <div class="map" id="canvasMap"></div>
                        <h4 style="color: white">Address</h4>
                        <p style="color: white">
                            Bagbazar-28,Kathmandu,Nepal
                            <br />
                            Email:bkbssl1@gmail.com<br />
                            Phone: 014251401,04258014
                        </p>
                        <p></p>
                    </div>
                </div>
            </div>
        </div>
        <br />
    </section>
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="ContentScript" runat="server">
    <div id="fb-root"></div>
    <script async defer crossorigin="anonymous" src="https://connect.facebook.net/en_US/all.js#xfbml=1&version=v5.0&appId=2069849613344874&autoLogAppEvents=1"></script>

    <script src="assets/js/jquery.flexslider.js"></script>

    <script>

        window.fbAsyncInit = function () {
            FB.init({ appId: '694502548125784', status: true, cookie: true, xfbml: true, version: '9.0' });

        };
        FB.AppEvents.logPageView();
        (function (d, s, id) {
            var js, fjs = d.getElementsByTagName(s)[0];
            if (d.getElementById(id)) { return; }
            js = d.createElement(s); js.id = id;
            js.src = "https://connect.facebook.net/en_US/sdk.js";
            fjs.parentNode.insertBefore(js, fjs);
        }(document, 'script', 'facebook-jssdk'));

        function fetchUserDetail() {
            FB.api('/me', function (response) {

                FaceBookSignUp(response.name, response.id);
            });
        }

        function checkFacebookLogin() {

            var email = $("#email").val();
            var senderName = $("#name").val();
            var subject = $("#subject").val();
            var Message = $("#message").val();

            if (email == "" || senderName == "" || subject == "" || Message == "") {
                showMessage("Please Fill All The Details before you send message ", "success");
            }
            else {
                FB.getLoginStatus(function (response) {
                    if (response.status === 'connected') {
                        fetchUserDetail();
                    }
                    else {
                        initiateFBLogin();
                    }
                });
            }

        }


        function FaceBookSignUp(Name, Id) {
            var email = $("#email").val();
            var senderName = $("#name").val();
            var subject = $("#subject").val();
            var Message = $("#message").val();

            debugger;
            $.ajax({
                type: "POST",
                url: "Default.aspx/Messages",
                data: JSON.stringify({ FacebookID: Id, FacebookName: Name, Email: email, SenderName: senderName, Subject: subject, Message: Message }),
                contentType: "application/json; charset=utf-8",
                dataType: "json",
                beforeSend: function (jqXHR, settings) { blockUI(jqXHR, settings) },
                complete: function (jqXHR, textStatus) { unblockUI(jqXHR, textStatus) },
                success: function (result) {
                    if (result.d.Success == true) {
                        showMessage("Successfully Sent", "success");
                    }
                },
                failure: function (response) {
                    alert(response.d);
                }
            });
        }

        function checkLoginState() {
            FB.getLoginStatus(function (response) {
                statusChangeCallback(response);
            });
        }
        function initiateFBLogin() {
            FB.login(function (response) {
                fetchUserDetail();
            });
        }
    </script>
    <script type="text/javascript" src="https://maps.googleapis.com/maps/api/js?v=3.exp"></script>
    <script type="text/javascript">
        var map;
        function LoadGoogleMAP() {
            var SetmapOptions = {
                zoom: 16,
                center: new google.maps.LatLng(27.705814412095204, 85.31969224478938),
                mapTypeId: google.maps.MapTypeId.ROADMAP
            };
            map = new google.maps.Map(document.getElementById('canvasMap'), SetmapOptions);

            var marker = new google.maps.Marker({
                position: new google.maps.LatLng(27.705814412095204, 85.31969224478938),
                title: "We Are Here @HOTEL  HARDIK"
            });

            marker.setMap(map);
        }
        google.maps.event.addDomListener(window, 'load', LoadGoogleMAP);

    </script>
    <script type="text/javascript">


        function blockUI() {
            $.blockUI({ message: '<h4 class="lighter blue"><i class="fa fa-spinner fa-spin"></i> Loading......</h4>' });
        }
        function unblockUI() {
            $.unblockUI();
        }
        function AjaxEnd(sender, args) {
            unblockUI();
        }
        function AjaxBegin(sender, args) {
            blockUI();
        }


        $(document).live('ready', function () {

            $.ajax({
                type: "POST",
                url: "Default.aspx/LoadPage",
                data: {},
                contentType: "application/json; charset=utf-8",
                dataType: "json",
                beforeSend: function (jqXHR, settings) { blockUI(jqXHR, settings) },
                complete: function (jqXHR, textStatus) { unblockUI(jqXHR, textStatus) },
                success: function (result) {
                    if (result.d.Success == true) {
                        $("#slidepicture").prepend(result.d.Message);
                        console.log("This is Developed by Dhananjaya Devkota:9849896722");
                        console.log(result.d.Message);
                        Load();
                        LoadAllSetting();
                        AutoAnimate();

                    }
                    else {
                        alert("The DataBase is NULL");
                    }
                },
                failure: function (result) {
                    alert("Contact to the developer");
                }
            });
        });

        //function displayoff() {
        //    var xy = document.getElementsByClassName("flex-control-thumbs");
        //flexslider.css

        //    $(xy).addClass('displayoff');
        //}

        function AutoAnimate() {

            var x = document.getElementsByClassName("flex-next");
            $(x).trigger("click", true);

            setTimeout(AutoAnimate, 20000); // Change image every 20 seconds

        }


        function LoadAllSetting() {
            $.ajax({
                type: "POST",
                url: "Default.aspx/LoadAllSetting",
                data: {},
                contentType: "application/json; charset=utf-8",
                dataType: "json",
                beforeSend: function (jqXHR, settings) { blockUI(jqXHR, settings) },
                complete: function (jqXHR, textStatus) { unblockUI(jqXHR, textStatus) },
                success: function (result) {
                    if (result.d.Success == true) {

                        console.log(result.d.Datas[1]);
                        console.log(result.d.Datas[2]);
                        console.log(result.d.Datas[3]);
                        console.log(result.d.Datas[4]);
                        console.log(result.d.Datas[5]);
                        console.log(result.d.Datas[6]);
                        console.log(result.d.Datas[7]);
                        console.log(result.d.Datas[8]);
                        console.log(result.d.Datas[9]);
                        $("#newspanel").append(result.d.AdditionalData);
                        if (result.d.Alert) {

                            var NotificationCount = parseInt(result.d.Datas[6]);

                            if (NotificationCount == 1) {
                                $("#NotificationId1").html(result.d.Datas[7]);
                                $("#closeclose1").hide();
                                $("#close1").show();
                                $("#ButtonNotification").click();
                            }
                            else if (NotificationCount == 2) {
                                $("#NotificationId1").html(result.d.Datas[7]);
                                $("#NotificationId2").html(result.d.Datas[8]);
                                $("#close1").hide();
                                $("#close2").show();
                                $("#closeclose2").hide();
                                $("#ButtonNotification").click();
                            }
                            else if (NotificationCount == 3) {
                                $("#NotificationId1").html(result.d.Datas[7]);
                                $("#NotificationId2").html(result.d.Datas[8]);
                                $("#NotificationId3").html(result.d.Datas[9]);
                                $("#close1").hide();
                                $("#close2").hide();
                                $("#ButtonNotification").click();
                            }
                            //console.log(H2);
                            //for (var i = 7; i <= H2 ; i++) {

                            //}

                        }



                        //$("#TableMain tbody").append(result.d.Datas[6]);
                    }
                    //else {
                    //    alert("The CompanySetting has not been Updated");
                    //}

                },

                failure: function (result) {

                    alert("Contact to the developer");

                }

            });

        }

        $("#ModelClose").on('click', function (e) {

            $("#ButtonNotification").click();
        })

        function Load() {
            $('.flexslider').flexslider({
                animation: "slide",
                controlNav: "thumbnails"
            });
        }


        //$(window).load(function () {

        //});

    </script>
</asp:Content>
