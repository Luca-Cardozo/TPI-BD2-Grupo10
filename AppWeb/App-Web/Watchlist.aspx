<%@ Page Title="" Language="C#" MasterPageFile="~/Master.Master" AutoEventWireup="true" CodeBehind="Watchlist.aspx.cs" Inherits="App_Web.Watchlist" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <div class="container mt-5">

        <div class="text-center mb-5">

            <h1 class="display-5 fw-bold">❤️ Mi Watchlist</h1>

            <p class="lead text-muted">
                ¡Tus películas favoritas guardadas para ver cuando quieras!       
            </p>

        </div>

        <div class="row">

            <asp:Repeater ID="repWatchlist" runat="server">

                <ItemTemplate>

                    <div class="col-md-4 col-lg-3 mb-4">

                        <div class="card h-100 shadow-sm">

                            <img src='<%# Eval("URLImagen") %>' class="card-img-top" style="height: 350px; object-fit: cover;" />

                            <div class="card-body d-flex flex-column">

                                <h5 class="text-center"><%# Eval("Titulo") %></h5>

                                <p class="text-center text-muted mb-2"> ⭐ <%# Eval("PromedioCalificacion") %></p>

                                <div class="mt-auto">

                                    <a href='DetallePelicula.aspx?id=<%# Eval("IdPelicula") %>' class="btn btn-primary w-100">Ver detalle</a>

                                </div>

                            </div>

                        </div>

                    </div>

                </ItemTemplate>

            </asp:Repeater>

        </div>

    </div>


</asp:Content>
