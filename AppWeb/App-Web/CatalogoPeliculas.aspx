<%@ Page Title="" Language="C#" MasterPageFile="~/Master.Master" AutoEventWireup="true" CodeBehind="CatalogoPeliculas.aspx.cs" Inherits="App_Web.CatalogoPeliculas" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <div class="container mt-4">

        <!-- Título -->
        <div class="row mb-4">
            <div class="col-12 text-center">
                <h1>Catálogo de Películas Disponibles</h1>
                <p class="text-muted">
                    Buscá películas utilizando los filtros
                </p>
            </div>
        </div>

        <!-- Filtros -->
        <div class="card shadow-sm mb-4">
            <div class="card-body">

                <h4 class="mb-4">Filtros de búsqueda</h4>

                <div class="row g-3">

                    <!-- Título -->
                    <div class="col-md-4">
                        <asp:Label Text="Título" ID="lblTitulo" runat="server" CssClass="form-label" />
                        <asp:TextBox
                            runat="server"
                            ID="txtTitulo"
                            CssClass="form-control"
                            placeholder="Buscar película..." />
                    </div>

                    <!-- Género -->
                    <div class="col-md-4">
                        <asp:Label Text="Género" ID="lblGenero" runat="server" CssClass="form-label" />
                        <asp:DropDownList
                            runat="server"
                            ID="ddlGenero"
                            CssClass="form-select"
                            AutoPostBack="true">
                        </asp:DropDownList>
                    </div>

                    <!-- Clasificación -->
                    <div class="col-md-4">
                        <asp:Label Text="Clasificación" runat="server" CssClass="form-label" />
                        <asp:DropDownList
                            runat="server"
                            ID="ddlClasificacion"
                            CssClass="form-select">
                        </asp:DropDownList>
                    </div>

                    <!-- Director -->
                    <div class="col-md-4">
                        <asp:Label Text="Director" runat="server" CssClass="form-label" />
                        <asp:DropDownList
                            runat="server"
                            ID="ddlDirector"
                            CssClass="form-select">
                        </asp:DropDownList>
                    </div>

                    <!-- Actor -->
                    <div class="col-md-4">
                        <asp:Label Text="Actor" runat="server" CssClass="form-label" />
                        <asp:DropDownList
                            runat="server"
                            ID="ddlActor"
                            CssClass="form-select">
                        </asp:DropDownList>
                    </div>

                    <!-- Año -->
                    <div class="col-md-4">
                        <asp:Label Text="Año de estreno" runat="server" CssClass="form-label" />
                        <asp:DropDownList
                            runat="server"
                            ID="ddlAnios"
                            CssClass="form-select">
                        </asp:DropDownList>
                    </div>

                </div>

                <!-- Botones -->
                <div class="d-flex gap-2 justify-content-center mt-4">
                    <asp:Button
                        Text="Buscar"
                        runat="server"
                        CssClass="btn btn-primary px-4"
                        ID="btnBuscar"
                        OnClick="btnBuscar_Click" />

                    <asp:Button
                        Text="Ver catálogo completo"
                        runat="server"
                        CssClass="btn btn-outline-secondary px-4"
                        ID="btnCatalogoCompleto"
                        OnClick="btnCatalogoCompleto_Click" />
                </div>

            </div>
        </div>

        <!-- Tabla -->
        <div class="card shadow-sm">
            <div class="card-body">

                <h4 class="mb-3">Resultados</h4>

                <div class="table-responsive">
                    <asp:GridView
                        ID="dgvPeliculas"
                        runat="server"
                        DataKeyNames="IdPelicula"
                        CssClass="table table-hover align-middle"
                        AutoGenerateColumns="false">

                        <Columns>
                            <asp:BoundField
                                HeaderText="Título"
                                DataField="Titulo" />

                            <asp:BoundField
                                HeaderText="Duración (min)"
                                DataField="DuracionMinutos" />

                            <asp:BoundField
                                HeaderText="Estreno"
                                DataField="FechaEstreno"
                                DataFormatString="{0:dd/MM/yyyy}" />

                            <asp:BoundField
                                HeaderText="Calificación"
                                DataField="PromedioCalificacion" />

                            <asp:CommandField
                                HeaderText="Acción"
                                ShowSelectButton="true"
                                SelectText="🔍 Ver detalle" />
                        </Columns>

                    </asp:GridView>
                </div>

            </div>
        </div>

    </div>


</asp:Content>
