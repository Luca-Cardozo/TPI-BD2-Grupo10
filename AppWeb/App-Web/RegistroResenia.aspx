<%@ Page Title="" Language="C#" MasterPageFile="~/Master.Master" AutoEventWireup="true" CodeBehind="RegistroResenia.aspx.cs" Inherits="App_Web.RegistroResenia" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">


    <div class="container mt-5">

        <div class="row justify-content-center">

            <div class="col-md-8">

                <div class="card shadow">

                    <div class="card-body p-4">

                        <h2 class="text-center mb-4">⭐ Dejar reseña</h2>

                        <div class="mb-3">

                            <label class="form-label">Comentario</label>
                            <asp:TextBox ID="txtComentario" runat="server" CssClass="form-control" TextMode="MultiLine" Rows="5" MaxLength="1000" />

                        </div>

                        <div class="mb-4">

                            <label class="form-label">Calificación (1–10)</label>
                            <asp:DropDownList ID="ddlCalificacion" runat="server" CssClass="form-select">
                            </asp:DropDownList>

                        </div>

                        <div class="d-grid gap-2">

                            <asp:Button ID="btnGuardar" runat="server" Text="Guardar reseña" CssClass="btn btn-primary" OnClick="btnGuardar_Click" />
                            <%--Vuelve a la página anterior--%>
                            <a href="javascript:history.back()" class="btn btn-outline-secondary">Volver</a>

                        </div>

                        <div class="row mb-4">
                            <asp:Label ID="lblMensaje" runat="server" Visible="false" CssClass="d-block mt-3 text-center" />
                        </div>

                    </div>

                </div>

            </div>

        </div>

    </div>



</asp:Content>
