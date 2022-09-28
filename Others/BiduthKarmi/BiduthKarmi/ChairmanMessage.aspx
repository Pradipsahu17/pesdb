<%@ Page Title="" Language="C#" MasterPageFile="~/ViewMaster.Master" AutoEventWireup="true" CodeBehind="ChairmanMessage.aspx.cs" Inherits="BiduthKarmi.ChairmanMessage" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentTitle" runat="server">
    Message From Chairman
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentHead" runat="server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentBody" runat="server">
    <div class="super-container" style="background-color: antiquewhite">
        <div class="container">
             <br />
            <div class="row">
                <div class="span5">
                    <%--<h2 style="padding-top:100px;padding-left:50px">Message From Chairman</h2>--%>
                </div>
                <div class="span5">
                   <img src="Img/BOD/1.jpg" style="height:200px;width:200px;border-radius: 200px;" />
                    <h5 style="color: white;padding-left:40px;color:black">RAM KUMAR THEBE<br />(Chairman Message)</h5>
                </div>
            </div>
            
            <div class="super-container" style="background-color: antiquewhite">
                <div class="container">
                    <asp:PlaceHolder ID="PlaceHolder1" runat="server" />
                </div>
            </div>
        </div>
    </div>
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="ContentScript" runat="server">
</asp:Content>
