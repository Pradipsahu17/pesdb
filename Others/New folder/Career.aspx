<%@ Page Title="" Language="C#" MasterPageFile="~/ViewMaster.Master" AutoEventWireup="true" CodeBehind="Career.aspx.cs" Inherits="BiduthKarmi.Career" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentTitle" runat="server">
    Career
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentHead" runat="server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentBody" runat="server">
    <div class="super-container" style="background-color: antiquewhite">
        <div class="container" style="margin-top: 60px">
            <div class="row" style="color: #090101" id="CareerCollection1" runat="server">
                <div class="span12">
                    <table id="TableMain" class="table table-bordered table-hover table-condensed active table-primary border-left-primary border-bottom-primary table-dark display responsive nowrap dataTable no-footer dtr-inline" style="color: black;" role="grid" aria-describedby="TableMain_info">
                        <tr>
                         <td></td>
                        </tr>
                        <tr style="margin-top:40px">
                            <td>
                                <h4>
                                    <asp:Label ID="CareerTitle" runat="server" /></h4>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <p>
                                    <asp:Label ID="CareerBody" runat="server" />
                                </p>
                            </td>
                        </tr>
                        <tr>
                            <td>

                                <a href="#" target="_blank" id="target" class="btn btn-danger" runat="server">Read    More    PDF</a>

                            </td>
                        </tr>
                        </table>
                </div>

            </div>
            <div class="row" id="CareerCollection2" runat="server" style="margin-top: 30px">
                <div class="row" style="color: #000000">
                    <div class="span12" id="Careerpanel">
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
            var url = window.location.href;
            var res = url.split("=");
            if (parseInt(res[1]) > 0) {

            }
            else {
                LoadSetting();
            }
        })
        function LoadSetting() {
            debugger;
            var url = window.location.href;

            $.ajax({
                type: "POST",
                url: "Career.aspx/LoadAllCareerDetails",
                data: JSON.stringify({URL:url }),
                contentType: "application/json; charset=utf-8",
                dataType: "json",
                beforeSend: function (jqXHR, settings) { blockUI(jqXHR, settings) },
                complete: function (jqXHR, textStatus) { unblockUI(jqXHR, textStatus) },
                success: function (result) {
                    if (result.d.Success == true) {
                        $("#Careerpanel").append(result.d.AdditionalData);
                    }
                    else {
                        alert("The CompanySetting has not been Updated");
                    }
                },

                failure: function (result) {

                    alert("Error loading News");

                }

            });

        }
    </script>
</asp:Content>
