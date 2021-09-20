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
            <a href="ListadoTelefonos" class="btn btn-primary btn-md">Listado Teléfonos</a>
        </div>
        <div class="col-md-4 col-12 mb-3">
            <a href="EmpresaListado" class="btn btn-primary btn-md">Listado Empresas</a>
        </div>
    </div>
    <div class="row"><br /></div>
    <div class="row">
        <div class="col-md-4 col-12 mb-3">
            <a href="ListadoDestinos" class="btn btn-primary btn-md">Listado Destinos</a>
        </div>
        <div class="col-md-4 col-12 mb-3">
            <a href="ListadoLLamada" class="btn btn-primary btn-md">Listado LLamada</a>
        </div>
        <div class="col-md-4 col-12 mb-3">
            <a href="PromocionListado" class="btn btn-primary btn-md">Listado Promociones</a>
        </div>
    </div>
    <div class="row"><br /></div>
    <div class="row">
        <div class="col-md-4 col-12 mb-3">
            <a href="Reportes" class="btn btn-primary btn-md">Reportes</a>
        </div>
    </div>
</asp:Content>
