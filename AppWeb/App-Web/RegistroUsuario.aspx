<%@ Page Title="" Language="C#" MasterPageFile="~/Master.Master" AutoEventWireup="true" CodeBehind="RegistroUsuario.aspx.cs" Inherits="App_Web.RegistroUsuario" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">

    <style>
        .validacion {
            color: red;
            font-size: 10px;
        }
    </style>

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <div class="container mt-5">

        <div class="row justify-content-center">

            <div class="col-md-8 col-lg-6">

                <div class="card shadow">

                    <div class="card-body p-4">

                        <asp:Label ID="lblMensaje" runat="server" CssClass="alert alert-danger d-none" role="alert"></asp:Label>

                        <h2 class="text-center mb-4">Crear cuenta</h2>

                        <div class="mb-3">
                            <label class="form-label">Nombre</label>
                            <asp:TextBox ID="txtNombre" runat="server" CssClass="form-control" />
                            <asp:RequiredFieldValidator CssClass="validacion" ErrorMessage="El nombre es requerido" ControlToValidate="txtNombre" runat="server" />
                            <asp:RegularExpressionValidator CssClass="validacion" runat="server" ControlToValidate="txtNombre" ErrorMessage="Solo puede ingresar letras" ValidationExpression="^[a-zA-ZáéíóúÁÉÍÓÚñÑ\s]+$" />
                        </div>

                        <div class="mb-3">
                            <label class="form-label">Apellido</label>
                            <asp:TextBox ID="txtApellido" runat="server" CssClass="form-control" />
                            <asp:RequiredFieldValidator CssClass="validacion" ErrorMessage="El apellido es requerido" ControlToValidate="txtApellido" runat="server" />
                            <asp:RegularExpressionValidator CssClass="validacion" runat="server" ControlToValidate="txtApellido" ErrorMessage="Solo puede ingresar letras" ValidationExpression="^[a-zA-ZáéíóúÁÉÍÓÚñÑ\s]+$" />
                        </div>

                        <div class="mb-3">
                            <label class="form-label">DNI</label>
                            <asp:TextBox ID="txtDNI" runat="server" CssClass="form-control" TextMode="SingleLine" />
                            <asp:RequiredFieldValidator CssClass="validacion" ErrorMessage="El DNI es requerido" ControlToValidate="txtDni" runat="server" />
                            <asp:RegularExpressionValidator CssClass="validacion" ErrorMessage="Solo puede ingresar números" ControlToValidate="txtDni" ValidationExpression="^[0-9]+$" runat="server" />
                        </div>

                        <div class="mb-3">
                            <label class="form-label">Email</label>
                            <asp:TextBox ID="txtEmail" runat="server" CssClass="form-control" TextMode="Email" />
                            <asp:RequiredFieldValidator CssClass="validacion" ErrorMessage="El email es requerido" ControlToValidate="txtEmail" runat="server" />
                            <asp:RegularExpressionValidator CssClass="validacion" ErrorMessage="Ingrese un email válido por favor" ControlToValidate="txtEmail" ValidationExpression="^([\w-\.]+)@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.)|(([\w-]+\.)+))([a-zA-Z]{2,4}|[0-9]{1,3})(\]?)$" runat="server" />
                        </div>

                        <div class="mb-3">
                            <label class="form-label">Contraseña</label>
                            <asp:TextBox ID="txtPassword" runat="server" CssClass="form-control" TextMode="Password" />
                            <asp:RequiredFieldValidator CssClass="validacion" ErrorMessage="La contraseña es requerida" ControlToValidate="txtPassword" runat="server" />
                        </div>

                        <div class="mb-3">
                            <label class="form-label">Teléfono</label>
                            <asp:TextBox ID="txtTelefono" runat="server" CssClass="form-control" TextMode="Phone" />
                            <asp:RegularExpressionValidator CssClass="validacion" ErrorMessage="Solo puede ingresar números" ControlToValidate="txtDni" ValidationExpression="^[0-9]+$" runat="server" />
                        </div>

                        <div class="mb-4">
                            <label class="form-label">Suscripción inicial</label>
                            <asp:DropDownList ID="ddlSuscripcion" runat="server" CssClass="form-select">
                            </asp:DropDownList>
                            <asp:RequiredFieldValidator runat="server" ControlToValidate="ddlSuscripcion" InitialValue="0" ErrorMessage="Debe seleccionar una suscripción" CssClass="text-danger" Display="Dynamic" />
                        </div>

                    <div class="d-flex gap-2">

                        <asp:Button ID="btnRegistrarse" runat="server" Text="Registrarse" CssClass="btn btn-primary w-100" OnClick="btnRegistrarse_Click" />
                        <a href="Home.aspx" class="btn btn-outline-secondary w-100">Cancelar</a>

                    </div>

                </div>

            </div>

        </div>

    </div>

    </div>


</asp:Content>
