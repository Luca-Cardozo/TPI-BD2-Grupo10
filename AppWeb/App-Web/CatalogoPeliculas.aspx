<%@ Page Title="" Language="C#" MasterPageFile="~/Master.Master" AutoEventWireup="true" CodeBehind="CatalogoPeliculas.aspx.cs" Inherits="App_Web.CatalogoPeliculas" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <div class="container mt-4">


        <div class="row mb-4">
            <div class="col-12 text-center">
                <h1>Catálogo de Películas Disponibles</h1>
                <p class="text-muted">
                    Buscá películas utilizando los filtros
                </p>
            </div>
        </div>


        <div class="card shadow-sm mb-4">
            <div class="card-body">

                <h4 class="mb-4">Filtros de búsqueda</h4>

                <div class="row g-3">


                    <div class="col-md-4">
                        <asp:Label Text="Título" ID="lblTitulo" runat="server" CssClass="form-label" />
                        <asp:TextBox runat="server" ID="txtTitulo" CssClass="form-control" placeholder="Buscar película..." />
                    </div>


                    <div class="col-md-4">
                        <asp:Label Text="Género" ID="lblGenero" runat="server" CssClass="form-label" />
                        <asp:DropDownList runat="server" ID="ddlGenero" CssClass="form-select">
                        </asp:DropDownList>
                    </div>


                    <div class="col-md-4">
                        <asp:Label Text="Clasificación" runat="server" CssClass="form-label" />
                        <asp:DropDownList runat="server" ID="ddlClasificacion" CssClass="form-select">
                        </asp:DropDownList>
                    </div>


                    <div class="col-md-4">
                        <asp:Label Text="Director" runat="server" CssClass="form-label" />
                        <asp:DropDownList runat="server" ID="ddlDirector" CssClass="form-select">
                        </asp:DropDownList>
                    </div>


                    <div class="col-md-4">
                        <asp:Label Text="Actor" runat="server" CssClass="form-label" />
                        <asp:DropDownList runat="server" ID="ddlActor" CssClass="form-select">
                        </asp:DropDownList>
                    </div>


                    <div class="col-md-4">
                        <asp:Label Text="Año de estreno" runat="server" CssClass="form-label" />
                        <asp:DropDownList runat="server" ID="ddlAnios" CssClass="form-select">
                        </asp:DropDownList>
                    </div>

                </div>


                <div class="d-flex gap-2 justify-content-center mt-4">
                    <asp:Button Text="Buscar" runat="server" CssClass="btn btn-primary px-4" ID="btnBuscar" OnClick="btnBuscar_Click" />

                    <asp:Button
                        Text="Ver catálogo completo" runat="server" CssClass="btn btn-outline-secondary px-4" ID="btnCatalogoCompleto" OnClick="btnCatalogoCompleto_Click" />
                </div>

            </div>
        </div>


        <div class="card shadow-sm">
            <div class="card-body">

                <h4 class="mb-3">Resultados</h4>

                <div class="table-responsive">
                    <asp:GridView ID="dgvPeliculas" runat="server" DataKeyNames="IdPelicula" CssClass="table table-hover align-middle" AutoGenerateColumns="false" OnSelectedIndexChanged="dgvPeliculas_SelectedIndexChanged">

                        <Columns>
                            <asp:BoundField HeaderText="Título" DataField="Titulo" />

                            <asp:BoundField HeaderText="Duración (min)" DataField="DuracionMinutos" />

                            <asp:BoundField HeaderText="Estreno" DataField="FechaEstreno" DataFormatString="{0:dd/MM/yyyy}" />

                            <asp:BoundField HeaderText="Calificación" DataField="PromedioCalificacion" />

                            <asp:CommandField HeaderText="Acción" ShowSelectButton="true" SelectText="🔍 Ver detalle" />
                        </Columns>

                    </asp:GridView>
                </div>

            </div>
        </div>

    </div>

    <br />
    <div class="d-flex justify-content-center mb-6">
        <a href="Home.aspx" class="btn btn-outline-secondary">← Volver al Home</a>
    </div>


</asp:Content>
