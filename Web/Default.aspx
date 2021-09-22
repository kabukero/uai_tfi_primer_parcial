<%@ Page Title="Home Page" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="Web._Default" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <div class="row text-center">
        <h2>Bienvenido a la Compañía Telefónica Phono</h2>
    </div>
    <div class="row"><br /></div>
    <div class="row">
        <div class="col-md-4 col-12 mb-3">
            <a href="ListadoClientes" class="btn btn-primary btn-md">Listado Clientes</a>
        </div>
        <div class="col-md-4 col-12 mb-3">
            <a href="EmpresaListado" class="btn btn-primary btn-md">Listado Empresas</a>
        </div>
        <div class="col-md-4 col-12 mb-3">
            <a href="DestinoListado" class="btn btn-primary btn-md">Listado Destinos</a>
        </div>
    </div>
    <div class="row"><br /></div>
    <div class="row">
        <div class="col-md-4 col-12 mb-3">
            <a href="PromocionListado" class="btn btn-primary btn-md">Listado Promociones</a>
        </div>
        <div class="col-md-4 col-12 mb-3">
            <a href="ListadoTelefonos" class="btn btn-primary btn-md">Listado Teléfonos</a>
        </div>
        <div class="col-md-4 col-12 mb-3">
            <a href="LLamadaListado" class="btn btn-primary btn-md">Listado LLamada</a>
        </div>
    </div>

    <div class="row"><br /></div>
    <div class="row">
        <div class="col-md-4 col-12 mb-3">
            <a href="FacturaListado" class="btn btn-primary btn-md">Listado facturas</a>
        </div>
    </div>

    <div class="row"><br /></div>
    <div class="row">
        <div class="col-12 mb-3">
            <a href="ReporteCargoMesCliente" class="btn btn-primary btn-md">Reporte Cargos por Mes de un Cliente</a>
        </div>
    </div>
    <div class="row"><br /></div>
    <div class="row">
        <div class="col-12">
            <a href="ReporteRecTotalMes" class="btn btn-primary btn-md">Reporte Recaudación total por mes</a>
        </div>
    </div>
    <div class="row"><br /></div>
    <div class="row">
        <div class="col-12">
            <a href="ReporteRecMesPromocion" class="btn btn-primary btn-md">Reporte Recaudación de un mes por promoción</a>
        </div>
    </div>
    <div class="row"><br /></div>
    <div class="row">
        <div class="col-12">
            <a href="ReportePorcLlamadas" class="btn btn-primary btn-md">Reporte Porcentaje de llamadas por tipo general y por cliente</a>
        </div>
    </div>
</asp:Content>
