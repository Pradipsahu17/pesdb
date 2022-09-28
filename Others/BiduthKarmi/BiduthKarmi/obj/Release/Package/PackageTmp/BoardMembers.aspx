<%@ Page Title="" Language="C#" MasterPageFile="~/ViewMaster.Master" AutoEventWireup="true" CodeBehind="BoardMembers.aspx.cs" Inherits="BiduthKarmi.BoardMembers" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentTitle" runat="server">
    Board   Members
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentHead" runat="server">
    <style>
        .border-left-primary {
            border-left: .25rem solid #4e73df !important;
        }

        .border-bottom-primary {
            border-bottom: .25rem solid #4e73df !important;
        }

        .border-left-secondary {
            border-left: .25rem solid #858796 !important;
        }

        .border-bottom-secondary {
            border-bottom: .25rem solid #858796 !important;
        }

        .border-left-success {
            border-left: .25rem solid #1cc88a !important;
        }

        .border-bottom-success {
            border-bottom: .25rem solid #1cc88a !important;
        }

        .border-left-info {
            border-left: .25rem solid #36b9cc !important;
        }

        .border-bottom-info {
            border-bottom: .25rem solid #36b9cc !important;
        }

        .border-left-warning {
            border-left: .25rem solid #f6c23e !important;
        }

        .border-bottom-warning {
            border-bottom: .25rem solid #f6c23e !important;
        }

        .border-left-danger {
            border-left: .25rem solid #e74a3b !important;
        }

        .border-bottom-danger {
            border-bottom: .25rem solid #e74a3b !important;
        }

        .border-left-light {
            border-left: .25rem solid #f8f9fc !important;
        }

        .border-bottom-light {
            border-bottom: .25rem solid #f8f9fc !important;
        }

        .border-left-dark {
            border-left: .25rem solid #5a5c69 !important;
        }

        .border-right-dark {
            border-right: .25rem solid #5a5c69 !important;
        }

        .border-bottom-dark {
            border-bottom: .25rem solid #5a5c69 !important;
        }

        .border-top-dark {
            border-top: .25rem solid #5a5c69 !important;
        }

        .card1 {
            position: relative;
            display: flex;
            flex-direction: column;
            min-width: 0;
            max-width: 220px;
            word-wrap: break-word;
            background-color: #fff;
            background-clip: border-box;
            border: 1px solid #e3e6f0;
            border-radius: .35rem;
        }

            .card1 > hr {
                margin-right: 0;
                margin-left: 0;
            }

            .card1 > .list-group {
                border-top: inherit;
                border-bottom: inherit;
            }

                .card1 > .list-group:first-child {
                    border-top-width: 0;
                    border-top-left-radius: calc(.35rem - 1px);
                    border-top-right-radius: calc(.35rem - 1px);
                }

                .card1 > .list-group:last-child {
                    border-bottom-width: 0;
                    border-bottom-right-radius: calc(.35rem - 1px);
                    border-bottom-left-radius: calc(.35rem - 1px);
                }

                .card1 > .card1-header + .list-group, .card1 > .list-group + .card1-footer {
                    border-top: 0;
                }

        .card1-body {
            flex: 1 1 auto;
            min-height: 1px;
            padding: 1.25rem;
        }

        .card1-title {
            margin-bottom: .75rem;
        }

        .card1-subtitle {
            margin-top: -.375rem;
            margin-bottom: 0;
        }

        .card1-text:last-child {
            margin-bottom: 0;
        }

        .card1-link:hover {
            text-decoration: none;
        }

        .card1-link + .card-link {
            margin-left: 1.25rem;
        }

        .card1-header {
            padding: .75rem 1.25rem;
            margin-bottom: 0;
            /*background-color: #f8f9fc;*/
            /*border-bottom: 1px solid #e3e6f0;*/
        }

            .card1-header:first-child {
                border-radius: calc(.35rem - 1px) calc(.35rem - 1px) 0 0;
            }

        .card1-footer {
            padding: .75rem 1.25rem;
            background-color: #f8f9fc;
            border-top: 1px solid #e3e6f0;
        }

        .card-footer:last-child {
            border-radius: 0 0 calc(.35rem - 1px) calc(.35rem - 1px);
        }

        .card1 .card1-header .dropdown; {
            line-height: 1;
        }

        .card1 .card1-header .dropdown .dropdown-menu {
            line-height: 1.5;
        }

        .card1 .card1-header[data-toggle=collapse] {
            text-decoration: none;
            position: relative;
            padding: .75rem 3.25rem .75rem 1.25rem;
        }

            .card1 .card1-header[data-toggle=collapse]::after {
                position: absolute;
                right: 0;
                top: 0;
                padding-right: 1.725rem;
                line-height: 51px;
                font-weight: 900;
                content: '\f107';
                font-family: 'Font Awesome 5 Free';
                color: #d1d3e2;
            }

            .card1 .card1-header[data-toggle=collapse].collapsed {
                border-radius: .35rem;
            }

                .card1 .card1-header[data-toggle=collapse].collapsed::after {
                    content: '\f105';
                }
    </style>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentBody" runat="server">


    <%-- <div class="super-container" style="background-color: #e4caca">
        <div class="container">
            <div class="row">
                <div class="span10 offset1">
                    <br />
                    <table id="TableMain" class="table table-bordered   active table-primary border-left-primary border-bottom-primary table-dark display responsive nowrap dataTable no-footer dtr-inline" style="color: black;" role="grid" aria-describedby="TableMain_info">
                        <tr>
                            <td colspan="2" style="background-color: darkseagreen; text-align: center"><strong>Board Members</strong> </td>
                        </tr>
                        <tr>
                            <td><strong>Chairman</strong></td>
                            <td><strong>Ram Kumar Thebe</strong></td>
                        </tr>
                        <tr>
                            <td><strong>Vice Chairman</strong></td>
                            <td><strong>Shankar Bahadur Chhettri</strong></td>
                        </tr>
                        <tr>
                            <td><strong>Secretary</strong></td>
                            <td><strong>Bhojraj Dhungana</strong></td>
                        </tr>
                        <tr>
                            <td><strong>Treasurer</strong></td>
                            <td><strong>Raju Prasad Timalsina</strong></td>
                        </tr>
                        <tr>
                            <td><strong>Member</strong></td>
                            <td><strong>Bhagawati Prasai</strong></td>

                        </tr>
                        <tr>
                            <td><strong>Member</strong></td>
                            <td><strong>Laxmi Gautam</strong></td>

                        </tr>
                        <tr>
                            <td><strong>Member</strong></td>
                            <td><strong>Shova Chitrakar Thapa</strong></td>

                        </tr>
                        <tr>
                            <td><strong>Member</strong></td>
                            <td><strong>Rajesh Nepal</strong></td>
                        </tr>
                        <tr>
                            <td><strong>Member</strong></td>
                            <td><strong>Rajesh Aryal</strong></td>
                        </tr>
                        <tr>
                            <td><strong>Member</strong></td>
                            <td><strong>Toyanath Dahal</strong></td>
                        </tr>
                        <tr>
                            <td><strong>Account Comittee</strong></td>
                            <td><strong>Shree Bhai Shrestha</strong></td>
                        </tr>
                    </table>
                </div>
            </div>
        </div>
    </div>--%>
    <div class="super-container" style="background-color: #4e73df">
        <div class="container" runat="server" id="EnglishDiv">
            <%--<div class="row">
                <div class="span4   offset4">
                    <h1 style="text-align: right">Board Members</h1>
                </div>
            </div>--%>
            <div class="row">
                <div class="span3   offset5">
                    <div class="">
                        <div class="" style="padding-left: 30px">
                            <img src="Img/BOD/1.jpg" style="border-radius: 100px; width: 100px; height: 100px" />
                        </div>
                        <div class="">
                            <h5 style="color: black; text-align: left;padding-left: 10px" runat="server" id="RamKumar">RAM KUMAR THEBE<br />
                                <span style="padding-left: 30px" runat="server" id="Chairman">(Chairman)</span></h5>
                        </div>
                    </div>
                </div>
            </div>
            <br />
            <div class="row">
                <div class="span3  offset1">
                    <div class="">
                        <div class="" style="padding-left: 30px">
                            <img src="Img/BOD/2.jpg" style="border-radius: 100px; width: 100px; height: 100px" />
                        </div>
                        <div class="">
                            <h5 style="color: black; text-align: left" runat="server" id="shankarbahadur">SHANKAR BD. CHHETTRI<br />
                                <span style="padding-left: 30px" runat="server" id="vicechairman">(Vice-Chairman)</span></h5>
                        </div>
                    </div>
                </div>
                <div class="span3   offset1">
                    <div class="">
                        <div class="">
                            <div class="" style="padding-left: 28px">
                                <img src="Img/BOD/3.jpg" style="border-radius: 100px; width: 100px; height: 100px" />
                            </div>
                        </div>
                        <div class="">
                            <h5 style="color: black; text-align: left" runat="server" id="bhojraj">BHOJ RAJ DHUNGANA<br />
                                <span style="padding-left: 30px" runat="server" id="secretary">(Secretary)</span></h5>
                        </div>
                    </div>
                </div>
                <div class="span3   offset1">
                    <div class="">
                        <div class="">
                            <div class="" style="padding-left: 30px">
                                <img src="Img/BOD/4.jpg" style="border-radius: 100px; width: 100px; height: 100px" />
                            </div>
                        </div>
                        <div class="">
                            <h5 style="color: black; text-align: left" id="rajuprasadtimalsina" runat="server">RAJU PRASAD TIMALSINA<br />
                                <span style="padding-left: 40px" runat="server" id="treasurer"> (Treasurer)</span></h5>
                        </div>
                    </div>
                </div>
            </div>
            <br />
            <div class="row">
                <div class="span3">
                    <div class="">
                        <img src="Img/BOD/5.jpg" style="border-radius: 100px; width: 100px; height: 100px" />
                        <div class="">
                            <h5 style="color: black; text-align: left;" runat="server" id="bhagwatiprasai">BHAGWATI PRASAI<br />
                                <span   style="padding-left: 30px" runat="server" id="member1">(Member)</span> </h5>
                        </div>
                    </div>
                </div>
                <div class="span3">
                    <div class="">
                        <img src="Img/BOD/6.jpg" style="border-radius: 100px; width: 100px; height: 100px" />
                        <div class="">
                            <h5 style="color: black; text-align: left;" runat="server" id="laxmigautam">LAXMI GAUTAM<br />
                                <span   style="padding-left: 10px" runat="server" id="member2">(Member)</span>  </h5>
                        </div>
                    </div>
                </div>
                <div class="span3">
                    <div class="">
                        <div class="" style="padding-left: 28px">
                            <img src="Img/BOD/7.jpg" style="border-radius: 100px; width: 100px; height: 100px" />
                        </div>
                        <div class="">
                            <h5 style="color: black; text-align: left;" runat="server" id="shovachitrakarthapa">SHOVA CHITRAKAR THAPA<br />
                                <span   style="padding-left: 30px" runat="server" id="member3">(Member)</span>  </h5>
                        </div>
                    </div>
                </div>
                <div class="span3">
                    <div class="">
                        <img src="Img/BOD/8.jpg" style="border-radius: 100px; width: 100px; height: 100px" />
                        <div class="">
                            <h5 style="color: black; text-align: left;" runat="server" id="rajeshnepal">RAJESH NEPAL<br />
                                <span   style="padding-left: 10px" runat="server" id="member4">(Member)</span>  </h5>
                        </div>
                    </div>
                </div>
            </div>
            <br />
            <div class="row">
                <div class="span3">
                    <div class="">
                        <img src="Img/BOD/9.jpg" style="border-radius: 100px; width: 100px; height: 100px" />
                        <div class="">
                            <h5 style="color: black; text-align: left;" runat="server" id="rajesharyal">RAJESH ARYAL<br />
                                <span   style="padding-left: 30px" runat="server" id="member5">(Member)</span> </h5>
                        </div>
                    </div>
                </div>
                <div class="span3">
                    <div class="">
                        <img src="Img/BOD/10.jpg" style="border-radius: 100px; width: 100px; height: 100px" />
                        <div class="">
                            <h5 style="color: black; text-align: left;" runat="server" id="toyanathdahal">TOYANATH DAHAL<br />
                                <span runat="server" id="member6">(Member)</span></h5>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <div class="container" runat="server" id="NepaliDiv">
            <%--<div class="row">
                <div class="span4   offset4">
                    <h1 style="text-align: right">Board Members</h1>
                </div>
            </div>--%>
            <div class="row">
                <div class="span3   offset5">
                    <div class="">
                        <div class="" style="padding-left: 30px">
                            <img src="Img/BOD/1.jpg" style="border-radius: 100px; width: 100px; height: 100px" />
                        </div>
                        <div class="">
                            <h5 style="color: black; text-align: left;padding-left: 40px">राम कुमर थेबे<br />
                                <span style="padding-left: 15px">(अध्यक्ष)</span></h5>
                        </div>
                    </div>
                </div>
            </div>
            <br />
            <div class="row">
                <div class="span3  offset1">
                    <div class="">
                        <div class="" style="padding-left: 30px">
                            <img src="Img/BOD/2.jpg" style="border-radius: 100px; width: 100px; height: 100px" />
                        </div>
                        <div class="">
                            <h5 style="color: black; text-align: left;padding-left: 25px">शंकर बहादुर क्षेत्री<br />
                                <span style="padding-left: 20px">(उपाध्यक्ष)</span></h5>
                        </div>
                    </div>
                </div>
                <div class="span3   offset1">
                    <div class="">
                        <div class="">
                            <div class="" style="padding-left: 28px">
                                <img src="Img/BOD/3.jpg" style="border-radius: 100px; width: 100px; height: 100px" />
                            </div>
                        </div>
                        <div class="">
                            <h5 style="color: black; text-align: left;padding-left: 25px">भोजराज ढुं‌गाना<br />
                                <span style="padding-left: 30px">(सचिव)</span></h5>
                        </div>
                    </div>
                </div>
                <div class="span3   offset1">
                    <div class="">
                        <div class="">
                            <div class="" style="padding-left: 30px">
                                <img src="Img/BOD/4.jpg" style="border-radius: 100px; width: 100px; height: 100px" />
                            </div>
                        </div>
                        <div class="">
                            <h5 style="color: black; text-align: left;padding-left: 25px">राजु प्रसाद तिमल्सिना<br />
                                <span style="padding-left: 30px"> (कोषाध्यक्ष)</span></h5>
                        </div>
                    </div>
                </div>
            </div>
            <br />
            <div class="row">
                <div class="span3">
                    <div class="">
                        <img src="Img/BOD/5.jpg" style="border-radius: 100px; width: 100px; height: 100px" />
                        <div class="">
                            <h5 style="color: black; text-align: left;padding-left: 10px">भगवती प्रसाई<br />
                                <span   style="padding-left: 15px">(सदस्य)</span> </h5>
                        </div>
                    </div>
                </div>
                <div class="span3">
                    <div class="">
                        <img src="Img/BOD/6.jpg" style="border-radius: 100px; width: 100px; height: 100px" />
                        <div class="">
                            <h5 style="color: black; text-align: left;padding-left: 15px">लक्ष्मी गौतम<br />
                                <span   style="padding-left: 10px">(सदस्य)</span>  </h5>
                        </div>
                    </div>
                </div>
                <div class="span3">
                    <div class="">
                        <div class="" style="padding-left: 28px">
                            <img src="Img/BOD/7.jpg" style="border-radius: 100px; width: 100px; height: 100px" />
                        </div>
                        <div class="">
                            <h5 style="color: black; text-align: left;padding-left: 20px" >शोभा चित्रकार थापा<br />
                                <span style="padding-left: 30px" runat="server" id="Span7">(सदस्य)</span>  </h5>
                        </div>
                    </div>
                </div>
                <div class="span3">
                    <div class="">
                        <img src="Img/BOD/8.jpg" style="border-radius: 100px; width: 100px; height: 100px" />
                        <div class="">
                            <h5 style="color: black; text-align: left;padding-left: 10px">राजेश नेपाल<br />
                                <span style="padding-left: 10px">(सदस्य)</span>  </h5>
                        </div>
                    </div>
                </div>
            </div>
            <br />
            <div class="row">
                <div class="span3">
                    <div class="">
                        <img src="Img/BOD/9.jpg" style="border-radius: 100px; width: 100px; height: 100px" />
                        <div class="">
                            <h5 style="color: black; text-align: left;padding-left: 10px">राजेश अर्याल<br />
                                <span   style="padding-left: 15px">(सदस्य)</span> </h5>
                        </div>
                    </div>
                </div>
                <div class="span3">
                    <div class="">
                        <img src="Img/BOD/10.jpg" style="border-radius: 100px; width: 100px; height: 100px" />
                        <div class="">
                            <h5 style="color: black; text-align: left;padding-left: 10px">तोयानाथ दाहाल<br />
                                <span style="padding-left: 15px">(सदस्य)</span></h5>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <%--<div class="super-container" style="background-color: antiquewhite">
        <div class="container">
            <div class="row">
                <div class="span4   offset4">
                    <h1 style="text-align: right">Board Members</h1>
                </div>
            </div>
            <div class="row">
                <div class="span3   offset5">
                    <div class="">
                        <img src="Img/BOD/1.jpg" style="border-radius: 200px; width: 200px; height: 200px" />
                        <div class="card1-header">
                            <h5 style="color: black; text-align: left">RAM KUMAR THEBE<br />
                                <span style="padding-left: 30px">(Chairman)</span></h5>
                        </div>
                    </div>
                </div>
            </div>
            <br />
            <div class="row">
                <div class="span3   offset1">
                    <div class="">
                        <img src="Img/BOD/2.jpg" style="border-radius: 200px; width: 200px; height: 200px" />
                        <div class="card1-header">
                            <h5 style="color: black; text-align: left">SHANKAR BD. CHHETTRY<br />
                                <span style="padding-left: 30px">(Vice-Chairman)</span></h5>
                        </div>
                    </div>
                </div>
                <div class="span3   offset1">
                    <div class="">
                        <img src="Img/BOD/3.jpg" style="border-radius: 200px; width: 200px; height: 200px" />
                        <div class="card1-header">
                            <h5 style="color: black; text-align: left">BHOJ RAJ DHUNGANA<br />
                                <span style="padding-left: 30px">(Secretary)</span></h5>
                        </div>
                    </div>
                </div>
                <div class="span3   offset1">
                    <div class="">
                        <img src="Img/BOD/4.jpg" style="border-radius: 200px; width: 200px; height: 200px" />
                        <div class="card1-header">
                            <h5 style="color: black; text-align: left">RAJU PRASAD TIMALSIANA<br />
                                <span style="padding-left: 30px">(Treasurer)</span></h5>
                        </div>
                    </div>
                </div>
            </div>
            <br />
            <div class="row">
                <div class="span3">
                    <div class="">
                        <img src="Img/BOD/5.jpg" style="border-radius: 200px; width: 200px; height: 200px" />
                        <div class="card1-header">
                            <h5 style="color: black; text-align: left; padding-left: 20px">BHAGWATI PRASAI<br />
                                <span style="padding-left: 30px">(Member)</span> </h5>
                        </div>
                    </div>
                </div>
                <div class="span3">
                    <div class="">
                        <img src="Img/BOD/6.jpg" style="border-radius: 200px; width: 200px; height: 200px" />
                        <div class="card1-header">
                            <h5 style="color: black; text-align: left; padding-left: 25px">LAXMI GAUTAM<br />
                                <span style="padding-left: 30px">(Member)</span>  </h5>
                        </div>
                    </div>
                </div>
                <div class="span3">
                    <div class="">
                        <img src="Img/BOD/7.jpg" style="border-radius: 200px; width: 200px; height: 200px" />
                        <div class="card1-header">
                            <h5 style="color: black; text-align: left;">SHOVA CHITRAKAR THAPA<br />
                                <span style="padding-left: 30px">(Member)</span>  </h5>
                        </div>
                    </div>
                </div>
                <div class="span3">
                    <div class="">
                        <img src="Img/BOD/8.jpg" style="border-radius: 200px; width: 200px; height: 200px" />
                        <div class="card1-header">
                            <h5 style="color: black; text-align: left; padding-left: 30px">RAJESH NEPAL<br />
                                <span style="padding-left: 20px">(Member)</span>  </h5>
                        </div>
                    </div>
                </div>
            </div>
            <br />
            <div class="row">
                <div class="span3">
                    <div class="">
                        <img src="Img/BOD/9.jpg" style="border-radius: 200px; width: 200px; height: 200px" />
                        <div class="card1-header">
                            <h5 style="color: black; text-align: left; padding-left: 30px">RAJESH ARYAL<br />
                                <span style="padding-left: 20px">(Member)</span> </h5>
                        </div>
                    </div>
                </div>
                <div class="span3">
                    <div class="">
                        <img src="Img/BOD/10.jpg" style="border-radius: 200px; width: 200px; height: 200px" />
                        <div class="card1-header">
                            <h5 style="color: black; text-align: left; padding-left: 25px">TOYANATH DAHAL<br />
                                <span style="padding-left: 20px">(Member)</span></h5>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>--%>

    <%--<div class="super-container" style="background-color: antiquewhite">
        <div class="container">

            <div class="row">
                <div class="span4   offset4">
                    <h1 style="text-align: right">Board Members</h1>
                </div>
            </div>
            <div class="row">
                <div class="span3   offset5">
                    <div class="card1   border-left-dark border-right-dark   border-bottom-dark  border-top-dark " style="border-radius: 10px; background-color: #4e73df">
                        <img src="Img/BOD/1.jpg" style="border-radius: 10px;" />
                        <div class="card1-header">
                            <h5 style="color: white; text-align: center">RAM KUMAR THEBE<br />
                                (Chairman)</h5>
                        </div>
                    </div>
                </div>
            </div>
            <br />
            <div class="row">
                <div class="span3   offset1">
                    <div class="card1   border-left-dark border-right-dark   border-bottom-dark  border-top-dark " style="border-radius: 10px; background-color: #4e73df">
                        <img src="Img/BOD/2.jpg" style="border-radius: 10px;" />
                        <div class="card1-header">
                            <h5 style="color: white; text-align: center">SHANKAR BD. CHHETTRY<br />
                                (Vice-Chairman)</h5>
                        </div>
                    </div>
                </div>
                <div class="span3   offset1">
                    <div class="card1   border-left-dark border-right-dark   border-bottom-dark  border-top-dark " style="border-radius: 10px; background-color: #4e73df">
                        <img src="Img/BOD/3.jpg" style="border-radius: 10px;" />
                        <div class="card1-header">
                            <h5 style="color: white; text-align: center">BHOJ RAJ DHUNGANA<br />
                                (Secretary)</h5>
                        </div>
                    </div>
                </div>
                <div class="span3   offset1">
                    <div class="card1   border-left-dark border-right-dark   border-bottom-dark  border-top-dark " style="border-radius: 10px; background-color: #4e73df">
                        <img src="Img/BOD/4.jpg" style="border-radius: 10px;" />
                        <div class="card1-header">
                            <h5 style="color: white; text-align: center">RAJU PRASAD TIMALSIANA<br />
                                (Treasurer)</h5>
                        </div>
                    </div>
                </div>
            </div>
            <br />
            <div class="row">
                <div class="span3">
                    <div class="card1   border-left-dark border-right-dark   border-bottom-dark  border-top-dark " style="border-radius: 10px; background-color: #4e73df">
                        <img src="Img/BOD/5.jpg" style="border-radius: 10px;" />
                        <div class="card1-header">
                            <h5 style="color: white; text-align: center">BHAGWATI PRASAI<br />
                                (Member)</h5>
                        </div>
                    </div>
                </div>
                <div class="span3">
                    <div class="card1   border-left-dark border-right-dark   border-bottom-dark  border-top-dark " style="border-radius: 10px; background-color: #4e73df">
                        <img src="Img/BOD/6.jpg" style="border-radius: 10px;" />
                        <div class="card1-header">
                            <h5 style="color: white; text-align: center">LAXMI GAUTAM<br />
                                (Member)</h5>
                        </div>
                    </div>
                </div>
                <div class="span3">
                    <div class="card1   border-left-dark border-right-dark   border-bottom-dark  border-top-dark " style="border-radius: 10px; background-color: #4e73df">
                        <img src="Img/BOD/7.jpg" style="border-radius: 10px;" />
                        <div class="card1-header">
                            <h5 style="color: white; text-align: center">SHOVA CHITRAKAR THAPA<br />
                                (Member)</h5>
                        </div>
                    </div>
                </div>
                <div class="span3">
                    <div class="card1   border-left-dark border-right-dark   border-bottom-dark  border-top-dark " style="border-radius: 10px; background-color: #4e73df">
                        <img src="Img/BOD/8.jpg" style="border-radius: 10px;" />
                        <div class="card1-header">
                            <h5 style="color: white; text-align: center">RAJESH NEPAL<br />
                                (Member)</h5>
                        </div>
                    </div>
                </div>
            </div>
            <br />
            <div class="row">
                <div class="span3">
                    <div class="card1   border-left-dark border-right-dark   border-bottom-dark  border-top-dark " style="border-radius: 10px; background-color: #4e73df">
                        <img src="Img/BOD/9.jpg" style="border-radius: 10px;" />
                        <div class="card1-header">
                            <h5 style="color: white; text-align: center">RAJESH ARYAL<br />
                                (Member)</h5>
                        </div>
                    </div>
                </div>
                <div class="span3">
                    <div class="card1   border-left-dark border-right-dark   border-bottom-dark  border-top-dark " style="border-radius: 10px; background-color: #4e73df">
                        <img src="Img/BOD/10.jpg" style="border-radius: 10px;" />
                        <div class="card1-header">
                            <h5 style="color: white; text-align: center">TOYANATH DAHAL<br />
                                (Member)</h5>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>--%>



    <%--<div class="super-container" style="background-color: antiquewhite">
        <div class="container">
            <div class="row">
                <div class="span4   offset4">
                    <h1 style="text-align: right">Board Members</h1>
                </div>
            </div>
            <div class="row">
                <div class="span3   offset5">
                    <div class="card1">
                        <img src="Img/BOD/1.jpg" style="border-radius: 220px; width: 220px; height: 220px" />
                        <div class="card1-header">
                            <h5 style="color: black; text-align: left">RAM KUMAR THEBE<br />
                                <span style="padding-left: 30px">(Chairman)</span></h5>
                        </div>
                    </div>
                </div>
            </div>
            <br />
            <div class="row">
                <div class="span3   offset1">
                    <div class="card1">
                        <img src="Img/BOD/2.jpg" style="border-radius: 220px; width: 220px; height: 220px" />
                        <div class="card1-header">
                            <h5 style="color: black; text-align: left">SHANKAR BD. CHHETTRY<br />
                                <span style="padding-left: 30px">(Vice-Chairman)</span></h5>
                        </div>
                    </div>
                </div>
                <div class="span3   offset1">
                    <div class="card1">
                        <img src="Img/BOD/3.jpg" style="border-radius: 220px; width: 220px; height: 220px" />
                        <div class="card1-header">
                            <h5 style="color: black; text-align: left">BHOJ RAJ DHUNGANA<br />
                                <span style="padding-left: 30px">(Secretary)</span></h5>
                        </div>
                    </div>
                </div>
                <div class="span3   offset1">
                    <div class="card1">
                        <img src="Img/BOD/4.jpg" style="border-radius: 220px; width: 220px; height: 220px" />
                        <div class="card1-header">
                            <h5 style="color: black; text-align: left">RAJU PRASAD TIMALSIANA<br />
                                <span style="padding-left: 30px">(Treasurer)</span></h5>
                        </div>
                    </div>
                </div>
            </div>
            <br />
            <div class="row">
                <div class="span3">
                    <div class="card1">
                        <img src="Img/BOD/5.jpg" style="border-radius: 220px; width: 220px; height: 220px" />
                        <div class="card1-header">
                            <h5 style="color: black; text-align: left; padding-left: 20px">BHAGWATI PRASAI<br />
                                <span style="padding-left: 30px">(Member)</span> </h5>
                        </div>
                    </div>
                </div>
                <div class="span3">
                    <div class="card1">
                        <img src="Img/BOD/6.jpg" style="border-radius: 220px; width: 220px; height: 220px" />
                        <div class="card1-header">
                            <h5 style="color: black; text-align: left; padding-left: 25px">LAXMI GAUTAM<br />
                                <span style="padding-left: 30px">(Member)</span>  </h5>
                        </div>
                    </div>
                </div>
                <div class="span3">
                    <div class="card1">
                        <img src="Img/BOD/7.jpg" style="border-radius: 220px; width: 220px; height: 220px" />
                        <div class="card1-header">
                            <h5 style="color: black; text-align: left;">SHOVA CHITRAKAR THAPA<br />
                                <span style="padding-left: 30px">(Member)</span>  </h5>
                        </div>
                    </div>
                </div>
                <div class="span3">
                    <div class="card1">
                        <img src="Img/BOD/8.jpg" style="border-radius: 220px; width: 220px; height: 220px" />
                        <div class="card1-header">
                            <h5 style="color: black; text-align: left; padding-left: 30px">RAJESH NEPAL<br />
                                <span style="padding-left: 20px">(Member)</span>  </h5>
                        </div>
                    </div>
                </div>
            </div>
            <br />
            <div class="row">
                <div class="span3">
                    <div class="card1">
                        <img src="Img/BOD/9.jpg" style="border-radius: 220px; width: 220px; height: 220px" />
                        <div class="card1-header">
                            <h5 style="color: black; text-align: left; padding-left: 30px">RAJESH ARYAL<br />
                                <span style="padding-left: 20px">(Member)</span> </h5>
                        </div>
                    </div>
                </div>
                <div class="span3">
                    <div class="card1">
                        <img src="Img/BOD/10.jpg" style="border-radius: 220px; width: 220px; height: 220px" />
                        <div class="card1-header">
                            <h5 style="color: black; text-align: left; padding-left: 25px">TOYANATH DAHAL<br />
                                <span style="padding-left: 20px">(Member)</span></h5>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>--%>

    <%--<div class="super-container" style="background-color: antiquewhite">
        <div class="container">
            <div class="row">
                <div class="span4   offset4">
                    <h1 style="text-align: right">Board Members</h1>
                </div>
            </div>
            <div class="row">
                <div class="span3   offset5">
                    <div class="card1   border-left-dark border-right-dark   border-bottom-dark  border-top-dark " style="border-radius: 10px; background-color: #faebd7">

                        <img src="Img/BOD/1.jpg" style="border-radius: 220px; width: 220px; height: 220px" />
                        <div class="card1-header">
                            <h5 style="color: black; text-align: left">RAM KUMAR THEBE<br />
                                <span style="padding-left: 30px">(Chairman)</span></h5>
                        </div>
                    </div>
                </div>
            </div>
            <br />
            <div class="row">
                <div class="span3   offset1">
                    <div class="card1   border-left-dark border-right-dark   border-bottom-dark  border-top-dark " style="border-radius: 10px; background-color: #faebd7">

                        <img src="Img/BOD/2.jpg" style="border-radius: 220px; width: 220px; height: 220px" />
                        <div class="card1-header">
                            <h5 style="color: black; text-align: left">SHANKAR BD. CHHETTRY<br />
                                <span style="padding-left: 30px">(Vice-Chairman)</span></h5>
                        </div>
                    </div>
                </div>
                <div class="span3   offset1">
                    <div class="card1   border-left-dark border-right-dark   border-bottom-dark  border-top-dark " style="border-radius: 10px; background-color: #faebd7">

                        <img src="Img/BOD/3.jpg" style="border-radius: 220px; width: 220px; height: 220px" />
                        <div class="card1-header">
                            <h5 style="color: black; text-align: left">BHOJ RAJ DHUNGANA<br />
                                <span style="padding-left: 30px">(Secretary)</span></h5>
                        </div>
                    </div>
                </div>
                <div class="span3   offset1">
                    <div class="card1   border-left-dark border-right-dark   border-bottom-dark  border-top-dark " style="border-radius: 10px; background-color: #faebd7">

                        <img src="Img/BOD/4.jpg" style="border-radius: 220px; width: 220px; height: 220px" />
                        <div class="card1-header">
                            <h5 style="color: black; text-align: left">RAJU PRASAD TIMALSIANA<br />
                                <span style="padding-left: 30px">(Treasurer)</span></h5>
                        </div>
                    </div>
                </div>
            </div>
            <br />
            <div class="row">
                <div class="span3">
                    <div class="card1   border-left-dark border-right-dark   border-bottom-dark  border-top-dark " style="border-radius: 10px; background-color: #faebd7">

                        <img src="Img/BOD/5.jpg" style="border-radius: 220px; width: 220px; height: 220px" />
                        <div class="card1-header">
                            <h5 style="color: black; text-align: left; padding-left: 20px">BHAGWATI PRASAI<br />
                                <span style="padding-left: 30px">(Member)</span> </h5>
                        </div>
                    </div>
                </div>
                <div class="span3">
                    <div class="card1   border-left-dark border-right-dark   border-bottom-dark  border-top-dark " style="border-radius: 10px; background-color: #faebd7">

                        <img src="Img/BOD/6.jpg" style="border-radius: 220px; width: 220px; height: 220px" />
                        <div class="card1-header">
                            <h5 style="color: black; text-align: left; padding-left: 25px">LAXMI GAUTAM<br />
                                <span style="padding-left: 30px">(Member)</span>  </h5>
                        </div>
                    </div>
                </div>
                <div class="span3">
                    <div class="card1   border-left-dark border-right-dark   border-bottom-dark  border-top-dark " style="border-radius: 10px; background-color: #faebd7">

                        <img src="Img/BOD/7.jpg" style="border-radius: 220px; width: 220px; height: 220px" />
                        <div class="card1-header">
                            <h5 style="color: black; text-align: left;">SHOVA CHITRAKAR THAPA<br />
                                <span style="padding-left: 30px">(Member)</span>  </h5>
                        </div>
                    </div>
                </div>
                <div class="span3">
                    <div class="card1   border-left-dark border-right-dark   border-bottom-dark  border-top-dark " style="border-radius: 10px; background-color: #faebd7">

                        <img src="Img/BOD/8.jpg" style="border-radius: 220px; width: 220px; height: 220px" />
                        <div class="card1-header">
                            <h5 style="color: black; text-align: left; padding-left: 30px">RAJESH NEPAL<br />
                                <span style="padding-left: 20px">(Member)</span>  </h5>
                        </div>
                    </div>
                </div>
            </div>
            <br />
            <div class="row">
                <div class="span3">
                    <div class="card1   border-left-dark border-right-dark   border-bottom-dark  border-top-dark " style="border-radius: 10px; background-color: #faebd7">

                        <img src="Img/BOD/9.jpg" style="border-radius: 220px; width: 220px; height: 220px" />
                        <div class="card1-header">
                            <h5 style="color: black; text-align: left; padding-left: 30px">RAJESH ARYAL<br />
                                <span style="padding-left: 20px">(Member)</span> </h5>
                        </div>
                    </div>
                </div>
                <div class="span3">
                    <div class="card1   border-left-dark border-right-dark   border-bottom-dark  border-top-dark " style="border-radius: 10px; background-color: #faebd7">
                        <img src="Img/BOD/10.jpg" style="border-radius: 220px; width: 220px; height: 220px" />
                        <div class="card1-header">
                            <h5 style="color: black; text-align: left; padding-left: 25px">TOYANATH DAHAL<br />
                                <span style="padding-left: 20px">(Member)</span></h5>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>--%>


</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="ContentScript" runat="server">
</asp:Content>
