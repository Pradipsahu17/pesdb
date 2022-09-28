<%@ Page Title="" Language="C#" MasterPageFile="~/AdminMaster.Master" AutoEventWireup="true" CodeBehind="MaintainGallary.aspx.cs" Inherits="BiduthKarmi.MaintainGallary" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentTitle" runat="server">
    Maintain    Gallary
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="Contenthead" runat="server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentNavTitle" runat="server">
    Maintain    Gallary
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="ContentPlaceBody" runat="server">
    <div class="row"  >
        <div class="col-lg-10 offset-1">
            <table class="auto-style1">
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
                    <td>
                        <asp:TextBox ID="txtDescription" Height="50px" CssClass="border-bottom-primary" Width="620px" Style="background-color: #3c3737; color: white" placeholder="Description" runat="server"></asp:TextBox>
                    </td>
                    <td colspan="2">
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator1" CssClass="text-danger" runat="server" Display="Dynamic" ControlToValidate="txtDescription" ErrorMessage="<ul><li>Please Give Description </li></ul>" ValidationGroup="Valid">
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
        </div>
    </div>
    <div class="container"  >
        <div class="row">
            <ul class="form-inline" id="GallaryDetails">
                <%--<li class="span3  card">
                    <div class="work">
                        <a href="Img/Gallary/IMG1.jpg" rel="prettyPhoto">
                            <img src="Img/Gallary/IMG1.jpg" alt="" style="height: 200px; width: 250px; border-radius: 10px" />
                        </a>
                        <h4>THisisme</h4>
                        <p></p>
                    </div>
                    <div class="btn-group form-inline">
                        <span class="btn btn-primary btn-xs"><i class='fa fa-eye fa-xs'></i></span>
                        &nbsp;&nbsp;&nbsp;
                        <span   id="a1" class="btn btn-danger  btn-xs"><i class='fa fa-trash fa-xs'></i></span>
                    </div>
                </li>--%>
            </ul>
        </div>
    </div>
</asp:Content>
<asp:Content ID="Content5" ContentPlaceHolderID="ContentScript" runat="server">
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
                url: "MaintainGallary.aspx/LoadGalleryDetails",
                data: {},
                beforeSend: function (jqXHR, settings) { blockUI(jqXHR, settings) },
                complete: function (jqXHR, textStatus) { unblockUI(jqXHR, textStatus) },
                success: function (result) {
                    $("#GallaryDetails").append(result.d);
                    
                },
                failure: function (msg) {
                    alert(msg.d);
                }
            });
        });
        function Active(element) {
            debugger;
            var GID = element;
            var r = confirm("Confirm Yourself before Proceeding");
            if (r == true) {
                $.ajax({
                    type: "POST",
                    url: "MaintainGallary.aspx/MakeInactive",
                    contentType: "application/json; charset=utf-8",
                    datatype: "json",
                    data: JSON.stringify({ GId: GID }),
                    beforeSend: function (jqXHR, settings) { blockUI(jqXHR, settings) },
                    complete: function (jqXHR, textStatus) { unblockUI(jqXHR, textStatus) },
                    success: function (result) {
                        if (result.d.Success = true) {

                            //if ($(thistr).find('td:eq(3)').html() == 'False') {
                            //    $(thistr).find('td:eq(3)').html('True');
                            //}
                            //else {
                            //    $(thistr).find('td:eq(3)').html('False');
                            //}
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
            var DeleteSno = element;
            var r = confirm("You are going to Delete the File");
            if (r == true) {
                $.ajax({
                    type: "POST",
                    url: "MaintainGallary.aspx/DeletePicture",
                    contentType: "application/json; charset=utf-8",
                    datatype: "json",
                    data: JSON.stringify({ GId: DeleteSno }),
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
