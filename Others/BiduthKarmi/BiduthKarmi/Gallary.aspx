<%@ Page Title="" Language="C#" MasterPageFile="~/ViewMaster.Master" AutoEventWireup="true" CodeBehind="Gallary.aspx.cs" Inherits="BiduthKarmi.Gallary" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentTitle" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentHead" runat="server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentBody" runat="server">
    <div class="super-container"    style="background-color:antiquewhite">
        <div class="portfolio portfolio-page container">
            <div class="row">
                <ul class="portfolio-img" id="GallaryApp" style="margin-top: 10px">
                </ul>
            </div>
        </div>
    </div>
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="ContentScript" runat="server">
    <script type="text/javascript">
        function blockUI() {
            $.blockUI({ message: '<h4 class="lighter blue"><i class="fa fa-spinner fa-spin"></i> Please wait while we perform your request.</h4>' });
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
            debugger;
            $.ajax({
                type: "POST",
                contentType: "application/json; charset=utf-8",
                dataType: "json",
                url: "Gallary.aspx/LoadGalleryDetails",
                data: {},
                beforeSend: function (jqXHR, settings) { blockUI(jqXHR, settings) },
                complete: function (jqXHR, textStatus) { unblockUI(jqXHR, textStatus) },
                success: function (result) {
                    $("#GallaryApp").append(result.d);
                },
                failure: function (msg) {
                    alert(msg.d);
                }
            });
        });</script>
</asp:Content>
