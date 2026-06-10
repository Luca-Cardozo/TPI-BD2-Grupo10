<%@ Page Title="" Language="C#" MasterPageFile="~/Master.Master" AutoEventWireup="true" CodeBehind="HistorialSuscripciones.aspx.cs" Inherits="App_Web.HistorialSuscripciones" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="container mt-4">
        <div class="row">
            <div class="col">
                <h2 class="mb-3 text-dark">👑 Historial de Suscripciones</h2>
                <hr class="border-secondary" />


                <asp:Label ID="lblMensaje" runat="server" CssClass="alert alert-danger d-none" role="alert"></asp:Label>


                <div class="table-responsive mt-3">
                    <asp:GridView ID="dgvHistorial" runat="server" CssClass="table table-hover table-bordered align-middle bg-white" AutoGenerateColumns="false" HeaderStyle-CssClass="table-light text-dark fw-bold border-bottom-2">
                        <Columns>
                            <asp:BoundField DataField="IdUsuario" HeaderText="ID Usuario" ItemStyle-Width="80px" ItemStyle-CssClass="text-secondary fw-bold" />
                            <asp:BoundField DataField="Nombre" HeaderText="Nombre" />
                            <asp:BoundField DataField="Apellido" HeaderText="Apellido" />
                            <asp:BoundField DataField="Email" HeaderText="Email" />
                            <asp:BoundField DataField="TipoMembresia" HeaderText="Tipo Membresía" ItemStyle-CssClass="fw-semibold" />
                            <asp:BoundField DataField="FechaAlta" HeaderText="Fecha Alta" DataFormatString="{0:dd/MM/yyyy}" ItemStyle-CssClass="text-muted" />
                            <asp:BoundField DataField="FechaBaja" HeaderText="Fecha Baja" DataFormatString="{0:dd/MM/yyyy}" NullDisplayText="-" ItemStyle-CssClass="text-muted" />


                            <asp:TemplateField HeaderText="Suscripción Activa" ItemStyle-HorizontalAlign="Center">
                                <ItemTemplate>

                                    <span class='<%# Convert.ToBoolean(Eval("EsSuscripcionActiva")) ? "text-success fw-bold" : "text-danger fw-bold" %>'>
                                        <%# Convert.ToBoolean(Eval("EsSuscripcionActiva")) ? "✔ Activa" : "❌ Inactiva" %>
            </span>
                                </ItemTemplate>
                            </asp:TemplateField>

                            <asp:BoundField DataField="EstadoVigencia" HeaderText="Estado Vigencia" />
                        </Columns>
                    </asp:GridView>
                </div>
            </div>
        </div>
    </div>
</asp:Content>
