<%@ Page Title="" Language="C#" MasterPageFile="~/ViewMaster.Master" AutoEventWireup="true" CodeBehind="LoanSubmitCommitte.aspx.cs" Inherits="BiduthKarmi.LoanSubmitCommitte" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentTitle" runat="server">
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
    <div class="super-container" style="background-color: antiquewhite">
        <div class="container" runat="server" id="EnglishDiv">

            <%-- <div class="row">
                <div class="span4   offset4">
                    <h2 style="text-align:right"> Loan    Submit  Committe</h2>
                    </div>
                 </div>
            <div class="row">
                <div class="span3   offset5">

                    <div class="card1   border-left-dark border-right-dark   border-bottom-dark  border-top-dark " style="border-radius: 10px; background-color: #4e73df">
                        <img src="Img/BOD/2.jpg" style="border-radius: 10px; height: 200px;" />
                        <div class="card1-header">
                            <h5 style="color: white; text-align: center">SHANKAR BD. CHHETTRY<br />
                                (Co-Ordinator)</h5>
                        </div>
                    </div>
                </div>
            </div>
            <br />
            <div class="row">
                <div class="span3   offset1">
                    <div class="card1   border-left-dark border-right-dark   border-bottom-dark  border-top-dark " style="border-radius: 10px; background-color: #4e73df">
                        <img src="Img/BOD/1.jpg" style="border-radius: 10px; height: 200px;" />
                        <div class="card1-header">
                            <h5 style="color: white; text-align: center">RAMESH PD DHAMALA
                                <br />
                                (Member)</h5>
                        </div>

                    </div>
                </div>
                <div class="span3   offset5">
                    <div class="card1   border-left-dark border-right-dark   border-bottom-dark  border-top-dark " style="border-radius: 10px; background-color: #4e73df">
                        <img src="Img/BOD/1.jpg" style="border-radius: 10px; height: 200px;" />
                        <div class="card1-header">
                            <h5 style="color: white; text-align: center">PRAKASH RAJ DHAKAL<br />
                                (Member)</h5>
                        </div>
                    </div>
                </div>
            </div>--%>
             <div class="row">
                <div class="span4   offset4">
                    <h2 style="text-align:right"> Loan    Submit  Committe</h2>
                    </div>
                 </div>
            <div class="row">
                <div class="span3   offset2"  style="padding-top:100px;">
                    <div class="card1   border-left-dark border-right-dark   border-bottom-dark  border-top-dark " style="border-radius: 10px; background-color: #4e73df">
                        <img src="Img/BOD/LO2.jpg" style="border-radius: 10px; height: 200px;" />
                        <div class="card1-header">
                            <h5 style="color: white; text-align: center">RAMESH PD DHAMALA
                                <br />
                                (Member)</h5>
                        </div>
                    </div>
                    </div>
                 
                 <div class="span3">
                
                    <div class="card1   border-left-dark border-right-dark   border-bottom-dark  border-top-dark " style="border-radius: 10px; background-color: #4e73df">
                        <img src="Img/BOD/2.jpg" style="border-radius: 10px; height: 200px;" />
                        <div class="card1-header">
                            <h5 style="color: white; text-align: center">SHANKAR BD. CHHETTRI<br />
                                (Co-Ordinator)</h5>
                        </div>
                    </div>
                </div>
                <div class="span3"style="padding-top:100px;">
                
                    <div class="card1   border-left-dark border-right-dark   border-bottom-dark  border-top-dark " style="border-radius: 10px; background-color: #4e73df">
                        <img src="Img/BOD/LO1.jpg" style="border-radius: 10px; height: 200px;" />
                        <div class="card1-header">
                            <h5 style="color: white; text-align: center">PRAKASH RAJ DHAKAL<br />
                                (Member)</h5>
                        </div>
                    </div>
                     </div>
            </div>
          
           

        </div>
        <div class="container" runat="server" id="NepaliDiv">
                 <div class="row">
                <div class="span4   offset4">
                    <h2 style="text-align:center;padding-left:50px"> ॠण उपसमिति</h2>
                    </div>
                 </div>
            <div class="row">
                <div class="span3   offset2"  style="padding-top:100px;">
                    <div class="card1   border-left-dark border-right-dark   border-bottom-dark  border-top-dark " style="border-radius: 10px; background-color: #4e73df">
                        <img src="Img/BOD/LO2.jpg" style="border-radius: 10px; height: 200px;" />
                        <div class="card1-header">
                            <h5 style="color: white; text-align: center">रमेश प्रसाद धमला
                                <br />
                                (सदस्य)</h5>
                        </div>
                    </div>
                    </div>
                 
                 <div class="span3">
                
                    <div class="card1   border-left-dark border-right-dark   border-bottom-dark  border-top-dark " style="border-radius: 10px; background-color: #4e73df">
                        <img src="Img/BOD/2.jpg" style="border-radius: 10px; height: 200px;" />
                        <div class="card1-header">
                            <h5 style="color: white; text-align: center">शंकर बहादुर क्षेत्री<br />
                                (सम्योजक)</h5>
                        </div>
                    </div>
                </div>
                <div class="span3"style="padding-top:100px;">
                
                    <div class="card1   border-left-dark border-right-dark   border-bottom-dark  border-top-dark " style="border-radius: 10px; background-color: #4e73df">
                        <img src="Img/BOD/LO1.jpg" style="border-radius: 10px; height: 200px;" />
                        <div class="card1-header">
                            <h5 style="color: white; text-align: center">प्रकाश राज ढकाल<br />
                                (सदस्य)</h5>
                        </div>
                    </div>
                     </div>
            </div>
           </div>
    </div>
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="ContentScript" runat="server">
</asp:Content>
