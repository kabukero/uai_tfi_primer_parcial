<%@ Page Language="C#" Title="Reporte" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="ReporteRecTotalMes.aspx.cs" Inherits="Web.ReporteRecTotalMes" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
	<div class="row">
		<h2>Reporte Reacudación Total por Mes</h2>
		<div class="row col-md-12">
			<div class="form-group col-md-4">
				<label for="DDLMes">Mes</label>
				<asp:DropDownList ID="DDLMes" placeholder="Mes" CssClass="form-control" runat="server"></asp:DropDownList>
			</div>
		</div>
		<div class="row col-md-12">
			<div class="form-group col-md-4">
				<asp:Button ID="BtnEnviar" runat="server" Text="Enviar" CssClass="btn btn-primary" OnClick="Enviar_Click" />
			</div>
		</div>
	
		<asp:GridView ID="gvReporte" runat="server" AutoGenerateColumns="false" CssClass="table table-responsive table-striped table-hover">
			<Columns>
				<asp:BoundField DataField="Mes.Nombre" HeaderText="Mes" />
				<asp:BoundField DataField="Importe" HeaderText="Importe Total" />
			</Columns>
			<HeaderStyle CssClass="thead-dark" />
			<EmptyDataTemplate>
				<h5>No hay datos cargados</h5>
			</EmptyDataTemplate>
		</asp:GridView>
	</div>
</asp:Content>
