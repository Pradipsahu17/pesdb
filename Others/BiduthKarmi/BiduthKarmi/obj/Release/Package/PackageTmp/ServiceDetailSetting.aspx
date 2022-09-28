<%@ Page Title="" Language="C#" MasterPageFile="~/AdminMaster.Master" AutoEventWireup="true" CodeBehind="ServiceDetailSetting.aspx.cs" Inherits="BiduthKarmi.ServiceDetailSettting" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentTitle" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="Contenthead" runat="server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentNavTitle" runat="server">
    <span>Service Details</span>ClassCollection
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="ContentPlaceBody" runat="server">
    <div class="container-fluid">
        <div class="row">
            <div class="offset-2 col-sm-8 offset-2">
                <asp:HiddenField ID="IsEditHiddenField" runat="server" />
                <asp:HiddenField ID="SelectedIdHiddenField" runat="server" />
                <div class="form-group">
                    <asp:TextBox runat="server" ID="SavingHeadTxtB" CssClass="form-control" PlaceHolder="Saving Head"></asp:TextBox>
                </div>
                <div class="form-group">
                    <asp:TextBox runat="server" ID="InterestRateTxtB" CssClass="form-control" PlaceHolder="Interest Rate"></asp:TextBox>
                </div>
                <div class="form-group">
                    <asp:TextBox runat="server" ID="TermConditionTxtB" CssClass="form-control" PlaceHolder="Terms And Conditions "></asp:TextBox>
                </div>
                <div class="form-group">
                    <asp:DropDownList runat="server" ID="ServiceCategroyDropdownList" CssClass="form-control">
                        <asp:ListItem CssClass="dropdown-menu" Value="1">Fix Deposit</asp:ListItem>
                        <asp:ListItem CssClass="dropdown-menu" Value="2">Eductation Saving</asp:ListItem>
                        <asp:ListItem CssClass="dropdown-menu" Value="3">Normal Saving</asp:ListItem>
                        <asp:ListItem CssClass="dropdown-menu" Value="4">General Saving</asp:ListItem>
                        <asp:ListItem CssClass="dropdown-menu" Value="5">Gold Saving</asp:ListItem>
                        <asp:ListItem CssClass="dropdown-menu" Value="6">Silver Saving</asp:ListItem>
                        <asp:ListItem CssClass="dropdown-menu" Value="7">Personal Loan</asp:ListItem>
                        <asp:ListItem CssClass="dropdown-menu" Value="8">Share Against Loan</asp:ListItem>
                        <asp:ListItem CssClass="dropdown-menu" Value="9">Hire Purchase Loan</asp:ListItem>
                        <asp:ListItem CssClass="dropdown-menu" Value="10">Share Account</asp:ListItem>
                    </asp:DropDownList>
                </div>
                <div class="action">
                    <asp:Button ID="btnSave" runat="server" Text="Save" ValidationGroup="valid" OnClick="btnSave_Click" CausesValidation="true" CssClass="btn btn-primary" />
                    <asp:Button ID="btnCancel" runat="server" Text="Cancel" CssClass="btn btn-Info" />
                </div>
            </div>
        </div>
    </div>
    <div style="margin-top: 25px;" class="container-fluid">

        <h2 style="text-align: center; color: blue; font-weight: 500;">List of Service Details</h2>
        <div class="row">
            <div class="col-12">
                <table id="TableMain" class="table table-bordered table-primary " style="color: #000000">
                    <thead>
                        <tr>
                            <th style="width: 3%; text-align: center; color: blue; font-size: 16px; padding: 8px;">ID</th>
                           <th style="width: 10%; text-align: center; color: blue; font-size: 16px; padding: 8px;">Category</th>
                            <th style="width: 10%; text-align: center; color: blue; font-size: 16px; padding: 8px;">SavingHead</th>
                            <th style="width: 10%; text-align: center; color: blue; font-size: 16px; padding: 8px;">Interest Rate</th>
                            <th style="width: 24%; text-align: center; color: blue; font-size: 16px; padding: 8px;">Terms And Conditions</th>
                            <th style="width: 10%; text-align: center; color: blue; font-size: 16px; padding: 8px;">IsActive</th>
                            <th style="width: 13%; text-align: center; color: blue; font-size: 16px; padding: 8px;">Action</th>
                        </tr>
                    </thead>
                    <tbody>
                    </tbody>
                </table>
            </div>
        </div>
    </div>
