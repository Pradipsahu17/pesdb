<%@ Page Title="" Language="C#" MasterPageFile="~/ViewMaster.Master" AutoEventWireup="true" CodeBehind="ShareScheme.aspx.cs" Inherits="BiduthKarmi.ShareScheme" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentTitle" runat="server">
    Share   Scheme
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentHead" runat="server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentBody" runat="server">
   <div class="super-container" style="background-color: white">
        <div class="container">
        <asp:PlaceHolder ID="SchemaSharePlaceHolder" runat="server"/>
        </div>
    </div>
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="ContentScript" runat="server">
</asp:Content>
