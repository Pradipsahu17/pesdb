<%@ Page Title="" Language="C#" MasterPageFile="~/AdminMaster.Master" AutoEventWireup="true" CodeBehind="PasswordReset.aspx.cs" Inherits="BiduthKarmi.PasswordReset" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentTitle" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="Contenthead" runat="server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentNavTitle" runat="server">
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="ContentPlaceBody" runat="server">
    <div class="container">
        <div class="card o-hidden border-0 shadow-lg my-5">
            <div class="card-body p-0">
                <!-- Nested Row within Card Body -->
                <div class="row">
                    <div class="col-lg-7">
                        <div class="p-5">

                            <div class="form-group row">
                                <div class="col-sm-6 mb-3 mb-sm-0">
                                    <input type="password" runat="server" class="form-control form-control-user"
                                        id="InputPassword" placeholder="Password" />
                                </div>
                                <div class="col-sm-6">
                                    <input type="password" runat="server"   class="form-control form-control-user"
                                        id="RepeatPassword" placeholder="Repeat Password" />
                                </div>
                            </div>
                            <div class="form-group row">
                                <asp:Button Text="Reset"  CssClass="btn btn-primary" ID="btnReset" OnClick="btnReset_Click" runat="server" />
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
</asp:Content>
<asp:Content ID="Content5" ContentPlaceHolderID="ContentScript" runat="server">
    <script>
        //$("#RepeatPassword").on("blur", function () {
        //    debugger;
        //    var pass = $("#RepeatPassword").val();
        //    var pass2 = $("#InputPassword").val();
        //    if (pass == pass2) {
        //        $("#btnReset").removeAttr('disabled');
        //    }
        //    else {

        //    }

        //})

    </script>
</asp:Content>
