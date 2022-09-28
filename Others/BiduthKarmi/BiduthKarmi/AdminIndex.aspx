<%@ Page Title="" Language="C#" MasterPageFile="~/AdminMaster.Master" AutoEventWireup="true" CodeBehind="AdminIndex.aspx.cs" Inherits="BiduthKarmi.AdminIndex" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentTitle" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="Contenthead" runat="server">
</asp:Content>
<asp:Content ID="Content5" ContentPlaceHolderID="ContentNavTitle" runat="server">
    <asp:Label Text="text" ID="WelcomeTitle" runat="server" />
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceBody" runat="server">


    <div class="container-fluid">

        <!-- Page Heading -->
        <div class="d-sm-flex align-items-center justify-content-between mb-4">
            <h1 class="h3 mb-0 text-gray-800">Dashboard</h1>
            <a href="#" class="d-none d-sm-inline-block btn btn-sm btn-primary shadow-sm"><i
                class="fas fa-download fa-sm text-white-50"></i>Generate Report</a>
        </div>

        <!-- Content Row -->
        <div class="row">

            <!-- Earnings (Monthly) Card Example -->
            <div class="col-xl-3 col-md-6 mb-4">
                <div class="card border-left-primary    border-bottom-primary shadow h-100 py-2">
                    <div class="card-body">
                        <div class="row no-gutters align-items-center">
                            <div class="col mr-2">
                                <div class="text-xs font-weight-bold text-primary text-uppercase mb-1">
                                    Visitors (Today)
                                </div>
                                <div class="h5 mb-0 font-weight-bold text-gray-800"><span id="Visitors">5</span></div>
                            </div>
                            <div class="col-auto">
                                <i class="fas fa-calendar fa-2x text-gray-300"></i>
                            </div>
                        </div>
                    </div>
                </div>
            </div>

            <!-- Earnings (Monthly) Card Example -->
            <div class="col-xl-3 col-md-6 mb-4">
                <div class="card border-left-success    border-bottom-success shadow h-100 py-2">
                    <div class="card-body">
                        <div class="row no-gutters align-items-center">
                            <div class="col mr-2">
                                <div class="text-xs font-weight-bold text-success text-uppercase mb-1">
                                   <a href="NewsSetting.aspx">Active News</a> 
                                </div>
                                <div class="h5 mb-0 font-weight-bold text-gray-800"><span id="ActiveNews">9</span></div>
                            </div>
                            <div class="col-auto">
                                <i class="fas fa-newspaper fa-2x text-gray-300"></i>
                            </div>
                        </div>
                    </div>
                </div>
            </div>

            <!-- Earnings (Monthly) Card Example -->

            <div class="col-xl-3 col-md-6 mb-4">
                <div class="card border-left-success border-bottom-success  shadow h-100 py-2">
                    <div class="card-body">
                        <div class="row no-gutters align-items-center">
                            <div class="col mr-2">
                                <div class="text-xs font-weight-bold text-success text-uppercase mb-1">
                                    <a href="HomeSlider.aspx">Active Home Slides</a>
                                </div>
                                <div class="h5 mb-0 font-weight-bold text-gray-800"><span id="ActiveHomeSlides">5</span></div>
                            </div>
                            <div class="col-auto">
                                <i class="fas fa-home fa-2x text-gray-300"></i>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <%--<div class="col-xl-3 col-md-6 mb-4">
                            <div class="card border-left-info shadow h-100 py-2">
                                <div class="card-body">
                                    <div class="row no-gutters align-items-center">
                                        <div class="col mr-2">
                                            <div class="text-xs font-weight-bold text-info text-uppercase mb-1">Tasks
                                            </div>
                                            <div class="row no-gutters align-items-center">
                                                <div class="col-auto">
                                                    <div class="h5 mb-0 mr-3 font-weight-bold text-gray-800">50%</div>
                                                </div>
                                                <div class="col">
                                                    <div class="progress progress-sm mr-2">
                                                        <div class="progress-bar bg-info" role="progressbar"
                                                            style="width: 50%" aria-valuenow="50" aria-valuemin="0"
                                                            aria-valuemax="100"></div>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="col-auto">
                                            <i class="fas fa-clipboard-list fa-2x text-gray-300"></i>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>--%>

            <!-- Pending Requests Card Example -->
            <div class="col-xl-3 col-md-6 mb-4">
                <div class="card border-left-warning border-bottom-warning  shadow h-100 py-2">
                    <div class="card-body">
                        <div class="row no-gutters align-items-center">
                            <div class="col mr-2">
                                <div class="text-xs font-weight-bold text-warning text-uppercase mb-1">
                                    <a href="#">Pending Requests</a>
                                </div>
                                <div class="h5 mb-0 font-weight-bold text-gray-800">18</div>
                            </div>
                            <div class="col-auto">
                                <i class="fas fa-comments fa-2x text-gray-300"></i>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>

    </div>



</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="ContentScript" runat="server">
    <script>
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
        $(document).ready(function () {

            LoadSetting();

        })

        function LoadSetting() {
            $.ajax({
                type: "POST",
                url: "AdminIndex.aspx/LoadPageDetails",
                data: {},
                contentType: "application/json; charset=utf-8",
                dataType: "json",
                beforeSend: function (jqXHR, settings) { blockUI(jqXHR, settings) },
                complete: function (jqXHR, textStatus) { unblockUI(jqXHR, textStatus) },
                success: function (result) {
                    if (result.d.Success == true) {
                        $("#ActiveHomeSlides").html(result.d.Datas[1]);
                        $("#ActiveNews").html(result.d.Datas[0]);
                        $("#Visitors").html(result.d.Datas[2]);
                        $("#test").prepend(result.d.Datas[3]);
                        $("#NewMessageCount").html(result.d.Datas[4]);
                        $("#NewNotificationCount").html(result.d.Datas[5]);
                    }
                    else {
                        alert("The CompanySetting has not been Updated");
                    }
                },

                failure: function (result) {

                    alert("Error loading News");

                }

            });
        };

        function AutoLoad() {
            $.ajax({
                type: "POST",
                url: "AdminIndex.aspx/LoadPageDetails",
                data: {},
                contentType: "application/json; charset=utf-8",
                dataType: "json",
               
                success: function (result) {
                    if (result.d.Success == true) {
                        $("#ActiveHomeSlides").html(result.d.Datas[1]);
                        $("#ActiveNews").html(result.d.Datas[0]);
                        $("#Visitors").html(result.d.Datas[2]);
                        $("#test").prepend(result.d.Datas[3]);
                        $("#NewMessageCount").html(result.d.Datas[4]);
                    }
                    else {
                        alert("The CompanySetting has not been Updated");
                    }
                },

                failure: function (result) {
                    alert("Error loading News");
                }

            });
        };



        function AutoAnimate() {

            AutoLoad();


            setTimeout(AutoAnimate, 600000); // Change image every 5 seconds

        }

    </script>
</asp:Content>
