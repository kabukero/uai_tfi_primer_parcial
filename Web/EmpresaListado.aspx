<%@ Page Language="C#" Title="Listado Empresas" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="EmpresaListado.aspx.cs" Inherits="Web.EmpresaListado" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
	<div class="row">
		<h2>Listado de Empresas</h2>
		<asp:GridView ID="gvEmpresas" runat="server" AutoGenerateColumns="false" CssClass="table table-responsive table-striped table-hover" OnRowCommand="gvTelefono_RowCommand">
			<Columns>
				<asp:BoundField DataField="Id" HeaderText="Id" Visible="false" />
				<asp:BoundField DataField="Nombre" HeaderText="Cliente" />
				<asp:BoundField DataField="Enable" HeaderText="Habilitado" />
				<asp:TemplateField HeaderText="Acción">
					<ItemTemplate>
						<asp:Button ID="BtnSeleccionar" runat="server" CausesValidation="false" CommandName="Seleccionar" Text="Seleccionar" CommandArgument='<%# Eval("Id") %>' CssClass="btn btn-secondary" />
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
		</div>
		<div class="row col-md-12">
			<div class="form-group col-md-4">
				<label for="ChkHabilitado">Habilitado</label>
				<asp:CheckBox ID="ChkHabilitado" runat="server"></asp:CheckBox>
			</div>
		</div>
		<div class="row col-md-12">
			<div class="form-group col-md-4">
				<asp:Button ID="BtnGuardar" runat="server" Text="Guardar" CssClass="btn btn-primary" OnClick="Guardar_Click" />
			</div>
		</div>
	</div>
</asp:Content>
