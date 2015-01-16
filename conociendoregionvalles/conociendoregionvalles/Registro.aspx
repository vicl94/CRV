<%@ Page Title="Registro" Language="C#" MasterPageFile="~/Site.Master" EnableEventValidation="false" AutoEventWireup="true" CodeBehind="Registro.aspx.cs" Inherits="conociendoregionvalles.Registro" %>

<%@ Register Src="~/Controls/SignUp.ascx" TagPrefix="uc1" TagName="SignUp" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <h2><%: Title %>.</h2>
    <h4>Cree una cuenta nueva.</h4>
    <hr />
    <div class="ui two column grid">
        <div class="column"  style="font-size:12px; font-weight:bold;">
            <uc1:SignUp runat="server" id="SignUp" />
        </div>
        <div class="column">
                <h2>Para registrar tu empresa, primeramente debes
                    registrarte como usuario del sitio web. Para eso es necesario que llenes
                    un pequeño formulario que se te presenta en la parte izquierda de esta
                    página. 
                </h2>
        </div>
    </div>
</asp:Content>
