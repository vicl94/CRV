<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="AltaComCat.aspx.cs" Inherits="conociendoregionvalles.AltaComCat" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
<style>
    .form-control{
        width:250px;
    }
</style>
<h5>Tipo de alta</h5>
<select class="form-control">
  <option value="1">Comunidad</option>
  <option value="2">Categoria</option>
</select>
<div style="height:10px"></div>
<h5>Nombre</h5>
<input type="text" class="form-control" placeholder="Nueva comunidad o categoria...">
<div style="height:10px"></div>
<button type="button" class="btn btn-primary">Enviar solicitud</button>
</asp:Content>
