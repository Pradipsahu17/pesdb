<%@ Page Title="" Language="C#" MasterPageFile="~/AdminMaster.Master" AutoEventWireup="true" CodeBehind="CareerSetting.aspx.cs" Inherits="BiduthKarmi.CareerSetting" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentTitle" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="Contenthead" runat="server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentNavTitle" runat="server">
    Career  Setting
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="ContentPlaceBody" runat="server">
    <div class="row">
        <div class="col-5 offset-2">
            <asp:FileUpload ID="FileUpload1" CssClass="btn btn-primary" runat="server" />
        </div>
    </div>

    <br />
    <div class="row">
        <div class="col-8 offset-2">
            <asp:HiddenField ID="Id" runat="server" />
            <asp:HiddenField ID="IsEdit" runat="server" />
            <asp:TextBox ID="txtBox" Width="715px" Height="50px" runat="server" Placeholder="Career Title"></asp:TextBox>
            <asp:RequiredFieldValidator ID="RequiredFieldValidator2" ControlToValidate="txtBox" ValidationGroup="valid" CssClass="text-danger" ErrorMessage="News Heading Required" Display="Dynamic" runat="server"></asp:RequiredFieldValidator>
        </div>
    </div>


    <br />
    <div class="row">
        <div class="col-lg-8 offset-2">
            <textarea id="tinymce" name="elm1" rows="10" cols="80" style="width: 89%; resize: none" runat="server"></textarea>
            <asp:RequiredFieldValidator ID="RequiredFieldValidator4" ControlToValidate="tinymce" ValidationGroup="valid" CssClass="text-danger" ErrorMessage="News Content Required" Display="Dynamic" runat="server"></asp:RequiredFieldValidator>
        </div>
    </div>
    <br />
    <div class="row">
        <div class="col-4 offset-2">
            <asp:Button ID="btnSave" runat="server" Text="Save" ValidationGroup="valid" OnClick="btnSave_Click" CausesValidation="true" CssClass="btn btn-primary" />
            <asp:Button ID="btnCancel" runat="server" Text="Cancel" CssClass="btn btn-Info" />
        </div>
    </div>
    <br />
    <div class="row">
        <div class="col-10 offset-1">
            <table id="TableMain" class="table table-bordered table-primary table-primary border-left-primary border-bottom-primary display responsive nowrap" style="color: Black;">
                <thead>
                    <tr>
                        <th>ID</th>
                        <th>Title</th>
                        <th>CreatedDate</th>
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
    <%-- <script src="Scripts/tinymce.min.js"></script>--%>
    <script type="text/javascript">
      <%--  $("#<%=txtNewsDate.ClientID%>").datepicker({
            dateFormat: 'dd-mm-yy',
            changeMonth: true,
            changeYear: true,
            showOn: 'button'
        });--%>

        $(document).ready(function () {
            $("#message-show").hide();
        })
    </script>
    <script type="text/javascript">
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
                url: "CareerSetting.aspx/LoadCareerDetails",
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
        function Active(element) {
            var thistr = $(element).closest("tr");
            //var PictureID = $(thistr).attr('id');
            var CId = element.id;
            var r = confirm("Confirm Yourself before Proceeding");
            if (r == true) {
                $.ajax({
                    type: "POST",
                    url: "CareerSetting.aspx/MakeInactive",
                    contentType: "application/json; charset=utf-8",
                    datatype: "json",
                    data: JSON.stringify({ CID: CId.substring(1) }),
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
            }

        };
        function Edit(element) {
            var thistr = $(element).closest("tr");
            debugger;
            //var DeleteSno = $(thistr).attr('id');
            var CId = element.id;
            var r = confirm("You are going to Edit the Career Setting ");
            if (r == true) {
                $.ajax({
                    type: "POST",
                    url: "CareerSetting.aspx/EditCareerSetting",
                    contentType: "application/json; charset=utf-8",
                    datatype: "json",
                    data: JSON.stringify({ CID: CId.substring(1) }),
                    beforeSend: function (jqXHR, settings) { blockUI(jqXHR, settings) },
                    complete: function (jqXHR, textStatus) { unblockUI(jqXHR, textStatus) },
                    success: function (response) {
                        if (response.d.Success == true) {
                            debugger;
                            let title = response.d.Datas[0];
                            let tinymce = response.d.Datas[1];
                            $("#<%=Id.ClientID%>").val(CId.substring(1));
                            $("#<%=txtBox.ClientID%>").val(title);
                            $("#<%=tinymce.ClientID%>").val(tinymce);
                        }
                    },
                })
                    }
                }
        function Delete(element) {
            var thistr = $(element).closest("tr");
            debugger;
            //var DeleteSno = $(thistr).attr('id');
            var CId = element.id;
            var r = confirm("You are going to Delete the News");
            if (r == true) {
                $.ajax({
                    type: "POST",
                    url: "CareerSetting.aspx/DeleteCareer",
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
