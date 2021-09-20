<%@ Page Language="C#" Title="Listado Clientes" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="ListadoClientes.aspx.cs" Inherits="Web.ListadoClientes" Async="true" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
	<div class="row">
		<h2>Listado de clientes</h2>
		<div class="row">
			<div class="form-group col-12">
				<a href="ClienteForm" class="btn btn-primary btn-md">Crear Cliente</a>
			</div>
		</div>
		<asp:GridView ID="gvClientes" runat="server" AutoGenerateColumns="false" CssClass="table table-responsive table-striped table-hover" OnRowCommand="gvClientes_RowCommand">
			<Columns>
				<asp:BoundField DataField="Id" HeaderText="Id" Visible="false" />
				<asp:BoundField DataField="Nombre" HeaderText="Nombre" />
				<asp:BoundField DataField="Apellido" HeaderText="Apellido" />
				<asp:BoundField DataField="DNI" HeaderText="DNI" />
				<asp:BoundField DataField="Enable" HeaderText="Habilitado" />
				<asp:TemplateField HeaderText="Acción">
					<ItemTemplate>
						<asp:HyperLink ID="ClienteFormHyperlink" runat="server" NavigateUrl='<%# Eval("Id", @"~\ClienteForm.aspx?Id={0}") %>' Text="Modificar" CssClass="btn btn-primary"></asp:HyperLink>
						<asp:Button ID="BtnEliminar" runat="server" CausesValidation="false" CommandName="EliminarCliente" Text="Eliminar" CommandArgument='<%# Eval("Id") %>' CssClass="btn btn-secondary" />
					</ItemTemplate>
				</asp:TemplateField>
			</Columns>
			<HeaderStyle CssClass="thead-dark" />
			<EmptyDataTemplate>
				<h5>No hay datos cargados</h5>
			</EmptyDataTemplate>
		</asp:GridView>
	</div>
</asp:Content>
