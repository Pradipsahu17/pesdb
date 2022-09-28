<%@ Page Title="" Language="C#" MasterPageFile="~/ViewMaster.Master" AutoEventWireup="true" CodeBehind="DepositScheme.aspx.cs" Inherits="BiduthKarmi.DepositScheme" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentTitle" runat="server">
    Deposit Scheme
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentHead" runat="server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentBody" runat="server">
    <div class="super-container" style="background-color: white">
        <div class="container">
            <asp:PlaceHolder runat="server" ID="FixDepositPlaceHolder" />
        </div>
          <div class="container">
            <asp:PlaceHolder runat="server" ID="EducationSavingPlaceHolder" />
        </div>
           <div class="container">
            <asp:PlaceHolder runat="server" ID="NormalSavingPlaceHolder" />
        </div>
           <div class="container">
            <asp:PlaceHolder runat="server" ID="GeneralSavingPlaceHolder" />
        </div>
           <div class="container">
            <asp:PlaceHolder runat="server" ID="GoldSavingPlaceHolder" />
        </div>
           <div class="container">
            <asp:PlaceHolder runat="server" ID="SilverSavingPlaceHolder" />
        </div>
    </div>
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="ContentScript" runat="server">
</asp:Content>
