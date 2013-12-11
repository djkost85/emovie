<%@ Page Title="Tienda" Language="C#" MasterPageFile="~/Site.master" AutoEventWireup="true"
    CodeBehind="Default.aspx.cs" Inherits="eMovieProject._Default" %>

<asp:Content ID="HeaderContent" runat="server" ContentPlaceHolderID="HeaderPlaceHolder">
    <title>eMovie Project</title>
</asp:Content>

<asp:Content ID="NotifyContent" runat=server ContentPlaceHolderID="NotifyPlaceHolder">
    Catálogo de Películas
</asp:Content>

<asp:Content ID="MovieContent" runat="server" ContentPlaceHolderID="MoviePlaceHolder">
    
    <asp:UpdatePanel ID="UpdateMovieContainer" runat="server" 
        ChildrenAsTriggers="True" UpdateMode="Conditional" ViewStateMode="Inherit">
        <ContentTemplate>
            <asp:ListView  ClientIDMode=Static ID="MovieGrid" runat="server" DataSourceID="MovieEntityDataSource" DataKeyNames="idPelicula">
                <LayoutTemplate>
                    <ul runat="server" id="movieDataList">
                      <li runat="server" id="itemPlaceholder"></li>
                    </ul>
                    <asp:DataPager runat="server" ID="DataPager" PageSize="18">
                        <Fields>
                          <asp:NumericPagerField ButtonCount="10"
                               PreviousPageText="Back"
                               NextPageText="Next" />
                        </Fields>
                    </asp:DataPager>
                </LayoutTemplate>
                <EmptyDataTemplate>
                    <span>
                        No se encontraron registros que coincidan con la búsqueda.
                    </span>
                </EmptyDataTemplate>
                <ItemTemplate>
                    <li>
                        <a href="#" title="<%# Eval("pelicula1") %>" id="<%# Eval("idPelicula") %>" >
                            <img src="<%# Eval("fotografia") %>" width="120px" height="150px" alt="<%# Eval("pelicula1") %>" />
                        </a>
                    </li>
                </ItemTemplate>
            </asp:ListView>
        </ContentTemplate>
    </asp:UpdatePanel>

    <asp:EntityDataSource ID="MovieEntityDataSource" runat="server" 
        ConnectionString="name=eMovieProjectDBEntities" 
        DefaultContainerName="eMovieProjectDBEntities" EnableDelete="True" 
        EnableFlattening="False" EnableInsert="True" EnableUpdate="True" 
        EntitySetName="Pelicula">
    </asp:EntityDataSource>
</asp:Content>

<asp:Content runat=server ID="FilterContent" ContentPlaceHolderID="FilterPlaceHolder">
    <div class="select-container">
        <asp:DropDownList  OnSelectedIndexChanged="onSelectCategoryChanged" CssClass="filterchosen" ClientIDMode=Static ID="selectCategory"
        runat="server" DataSourceID="CategoriasDataSource" AutoPostBack="true" 
        DataValueField="idCategoria" DataTextField="categoria1">
        </asp:DropDownList>
    </div>
    <div class="select-container">
        <asp:DropDownList CssClass="filterchosen" ID="selectOrderBy" runat="server" AutoPostBack=true  OnSelectedIndexChanged="OnSelectedOrderByChanged">
            <asp:ListItem Text="Ordenar Por" />
            <asp:ListItem Text="Nombre Pelicula" />
            <asp:ListItem Text="Año" />
            <asp:ListItem Text="Productora" />
        </asp:DropDownList>
    </div>
    <div class="select-container">
        <asp:TextBox ClientIDMode=Static ID="buscador" runat=server Text="Buscador de Películas"></asp:TextBox>
    </div>
    <div class="select-container">
        <asp:Button ClientIDMode=Static OnClick="OnClickDisplayModeGrid" ID="display_mode_grid" title="Grid View" CssClass=button runat="server" />
        <asp:Button ClientIDMode=Static OnClick="OnClickDisplayModeList" ID="display_mode_list" title="List View" CssClass=button runat="server" />
    </div>

    <asp:EntityDataSource ID="CategoriasDataSource" runat="server" 
        ConnectionString="name=eMovieProjectDBEntities" 
        DefaultContainerName="eMovieProjectDBEntities" EnableDelete="True" 
        EnableFlattening="False" EnableInsert="True" EnableUpdate="True" 
        EntitySetName="Categoria">
    </asp:EntityDataSource>
</asp:Content>

<asp:Content runat=server ID="MovieDescriptorContainer"  ContentPlaceHolderID="MovieDescriptorPlaceHolder">
        <div id="movie-descriptor-picture">
            <img src="" alt="Alternate Text" />
        </div>
        <div id="movie-descriptor-info">
            <div id="movie-descriptor-data">
                <span id="movie-title">content</span>
                <span>content</span>
                <span>content</span>
                <span>content</span>
                <span>content</span>
            </div>
            <div id="movie-descriptor-shopping">
                <span id="rent-button"></span>
                <span id="buy-button"></span>
                <span id="view-trailer-button"></span>
            </div>
        </div> 
</asp:Content>


