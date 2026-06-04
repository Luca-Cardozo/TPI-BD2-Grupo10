<%@ Page Title="" Language="C#" MasterPageFile="~/Master.Master" AutoEventWireup="true" CodeBehind="CambiarSuscripcion.aspx.cs" Inherits="App_Web.CambiarSuscripcion" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <div class="container mt-5">

        <div class="row justify-content-center">

            <div class="col-md-7 col-lg-6">

                <div class="card shadow">

                    <div class="card-body p-4">

                        <h2 class="text-center mb-4">Mi Suscripción</h2>

                        <div class="alert alert-primary">

                            <h5>Suscripción actual</h5>

                            <asp:Label ID="lblSuscripcionActual" runat="server" CssClass="fw-bold fs-5" />

                            <br />

                            <asp:Label ID="lblPrecioActual" runat="server" CssClass="text-muted" />

                        </div>


                        <div class="mb-3">

                            <label class="form-label">Seleccionar nueva suscripción</label>

                            <asp:DropDownList ID="ddlSuscripcion" runat="server" CssClass="form-select" AutoPostBack="true" OnSelectedIndexChanged="ddlSuscripcion_SelectedIndexChanged">
                            </asp:DropDownList>

                        </div>


                        <div class="mb-4">

                            <strong>Precio mensual:</strong>

                            <asp:Label ID="lblPrecioNueva" runat="server" Text="Seleccione una suscripción" />

                        </div>

                        <div class="d-flex gap-2">

                            <asp:Button ID="btnCambiar" runat="server" Text="Cambiar suscripción" CssClass="btn btn-success w-100" OnClick="btnCambiar_Click" />

                            <a href="Home.aspx" class="btn btn-outline-secondary w-100">Cancelar</a>

                        </div>

                        <div class="d-flex gap-2">
                            <asp:Label ID="lblMensaje" runat="server" CssClass="d-block mt-3 text-center fw-bold" />
                        </div>

                    </div>

                </div>

            </div>

        </div>

    </div>


</asp:Content>
