<%@ Page Language="C#" Title="Listado Teléfonos" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="ListadoTelefonos.aspx.cs" Inherits="Web.ListadoTelefonos" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
	<div class="row">
		<h2>Listado de Teléfonos</h2>
		<asp:GridView ID="gvTelefonos" runat="server" AutoGenerateColumns="false" CssClass="table table-responsive table-striped table-hover" OnRowCommand="gvTelefono_RowCommand">
			<Columns>
				<asp:BoundField DataField="Id" HeaderText="Id" Visible="false" />
				<asp:BoundField DataField="Cliente.NombreCompleto" HeaderText="Cliente" />
				<asp:BoundField DataField="TelefonoTipo.Nombre" HeaderText="Tipo" />
				<asp:BoundField DataField="Numero" HeaderText="Numero" />
				<asp:BoundField DataField="Enable" HeaderText="Habilitado" />
				<asp:TemplateField HeaderText="Acción">
					<ItemTemplate>
						<asp:Button ID="BtnEliminar" runat="server" CausesValidation="false" CommandName="EliminarTelefono" Text="Eliminar" CommandArgument='<%# Eval("Id") %>' CssClass="btn btn-secondary" />
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
				<label for="DDLCliente">Cliente</label>
				<asp:DropDownList ID="DDLCliente" placeholder="Cliente" CssClass="form-control" runat="server"></asp:DropDownList>
			</div>
			<div class="form-group col-md-4">
				<label for="DLLTipo">Tipo</label>
				<asp:DropDownList ID="DLLTipo" placeholder="Tipo" CssClass="form-control" runat="server"></asp:DropDownList>
			</div>
			<div class="form-group col-md-4">
				<label for="TxtNumero">Número</label>
				<asp:TextBox ID="TxtNumero" placeholder="Numero" CssClass="form-control" runat="server"></asp:TextBox>
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
