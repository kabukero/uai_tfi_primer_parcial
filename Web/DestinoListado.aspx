<%@ Page Language="C#" Title="Listado Destinos" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="DestinoListado.aspx.cs" Inherits="Web.DestinoListado" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
	<div class="row">
		<h2>Listado de Destinos</h2>
		<asp:GridView ID="gvDestinos" runat="server" AutoGenerateColumns="false" CssClass="table table-responsive table-striped table-hover" OnRowCommand="gvDestinos_RowCommand">
			<Columns>
				<asp:BoundField DataField="Id" HeaderText="Id" Visible="false" />
				<asp:BoundField DataField="Nombre" HeaderText="Nombre" />
				<asp:BoundField DataField="Empresa.Nombre" HeaderText="Empresa" />
				<asp:BoundField DataField="PrefijoInternacional" HeaderText="Prefijo Internacional" />
				<asp:BoundField DataField="Enable" HeaderText="Habilitado" />
				<asp:TemplateField HeaderText="Acción">
					<ItemTemplate>
						<asp:Button ID="BtnSeleccionar" runat="server" CausesValidation="false" CommandName="Seleccionar" Text="Seleccionar" CommandArgument='<%# Eval("Id") %>' CssClass="btn btn-primary" />
						<asp:Button ID="BtnEliminar" runat="server" CausesValidation="false" CommandName="Eliminar" Text="Eliminar" CommandArgument='<%# Eval("Id") %>' CssClass="btn btn-secondary" />
					</ItemTemplate>
				</asp:TemplateField>
			</Columns>
			<HeaderStyle CssClass="thead-dark" />
			<EmptyDataTemplate>
				<h5>No hay datos cargados</h5>
			</EmptyDataTemplate>
		</asp:GridView>
		<div class="row col-md-12">
			<div class="form-group col-md-4">
				<asp:HiddenField ID="HidId" runat="server"></asp:HiddenField>
				<label for="TxtNombre">Nombre</label>
				<asp:TextBox ID="TxtNombre" placeholder="Nombre" CssClass="form-control" runat="server"></asp:TextBox>
				<asp:RequiredFieldValidator ControlToValidate="TxtNombre" Text="Ingrese el nombre" CssClass="text-danger" runat="server"></asp:RequiredFieldValidator>
			</div>
			<div class="form-group col-md-4">
				<label for="DDLEmpresa">Empresa</label>
				<asp:DropDownList ID="DDLEmpresa" placeholder="Empresa" CssClass="form-control" runat="server"></asp:DropDownList>
			</div>
			<div class="form-group col-md-4">
				<label for="TxtPrefijoInternacional">Prefijo Internacional</label>
				<asp:TextBox ID="TxtPrefijoInternacional" placeholder="Prefijo Internacional" CssClass="form-control" runat="server"></asp:TextBox>
				<asp:RequiredFieldValidator ControlToValidate="TxtPrefijoInternacional" Text="Ingrese el prefijo internacional" CssClass="text-danger" runat="server"></asp:RequiredFieldValidator>
			</div>
		</div>
		<div class="row col-md-12">
			<div class="row col-md-4">
				<div class="form-group col-md-4">
					<label for="ChkHabilitado">Habilitado</label>
					<asp:CheckBox ID="ChkHabilitado" runat="server"></asp:CheckBox>
				</div>
			</div>
		</div>
		<div class="row col-md-12">
			<div class="form-group col-md-4">
				<asp:Button ID="BtnGuardar" runat="server" Text="Guardar" CssClass="btn btn-primary" OnClick="Guardar_Click" />
				<asp:Button ID="BtnLimpiar" runat="server" Text="Limpiar" CssClass="btn btn-secondary" OnClick="Limpiar_Click" />
			</div>
		</div>
	</div>
</asp:Content>
