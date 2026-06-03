<%@ Page Title="" Language="C#" MasterPageFile="~/Master.Master" AutoEventWireup="true" CodeBehind="ResumenActividadUsuarios.aspx.cs" Inherits="App_Web.ResumenActividadUsuarios" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <div class="card shadow-sm">

        <div class="card-body">

            <h3 class="mb-4">Resumen de actividad de usuarios</h3>

            <asp:GridView ID="dgvActividadUsuarios" runat="server" CssClass="table table-hover" AutoGenerateColumns="false">

                <Columns>

                    <asp:BoundField HeaderText="Nombre" DataField="Nombre" />

                    <asp:BoundField HeaderText="Apellido" DataField="Apellido" />

                    <asp:BoundField HeaderText="DNI" DataField="DNI" />

                    <asp:BoundField HeaderText="Email" DataField="Email" />

                    <asp:BoundField HeaderText="Suscripcion" DataField="Suscripcion" />

                    <asp:BoundField HeaderText="Reseñas" DataField="CantResenias" />

                    <asp:BoundField HeaderText="Reproducciones" DataField="CantReproducciones" />

                </Columns>

            </asp:GridView>

        </div>

    </div>



</asp:Content>
