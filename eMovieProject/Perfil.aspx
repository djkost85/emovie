<%@ Page Title="Perfil" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Perfil.aspx.cs" Inherits="eMovieProject.Perfil" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeaderPlaceHolder" runat="server">
    
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="NotifyPlaceHolder" runat="server">
    <asp:LoginView runat="server">
        <AnonymousTemplate>
            <span>No Tiene permisos de Acceder a esta Página.</span>
            <% Response.Redirect("Account/Login.aspx"); %>
        </AnonymousTemplate>
        <LoggedInTemplate>
            <asp:LoginName FormatString="Perfil {0}" runat="server" />
        </LoggedInTemplate>
    </asp:LoginView>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="MoviePlaceHolder" runat="server">
    
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="FilterPlaceHolder" runat="server">
</asp:Content>
<asp:Content ID="Content5" ContentPlaceHolderID="ShoppingCartPlaceHolder" runat="server">
</asp:Content>
<asp:Content ID="Content6" ContentPlaceHolderID="MovieDescriptorPlaceHolder" runat="server">
</asp:Content>
