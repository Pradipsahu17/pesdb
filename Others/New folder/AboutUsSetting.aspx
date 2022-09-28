<%@ Page Title="" Language="C#" MasterPageFile="~/AdminMaster.Master" AutoEventWireup="true" CodeBehind="AboutUsSetting.aspx.cs" Inherits="BiduthKarmi.AboutUsSetting" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentTitle" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="Contenthead" runat="server">
    <style>
        .center {
            text-align: center
        }
    </style>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentNavTitle" runat="server">
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="ContentPlaceBody" runat="server">
    <div class="container-fluid">
        <div class="row">
            <div class="offset-2 col-sm-8 offset-2">
                <asp:HiddenField ID="IsEditHiddenField" runat="server" />
                <asp:HiddenField ID="SelectedIdHiddenField" runat="server" />
                <div class="form-group">
                    <asp:TextBox runat="server" ID="INameTxtB" CssClass="form-control" PlaceHolder="Institution Name"></asp:TextBox>
                </div>
                <div class="form-group">
                    <asp:TextBox runat="server" ID="IEstablishmentTxtB" CssClass="form-control" PlaceHolder="Institution Establishment"></asp:TextBox>
                </div>
                <div class="form-group">
                    <asp:TextBox runat="server" ID="IWorkPlaceTxtB" CssClass="form-control" PlaceHolder="Institution Work Place "></asp:TextBox>
                </div>
                <div class="form-group">
                    <asp:TextBox runat="server" ID="IAddressTxtB" CssClass="form-control" PlaceHolder="Institution Address"></asp:TextBox>
                </div>
                <div class="form-group">
                    <asp:TextBox runat="server" ID="IMNAShareCapitalTxtB" CssClass="form-control" PlaceHolder="Member Count And Share Capital"></asp:TextBox>
                </div>
                <div class="form-group">
                    <asp:TextBox runat="server" ID="IPurposeTxtB" CssClass="form-control" TextMode="MultiLine" Rows="10" Columns="10" PlaceHolder="Institution Purpose"></asp:TextBox>
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
            <h2 style="text-align: center;">About Us Lists</h2>
            <div class="row">
                <div class="col-sm-12 ">
                    <table id="TableMain" class="table table-bordered table-primary  display responsive nowrap" style="color: Black;">
                        <thead>
                            <tr>
                                <th style="text-align: center; width: 5%;">ID</th>
                                <th style="text-align: center; width: 13%">Institution Name</th>
                                <th style="text-align: center; width: 8%">Institution Establishment</th>
                                <th style="text-align: center; width: 10%">Institution WorkPlace</th>
                                <th style="text-align: center; width: 8%">Address</th>
                                <th style="text-align: center; width: 10%">Member Count</th>
                                <th style="text-align: center; width: 20%">Institution Purpose</th>
                                <th style="text-align: center; width: 8%">IsActive</th>
                                <th style="text-align: center; width: 18%">Action</th>
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
                url: "AboutUsSetting.aspx/LoodAboutUsDetails",
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
            var r = confirm("You are going to Delete the About Us");
            if (r == true) {
                $.ajax({
                    type: "POST",
                    url: "AboutUsSetting.aspx/DeleteAboutUs",
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
            var r = confirm("You are going to Edit the AboutUs ");
            if (r == true) {
                $.ajax({
                    type: "POST",
                    url: "AboutUsSetting.aspx/EditAboutUs",
                    contentType: "application/json; charset=utf-8",
                    datatype: "json",
                    data: JSON.stringify({ CID: CId.substring(1) }),
                    beforeSend: function (jqXHR, settings) { blockUI(jqXHR, settings) },
                    complete: function (jqXHR, textStatus) { unblockUI(jqXHR, textStatus) },
                    success: function (response) {
                        if (response.d.Success == true) {
                            debugger;
                            let institutionName = response.d.Datas[0];
                            let institutionEstablishment = response.d.Datas[1];
                            let institutionWorkPlace = response.d.Datas[2];
                            let address = response.d.Datas[3];
                            let memberNumberAndShareCapital = response.d.Datas[4];
                            let organizationPurpose = response.d.Datas[5];
                            $("#<%=IsEditHiddenField.ClientID%>").val(true);
                            $("#<%=SelectedIdHiddenField.ClientID%>").val(CId.substring(1));
                            $("#<%=INameTxtB.ClientID%>").val(institutionName);
                            $("#<%=IEstablishmentTxtB.ClientID%>").val(institutionEstablishment);
                            $("#<%=IWorkPlaceTxtB.ClientID%>").val(institutionWorkPlace);
                            $("#<%=IAddressTxtB.ClientID%>").val(address);
                            $("#<%=IMNAShareCapitalTxtB.ClientID%>").val(memberNumberAndShareCapital);
                            $("#<%=IPurposeTxtB.ClientID%>").val(organizationPurpose);

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
                    url: "AboutUsSetting.aspx/MakeInactive",
                    contentType: "application/json; charset=utf-8",
                    datatype: "json",
                    data: JSON.stringify({ CID: CId.substring(1) }),
                    beforeSend: function (jqXHR, settings) { blockUI(jqXHR, settings) },
                    complete: function (jqXHR, textStatus) { unblockUI(jqXHR, textStatus) },
                    success: function (result) {
                        if (result.d.Success = true) {
                            if ($(thistr).find('td:eq(7)').html() == 'False') {
                                $(thistr).find('td:eq(7)').html('True');
                            }
                            else {
                                $(thistr).find('td:eq(7)').html('False');
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