</asp:Content>
<asp:Content ID="Content5" ContentPlaceHolderID="ContentScript" runat="server">
    <script type="text/javascript">
        $(document).ready(function () {
            $("#message-show").hide();
        })
        function blockUI() {
            $.blockUI({ message: '<h4 class="lighter blue"><i class="fa fa-spinner fa-spin"></i> Please wait...</h4>' });
        }
        function unblockUI() {
            $.unblockUI("");
        }
        function AjaxEnd(sender, args) {
            unblockUI();
        }
        function AjaxBegin(sender, args) {
            blockUI();
        }

        $(document).ready(function () {
            $.ajax({
                type: "POST",
                contentType: "application/json; charset=utf-8",
                dataType: "json",
                url: "ServiceDetailSetting.aspx/LoadServiceDetail",
                data: {},
                beforeSend: function (jqXHR, settings) { blockUI(jqXHR, settings) },
                complete: function (jqXHR, textStatus) { unblockUI(jqXHR, textStatus) },
                success: function (result) {
                    if (result.d.Success = true) {
                        $("#TableMain tbody").prepend(result.d.Data);
                        //var tableinstance = $('#TableMain').DataTable({
                        //});
                    }
                },
                failure: function (msg) {
                    alert(msg.d);
                }
            });
        });
        function Delete(element) {
            var thistr = $(element).closest("tr");
            debugger;
            //var DeleteSno = $(thistr).attr('id');
            var CId = element.id;
            var r = confirm("You are going to Delete the service detail.");
            if (r == true) {
                $.ajax({
                    type: "POST",
                    url: "ServiceDetailSetting.aspx/DeleteServiceDetail",
                    contentType: "application/json; charset=utf-8",
                    datatype: "json",
                    data: JSON.stringify({ CID: CId.substring(1) }),
                    beforeSend: function (jqXHR, settings) { blockUI(jqXHR, settings) },
                    complete: function (jqXHR, textStatus) { unblockUI(jqXHR, textStatus) },
                    success: function (response) {
                        alert("Delete Successfully");
                        thistr.remove();

                    },
                })
            }
        }
        function Edit(element) {
            var thistr = $(element).closest("tr");
            debugger;
            //var DeleteSno = $(thistr).attr('id');
            var CId = element.id;
            var r = confirm("You are going to Edit the Service Detail. ");
            if (r == true) {
                $.ajax({
                    type: "POST",
                    url: "ServiceDetailSetting.aspx/EditServiceDetail",
                    contentType: "application/json; charset=utf-8",
                    datatype: "json",
                    data: JSON.stringify({ CID: CId.substring(1) }),
                    beforeSend: function (jqXHR, settings) { blockUI(jqXHR, settings) },
                    complete: function (jqXHR, textStatus) { unblockUI(jqXHR, textStatus) },
                    success: function (response) {
                        if (response.d.Success == true) {
                            debugger;
                            let savingHead = response.d.Datas[0];
                            let interestRate = response.d.Datas[1];
                            let termsAndconditions = response.d.Datas[2];
                            let serviceId = response.d.Datas[3];
                            $("#<%=IsEditHiddenField.ClientID%>").val(true);
                            $("#<%=SelectedIdHiddenField.ClientID%>").val(CId.substring(1));
                            $("#<%=SavingHeadTxtB.ClientID%>").val(savingHead);
                            $("#<%=InterestRateTxtB.ClientID%>").val(interestRate);
                            $("#<%=TermConditionTxtB.ClientID%>").val(termsAndconditions);
                            $("#<%=ServiceCategroyDropdownList.ClientID%>").val(serviceId);

                        }
                    },
                })
            }
        }

        function Active(element) {
            var thistr = $(element).closest("tr");
            //var PictureID = $(thistr).attr('id');
            var CId = element.id;
            var r = confirm("Confirm Yourself before Proceeding");
            if (r == true) {
                $.ajax({
                    type: "POST",
                    url: "ServiceDetailSetting.aspx/MakeInactive",
                    contentType: "application/json; charset=utf-8",
                    datatype: "json",
                    data: JSON.stringify({ CID: CId.substring(1) }),
                    beforeSend: function (jqXHR, settings) { blockUI(jqXHR, settings) },
                    complete: function (jqXHR, textStatus) { unblockUI(jqXHR, textStatus) },
                    success: function (result) {
                        if (result.d.Success = true) {
                            if ($(thistr).find('td:eq(5)').html() == 'False') {
                                $(thistr).find('td:eq(5)').html('True');
                            }
                            else {
                                $(thistr).find('td:eq(5)').html('False');
                            }
                        }
                        else {
                            alert("Error");
                        }
                    },
                })
            }

        };
    </script>
</asp:Content>
