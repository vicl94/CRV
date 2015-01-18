<%@ Page Title="Inicio" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="conociendoregionvalles._Default" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <%--<script type="text/javascript">
        window.location = "http://www.conociendoregionvalles.com"
    </script>--%>
    <script src="Scripts/semantic.js"></script>
    <script src="//code.jquery.com/jquery-latest.min.js"></script>
    <script src="Scripts/unslider.js"></script>
    <script>
        $(function () {
            $('.banner').unslider({
                speed: 500,               //  The speed to animate each slide (in milliseconds)
                delay: 3000,              //  The delay between slide animations (in milliseconds)
                complete: function () { },  //  A function that gets called after every slide animation
                keys: true,               //  Enable keyboard (left, right) arrow shortcuts
                dots: true,               //  Display dot navigation
                fluid: true              //  Support responsive design. May break non-responsive designs
            });
        });
</script>
    <div style="display: none;">
        <a href="http://www.contadorvisitasgratis.com" target="_Blank" title="contador de visitas">contador de visitas</a><br>
<script type="text/javascript" src="http://counter1.allfreecounter.com/private/countertab.js?c=9b21e19313945f7c5ab522f9e18ec016"></script>
    </div>
    <div class="row">
        <div class="container-fluid">
<style type="text/css">
.item{
    background: #333;    
    text-align: center;
}
.carousel{
    margin-top: 20px;
}
.bs-example{
	margin: 20px;
}
</style>
 <div class="bs-example">
    <div id="myCarousel" class="carousel slide" data-interval="3000" data-ride="carousel">
    	<!-- Carousel indicators -->
        <ol class="carousel-indicators">
            <li data-target="#myCarousel" data-slide-to="0" class="active"></li>
            <li data-target="#myCarousel" data-slide-to="1"></li>
            <li data-target="#myCarousel" data-slide-to="2"></li>
        </ol>   
       <!-- Carousel items -->
        <div class="carousel-inner">
            <div class="active item">
                <img src="Images/home.jpg" class="img-responsive" style="height:inherit; margin:0 auto;"/>
            </div>
            <div class="item">
                <img src="Images/Untitled-1.jpg" class="img-responsive" style="height:inherit; margin:0 auto;"/>
            </div>
            <div class="item">
               <img src="Images/CRV%20LOGO.png" class="img-responsive" style="height:inherit; margin:0 auto;"/>
            </div>
        </div>
        <!-- Carousel nav -->
        <a class="carousel-control left" href="#myCarousel" data-slide="prev">
            <span class="glyphicon glyphicon-chevron-left"></span>
        </a>
        <a class="carousel-control right" href="#myCarousel" data-slide="next">
            <span class="glyphicon glyphicon-chevron-right"></span>
        </a>
    </div>
</div>
            </div>
        </div>
    <div class="row">
        <div class="col-md-4">
            <h2>Todo lo que buscas en tan solo algunos click's</h2>
            <p>Encuentra todo desde la comodidad de tu hogar en un solo sitio. Para armar una fiesta, remodelar tu casa, arreglar tu coche, etc.
                Somos tu mejor solución.
            </p>
            <p>
                <a class="btn btn-primary" href="About">CONOCENOS &raquo;</a>
               
            </p>
        </div>
        <div class="col-md-4">
            <h2>¿Ofreces o vendes algun servicio o producto?</h2>
            <p>
                Registrate para que toda la región valles pueda ver tus productos y/o servicios y así obtener más ganancias.
            </p>
            <p>
                 <a class="btn btn-primary" href="Registro">REGISTRATE &raquo;</a>
            </p>
        </div>
        <div class="col-md-4">
            <h2>Nuevas actualizaciones</h2>
            <p>
                Dia con dia estaremos realizando actualizaciones para ofrecerte un mejor servicio y puedes así disfrutar
                de las mejores caracteristicas que te ofrece Conociendo Región Valles.
            </p>
            <p>
               
            </p>
        </div>
    </div>

</asp:Content>
