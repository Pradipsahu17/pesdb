<%@ Page Title="" Language="C#" MasterPageFile="~/AdminMaster.Master" AutoEventWireup="true" CodeBehind="ServicesSetting.aspx.cs" Inherits="BiduthKarmi.ServicesSetting" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentTitle" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="Contenthead" runat="server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentNavTitle" runat="server">
    Services Settings
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="ContentPlaceBody" runat="server">
   <div id="panel" style="height: 500px; background-color: White; padding: 10px; overflow: auto">  
     <h1>  
        <a href="../adminIndex.aspx">Back </a>| Service Master  
    </h1>  
    <asp:updatepanel id="UpdatePanelService" runat="server" updatemode="Conditional">  
            <ContentTemplate>  
                <asp:GridView ID="gridService" runat="server" CssClass="EU_DataTable" AutoGenerateColumns="false" ShowFooter="true" OnRowEditing="gridService_RowEditing"            onrowcreated="gridService_RowCreated"onrowupdating="gridService_RowUpdating">  
                    <Columns>  
                        <asp:TemplateField ItemStyle-Width="30px" HeaderText="SR.NO">  
                            <ItemTemplate>  
                                <asp:Label ID="lblID" runat="server"  
                                  Text='<%#Eval("service_id")%>'></asp:Label>  
                            </ItemTemplate>  
                        </asp:TemplateField>  
                        <asp:TemplateField ItemStyle-Width="600px" HeaderText="Service">  
                            <ItemTemplate>  
                                <asp:Label ID="lblService" runat="server" Text='<%#Eval("service_name")%>'></asp:Label>  
                            </ItemTemplate>  
                            <EditItemTemplate>  
                                <asp:TextBox ID="txtService" runat="server" Text='<%#Eval("service_name")%>'></asp:TextBox>  
                            </EditItemTemplate>  
                            <FooterTemplate>  
                                <asp:TextBox ID="txtService" runat="server"></asp:TextBox>  
                            </FooterTemplate>  
                        </asp:TemplateField>  
                        <asp:TemplateField ItemStyle-Width="100px" HeaderText="Service Photo">  
                    </Columns>  
                </asp:GridView>  
                <asp:UpdateProgress ID="UpdateProgress1" runat="server"  
                     AssociatedUpdatePanelID="UpdatePanelService">  
                    <ProgressTemplate>  
                        Please wait image is getting uploaded....  
                    </ProgressTemplate>  
                </asp:UpdateProgress>  
            </ContentTemplate>  
            <Triggers>  
            </Triggers>  
       </asp:updatepanel>  
</div>  
</asp:Content>
<asp:Content ID="Content5" ContentPlaceHolderID="ContentScript" runat="server">
</asp:Content>
