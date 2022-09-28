<%@ Page Title="" Language="C#" MasterPageFile="~/ViewMaster.Master" AutoEventWireup="true" CodeBehind="PersonalLoan.aspx.cs" Inherits="BiduthKarmi.PersonalLoan" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentTitle" runat="server">
    Personal Loan
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
