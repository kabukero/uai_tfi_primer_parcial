<%@ Page Language="C#" Title="Formulario Cliente" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="ClienteForm.aspx.cs" Inherits="Web.ClienteForm" Async="true" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
	<div class="row">
		<h2>Formulario Cliente</h2>
		<div class="row col-md-12">
			<div class="form-group col-md-4">
				<label for="TxtNombre">Nombre</label>
				<asp:TextBox ID="TxtNombre" placeholder="Nombre" CssClass="form-control" runat="server"></asp:TextBox>
				<asp:RequiredFieldValidator ControlToValidate="TxtNombre" Text="Ingrese el nombre" CssClass="text-danger" runat="server"></asp:RequiredFieldValidator>
			</div>
			<div class="form-group col-md-4">
				<label for="TxtApellido">Apellido</label>
				<asp:TextBox ID="TxtApellido" placeholder="Apellido" CssClass="form-control" runat="server"></asp:TextBox>
				<asp:RequiredFieldValidator ControlToValidate="TxtApellido" Text="Ingrese el apellido" CssClass="text-danger" runat="server"></asp:RequiredFieldValidator>
			</div>
			<div class="form-group col-md-4">
				<label for="TxtDNI">DNI</label>
				<asp:TextBox ID="TxtDNI" placeholder="DNI" CssClass="form-control" runat="server"></asp:TextBox>
				<asp:RequiredFieldValidator ControlToValidate="TxtDNI" Text="Ingrese el DNI" CssClass="text-danger" runat="server"></asp:RequiredFieldValidator>
			</div>
			<div class="form-group col-md-4">
				<label for="ChkHabilitado">Habilitado</label>
				<asp:CheckBox ID="ChkHabilitado" runat="server"></asp:CheckBox>
			</div>
		</div>
		<div class="row col-md-12">
			<div class="form-group col-md-4">
				<asp:Button ID="BtnGuardar" runat="server" Text="Guardar" CssClass="btn btn-primary" OnClick="Guardar_Click" />
				<a href="ListadoClientes" class="btn">Cancelar</a>
			</div>
		</div>
		<asp:HiddenField ID="TxtId" runat="server"></asp:HiddenField>
		<asp:Panel ID="ErrorPanel" CssClass="alert alert-danger" runat="server"></asp:Panel>
	</div>
</asp:Content>
