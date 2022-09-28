<%@ Page Title="" Language="C#" MasterPageFile="~/AdminMaster.Master" AutoEventWireup="true" CodeBehind="ChairManMessageSetting.aspx.cs" Inherits="BiduthKarmi.ChairManMessageSetting" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentTitle" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="Contenthead" runat="server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentNavTitle" runat="server">
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="ContentPlaceBody" runat="server">
    <div class="container-fluid">
        <asp:ScriptManager runat="server"></asp:ScriptManager>
        <asp:UpdatePanel runat="server" ID="update">
            <ContentTemplate>
            <div class="row">
                <div class="offset-2 col-sm-8 offset-2">
                    <asp:HiddenField ID="MessageID" runat="server" />
                    <asp:HiddenField ID="IsEdit" runat="server" />
                    <div class="form-group">
                        <asp:TextBox runat="server" ID="MessageTextBox" TextMode="MultiLine" Rows="15" Columns="15" Class="form-control" PlaceHolder="Message"></asp:TextBox>
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
            </ContentTemplate>
        </asp:UpdatePanel>
    </div>
    <div id="List-Of-AssociateBanks" style="margin: 30px; color: black">
        <div class="container-fluid">
            <h2 style="text-align: center;">Chair Man Message</h2>
            <div class="row">
                <div class="col-sm-12 ">
                    <table id="TableMain" class="table table-bordered table-primary table-primary  responsive nowrap" style="color: Black;">
                        <thead>
                            <tr>
                                <th style="text-align: center; width: 5%;">ID</th>
                                <th style="text-align: center; width: 60%;">Message</th>
                                 <th style="text-align: center; width: 15%;">IsActive</th>
                                <th style="text-align: center; width: 20%;">Action</th>
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
                url: "ChairManMessageSetting.aspx/LoodChairManMessageDetails",
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
            //var DeleteSno = $(thistr).attr('id');
            var CId = element.id;
            var r = confirm("You are going to Delete the ChairMan Message");
            if (r == true) {
                $.ajax({
                    type: "POST",
                    url: "ChairManMessageSetting.aspx/DeleteChairManMesssage",
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
        function Edit(element) {
            var thistr = $(element).closest("tr");
            //var DeleteSno = $(thistr).attr('id');
            var CId = element.id;
            var r = confirm("You are going to Edit the ChairMan Message ");
            if (r == true) {
                $.ajax({
                    type: "POST",
                    url: "ChairManMessageSetting.aspx/EditChairManMesssage",
                    contentType: "application/json; charset=utf-8",
                    datatype: "json",
                    data: JSON.stringify({ CID: CId.substring(1) }),
                    beforeSend: function (jqXHR, settings) { blockUI(jqXHR, settings) },
                    complete: function (jqXHR, textStatus) { unblockUI(jqXHR, textStatus) },
                    success: function (response) {
                        if (response.d.Success == true) {
                            debugger;
                            let message = response.d.Message;
                            $("#<%=IsEdit.ClientID%>").val(true);
                            $("#<%=MessageID.ClientID%>").val(CId.substring(1));
                            $("#<%=MessageTextBox.ClientID%>").val(message);
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
                    url: "ChairManMessageSetting.aspx/MakeInactive",
                    contentType: "application/json; charset=utf-8",
                    datatype: "json",
                    data: JSON.stringify({ CID: CId.substring(1) }),
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
            }

        };
    </script>
</asp:Content>
