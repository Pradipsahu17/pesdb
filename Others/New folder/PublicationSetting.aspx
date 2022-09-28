<%@ Page Title="" Language="C#" MasterPageFile="~/AdminMaster.Master" AutoEventWireup="true" CodeBehind="PublicationSetting.aspx.cs" Inherits="BiduthKarmi.PublicationSetting" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentTitle" runat="server">
    Report & Publication Setting
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="Contenthead" runat="server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentNavTitle" runat="server">
    Report & Publication Setting
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="ContentPlaceBody" runat="server">
    <div class="row">
        <div class="col-lg-10 offset-1">
            <table class="auto-style1">
                <tr>
                    <td></td>
                    <td>
                        <asp:FileUpload ID="FileUpload1" CssClass="btn btn-dark border-bottom-primary" Text="Choose Picture" runat="server" />
                        <b style="color: black">Please Select Picture/Image to display</b>
                    </td>
                    <td colspan="4">
                        <%-- <asp:RequiredFieldValidator ID="rfvFileupload" CssClass="text-danger" runat="server" Display="Dynamic" ControlToValidate="FileUpload1" ErrorMessage="<ul><li>Please Select the Picture</li></ul>" ValidationGroup="Valid">
                        </asp:RequiredFieldValidator>--%>
                    </td>
                </tr>
                <tr>
                    <td></td>
                    <td>
                        <asp:TextBox ID="txtDisplayName" Height="50px" CssClass="border-bottom-primary" Width="800px" Style="background-color: #3c3737; color: white" placeholder="Publication Name/Title" runat="server"></asp:TextBox>
                    </td>
                    <td colspan="2">
                        <asp:RequiredFieldValidator ID="rfvPictureDescription" CssClass="text-danger" runat="server" Display="Dynamic" ControlToValidate="txtDisplayName" ErrorMessage="<ul><li>Please Give Display Name</li></ul>" ValidationGroup="Valid">
                        </asp:RequiredFieldValidator>
                    </td>
                </tr>
                <tr>
                    <td></td>
                    <td>
                        <asp:TextBox ID="txtSampleContain" Height="50px" CssClass="border-bottom-primary" Width="800px" Style="background-color: #3c3737; color: white" placeholder="Sample Contain" runat="server"></asp:TextBox>
                    </td>
                    <td colspan="2">
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator1" CssClass="text-danger" runat="server" Display="Dynamic" ControlToValidate="txtSampleContain" ErrorMessage="<ul><li>Please Give Sample Cantain</li></ul>" ValidationGroup="Valid">
                        </asp:RequiredFieldValidator>
                    </td>
                </tr>
                <tr>
                    <td></td>
                    <td>
                        <asp:FileUpload ID="FileUpload2" CssClass="btn btn-dark border-bottom-primary" Text="Choose Picture" runat="server" />
                        <b style="color: black">Please Select PDF File If there for read more</b>
                    </td>
                </tr>

                <%--<tr>
                    <td>&nbsp;</td>
                    <td>
                        <asp:Button ID="btnSave" CssClass="btn btn-success btn-block border-bottom-primary" OnClick="btnSave_Click" Width="200px" ValidationGroup="Valid" runat="server" Text="Save" />

                    </td>
                </tr>--%>

                <tr>
                    <td>&nbsp;</td>
                    <td>&nbsp;</td>
                </tr>
            </table>
            <div class="row">
                <div class="col-lg-12">
                    <textarea id="tinymce" name="elm1" rows="10" cols="80" placeholder="Content of the Publication goes here" style="width: 89%; resize: none" runat="server"></textarea>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator4" ControlToValidate="tinymce" ValidationGroup="valid" CssClass="text-danger" ErrorMessage="News Content Required" Display="Dynamic" runat="server"></asp:RequiredFieldValidator>
                </div>
            </div>
            <br />
            <asp:Button ID="btnSave" CssClass="btn btn-success btn-block border-bottom-primary" OnClick="btnSave_Click" Width="200px" ValidationGroup="Valid" runat="server" Text="Save" />
            <br />
            <br />

            <table id="TableMain" class="table table-bordered table-primary border-left-primary border-bottom-primary   table-dark display responsive nowrap" style="color: Black;">
                <thead>
                    <tr>
                        <th>SNo</th>
                        <th>PublicationName</th>
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
<asp:Content ID="Content5" ContentPlaceHolderID="ContentScript" runat="server">
    <script src="https://cloud.tinymce.com/stable/tinymce.min.js"></script>
    <script src="https://cloud.tinymce.com/stable/tinymce.min.js?apiKey=scko9p85qs0crd4918yno38parilkja4isbapgz0shi3u8aw"></script>
    <script>tinymce.init({ selector: 'textarea' });</script>
    <script src="Scripts/jquery-ui.min.js"></script>
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
                url: "PublicationSetting.aspx/LoadPublicationDetails",
                data: {},
                beforeSend: function (jqXHR, settings) { blockUI(jqXHR, settings) },
                complete: function (jqXHR, textStatus) { unblockUI(jqXHR, textStatus) },
                success: function (result) {
                    $("#TableMain tbody").prepend(result.d.Data);
                    var tableinstance = $('#TableMain').DataTable({
                    });
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
                    url: "PublicationSetting.aspx/MakeInactive",
                    contentType: "application/json; charset=utf-8",
                    datatype: "json",
                    data: JSON.stringify({ PID: DID.substring(1) }),
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
            var DeleteSno = element.id;
            debugger;
            var r = confirm("You are going to Delete the File");
            if (r == true) {
                $.ajax({
                    type: "POST",
                    url: "PublicationSetting.aspx/DeletePublication",
                    contentType: "application/json; charset=utf-8",
                    datatype: "json",
                    data: JSON.stringify({ PId: DeleteSno.substring(1) }),
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
    <script type="text/javascript">
        $(document).ready(function () {
            tinyMCE.init({
                selector: "textarea#tinymce",
                mode: "textareas",
                theme: "advanced",
                theme_advanced_toolbar_location: "top",
                theme_advanced_buttons1: "italic,underline,separator,justifyleft,justifycenter,justifyright,separator,formatselect,separator,bullist,numlist,link,unlink",
                theme_advanced_buttons2: "",
                theme_advanced_buttons3: "",
                encoding: "xml",
                plugins: [
                     "advlist autolink link lists charmap print preview hr anchor pagebreak spellchecker",
                     "searchreplace wordcount visualblocks visualchars code fullscreen insertdatetime nonbreaking",
                     "save contextmenu directionality emoticons template paste textcolor"
                ],
                content_css: "../assets/css/bootstrap.css",
                toolbar: "insertfile undo redo | styleselect | bold italic | alignleft aligncenter alignright alignjustify bullist numlist forecolor | outdent indent | l      ink | ",
                style_formats: [
                     { title: 'Bold text', inline: 'b' },
                     { title: 'Red text', inline: 'span', styles: { color: '#ff0000' } },
                     { title: 'Red header', block: 'h1', styles: { color: '#ff0000' } },
                     { title: 'Example 1', inline: 'span', classes: 'example1' },
                     { title: 'Example 2', inline: 'span', classes: 'example2' },
                     { title: 'Table styles' },
                     { title: 'Table row 1', selector: 'tr', classes: 'tablerow1' }
                ]
            });
        });

    </script>
</asp:Content>
