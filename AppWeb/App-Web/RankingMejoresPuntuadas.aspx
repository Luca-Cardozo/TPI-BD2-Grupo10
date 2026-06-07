<%@ Page Title="" Language="C#" MasterPageFile="~/Master.Master" AutoEventWireup="true" CodeBehind="RankingMejoresPuntuadas.aspx.cs" Inherits="App_Web.RankingMejoresPuntuadas" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <div class="container mt-5">

    <h1 class="mb-2">🏆 Top 10 películas mejor puntuadas</h1>

    
    <asp:Label  ID="lblMensaje"  runat="server"  Visible="false" />

    <asp:Repeater ID="repRanking" runat="server">

        <ItemTemplate>

            <div class="card mb-3 shadow-sm">

                <div class="card-body">

                    <div class="row align-items-center">

                        <div class="col-md-1 text-center">

                            <span class="badge bg-primary fs-5">
                                #<%# Container.ItemIndex + 1 %>
                            </span>

                        </div>

                        <div class="col-md-2 text-center">

                            <img src='<%# Eval("URLImagen") %>'  class="rounded shadow-sm" style="height:130px; width:90px; object-fit:cover;" />

                        </div>

                        <div class="col-md-6">

                            <h4 class="mb-2">
                                <%# Eval("Titulo") %>
                            </h4>

                            <p class="mb-0 fw-bold text-warning">
                                ⭐ <%# Eval("PromedioCalificacion", "{0:0.00}") %>
                            </p>

                        </div>

                        <div class="col-md-3 text-end">

                            <a 
                                href='DetallePelicula.aspx?id=<%# Eval("IdPelicula") %>' 
                                class="btn btn-primary">

                                Ver detalle

                            </a>

                        </div>

                    </div>

                </div>

            </div>

        </ItemTemplate>

    </asp:Repeater>

</div>

</asp:Content>

