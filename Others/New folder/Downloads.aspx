<%@ Page Title="" Language="C#" MasterPageFile="~/ViewMaster.Master" AutoEventWireup="true" CodeBehind="Downloads.aspx.cs" Inherits="BiduthKarmi.Downloads" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentTitle" runat="server">
    Downloads
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentHead" runat="server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentBody" runat="server">
    <div class="super-container" style="background-color: antiquewhite">
        <div class="container">
            <div class="row">
                <div class="span12">
                    <br />
                    <table id="TableMain" class="table table-bordered table-primary border-left-primary border-bottom-primary table-dark display responsive nowrap dataTable no-footer dtr-inline" style="color: black;" role="grid" aria-describedby="TableMain_info">
                        <thead>
                            <tr>
                                <td colspan="3" style="background-color: blue; font-size: 20px; color: white"><strong>Downloads</strong></td>
                            </tr>
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
                            <%-- <tr>
                                    <td>1</td>
                                    <td><b>Cash Collection Form For Collector</b></td>
                                    <td><a href="Downloads/Cash Collection Form for Collector.pdf" target="_blank"><span class="btn btn-success btn-xs Read" title="Read"><i class="fa fa-eye fa-sx"></i></span></a>
                                        <a href="Downloads/Cash Collection Form for Collector.pdf" target="_blank" download><span class="btn btn-primary btn-xs Delete" title="DownLoad"><i class="fa fa-download fa-xs"></i></span></a></td>
                                </tr>
                                <tr>
                                    <td>2</td>
                                    <td><b>Deposit Return Form</b></td>
                                    <td><a href="Downloads/Deposit Return Form.pdf" target="_blank"><span class="btn btn-success btn-xs Read" title="Read"><i class="fa fa-eye fa-sx"></i></span></a>
                                        <a href="Downloads/Deposit Return Form.pdf" target="_blank" download><span class="btn btn-primary btn-xs Delete" title="DownLoad"><i class="fa fa-download fa-xs"></i></span></a></td>
                                </tr>
                                <tr>
                                    <td>3</td>
                                    <td><b>Gold/Silver/Fixed/Education Saving Deposit Form</b></td>
                                    <td><a href="Downloads/Gol-Silver-Fixed-Education Saving Deposit Form.pdf" target="_blank"><span class="btn btn-success btn-xs Read" title="Read"><i class="fa fa-eye fa-sx"></i></span></a>
                                        <a href="Downloads/Gol-Silver-Fixed-Education Saving Deposit Form.pdf" target="_blank" download><span class="btn btn-primary btn-xs Delete" title="DownLoad"><i class="fa fa-download fa-xs"></i></span></a></td>
                                </tr>
                                <tr>
                                    <td>4</td>
                                    <td><b>Know Your Member(KYM) Form</b></td>
                                    <td><a href="Downloads/KnowYourMember(KYM).pdf" target="_blank"><span class="btn btn-success btn-xs Read" title="Read"><i class="fa fa-eye fa-sx"></i></span></a>
                                        <a href="Downloads/KnowYourMember(KYM).pdf" target="_blank" download><span class="btn btn-primary btn-xs Delete" title="DownLoad"><i class="fa fa-download fa-xs"></i></span></a></td>
                                </tr>
                                <tr>
                                    <td>5</td>
                                    <td><b>Loan Form</b></td>
                                    <td><a href="Downloads/LoanForm.pdf" target="_blank"><span class="btn btn-success btn-xs Read" title="Read"><i class="fa fa-eye fa-sx"></i></span></a>
                                        <a href="Downloads/LoanForm.pdf" target="_blank" download><span class="btn btn-primary btn-xs Delete" title="DownLoad"><i class="fa fa-download fa-xs"></i></span></a></td>
                                </tr>
                                <tr>
                                    <td>6</td>
                                    <td><b>Share Form</b></td>
                                    <td><a href="Downloads/Share Form.pdf" target="_blank"><span class="btn btn-success btn-xs Read" title="Read"><i class="fa fa-eye fa-sx"></i></span></a>
                                        <a href="Downloads/Share Form.pdf" target="_blank" download><span class="btn btn-primary btn-xs Delete" title="DownLoad"><i class="fa fa-download fa-xs"></i></span></a></td>
                                </tr>--%>
                        </tbody>
                    </table>
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


            debugger;
            var url = window.location.href;
            var res = url.split("=");
            var DID = res[res.length - 1];
            LoadSetting(DID);


        })
        function LoadSetting(DID) {
            debugger;
            $.ajax({
                type: "POST",
                url: "Downloads.aspx/LoadAllSetting",
                data: {},
                contentType: "application/json; charset=utf-8",
                dataType: "json",
                data: JSON.stringify({ DID: DID }),
                beforeSend: function (jqXHR, settings) { blockUI(jqXHR, settings) },
                complete: function (jqXHR, textStatus) { unblockUI(jqXHR, textStatus) },
                success: function (result) {
                    if (result.d.Success == true) {
                        $("#TableMain   tbody").append(result.d.AdditionalData);
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
