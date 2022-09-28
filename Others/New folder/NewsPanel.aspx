<%@ Page Title="" Language="C#" MasterPageFile="~/ViewMaster.Master" AutoEventWireup="true" CodeBehind="NewsPanel.aspx.cs" Inherits="BiduthKarmi.NewsPanel" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentTitle" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentHead" runat="server">
</asp:Content>

<asp:Content ID="Content3" ContentPlaceHolderID="ContentBody" runat="server">
    <div class="container"  style="margin-top:60px">
        <div class="row" style="color: #090101" id="NewsCollection1" runat="server">
            <div class="span12">
                <h4>
                    <asp:Label ID="newsTitle" runat="server" /></h4>
                <p>
                    <asp:Label ID="newsBody" runat="server" />
                </p>
                <%--<a href="NewsPanel.aspx" target="_blank">Read more</a>--%>
            </div>

        </div>
        <div class="row" id="NewsCollection2" runat="server"    style="margin-top:30px">
            <div class="row" style="color: #000000">
                <div class="span12" id="newspanel">
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
                url: "NewsPanel.aspx/LoadAllNews",
                data: JSON.stringify({ URL: url }),
                contentType: "application/json; charset=utf-8",
                dataType: "json",
                beforeSend: function (jqXHR, settings) { blockUI(jqXHR, settings) },
                complete: function (jqXHR, textStatus) { unblockUI(jqXHR, textStatus) },
                success: function (result) {
                    if (result.d.Success == true) {
                        $("#newspanel").append(result.d.AdditionalData);
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
