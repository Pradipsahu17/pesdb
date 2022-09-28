<%@ Page Title="" Language="C#" MasterPageFile="~/ViewMaster.Master" AutoEventWireup="true" CodeBehind="AboutUs.aspx.cs" Inherits="BiduthKarmi.AboutUs" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentTitle" runat="server">
    About   Us
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentHead" runat="server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentBody" runat="server">

    <div class="super-container" style="background-color: antiquewhite">
        <div class="container">
            <h2>About Us</h2>
            <asp:PlaceHolder ID="PlaceHolder1" runat="server" />
        </div>
    </div>
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="ContentScript" runat="server">
</asp:Content>
