<%@ Page Title="" Language="C#" MasterPageFile="~/AdminMaster.Master" AutoEventWireup="true" CodeBehind="DownloadCategory.aspx.cs" Inherits="BiduthKarmi.DownloadCategory" %>

<asp:Content ID="Content6" ContentPlaceHolderID="ContentTitle" runat="server">
    DownLoad Category
</asp:Content>
<asp:Content ID="Content7" ContentPlaceHolderID="Contenthead" runat="server">
</asp:Content>
<asp:Content ID="Content8" ContentPlaceHolderID="ContentNavTitle" runat="server">
    DOWNLOAD CATEGORY
</asp:Content>
<asp:Content ID="Content9" ContentPlaceHolderID="ContentPlaceBody" runat="server">
    <div class="row">
        <div class="col-lg-10 offset-1">
            <table class="auto-style1">
                <tr>
                    <td>
                        
                    </td>
                    <td>
                        <asp:TextBox ID="txtDisplayName" Height="50px" CssClass="border-bottom-primary" Width="320px" Style="background-color: #3c3737; color: white" placeholder="Category Name" runat="server"></asp:TextBox>
                    </td>
                    <td colspan="2">
                        <asp:RequiredFieldValidator ID="rfvPictureDescription" CssClass="text-danger" runat="server" Display="Dynamic" ControlToValidate="txtDisplayName" ErrorMessage="<ul><li>Please Give Category Name</li></ul>" ValidationGroup="Valid">
                        </asp:RequiredFieldValidator>
                    </td>
                </tr>
                <tr>
                    <td>&nbsp;</td>
                    <td>
                        <asp:Button ID="btnSave" CssClass="btn btn-success btn-block border-bottom-primary" OnClick="btnSave_Click" Width="200px" ValidationGroup="Valid" runat="server" Text="Save" />
                    </td>

                </tr>

                <tr>
                    <td>&nbsp;</td>
                    <td>&nbsp;</td>
                </tr>
            </table>
            <table id="TableMain" class="table table-bordered table-primary border-left-primary border-bottom-primary   table-dark display responsive nowrap" style="color: Black;">
                <thead>
                    <tr>
                        <th>CID</th>
                        <th>CategoryName</th>
                        <th>Active</th>
                        <th>Action</th>
                    </tr>
                </thead>
                <tbody>
                </tbody>
            </table>
        </div>
    </div>
</asp:Content>
<asp:Content ID="Content10" ContentPlaceHolderID="ContentScript" runat="server">
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
                url: "DownloadCategory.aspx/LoadDownloadCategory",
                data: {},
                beforeSend: function (jqXHR, settings) { blockUI(jqXHR, settings) },
                complete: function (jqXHR, textStatus) { unblockUI(jqXHR, textStatus) },
                success: function (result) {
                    $("#TableMain tbody").prepend(result.d);
                    //var tableinstance = $('#TableMain').DataTable({
                    //});
                },
                failure: function (msg) {
                    alert(msg.d);
                }
            });
        });
        function Active(element) {
            debugger;
            var thistr = $(element).closest("tr");
            //var PictureID = $(thistr).attr('id');
            var DID = element.id;
            var r = confirm("Confirm Yourself before Proceeding");
            if (r == true) {
                $.ajax({
                    type: "POST",
                    url: "DownloadCategory.aspx/MakeInactive",
                    contentType: "application/json; charset=utf-8",
                    datatype: "json",
                    data: JSON.stringify({ CID: DID.substring(1) }),
                    beforeSend: function (jqXHR, settings) { blockUI(jqXHR, settings) },
                    complete: function (jqXHR, textStatus) { unblockUI(jqXHR, textStatus) },
                    success: function (result) {
                        if (result.d.Success = true) {

                            if ($(thistr).find('td:eq(2)').html() == 'False') {
                                $(thistr).find('td:eq(2)').html('True');
                            }
                            else {
                                $(thistr).find('td:eq(2)').html('False');
                            }
                        }
                        else {
                            alert("Error");
                        }

                    },
                })
            } else {
                alert("Revoked");
            }

        }
        function Delete(element) {
            var thistr = $(element).closest("tr");

            //var DeleteSno = $(thistr).attr('id');
            var DeleteSno = element.id;
            var r = confirm("You are going to Delete the File");
            if (r == true) {
                $.ajax({
                    type: "POST",
                    url: "DownloadCategory.aspx/DeletePicture",
                    contentType: "application/json; charset=utf-8",
                    datatype: "json",
                    data: JSON.stringify({ DId: DeleteSno.substring(1) }),
                    beforeSend: function (jqXHR, settings) { blockUI(jqXHR, settings) },
                    complete: function (jqXHR, textStatus) { unblockUI(jqXHR, textStatus) },
                    success: function (response) {
                        thistr.remove();
                        showMessage("Successfully Deleted", "success");
                    },
                })
            } else {
                alert("Revoked");
            }
        }

    </script>
</asp:Content>
