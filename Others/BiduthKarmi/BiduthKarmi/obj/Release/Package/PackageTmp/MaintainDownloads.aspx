<%@ Page Title="" Language="C#" MasterPageFile="~/AdminMaster.Master" AutoEventWireup="true" CodeBehind="MaintainDownloads.aspx.cs" Inherits="BiduthKarmi.MaintainDownloads" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentTitle" runat="server">
    Download  Setting
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="Contenthead" runat="server">
</asp:Content>
<asp:Content ID="Content5" ContentPlaceHolderID="ContentNavTitle" runat="server">
    DOWNLOAD SETTING
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceBody" runat="server">
    <div class="row">
        <div class="col-lg-10 offset-1">
            <table class="auto-style1">

                <tr>
                    <td></td>
                    <td>
                        <asp:Label runat="server" ID="ErrorLabel" Visible="false" CssClass="form-control" Style="background-color: red">Error While Saving. Category Name Aleady Exists.</asp:Label></td>
                </tr>
                <tr>
                    <td></td>
                    <td>
                        <asp:FileUpload ID="FileUpload1" CssClass="btn btn-dark border-bottom-primary" runat="server" />
                    </td>
                    <td colspan="4">
                        <asp:RequiredFieldValidator ID="rfvFileupload" CssClass="text-danger" runat="server" Display="Dynamic" ControlToValidate="FileUpload1" ErrorMessage="<ul><li>Please Select the Picture</li></ul>" ValidationGroup="Valid">
                        </asp:RequiredFieldValidator>
                    </td>
                </tr>
                <br />
                <tr>
                    <td></td>
                    <td>
                        <asp:TextBox ID="txtDisplayName" Height="50px" CssClass="border-bottom-primary" Width="320px" Style="background-color: #3c3737; color: white" placeholder="Display Name" runat="server"></asp:TextBox>
                    </td>
                    <td colspan="2">
                        <asp:RequiredFieldValidator ID="rfvPictureDescription" CssClass="text-danger" runat="server" Display="Dynamic" ControlToValidate="txtDisplayName" ErrorMessage="<ul><li>Please Give Display Name</li></ul>" ValidationGroup="Valid">
                        </asp:RequiredFieldValidator>
                    </td>
                </tr>
                <tr>
                    <td></td>
                    <td></td>
                </tr>
                <tr>
                    <td></td>
                    <td>
                        <span>Choose Download Category before saving</span>
                    </td>
                </tr>
                <tr>
                    <td></td>
                    <td></td>
                </tr>
                <tr>
                    <td></td>
                    <td>
                        <asp:DropDownList CssClass="form-control" ID="DropDownList" runat="server">
                        </asp:DropDownList>
                    </td>
                </tr>
                <tr>
                    <td></td>
                    <td></td>
                </tr>
                <tr>
                    <td>&nbsp;</td>
                    <td>
                        <asp:Button ID="btnSave" CssClass="btn btn-success btn-block border-bottom-primary" OnClick="btnSave_Click" Width="200px" ValidationGroup="Valid" runat="server" Text="Save" />
                        <%--<a href="#" class="btn btn-success btn-icon-split">
                            <span class="icon text-white-50">
                                <i class="fas fa-check"></i>
                            </span>
                            <span class="text">Save</span>
                        </a>--%>
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
                        <th>SNo</th>
                        <th>DisplayName</th>
                        <th>Created On</th>
                        <th>IsActive</th>
                        <th>Action</th>
                    </tr>
                </thead>
                <tbody>
                </tbody>
            </table>
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
                url: "MaintainDownloads.aspx/LoadDownloadDetails",
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
                    url: "MaintainDownloads.aspx/MakeInactive",
                    contentType: "application/json; charset=utf-8",
                    datatype: "json",
                    data: JSON.stringify({ DId: DID.substring(1) }),
                    beforeSend: function (jqXHR, settings) { blockUI(jqXHR, settings) },
                    complete: function (jqXHR, textStatus) { unblockUI(jqXHR, textStatus) },
                    success: function (result) {
                        if (result.d.Success = true) {

                            if ($(thistr).find('td:eq(3)').html() == 'False') {
                                $(thistr).find('td:eq(3)').html('True');
                            }
                            else {
                                $(thistr).find('td:eq(3)').html('False');
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
                    url: "MaintainDownloads.aspx/DeletePicture",
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
