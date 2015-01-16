<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="SignUp.ascx.cs" Inherits="conociendoregionvalles.Controls.SignUp" %>
<p class="text-danger">
        <asp:Literal runat="server" ID="ErrorMessage" />
    </p>

    <div class="form-horizontal">
        
        <asp:ValidationSummary runat="server" id="Validator" CssClass="text-danger" />
        <div class="form-group">
            <asp:Label runat="server" AssociatedControlID="txtUserName" CssClass="col-md-2 control-label">Nombre de usuario</asp:Label>
            <div class="col-md-10">
                <asp:TextBox runat="server" ID="txtUserName" CssClass="form-control" />
                <asp:RequiredFieldValidator runat="server" ControlToValidate="txtUserName"
                    CssClass="text-danger" ErrorMessage="El campo de nombre de usuario es obligatorio." />
            </div>
        </div>
        <div class="form-group">
            <asp:Label runat="server" AssociatedControlID="txtNombres" CssClass="col-md-2 control-label">Nombre(s)</asp:Label>
            <div class="col-md-10">
                <asp:TextBox runat="server" ID="txtNombres" CssClass="form-control" />
                <asp:RequiredFieldValidator runat="server" ControlToValidate="txtNombres"
                    CssClass="text-danger" ErrorMessage="El campo de Nombre(s) de usuario es obligatorio." />
            </div>
        </div>
        <div class="form-group">
            <asp:Label runat="server" AssociatedControlID="txtApellidos" CssClass="col-md-2 control-label">Apellido(s)</asp:Label>
            <div class="col-md-10">
                <asp:TextBox runat="server" ID="txtApellidos" CssClass="form-control" />
                <asp:RequiredFieldValidator runat="server" ControlToValidate="txtApellidos"
                    CssClass="text-danger" ErrorMessage="El campo de Apellido(s) de usuario es obligatorio." />
            </div>
        </div>
        <div class="form-group">
            <asp:Label runat="server" AssociatedControlID="txtCorreo" CssClass="col-md-2 control-label">E-Mail</asp:Label>
            <div class="col-md-10">
                <asp:TextBox runat="server" ID="txtCorreo" CssClass="form-control" />
                <asp:RegularExpressionValidator runat="server" 
                    ErrorMessage="Correo no valido" CssClass="text-danger" ControlToValidate="txtCorreo" 
                    ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*"> </asp:RegularExpressionValidator>
                <%-- <asp:RequiredFieldValidator runat="server" ControlToValidate="txtResumen"
                    CssClass="text-danger" ErrorMessage="El campo de Resumen es obligatorio." />--%>
            </div>
        </div>
        <div class="form-group">
            <asp:Label runat="server" AssociatedControlID="txtPassword" CssClass="col-md-2 control-label">Contraseña</asp:Label>
            <div class="col-md-10">
                <asp:TextBox runat="server" ID="txtPassword" TextMode="Password" CssClass="form-control" />
                <asp:RequiredFieldValidator runat="server" ControlToValidate="txtPassword"
                    CssClass="text-danger" ErrorMessage="El campo de contraseña es obligatorio." />
            </div>
        </div>
        <div class="form-group">
            <asp:Label runat="server" AssociatedControlID="ConfirmPassword" CssClass="col-md-2 control-label">Confirmar contraseña</asp:Label>
            <div class="col-md-10">
                <asp:TextBox runat="server" ID="ConfirmPassword" TextMode="Password" CssClass="form-control" />
                <asp:RequiredFieldValidator runat="server" ControlToValidate="ConfirmPassword"
                    CssClass="text-danger" Display="Dynamic" ErrorMessage="El campo de confirmación de contraseña es obligatorio." />
                <asp:CompareValidator runat="server" ControlToCompare="txtPassword" ControlToValidate="ConfirmPassword"
                    CssClass="text-danger" Display="Dynamic" ErrorMessage="La contraseña y la contraseña de confirmación no coinciden." />
            </div>
        </div>
        <div class="form-group">
                    <div class="col-md-offset-2 col-md-10">
                       <%--<asp:Button runat="server" Text="Registrarse" CssClass="btn btn-default" />--%>
                        <asp:Button runat="server" ID="btnRegistrar" Text="Registrarse" CssClass="positive ui button" OnClick="btnRegistrar_Click" />
                    </div>
        </div>
    </div>
<button  style="display: none;" type="button" id="modal" class="btn btn-primary" data-toggle="modal" data-target=".bs-example-modal-lg">Large modal</button>

<div class="modal fade bs-example-modal-lg" tabindex="-1" role="dialog" aria-labelledby="myLargeModalLabel" aria-hidden="true">
  <div class="modal-dialog modal-lg">
    <div class="modal-content">
        <form class="form-horizontal">
        <fieldset>
        <!-- Form Name -->
        <legend>Registro</legend>
             <asp:Label ID="lblEstado" runat="server" Text="La contraseña no es valida. Por favor ingrese otra" CssClass="labels"></asp:Label>
             <asp:Button runat="server" ID="btnLogin" Text="Iniciar sesion" CssClass="positive ui button" />
        </fieldset>
        </form>
       
    </div>
  </div>
</div>