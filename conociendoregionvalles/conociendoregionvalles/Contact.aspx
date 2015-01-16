<%@ Page Title="Contacto" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Contact.aspx.cs" Inherits="conociendoregionvalles.Contact" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <h2><%: Title %>.</h2>
    <h3>Contactanos en la siguiente dirección.</h3>
    <address>
        6 de marzo, Col. Santa Cecilia.<br />
        Ameca, Jal.<br />
        <abbr title="Phone">Teléfono:</abbr>
        01 (375) 755 94 53 - 045 33 19 26 00 16
    </address>

    <address>
        <strong>Soporte:</strong>   <a href="mailto:soporte@conociendoregionvalles.com">soporte@conociendoregionvalles.com</a><br />
    </address>
</asp:Content>
