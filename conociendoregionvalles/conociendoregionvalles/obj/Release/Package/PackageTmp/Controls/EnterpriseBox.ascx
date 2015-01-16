<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="EnterpriseBox.ascx.cs" Inherits="conociendoregionvalles.Controls.EnterpriseBox" %>
<style type="text/css">
    .auto-style1 {
        height: 90%;
    }
</style>
<div class="TableContainer" >
                <table >
                    <tr>
                        <td rowspan="5" style="width: 200px; height:200px; border-bottom-left-radius:24px;">
                            <asp:Image ID="img" runat="server" class="imagecontainer" src="Images/company_building3.jpg"/>
                        </td>
                        <td colspan="2" style="height: 15px;">
                             <asp:Label ID="lblNombre" runat="server" Text="Nombre"></asp:Label>
                        </td>
                    </tr>
                    <tr>
                        <td style="vertical-align:top; height:80%" class="auto-style1" colspan="2">
                            <asp:Label ID="lblResumen" runat="server" Text="Label" CssClass="labels"></asp:Label>
                        </td>
                    </tr>
                    <tr>
                        <td >
                            <asp:Label ID="Label1" runat="server" Text="Correo:" CssClass="labelsbottom" ></asp:Label>
                        </td>
                        <td>
                            <asp:Label ID="lblCorreo" runat="server" Text="correo@dominio.com" CssClass="labelsbottom"></asp:Label>
                        </td>
                    </tr>
                    <tr>
                        <td style="padding: 0px; margin: 0px; font-size: medium">
                            <asp:Label ID="Label2" runat="server" Text="Telefono:" CssClass="labelsbottom"></asp:Label>
                        </td>
                        <td>
                            <asp:Label ID="lblTelefono" runat="server" Text="7558475" CssClass="labelsbottom"></asp:Label>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <asp:Label ID="Label3" runat="server" Text="Domicilio:" CssClass="labelsbottom"></asp:Label>
                        </td>
                        <td>
                            <asp:Label ID="lblDomicilio" runat="server" Text="6 de marzo #40 Col. Santa cecilia" CssClass="labelsbottom"></asp:Label>
                        </td>
                    </tr>
                
                </table>
            </div>