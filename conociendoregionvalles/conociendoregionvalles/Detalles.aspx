<%@ Page Title="Detalles" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Detalles.aspx.cs" Inherits="conociendoregionvalles.Detalles" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <%--<script src="http://maps.googleapis.com/maps/api/js?key=AIzaSyDo3B1SIUzUz6NBeUpQYAglsNFbac_ip7o"></script>--%>
    <script type="text/javascript" src="https://maps.googleapis.com/maps/api/js?v=3.exp&sensor=false"></script>
    <link rel="stylesheet" href="//blueimp.github.io/Gallery/css/blueimp-gallery.min.css">
    <link href="css/bootstrap-image-gallery.css" rel="stylesheet" />
    <script src="Scripts/bootstrap-image-gallery.js"></script>
    <script>
        // 2. This code loads the IFrame Player API code asynchronously.
        var tag = document.createElement('script');

        tag.src = "https://www.youtube.com/iframe_api";
        var firstScriptTag = document.getElementsByTagName('script')[0];
        firstScriptTag.parentNode.insertBefore(tag, firstScriptTag);

        // 3. This function creates an <iframe> (and YouTube player)
        //    after the API code downloads.
        var player;
        function onYouTubeIframeAPIReady() {
            player = new YT.Player('player', {
                height: '315',
                width: '420',
                videoId: 'o322TuoOcVA',
                events: {
                    'onReady': onPlayerReady,
                    'onStateChange': onPlayerStateChange
                }
            });
        }

        // 4. The API will call this function when the video player is ready.
        function onPlayerReady(event) {
            //event.target.playVideo();
        }

        // 5. The API calls this function when the player's state changes.
        //    The function indicates that when playing a video (state=1),
        //    the player should play for six seconds and then stop.
        var done = false;
        function onPlayerStateChange(event) {
            //if (event.data == YT.PlayerState.PLAYING && !done) {
            //    setTimeout(stopVideo, 6000);
            //    done = true;
            //}
        }
        function stopVideo() {
            player.stopVideo();
        }
        function changevideo(url) {
            var params = YouTubeGetID(url);
            player.loadVideoById(params, 0, "large")
        }
        function YouTubeGetID(url) {
            var ID = '';
            url = url.replace(/(>|<)/gi, '').split(/(vi\/|v=|\/v\/|youtu\.be\/|\/embed\/)/);
            if (url[2] !== undefined) {
                ID = url[2].split(/[^0-9a-z_]/i);
                ID = ID[0];
            }
            else {
                ID = url;
            }
            return ID;
        }
    </script>
    <script>
        var map;
        var myCenter = new google.maps.LatLng(20.5388414, -104.0472593);
        var latlng = new google.maps.LatLng(20.5388414, -104.0472593);;
        var jsonFiles;
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
            loadFiles();
        });
        function loadFiles() {
            jsonFiles = <%=this.jsonFiles%>;
            var tableVideos=$("#videoTable").find('tbody');
            for(var c=0;c<jsonFiles.length;c++){
                if(jsonFiles[c].IFileType=='YouTube'){
                tableVideos.append($('<tr>')
                   .append($('<td>').attr('onclick','changevideo("'+jsonFiles[c].IUrl+'")')
                   .append($('<label>').attr('onclick','changevideo("'+jsonFiles[c].IUrl+'")').text(jsonFiles[c].IName))));
                }
                if(jsonFiles[c].IFileType=='Image'){
                    $('#divImages').prepend(' <a href="'+jsonFiles[c].IUrl+jsonFiles[c].IExt+'"data-gallery><img class="imagecontainer" src="'+jsonFiles[c].IUrl+jsonFiles[c].IExt+'" /></a>')
                    //$('#divImages').prepend('<img class="imagecontainer" src="'+jsonFiles[c].IUrl+jsonFiles[c].IExt+'" />')
                }
                if(jsonFiles[c].IFileType=='Audio'){
                    $('#divAudios').prepend('<audio controls="controls" src="'+jsonFiles[c].IUrl+jsonFiles[c].IExt+'"></audio>')
                    //$('#divImages').prepend('<img class="imagecontainer" src="'+jsonFiles[c].IUrl+jsonFiles[c].IExt+'" />')
                }
            }

        }
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
        $(window).resize(function () {
            resizeMap();
        });
        function resizeMap() {
            if (typeof map == "undefined") return;
            setTimeout(function () { resizingMap(); }, 400);
        }
        function resizingMap() {
            if (typeof map == "undefined") return;
            var center = map.getCenter();
            google.maps.event.trigger(map, "resize");
            map.setCenter(center);
        }
</script>
    <div class="ui segment">
        <div class="row">
            <div class="col-md-3">
                        <asp:Image ID="ImgLogo" runat="server" CssClass="imagecontainerdetails" ClientIdMode="Static"  ImageUrl="~/Images/img_no_disp_es.jpg" />
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
                    <div id="map-canvas"style="width:500px;height:380px;"class="span6"></div>
                </div>
           
        </div>
    </div>
    <div class="ui segment" runat="server" id="divAdvance">
        <div class="row">
            <div align="center"><h3>Videos</h3></div>
       <div class="col-md-5"> 
        <div id="player"></div>
           </div>
        <div class="col-md-4">
            <table id="videoTable" class="table table-striped">
                                  <thead>
                                        <td><b>LISTA DE VIDEOS</b></td> 
                                   </thead>
                                <tbody>
                                </tbody>
            </table>
         </div>
            </div>
         <div class="row">
             <div align="center"><h3>Galeria de imagenes</h3></div>
             
            <div class="col-md-10" id="divImages"> 
                <div id="links">
                    
                </div>
           </div>
             </div>
        <div class="row">
             <div align="center"><h3>Audios</h3></div>
             <div class="col-md-10" id="divAudios"> 

            </div>
         </div>
        
    </div>
    
<!-- The Bootstrap Image Gallery lightbox, should be a child element of the document body -->
<div id="blueimp-gallery" class="blueimp-gallery">
    <!-- The container for the modal slides -->
    <div class="slides"></div>
    <!-- Controls for the borderless lightbox -->
    <h3 class="title"></h3>
    <a class="prev">‹</a>
    <a class="next">›</a>
    <a class="close">×</a>
    <a class="play-pause"></a>
    <ol class="indicator"></ol>
    <!-- The modal dialog, which will be used to wrap the lightbox content -->
    <div class="modal fade">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" aria-hidden="true">&times;</button>
                    <h4 class="modal-title"></h4>
                </div>
                <div class="modal-body next"></div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-default pull-left prev">
                        <i class="glyphicon glyphicon-chevron-left"></i>
                        Previous
                    </button>
                    <button type="button" class="btn btn-primary next">
                        Next
                        <i class="glyphicon glyphicon-chevron-right"></i>
                    </button>
                </div>
            </div>
        </div>
    </div>
</div>
<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.10.2/jquery.min.js"></script>
<!-- Bootstrap JS is not required, but included for the responsive demo navigation and button states -->
<script src="http://netdna.bootstrapcdn.com/bootstrap/3.0.2/js/bootstrap.min.js"></script>
<script src="http://blueimp.github.io/Gallery/js/jquery.blueimp-gallery.min.js"></script>
<script src="Scripts/bootstrap-image-gallery.js"></script>
<script src="Scripts/demo.js"></script>
<asp:HiddenField ID="HLatitude" runat="server" ClientIdMode="Static" />
<asp:HiddenField ID="HLongitude" runat="server" ClientIdMode="Static" />
</asp:Content>
