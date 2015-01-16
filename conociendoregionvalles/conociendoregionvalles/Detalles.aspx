<%@ Page Title="Detalles" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Detalles.aspx.cs" Inherits="conociendoregionvalles.Detalles" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <%--<script src="http://maps.googleapis.com/maps/api/js?key=AIzaSyDo3B1SIUzUz6NBeUpQYAglsNFbac_ip7o"></script>--%>
    <script type="text/javascript" src="https://maps.googleapis.com/maps/api/js?v=3.exp&sensor=false"></script>
    <script>
        var map;
        var myCenter = new google.maps.LatLng(20.5388414, -104.0472593);
        var latlng = new google.maps.LatLng(20.5388414, -104.0472593);; 
        //var marker=new google.maps.Marker({
        //    position:myCenter
        //});
        function initialize() {
            var mapProp = {
                center: latlng,
                zoom: 13,
                mapTypeId: google.maps.MapTypeId.ROADMAP
            };
            map = new google.maps.Map(document.getElementById("map-canvas"), mapProp);
            marker.setMap(map);
            document.getElementById("HLatitude").value = 20.5388414;
            document.getElementById("HLongitude").value = -104.0472593;
            google.maps.event.addListener(marker, 'dragend', function () {
                //alert(marker.position.lat());
                document.getElementById("HLatitude").value = marker.position.lat();
                document.getElementById("HLongitude").value = marker.position.lng();
            });
            google.maps.event.addListener(marker, 'click', function () {
                alert(marker.getPosition());

            });

        };
        google.maps.event.addDomListener(window, 'load', initialize);
        google.maps.event.addDomListener(window, "resize", resizingMap());
        function resizeMap() {
            if (typeof map == "undefined") return;
            setTimeout(function () { resizingMap(); }, 400);
        }
        function resizingMap() {
            if (typeof map == "undefined") return;
            var center = latlng;
            google.maps.event.trigger(map, "resize");
            map.setCenter(latlng);
        }

        var myLatlng = latlng;
        var mapOptions = {
            zoom: 13,
            center: latlng
        }

        // Place a draggable marker on the map
        var marker = new google.maps.Marker({
            position: myLatlng,
            map: map,
            draggable: false,
        });
        function loadCoord() {
            var lat = document.getElementById("HLatitude").value;
            var lng = document.getElementById("HLongitude").value;
            latlng = new google.maps.LatLng(lat, lng);
            marker.setPosition(latlng);
        }
        $(document).ready(function () {
            loadCoord();
            autoheight($("#txtMoreSummary"));
        });
        function autoheight(a) {
            if (!$(a).prop('scrollTop')) {
                do {
                    var b = $(a).prop('scrollHeight');
                    var h = $(a).height();
                    $(a).height(h - 5);
                }
                while (b && (b != $(a).prop('scrollHeight')));
            };
            $(a).height($(a).prop('scrollHeight') + 20);
        }
</script>
    <div class="ui segment">
        <div class="row">
            <div class="col-md-3">
                        <asp:Image ID="ImgLogo" runat="server" CssClass="imagecontainer" ClientIdMode="Static"  ImageUrl="~/Images/img_no_disp_es.jpg" />
            </div>
            <div align="center">
                <asp:Label ID="lblNombre" runat="server" Text="Reparación de celulares" CssClass="labelname"></asp:Label>
            </div>
            <div style="height:30px;"></div>
            <div align="left">
                  <asp:Label ID="Label2" runat="server" Text="Correo:" CssClass="labeldetails" ></asp:Label>
                  <asp:Label ID="lblCorreo" runat="server" Text="correo@dominio.com" CssClass="labeldetails"></asp:Label>
            </div>
            <div align="left">
                  <asp:Label ID="Label3" runat="server" Text="Telefono:" CssClass="labeldetails"></asp:Label>
                  <asp:Label ID="lblTelefono" runat="server" Text="9999999" CssClass="labeldetails"></asp:Label>
            </div>
            <div align="left">
                  <asp:Label ID="Label4" runat="server" Text="Región:" CssClass="labeldetails"></asp:Label>
                  <asp:Label ID="lblRegion" runat="server" Text="Ameca" CssClass="labeldetails"></asp:Label>
            </div>
            <div align="left">
                  <asp:Label ID="Label5" runat="server" Text="Categoria:" CssClass="labeldetails"></asp:Label>
                  <asp:Label ID="lblCategoria" runat="server" Text="Celulares" CssClass="labeldetails"></asp:Label>
            </div>
            <div align="left">
                  <asp:Label ID="Label6" runat="server" Text="Domicilio:" CssClass="labeldetails"></asp:Label>
                  <asp:Label ID="lblDomicilio" runat="server" Text="A la vuelta #22" CssClass="labeldetails"></asp:Label>
            </div>
        </div>
        
    </div>
    <div class="ui segment">
        <div class="row">
            <div>
                <asp:Label ID="Label7" runat="server" Text="Otros datos" CssClass="labelsumaryhead"></asp:Label>
            </div>
            <div> 
                <textarea id="txtMoreSummary" runat="server" class="form-control" style="max-height:800px; height:auto"  ClientIdMode="Static" readonly="readonly"></textarea>
                <%--<asp:Label ID="lblMoreSummary" runat="server" Text="Más resumen" CssClass="labelsumary"></asp:Label>--%>
            </div>
        </div>
    </div>
    <div class="ui segment">
        <div class="row">
                <div class="form-group" style="margin-left:20px">
                    <asp:Label runat="server" AssociatedControlID="txtMoreSummary">Ubicación:</asp:Label>
                    <div id="map-canvas"  style="width:500px;height:380px;"class=""></div>
                </div>
           
        </div>
    </div>
<asp:HiddenField ID="HLatitude" runat="server" ClientIdMode="Static" />
<asp:HiddenField ID="HLongitude" runat="server" ClientIdMode="Static" />
</asp:Content>
