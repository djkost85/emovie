<%@ Page Title="Registro" Language="C#" MasterPageFile="~/Site.master" AutoEventWireup="true"
    CodeBehind="Register.aspx.cs" Inherits="eMovieProject.Account.Register" %>

<asp:Content ID="HeaderContent" runat="server" ContentPlaceHolderID="HeaderPlaceHolder">
</asp:Content>
<asp:Content ID="Content1" runat="server" ContentPlaceHolderID="NotifyPlaceHolder">
    Registro de Usuario  |  Crear una Cuenta
</asp:Content>


<asp:Content ID="BodyContent" runat="server" ContentPlaceHolderID="MoviePlaceHolder">
    <asp:CreateUserWizard ID="RegisterUser" runat="server" EnableViewState="false">
        <LayoutTemplate>
            <asp:PlaceHolder ID="wizardStepPlaceholder" runat="server"></asp:PlaceHolder>
            <asp:PlaceHolder ID="navigationPlaceholder" runat="server"></asp:PlaceHolder>
        </LayoutTemplate>
        <WizardSteps>
            <asp:CreateUserWizardStep ID="RegisterUserWizardStep" runat="server">
                <ContentTemplate>
                    <p>
                        Use el formulario siguiente para crear una cuenta nueva.
                    </p>
                    <p>
                        Las contraseñas deben tener una longitud mínima de <%= Membership.MinRequiredPasswordLength %> caracteres.
                    </p>
                    <span class="failureNotification">
                        <asp:Literal ID="ErrorMessage" runat="server"></asp:Literal>
                    </span>
                    <asp:ValidationSummary ID="RegisterUserValidationSummary" runat="server" CssClass="failureNotification" 
                         ValidationGroup="RegisterUserValidationGroup"/>
                    <div class="accountInfo">
                        <fieldset class="register">
                            <legend>Información de cuenta</legend>
                            <p>
                                <asp:Label ID="nombreCompletoLabel" runat="server" AssociatedControlID="nombreCompleto">Nombre Completo:</asp:Label>
                                <asp:TextBox ID="nombreCompleto" runat="server"></asp:TextBox>
                                <asp:RequiredFieldValidator ID="NombreRequired" runat="server" ControlToValidate="nombreCompleto" 
                                     ErrorMessage="El nombre completo es obligatorio." ToolTip="El nombre completo es obligatorio." 
                                     ValidationGroup="RegisterUserValidationGroup">*</asp:RequiredFieldValidator>
                            </p>
                            <p>
                                <asp:Label ID="apellidoCompletoLabel" runat="server" AssociatedControlID="UserName">Apellido Completo:</asp:Label>
                                <asp:TextBox ID="apellidoCompleto" runat="server" CssClass="textEntry"></asp:TextBox>
                                <asp:RequiredFieldValidator ID="ApellidoRequired" runat="server" ControlToValidate="UserName" 
                                      ErrorMessage="El apellido completo es obligatorio." ToolTip="El apellido completo es obligatorio." 
                                     ValidationGroup="RegisterUserValidationGroup">*</asp:RequiredFieldValidator>
                            </p>
                            <p>
                                <asp:Label ID="UserNameLabel" runat="server" AssociatedControlID="UserName">Nombre de usuario:</asp:Label>
                                <asp:TextBox ID="UserName" runat="server" CssClass="textEntry"></asp:TextBox>
                                <asp:RequiredFieldValidator ID="UserNameRequired" runat="server" ControlToValidate="UserName" 
                                     CssClass="failureNotification" ErrorMessage="El nombre de usuario es obligatorio." ToolTip="El nombre de usuario es obligatorio." 
                                     ValidationGroup="RegisterUserValidationGroup">*</asp:RequiredFieldValidator>
                            </p>
                            <p>
                                <asp:Label ID="EmailLabel" runat="server" AssociatedControlID="Email">Correo electrónico:</asp:Label>
                                <asp:TextBox ID="Email" runat="server" CssClass="textEntry"></asp:TextBox>
                                <asp:RequiredFieldValidator ID="EmailRequired" runat="server" ControlToValidate="Email" 
                                     CssClass="failureNotification" ErrorMessage="El correo electrónico es obligatorio." ToolTip="El correo electrónico es obligatorio." 
                                     ValidationGroup="RegisterUserValidationGroup">*</asp:RequiredFieldValidator>
                            </p>
                            <p>
                                <asp:Label ID="PasswordLabel" runat="server" AssociatedControlID="Password">Contraseña:</asp:Label>
                                <asp:TextBox ID="Password" runat="server" CssClass="passwordEntry" TextMode="Password"></asp:TextBox>
                                <asp:RequiredFieldValidator ID="PasswordRequired" runat="server" ControlToValidate="Password" 
                                     CssClass="failureNotification" ErrorMessage="La contraseña es obligatoria." ToolTip="La contraseña es obligatoria." 
                                     ValidationGroup="RegisterUserValidationGroup">*</asp:RequiredFieldValidator>
                            </p>
                            <p>
                                <asp:Label ID="ConfirmPasswordLabel" runat="server" AssociatedControlID="ConfirmPassword">Confirmar contraseña:</asp:Label>
                                <asp:TextBox ID="ConfirmPassword" runat="server" CssClass="passwordEntry" TextMode="Password"></asp:TextBox>
                                <asp:RequiredFieldValidator ControlToValidate="ConfirmPassword" CssClass="failureNotification" Display="Dynamic" 
                                     ErrorMessage="Confirmar contraseña es obligatorio." ID="ConfirmPasswordRequired" runat="server" 
                                     ToolTip="Confirmar contraseña es obligatorio." ValidationGroup="RegisterUserValidationGroup">*</asp:RequiredFieldValidator>
                                <asp:CompareValidator ID="PasswordCompare" runat="server" ControlToCompare="Password" ControlToValidate="ConfirmPassword" 
                                     CssClass="failureNotification" Display="Dynamic" ErrorMessage="Contraseña y Confirmar contraseña deben coincidir."
                                     ValidationGroup="RegisterUserValidationGroup">*</asp:CompareValidator>
                            </p>
                            <p>
                                <asp:Label ID="numeroTarjetLabel" runat="server" AssociatedControlID="numeroTarjeta">Ingrese su Número de Tarjeta de Crédito</asp:Label>
                                <asp:TextBox ID="numeroTarjeta" runat="server" CssClass="textEntry"></asp:TextBox>
                                <asp:RequiredFieldValidator ID="numeroTarjetaRequired" runat="server" ControlToValidate="numeroTarjeta" 
                                     CssClass="failureNotification" ErrorMessage="El número de tarjeta de crédito es requerido." ToolTip="El número de tarjeta de crédito es requerido." 
                                     ValidationGroup="RegisterUserValidationGroup">*</asp:RequiredFieldValidator>
                            </p>
                            <p>
                                <asp:Label ID="pinTarjetaLabel" runat="server" AssociatedControlID="Email">Ingrese el PIN de su Tarjeta de Crédito:</asp:Label>
                                <asp:TextBox ID="pinTarjeta" runat="server"></asp:TextBox>
                                <asp:RequiredFieldValidator ID="pinTarjetaRequired" runat="server" ControlToValidate="pinTarjeta" 
                                     CssClass="failureNotification" ErrorMessage="El PIN de su tarjeta de crédito es requerido." ToolTip="El PIN de su tarjeta de crédito es requerido." 
                                     ValidationGroup="RegisterUserValidationGroup">*</asp:RequiredFieldValidator>
                            </p>
                            <p>
                                <asp:FileUpload ID="uploadImage" ClientIDMode=Static runat="server"/>
                            </p>
                        </fieldset>
                        <p>
                            <asp:Button  OnClick="OnClickRegisterUser" ID="CreateUserButton" runat="server" Text="Crear usuario" 
                                 ValidationGroup="RegisterUserValidationGroup"/>
                        </p>
                    </div>
                </ContentTemplate>
                <CustomNavigationTemplate>
                </CustomNavigationTemplate>
            </asp:CreateUserWizardStep>
        </WizardSteps>
    </asp:CreateUserWizard>
</asp:Content>
