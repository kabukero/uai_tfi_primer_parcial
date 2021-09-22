<%@ Page Language="C#" Title="Reportes" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="FacturaListado.aspx.cs" Inherits="Web.FacturaListado" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
	<div class="row">
		<h2>Listado Facturas de Clientes</h2>

		<div class="row col-md-12">
			<div class="form-group col-md-4">
				<label for="DLLCliente">Cliente</label>
				<asp:DropDownList ID="DDLCliente" placeholder="Cliente" CssClass="form-control" runat="server"></asp:DropDownList>
			</div>
			<div class="form-group col-md-4">
				<label for="CalFechaLLamada">Fecha LLamada</label>
				<asp:Calendar ID="CalFechaLLamada" runat="server" Format="dd/mm/yyyy"></asp:Calendar>
			</div>
		</div>
		<div class="row col-md-12">
			<div class="form-group col-md-4">
				<asp:Button ID="BtnGuardar" runat="server" Text="Guardar" CssClass="btn btn-primary" OnClick="Guardar_Click" />
			</div>
		</div>

		<asp:GridView ID="gvFacturas" runat="server" AutoGenerateColumns="false" CssClass="table table-responsive table-striped table-hover">
			<Columns>
				<asp:BoundField DataField="Cliente.NombreCompleto" HeaderText="Cliente" />
				<asp:BoundField DataField="FechaFacturacion" HeaderText="Fecha" />
				<asp:BoundField DataField="MontoTotal" HeaderText="Monto Total" />
			</Columns>
			<HeaderStyle CssClass="thead-dark" />
			<EmptyDataTemplate>
				<h5>No hay datos cargados</h5>
			</EmptyDataTemplate>
		</asp:GridView>
	</div>
</asp:Content>
