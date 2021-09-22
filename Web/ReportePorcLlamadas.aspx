<%@ Page Language="C#" Title="Reportes" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="ReportePorcLlamadas.aspx.cs" Inherits="Web.ReportePorcLlamadas" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
	<div class="row">
		<h2>Reporte Porcentaje Llamadas Tipo General y Cliente</h2>
		<div class="row col-md-12">
			<div class="form-group col-md-4">
				<label for="DLLCliente">Cliente</label>
				<asp:DropDownList ID="DDLCliente" placeholder="Cliente" CssClass="form-control" runat="server"></asp:DropDownList>
			</div>
		</div>
		<div class="row col-md-12">
			<div class="form-group col-md-4">
				<asp:Button ID="BtnEnviar" runat="server" Text="Enviar" CssClass="btn btn-primary" OnClick="Enviar_Click" />
			</div>
		</div>

		<asp:GridView ID="gvReporte" runat="server" AutoGenerateColumns="false" CssClass="table table-responsive table-striped table-hover">
			<Columns>
				<asp:BoundField DataField="Cliente.NombreCompleto" HeaderText="Cliente" />
				<asp:BoundField DataField="Promocion.Nombre" HeaderText="Promocion" />
				<asp:BoundField DataField="Cantidad" HeaderText="Cantidad Llamadas" />
				<asp:BoundField DataField="Porcentaje" HeaderText="Porcentaje" />
			</Columns>
			<HeaderStyle CssClass="thead-dark" />
			<EmptyDataTemplate>
				<h5>No hay datos cargados</h5>
			</EmptyDataTemplate>
		</asp:GridView>
	</div>
</asp:Content>
