<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="EnterpriseBox.ascx.cs" Inherits="conociendoregionvalles.Controls.EnterpriseBox" %>
<style type="text/css">
    .auto-style1 {
        height: 90%;
    }
</style>
<div class="TableContainer" >
    <div class="table-responsive">    
                <table >
                    <tr>
                        <td rowspan="7" style="height:150px; width:150px; border-bottom-left-radius:24px;">
                            <asp:Image ID="img" runat="server" src="Images/company_building3.jpg" CssClass="imagecontainer"/>
                        </td>
                        <td colspan="6" style="height: 15px;">
                             <asp:Label ID="lblNombre" runat="server" Text="Nombre"></asp:Label>
                        </td>
                    </tr>
                    <tr>
                        <td style="vertical-align:top; height:80%" class="auto-style1" colspan="6">
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
                        <td>
                            <asp:Label ID="Label2" runat="server" Text="Telefono:" CssClass="labelsbottom"></asp:Label>
                        </td>
                        <td colspan="2" align="left">
                            <asp:Label ID="lblTelefono" runat="server" Text="9999999" CssClass="labelsbottom"></asp:Label>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <asp:Label ID="Label5" runat="server" Text="Región" CssClass="labelsbottom"></asp:Label>
                        </td>
                        <td>
                            <asp:Label ID="lblRegion" runat="server" Text="Ameca" CssClass="labelsbottom"></asp:Label>
                        </td>
                        <td  align="right">
                            <asp:Label ID="Label6" runat="server" Text="Categoria:" CssClass="labelsbottom"></asp:Label>
                        </td>
                        <td colspan="2" align="left">
                            <asp:Label ID="lblTag" runat="server" Text="Default" CssClass="labelsbottom"></asp:Label>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <asp:Label ID="Label3" runat="server" Text="Domicilio:" CssClass="labelsbottom"></asp:Label>
                        </td>
                        <td colspan="3" align="left">
                            <asp:Label ID="lblDomicilio" runat="server" Text="A la vuelta" CssClass="labelsbottom"></asp:Label>
                        </td>
                         <td>
                            <div align="right" style="margin-right:10px;">
                                <b><asp:HyperLink ID="LinkSeeMore" runat="server" style="font-size: 15px" >VER MÁS</asp:HyperLink></b>
                            </div>

                        </td>
                    </tr>
                </table>
         </div>
            </div>