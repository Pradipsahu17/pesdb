<%@ Page Title="" Language="C#" MasterPageFile="~/ViewMaster.Master" AutoEventWireup="true" CodeBehind="ReportAndPublication.aspx.cs" Inherits="BiduthKarmi.ReportAndPublication" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentTitle" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentHead" runat="server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentBody" runat="server">
    <div class="container" style="margin-top: 60px; background-color: white">
        <div class="row" id="PublicationCollection1" runat="server">
            <div class="span12">
                <h4>
                    <asp:Label ID="newsTitle" runat="server" /></h4>
                <div id="ImgSrc" runat="server">
                    <asp:Image ImageUrl="imageurl" ID="ImageUrl" runat="server" Height="300" Width="500" />
                </div>
                <p>
                    <asp:Label ID="newsBody" runat="server" />
                </p>
                <%--<a href="NewsPanel.aspx" target="_blank">Read more</a>--%>
            </div>

        </div>
        <div class="row" id="PublicationCollection2" runat="server" style="margin-top: 30px">
            <div class="row" style="color: #000000">
                <div class="span10 offset1" id="newspanel">
                    <%--<div class='row'>
                        <div class='span12'>
                            <div class="row">
                                <div class="span4">
                                    <h4>Test Publication</h4>
                                    <p>This is test publication sample</p>
                                    <table>
                                        <tr>
                                            <td>
                                                <img src="Img/HomeSlider/IMG1.jpg" width="200" height="200" />
                                             </td>
                                            <td>
                                                <a href='ReportAndPublication.aspx?id=1' class="btn btn-primary">Read more</a>
                                                <br /><br />
                                                 <a href="#" target="_blank" class="btn btn-danger">GET PDF</a>
                                                
                                            </td>
                                        </tr>
                                    </table>

                                </div>
                            </div>
                        </div>
                    </div>--%>
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
                url: "ReportAndPublication.aspx/LoadAllPublication",
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

                    alert("Error loading Publication");

                }

            });

        }
    </script>
</asp:Content>
