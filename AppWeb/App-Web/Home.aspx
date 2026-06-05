<%@ Page Title="" Language="C#" MasterPageFile="~/Master.Master" AutoEventWireup="true" CodeBehind="Home.aspx.cs" Inherits="App_Web.Home" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <div class="container mt-5 mb-5">

        <div class="text-center">

            <h1 class="display-4 fw-bold">🎬 Bienvenido a Filmio</h1>
            <h2 class="display-4 fw-bold">¡Tus películas favoritas en un solo lugar!</h2>

            <p class="lead text-muted">Reproducí películas, explorá detalles y conocé las reseñas de otros usuarios.</p>

            <hr class="w-50 mx-auto" />

        </div>

    </div>

    <div class="container mt-4">

        <div class="row">
            <asp:Repeater ID="repPeliculas" runat="server">

                <ItemTemplate>

                    <div class="col-md-4 col-lg-3 mb-4">
                        <div class="card h-100 shadow-sm">

                            <img src='<%# Eval("URLImagen") %>'
                                class="card-img-top"
                                style="height: 350px; object-fit: cover;"
                                alt="Poster película" />

                            <div class="card-body d-flex flex-column">

                                <h5 class="card-title text-center">
                                    <%# Eval("Titulo") %>
                                </h5>

                                <div class="mt-auto text-center">
                                    <asp:Button Text="Ver detalle" runat="server" ID="btnDetalle" CssClass="btn btn-primary w-100" CommandArgument='<%# Eval("IdPelicula") %>' OnClick="btnDetalle_Click" />
                                </div>

                            </div>

                        </div>
                    </div>

                </ItemTemplate>

            </asp:Repeater>
        </div>

    </div>

</asp:Content>
