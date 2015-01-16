<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Ayuda.aspx.cs" Inherits="conociendoregionvalles.Ayuda" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <div class="panel-group" id="accordion" role="tablist" aria-multiselectable="true">
  <div class="panel panel-default">
    <div class="panel-heading" role="tab" id="headingOne">
      <h4 class="panel-title">
        <a data-toggle="collapse" data-parent="#accordion" href="#collapseOne" aria-expanded="true" aria-controls="collapseOne">
          ¿Cómo registrar mi anuncio?
        </a>
      </h4>
    </div>
    <div id="collapseOne" class="panel-collapse collapse in" role="tabpanel" aria-labelledby="headingOne">
      <div class="panel-body">
        <p> Es necesario registrarte como usuario de Conociendo Región Valles. Lo puedes hacer por medio
            del formulario que se encuentra <a href="Registro">Aquí</a>.
            Una vez registrado, te saldrá una nueva opción en el menú "Mis Anuncios".
            <img class="img-responsive" src="Images/tmenuanuncios.png" />
            
            Te llevará al listado de los anuncios registrados. Saldrá un botón "REGISTRAR NUEVO ANUNCIO".
            <img class="img-responsive" src="Images/tmisanuncios.png" />

            Al darle click al botón, saldrá una ventana modal en el cual podras registrar tu anuncio.
            En la parte superior puedes elegir el paquete desees.
            <img class="img-responsive" src="Images/tregistroanuncio.png" />
            <img class="img-responsive" src="Images/tanunciobasico.png" />

            Al registrar el anunció se cerrará la ventana y te mostrara los detalles de tu anuncio.
            <img class="img-responsive" src="Images/tanunciosregistrados.png" />

            El paquete GRATIS, no es necesario pagarlo. Se activa al instante que se registra, pero para el
            paquete BASICO, es necesario dar click en DETALLE DE PAGO. Posteriormente dar click en pagar y 
            saldrá la información necesaria para poder realizar el deposito.
            <img class="img-responsive" src="Images/tpagos.png" />

            Al buscar los anuncios en el "Listado de empresas" se mostraran de esta manera.
            <img class="img-responsive" src="Images/tanuncioslistado.png" />

            El anuncio con el paquete BASICO tendra la opción de VER MÁS. Al seleccionarlo nos llevará a una ventana
            con la información detallada del anuncio.
            <img class="img-responsive" src="Images/tdetalles.png" />
        </p>
      </div>
    </div>
  </div>
  <%--<div class="panel panel-default">
    <div class="panel-heading" role="tab" id="headingTwo">
      <h4 class="panel-title">
        <a class="collapsed" data-toggle="collapse" data-parent="#accordion" href="#collapseTwo" aria-expanded="false" aria-controls="collapseTwo">
          Collapsible Group Item #2
        </a>
      </h4>
    </div>
    <div id="collapseTwo" class="panel-collapse collapse" role="tabpanel" aria-labelledby="headingTwo">
      <div class="panel-body">
        Anim pariatur cliche reprehenderit, enim eiusmod high life accusamus terry richardson ad squid. 3 wolf moon officia aute, non cupidatat skateboard dolor brunch. Food truck quinoa nesciunt laborum eiusmod. Brunch 3 wolf moon tempor, sunt aliqua put a bird on it squid single-origin coffee nulla assumenda shoreditch et. Nihil anim keffiyeh helvetica, craft beer labore wes anderson cred nesciunt sapiente ea proident. Ad vegan excepteur butcher vice lomo. Leggings occaecat craft beer farm-to-table, raw denim aesthetic synth nesciunt you probably haven't heard of them accusamus labore sustainable VHS.
      </div>
    </div>
  </div>
  <div class="panel panel-default">
    <div class="panel-heading" role="tab" id="headingThree">
      <h4 class="panel-title">
        <a class="collapsed" data-toggle="collapse" data-parent="#accordion" href="#collapseThree" aria-expanded="false" aria-controls="collapseThree">
          Collapsible Group Item #3
        </a>
      </h4>
    </div>
    <div id="collapseThree" class="panel-collapse collapse" role="tabpanel" aria-labelledby="headingThree">
      <div class="panel-body">
        Anim pariatur cliche reprehenderit, enim eiusmod high life accusamus terry richardson ad squid. 3 wolf moon officia aute, non cupidatat skateboard dolor brunch. Food truck quinoa nesciunt laborum eiusmod. Brunch 3 wolf moon tempor, sunt aliqua put a bird on it squid single-origin coffee nulla assumenda shoreditch et. Nihil anim keffiyeh helvetica, craft beer labore wes anderson cred nesciunt sapiente ea proident. Ad vegan excepteur butcher vice lomo. Leggings occaecat craft beer farm-to-table, raw denim aesthetic synth nesciunt you probably haven't heard of them accusamus labore sustainable VHS.
      </div>
    </div>
  </div>--%>
</div>
</asp:Content>
