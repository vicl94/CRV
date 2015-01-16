<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="EnterpriseRegister.ascx.cs" Inherits="conociendoregionvalles.Controls.EnterpriseRegister" %>

     <div class="row">
        <div class="col-md-offset-1 col-md-3">
                        <asp:Image ID="ImgLogo" runat="server" CssClass="imagecontainer" ClientIdMode="Static"  ImageUrl="~/Images/img_no_disp_es.jpg" />
        </div>
        <div class="col-md-3">
            <div class="form-group">
                    <asp:Label runat="server" AssociatedControlID="txtCompanyName" >Nombre de Empresa (Compañia)</asp:Label>
                    <div>
                        <asp:TextBox runat="server" ID="txtCompanyName" CssClass="form-control" ClientIdMode="Static"/>
                    </div>
             </div>
         </div>
         <div class="col-md-3">
                <div class="form-group">
                    <asp:Label runat="server" AssociatedControlID="txtTelefono" >Telefono</asp:Label>
                    <div>
                        <asp:TextBox runat="server" ID="txtTelefono" CssClass="form-control" ClientIdMode="Static"/>
                    </div>
                </div>
            </div>
         <div class="col-md-3">
            <div class="form-group">
                    <asp:Label runat="server" AssociatedControlID="txtDomicilio" >Domicilio</asp:Label>
                    <div>
                        <asp:TextBox runat="server" ID="txtDomicilio" CssClass="form-control" ClientIdMode="Static"/>
                    </div>
             </div>
         </div>
         <div class="col-md-3">
                <div class="form-group">
                    <asp:Label runat="server" AssociatedControlID="txtCorreo" >Correo</asp:Label>
                    <div>
                        <asp:TextBox runat="server" ID="txtCorreo" CssClass="form-control" ClientIdMode="Static"/>      
                    </div>
                </div>
            </div>

         <div class="col-md-3">
            <div class="form-group">
                    <asp:Label runat="server" AssociatedControlID="selectRegion">Comunidad</asp:Label>
                    <div>
                        <select class="form-control" id="selectRegion" runat="server"  ClientIdMode="Static" style="width:250px">
                        </select>
                    </div>
                </div>
         </div>
        <div class="col-md-3">
            <div class="form-group">
                    <asp:Label runat="server" AssociatedControlID="selectTag">Categoria</asp:Label>
                    <div>
                        <select class="form-control" id="selectTag" runat="server"  ClientIdMode="Static" style="width:250px">
                        </select>
                    </div>
                </div>
         </div>


     </div>


    <div class="row">
       <div class="col-md-offset-1 col-md-3">
             <asp:FileUpload ID="FileUpload1" runat="server" CssClass="form-control" ClientIdMode="Static" />
         </div>
        
    </div>
<div class="row">
    <div class="col-md-offset-1 col-md-10">
         <div class="form-group">
                    <asp:Label runat="server" AssociatedControlID="txtResumen">Resumen (Productos y/o servicios)</asp:Label>
                    <div>
                        <textarea id="txtResumen" cols="8" rows="5" runat="server" class="form-control" style="width:800px;" draggable="false" ClientIdMode="Static"></textarea>              
                    </div>
                </div>
        </div>
    </div>
    <div class="row">
       <div class="col-md-offset-1 col-md-10">
            <asp:Button runat="server" ID="RegistingAdd" Text="Registrarse" ClientIdMode="Static" OnClick="RegistingAdd_Click" />       
       </div>
    </div>      

<script>
    $("#FileUpload1").change(function () {
        var tmppath = URL.createObjectURL(event.target.files[0]);
        $("#ImgLogo").fadeIn("fast").attr('src', tmppath);
    });

</script>