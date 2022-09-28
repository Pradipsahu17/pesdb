<%@ Page Title="" Language="C#" MasterPageFile="~/ViewMaster.Master" AutoEventWireup="true" CodeBehind="SilverSaving.aspx.cs" Inherits="BiduthKarmi.SilverSaving" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentTitle" runat="server">
    Silver  Saving
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentHead" runat="server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentBody" runat="server">
     <div class="super-container" style="background-color: white">
        <div class="container">
            <asp:PlaceHolder ID="PlaceHolder1" runat="server" />
        </div>
    </div>
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="ContentScript" runat="server">
</asp:Content>
