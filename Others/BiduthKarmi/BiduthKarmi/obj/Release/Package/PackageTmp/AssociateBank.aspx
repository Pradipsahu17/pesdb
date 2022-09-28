<%@ Page Title="" Language="C#" MasterPageFile="~/AdminMaster.Master" AutoEventWireup="true" CodeBehind="AssociateBank.aspx.cs" Inherits="BiduthKarmi.AssociateBank" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentTitle" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="Contenthead" runat="server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentNavTitle" runat="server">
    <span>Associate Banks</span>
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="ContentPlaceBody" runat="server">
    <div class="container-fluid">
        <div class="row">
            <div class="offset-2 col-sm-8 offset-2">
                <asp:HiddenField ID="IsEditHiddenField" runat="server" />
                <asp:HiddenField ID="SelectedIdHiddenField" runat="server" />
                <div class="form-group">
                    <asp:TextBox runat="server" ID="BankNameTxtB" CssClass="form-control" PlaceHolder="Bank Name"></asp:TextBox>
                </div>
                <div class="form-group">
                    <asp:TextBox runat="server" ID="AccountNumberTxtB" CssClass="form-control" PlaceHolder="Account Number"></asp:TextBox>
                </div>
                <div class="form-group">
                    <asp:TextBox runat="server" ID="AccountHolderNameTxtB" CssClass="form-control" PlaceHolder="Account Holder Name "></asp:TextBox>
                </div>
                <div class="form-group">
                    <asp:TextBox runat="server" ID="BranchNameTxtB" CssClass="form-control" PlaceHolder="Branch Name"></asp:TextBox>
                </div>
                <div class="form-group">
                    <asp:FileUpload runat="server" ID="LogoUploaderFile" CssClass="fform-control-file border" />
                </div>
                <div class="form-group">
                    <asp:HiddenField runat="server" ID="IsActiveHF" />
                </div>
                <div class="action">
                    <asp:Button ID="btnSave" runat="server" Text="Save" ValidationGroup="valid" OnClick="btnSave_Click" CausesValidation="true" CssClass="btn btn-primary" />
                    <asp:Button ID="btnCancel" runat="server" Text="Cancel" CssClass="btn btn-Info" />
                </div>
            </div>
        </div>
    </div>
    <div id="List-Of-AssociateBanks" style="margin: 10px; color: black">
        <div class="container-fluid">
            <h2 style="text-align: center;">Associate Bank  Lists</h2>
            <div class="row">
                <div class="col-sm-12 ">
                    <table id="TableMain" class="table table-bordered table-primary  display responsive nowrap" style="color: Black;">
                        <thead>
                            <tr>
                                <th style="text-align:center; width:5%; ">ID</th>
                                <th style="text-align:center; width:15%;">Bank Name</th>
                                <th style="text-align:center; width:10%;" >Account Number</th>
                                <th style="text-align:center; width:10%;" >Account Holder Name</th>
                                <th style="text-align:center; width:10%;">Branch Name</th>
                                <th style="text-align:center; width:10%;" >Logo</th>
                                <th style="text-align:center; width:5%; " >IsActive</th>
                                <th style="text-align:center;width:15%; ">Action</th>
                            </tr>
                        </thead>
                        <tbody>
                        </tbody>
                    </table>
                </div>
            </div>
        </div>
    </div>
</asp:Content>
<asp:Content ID="Content5" ContentPlaceHolderID="ContentScript" runat="server">
    <%--  <link rel="stylesheet" href="https://cdn.jsdeli.net/npm/bootstrap@4.6.1/dist/css/bootstrap.min.css" />
    <script src="https://cdn.jsdelivr.net/npm/jquery@3.5.1/dist/jquery.slim.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/js/bootstrap.bundle.min.js"></script>--%>
    <script src="Scripts/jquery-ui.min.js"></script>
    <script type="text/javascript">
        $(document).ready(function () {
            $("#message-show").hide();
        })
        function blockUI() {
            $.blockUI({ message: '<h4 class="lighter blue"><i class="fa fa-spinner fa-spin"></i> Please wait...</h4>' });
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
            $.ajax({
                type: "POST",
                contentType: "application/json; charset=utf-8",
                dataType: "json",
                url: "AssociateBank.aspx/LoodAssociateBankDetails",
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
        function Edit(element) {
            var thistr = $(element).closest("tr");
            //var DeleteSno = $(thistr).attr('id');
            var CId = element.id;
            var r = confirm("You are going to Edit the AssociateBank ");
            if (r == true) {
                $.ajax({
                    type: "POST",
                    url: "AssociateBank.aspx/EditAssociateBank",
                    contentType: "application/json; charset=utf-8",
                    datatype: "json",
                    data: JSON.stringify({ CID: CId.substring(1) }),
                    //beforeSend: function (jqXHR, settings) { blockUI(jqXHR, settings) },
                    //complete: function (jqXHR, textStatus) { unblockUI(jqXHR, textStatus) },
                    success: function (response) {
                        if (response.d.Success == true) {
                            debugger;
                            let bankName = response.d.Datas[0];
                            let accountNumber = response.d.Datas[1];
                            let accountHolderName = response.d.Datas[2];
                            let branchName = response.d.Datas[3];
                            let logo = response.d.Datas[4];
                            $("#<%=IsEditHiddenField.ClientID%>").val(true);
                            $("#<%=SelectedIdHiddenField.ClientID%>").val(CId.substring(1));
                            $("#<%=BankNameTxtB.ClientID%>").val(bankName);
                            $("#<%=AccountNumberTxtB.ClientID%>").val(accountNumber);
                            $("#<%=AccountHolderNameTxtB.ClientID%>").val(accountHolderName);
                            $("#<%=BranchNameTxtB.ClientID%>").val(branchName);
                            $("#<%=LogoUploaderFile.ClientID%>").val(logo);
                            $("#<%=IsActiveHF.ClientID%>").val(isActive);
               

                        }
                    },
                })
            }
        }

        function Delete(element) {
            var thistr = $(element).closest("tr");;
            //var DeleteSno = $(thistr).attr('id');
            var CId = element.id;
            var r = confirm("You are going to Delete the AssociateBank");
            if (r == true) {
                $.ajax({
                    type: "POST",
                    url: "AssociateBank.aspx/DeleteAssociateBank",
                    contentType: "application/json; charset=utf-8",
                    datatype: "json",
                    data: JSON.stringify({ CID: CId.substring(1) }),
                    beforeSend: function (jqXHR, settings) { blockUI(jqXHR, settings) },
                    complete: function (jqXHR, textStatus) { unblockUI(jqXHR, textStatus) },
                    success: function (response) {
                        alert("Delete Successfull");
                        thistr.remove();

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
                    url: "AssociateBank.aspx/MakeInactive",
                    contentType: "application/json; charset=utf-8",
                    datatype: "json",
                    data: JSON.stringify({ CID: CId.substring(1) }),
                    beforeSend: function (jqXHR, settings) { blockUI(jqXHR, settings) },
                    complete: function (jqXHR, textStatus) { unblockUI(jqXHR, textStatus) },
                    success: function (result) {
                        if (result.d.Success = true) {
                            if ($(thistr).find('td:eq(6)').html() == 'False') {
                                $(thistr).find('td:eq(6)').html('True');
                            }
                            else {
                                $(thistr).find('td:eq(6)').html('False');
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
