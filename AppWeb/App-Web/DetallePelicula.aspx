<%@ Page Title="" Language="C#" MasterPageFile="~/Master.Master" AutoEventWireup="true" CodeBehind="DetallePelicula.aspx.cs" Inherits="App_Web.DetallePelicula" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">


    <div class="container mt-5">

        <div class="row g-4">

            <div class="col-md-4">
                <asp:Image ID="imgPelicula" runat="server" CssClass="img-fluid rounded shadow" />
            </div>


            <div class="col-md-8">

                <h1 class="mb-3">
                    <asp:Label ID="lblTitulo" runat="server" />
                </h1>

                <p class="text-muted">
                    <strong>Estreno:</strong>
                    <asp:Label ID="lblFechaEstreno" runat="server" />
                </p>

                <p>
                    <strong>Descripción:</strong>
                    <br />
                    <asp:Label ID="lblDescripcion" runat="server" />
                </p>

                <div class="row mb-3">

                    <div class="col-md-6">
                        <strong>Duración:</strong>
                        <asp:Label ID="lblDuracion" runat="server" />
                    </div>

                    <div class="col-md-6">
                        <strong>Clasificación:</strong>
                        <asp:Label ID="lblClasificacion" runat="server" />
                    </div>

                </div>

                <p>
                    <strong>Director:</strong>
                    <asp:Label ID="lblDirector" runat="server" />
                </p>


                <div class="mb-3">
                    <strong>Géneros:</strong>
                    <br />
                    <asp:Repeater ID="repGeneros" runat="server">

                        <ItemTemplate>
                            <span class="badge bg-primary me-1">
                                <%# Eval("Descripcion") %>
                            </span>
                        </ItemTemplate>

                    </asp:Repeater>
                </div>


                <div class="mb-3">
                    <strong>Casting:</strong>

                    <ul class="list-group mt-2">
                        <asp:Repeater ID="repActores" runat="server">

                            <ItemTemplate>
                                <li class="list-group-item">
                                    <%# Eval("Nombre") %>
                                    <%# Eval("Apellido") %>
                                </li>
                            </ItemTemplate>

                        </asp:Repeater>
                    </ul>
                </div>


                <div class="row mb-4">

                    <div class="col-md-6">
                        <strong>Visualizaciones:</strong>
                        <asp:Label ID="lblVisualizaciones" runat="server" />
                    </div>

                    <div class="col-md-6">
                        <strong>Calificación:</strong>
                        ⭐
                    <asp:Label ID="lblCalificacion" runat="server" />
                    </div>

                </div>


                <asp:HyperLink ID="lnkTrailer" runat="server" CssClass="btn btn-danger" Target="_blank" Text="Ver Trailer" />

                <asp:Button ID="btnResenia" runat="server" Text="✍️ Dejar reseña y calificar" CssClass="btn btn-warning" OnClick="btnResenia_Click" />

                <asp:Button ID="btnReproducir" runat="server" Text="▶️ Reproducir" CssClass="btn btn-success" OnClick="btnReproducir_Click" />

                <asp:Button ID="btnWatchlist" runat="server" Text="❤️ Agregar a Watchlist" CssClass="btn btn-primary" OnClick="btnWatchlist_Click" />
                 <asp:Button ID="btnBajaPelicula"   runat="server"   Text="Dar de baja película"   CssClass="btn btn-outline-danger"  OnClick="btnBajaPelicula_Click" />
                <div class="row mb-4">
                    <asp:Label ID="lblMensaje" runat="server" CssClass="d-block mt-3 text-center fw-bold" />
                </div>

            </div>

        </div>

    </div>


    <div class="mt-5">

        <h3 class="mb-4">Reseñas de usuarios</h3>

        <asp:Repeater ID="repResenias" runat="server">

            <ItemTemplate>

                <div class="card mb-3 shadow-sm">

                    <div class="card-body">

                        <div class="d-flex justify-content-between">

                            <h5 class="card-title mb-0">

                                <%# Eval("Usuario.Nombre") %>
                                <%# Eval("Usuario.Apellido") %>

                            </h5>

                            <small class="text-muted">
                                <%# Eval("Fecha", "{0:dd/MM/yyyy}") %>
                            </small>

                        </div>

                        <div class="mt-2 mb-2">
                            ⭐ <%# Eval("Calificacion") %>/10
                        </div>

                        <p class="card-text">
                            <%# Eval("Comentario") %>
                        </p>

                    </div>

                </div>

            </ItemTemplate>

        </asp:Repeater>

    </div>

    <br />
    <div class="d-flex justify-content-center mb-6">
        <a href="Home.aspx" class="btn btn-outline-secondary">← Volver al Home</a>
    </div>

</asp:Content>
