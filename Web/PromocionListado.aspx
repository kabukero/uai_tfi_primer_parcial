<%@ Page Language="C#" Title="Listado Promociones" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="PromocionListado.aspx.cs" Inherits="Web.PromocionListado" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
	<div class="row">
		<h2>Listado de Promociones</h2>
		<asp:GridView ID="gvPromociones" runat="server" AutoGenerateColumns="false" CssClass="table table-responsive table-striped table-hover" OnRowCommand="Promociones_RowCommand">
			<Columns>
				<asp:BoundField DataField="Id" HeaderText="Id" Visible="false" />
				<asp:BoundField DataField="Nombre" HeaderText="Nombre" />
				<asp:BoundField DataField="CostoMinuto" HeaderText="Costo Minuto" />
				<asp:BoundField DataField="CostoAdicional" HeaderText="Costo Adicional" />
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
			<div class="form-group col-md-12">
				<asp:HiddenField ID="HidId" runat="server"></asp:HiddenField>
				<label for="TxtNombre">Nombre</label>
				<asp:TextBox ID="TxtNombre" placeholder="Nombre" CssClass="form-control" runat="server"></asp:TextBox>
				<asp:RequiredFieldValidator ControlToValidate="TxtNombre" Text="Ingrese el nombre" CssClass="text-danger" runat="server"></asp:RequiredFieldValidator>
			</div>
		</div>
		<div class="row col-md-12">
			<div class="form-group col-md-4">
				<label for="TxtCostoMinuto">Costo Minuto</label>
				<asp:TextBox ID="TxtCostoMinuto" placeholder="CostoMinuto" CssClass="form-control" runat="server"></asp:TextBox>
				<asp:RequiredFieldValidator ControlToValidate="TxtCostoMinuto" Text="Ingrese el Costo Minuto" CssClass="text-danger" runat="server"></asp:RequiredFieldValidator>
			</div>
			<div class="form-group col-md-4">
				<label for="TxtCostoAdicional">Costo Adicional</label>
				<asp:TextBox ID="TxtCostoAdicional" placeholder="Costo Adicional" CssClass="form-control" runat="server"></asp:TextBox>
				<asp:RequiredFieldValidator ControlToValidate="TxtCostoAdicional" Text="Ingrese el Costo Adicional" CssClass="text-danger" runat="server"></asp:RequiredFieldValidator>
			</div>
			<div class="form-group col-md-4">
				<label for="ChkHabilitado">Habilitado</label>
				<asp:CheckBox ID="ChkHabilitado" runat="server"></asp:CheckBox>
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
