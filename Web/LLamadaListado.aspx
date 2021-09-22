<%@ Page Language="C#" Title="Listado Llamadas" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="LLamadaListado.aspx.cs" Inherits="Web.LLamadaListado" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
	<div class="row">
		<h2>Listado de Llamadas</h2>
		<asp:GridView ID="gvLlamadas" runat="server" AutoGenerateColumns="false" CssClass="table table-responsive table-striped table-hover">
			<Columns>
				<asp:BoundField DataField="Id" HeaderText="Id" Visible="false" />
				<asp:BoundField DataField="TelefonoOrigen.TelefonoCliente" HeaderText="Numero Origen" />
				<asp:BoundField DataField="DestinoOrigen.Nombre" HeaderText="Destino Origen" />
				<asp:BoundField DataField="TelefonoDestino.TelefonoCliente" HeaderText="Numero Destino" />
				<asp:BoundField DataField="DestinoDestino.Nombre" HeaderText="Destino Origen" />
				<asp:BoundField DataField="Promocion.Nombre" HeaderText="Tipo" />
				<asp:BoundField DataField="DuracionMinutos" HeaderText="Duracion" />
				<asp:BoundField DataField="Importe" HeaderText="Importe" />
				<asp:BoundField DataField="FechaLlamada" HeaderText="Fecha" />
			</Columns>
			<HeaderStyle CssClass="thead-dark" />
			<EmptyDataTemplate>
				<h5>No hay datos cargados</h5>
			</EmptyDataTemplate>
		</asp:GridView>
		<div class="row col-md-12">
			<div class="form-group col-md-4">
				<label for="DDLTelefonoOrigen">Numero Origen</label>
				<asp:DropDownList ID="DDLTelefonoOrigen" placeholder="Numero Origen" CssClass="form-control" runat="server"></asp:DropDownList>
			</div>
			<div class="form-group col-md-4">
				<label for="DLLDestinoOrigen">Destino Origen</label>
				<asp:DropDownList ID="DLLDestinoOrigen" placeholder="Destino Origen" CssClass="form-control" runat="server"></asp:DropDownList>
			</div>
		</div>
		<div class="row col-md-12">
			<div class="form-group col-md-4">
				<label for="DDLTelefonoDestino">Numero Destino</label>
				<asp:DropDownList ID="DDLTelefonoDestino" placeholder="Numero Origen" CssClass="form-control" runat="server"></asp:DropDownList>
			</div>
			<div class="form-group col-md-4">
				<label for="DLLDestinoDestino">Destino Destino</label>
				<asp:DropDownList ID="DLLDestinoDestino" placeholder="Destino Destino" CssClass="form-control" runat="server"></asp:DropDownList>
			</div>
		</div>
		<div class="row col-md-12">
			<div class="form-group col-md-8">
				<label for="DLLPromocion">Promocion</label>
				<asp:DropDownList ID="DLLPromocion" placeholder="Promocion" CssClass="form-control" runat="server"></asp:DropDownList>
			</div>
		</div>
		<div class="row col-md-12">
			<div class="form-group col-md-4">
				<label for="CalFechaLLamada">Fecha LLamada</label>
				<asp:Calendar ID="CalFechaLLamada" runat="server" Format="dd/mm/yyyy"></asp:Calendar>
			</div>
			<div class="form-group col-md-4">
				<label for="TxtDuracionMinutos">Duracion Minutos</label>
				<asp:TextBox ID="TxtDuracionMinutos" placeholder="Duracion Minutos" CssClass="form-control" runat="server"></asp:TextBox>
				<asp:RequiredFieldValidator ControlToValidate="TxtDuracionMinutos" Text="Ingrese la duración en minutos" CssClass="text-danger" runat="server"></asp:RequiredFieldValidator>
				<asp:RegularExpressionValidator ControlToValidate="TxtDuracionMinutos" Text="La duración debe ser un número" ValidationExpression="\d+" CssClass="text-danger" runat="server"></asp:RegularExpressionValidator>
			</div>
		</div>
		<div class="row col-md-12">
			<div class="form-group col-md-4">
				<asp:Button ID="BtnGuardar" runat="server" Text="Guardar" CssClass="btn btn-primary" OnClick="Guardar_Click" />
			</div>
		</div>
	</div>
</asp:Content>
