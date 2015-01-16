<%@ Page Title="Mis Anuncios" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="MisAnuncios.aspx.cs" Inherits="conociendoregionvalles.MisAnuncios" %>

<%@ Register Src="~/Controls/EnterpriseRegister.ascx" TagPrefix="uc1" TagName="EnterpriseRegister" %>
<%@ Register assembly="Artem.Google" namespace="Artem.Google.UI" tagprefix="artem" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
   <%-- <asp:ImageButton
    ID="PayPalBtn"
    runat="server"
    ImageUrl="https://www.paypalobjects.com/en_GB/i/btn/btn_buynow_LG.gif"
    onclick="PayPalBtn_Click" />--%>
    <%--<script src="http://maps.googleapis.com/maps/api/js?key=AIzaSyDo3B1SIUzUz6NBeUpQYAglsNFbac_ip7o"></script>--%>
    <script type="text/javascript" src="https://maps.googleapis.com/maps/api/js?v=3.exp&sensor=false"></script>
    <script>
        var map;        
        var myCenter=new google.maps.LatLng(20.5388414,-104.0472593);
        //var marker=new google.maps.Marker({
        //    position:myCenter
        //});
        function initialize() {
            var mapProp = {
                center:myCenter,
                zoom: 13,
                mapTypeId:google.maps.MapTypeId.ROADMAP
            };
            map=new google.maps.Map(document.getElementById("map-canvas"),mapProp);
            marker.setMap(map);
            document.getElementById("HLatitude").value = 20.5388414;
            document.getElementById("HLongitude").value = -104.0472593;
            google.maps.event.addListener(marker, 'dragend', function() {
                //alert(marker.position.lat());
                document.getElementById("HLatitude").value = marker.position.lat();
                document.getElementById("HLongitude").value = marker.position.lng();
            }); 
            google.maps.event.addListener(marker, 'click', function() {
                alert(marker.getPosition());
               
            }); 

        };
        google.maps.event.addDomListener(window, 'load', initialize);
        google.maps.event.addDomListener(window, "resize", resizingMap());
        function resizeMap() {
            if(typeof map =="undefined") return;
            setTimeout( function(){resizingMap();} , 400);
        }
        function resizingMap() {
            if(typeof map =="undefined") return;
            var center = map.getCenter();
            google.maps.event.trigger(map, "resize");
            map.setCenter(center); 
        }
        
        var myLatlng = myCenter;
        var mapOptions = {
            zoom: 13,
            center: myLatlng
        }
       
        // Place a draggable marker on the map
        var marker = new google.maps.Marker({
            position: myLatlng,
            map: map,
            draggable:true,
            title:"Drag me!"
        });
        function loadCoord(){
            var lat = document.getElementById("HLatitude").value;
            var lng = document.getElementById("HLongitude").value;
            var latlng = new google.maps.LatLng(lat,lng);
            marker.setPosition(latlng);
        }
</script>
    <script src="Scripts/bootbox.js"></script>
    <div class="row">
            <section id="loginForm">
                <div class="form-horizontal">
                    <h4>Registra tu empresa</h4>
                    <hr />
                    <asp:PlaceHolder runat="server" ID="ErrorMessage" Visible="false">
                        <p class="text-danger">
                            <asp:Literal runat="server" ID="FailureText" />
                        </p>
                    </asp:PlaceHolder>
                <div style="height:20px;">
                </div>
                <asp:UpdatePanel ID="pnlRegistrarEmpresa" runat="server">
                     <ContentTemplate>
                     <div class="form-horizontal">
                            <%--<asp:GridView ID="gvAnuncios" runat="server" CssClass="table table-hover">
                                <Columns>
                                    <asp:CommandField ButtonType="Button" ShowEditButton="True">
                                    <ControlStyle CssClass="ui blue button" />
                                    </asp:CommandField>
                                    <asp:CommandField ShowDeleteButton="True">
                                    <ControlStyle CssClass="negative ui button" />
                                    </asp:CommandField>
                                </Columns>
                            </asp:GridView>--%>

                            <table id="misAnunciosTable" class="table table-striped">
                                  <thead>
                                  <td><b>NOMBRE</b></td>
                                        <td><b>REGION</b></td>
                                        <td><b>CATEGORIA</b></td>
                                        <td><b>PAQUETE</b></td>
                                        <td><b>ESTADO</b></td>
                                        <td colspan="3"><b>PANEL</b></td>
                                 </thead>
                                <tbody>
                                </tbody>
                            </table>   
                        </div>
                    <%--<asp:Button ID="btnRegistrar" runat="server" Text="Registrar Nuevo Anuncio" CssClass="positive ui button" style="font-size:17px;"/>--%>
                    <button type="button" id="modal" class="positive ui button" data-toggle="modal" data-target="#modalregisting" onclick="clearValues()">Registrar Nuevo Anuncio</button>    
                   
                         </div>
                </ContentTemplate>
                </asp:UpdatePanel>
                
                    <!-- Modal -->
                <div class="modal fade bs-example-modal-lg" tabindex="-1" role="dialog" aria-labelledby="myLargeModalLabel" aria-hidden="true" id="myModal">
                  <div class="modal-dialog modal-lg" style="top: 40%; width:1000px; background-color:white;">
                      <div class="modal-header">
                        <button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
                        <h3 id="myModalLabel">Detalle de pagos</h3>
                      </div>
                      <div class="modal-body">
                          <h4><asp:Label ID="txtCompanyNamePayment" runat="server" Text="Add"  ClientIdMode="Static"></asp:Label></h4>
                        <table id="paymentsTable" class="table table-striped">
                                  <thead>
                                        <td><b>REFERENCIA</b></td>
                                        <td><b>FECHA DE PAGO</b></td>
                                        <td><b>FECHA DE VENCIMIENTO</b></td>
                                        <td><b>METODO DE PAGO</b></td>
                                        <td><b>ESTADO</b></td>
                                        <td><b>CANTIDAD</b></td>
                                   </thead>
                                <tbody>
                                </tbody>
                            </table>
                         <div id="paycode" style="display:none">
                             <h4>Por el momento solo contamos con la opción de deposito por medio de </h4>
                             <img src="Images/bancoppel.png" />
                             <h4>Es necesario que acudas a una sucursal de BANCOPPEL y solicites un <b>DEPOSITO REFERENCIADO</b> a la cuenta:</h4>
                             <h3> <b>4169 1602 0272 3525</b> </h3>
                             <h4>E indiques la siguiente referencia: </h4>
                             <h3><b><asp:Label ID="code" runat="server" Text="Add"  ClientIdMode="Static"></asp:Label></b></h3>
                             <h4>Una vez realizado el pago, tu anuncio será visible en un promedio de 24 horas.</h4>
                             <h3>Cantidad a depositar:</h3>
                             <h4>Si es el primer pago de tu anuncio: $180 MXN. (Solo BÁSICO y AVANZADO)</h4>
                             <h3>Mensualidad: </h3>
                             <h4><ul>
                                    <li>GRATIS: $0.00 MXN</li>
                                    <li>BASICO: $250.00 MXN</li>
                                    <li>AVANZADO: No disponible</li>
                                </ul></h4>
                         </div>   
                          <div align="right">
                              <button type="button" class="btn btn-success" id="btnPay">PAGAR</button>
                          </div>
                      </div>
                      <div class="modal-footer">
                        <%--<button class="btn" data-dismiss="modal" aria-hidden="true">Close</button>--%>
                        <button class="btn btn-primary" data-dismiss="modal" aria-hidden="true">CERRAR</button>
                      </div>
                    </div>
                    </div>
                <%--  --%>
                <div class="modal fade bs-example-modal-lg" tabindex="-1" role="dialog" aria-labelledby="myLargeModalLabel" aria-hidden="true" id="modalregisting">
                  <div class="modal-dialog modal-lg" style="top: 40%; width:1000px" id="modalregisting1">
                    <div class="modal-content" id="modalregisting2">
                        <form class="form-horizontal">
                        <fieldset>
                        <!-- Form Name -->
                        <legend>REGISTRO  <button type="button" class="close" data-dismiss="modal">&times;</button></legend>
                          <div id="packageinfo">
                            <div align="center"><h4>Elige tu paquete</h4></div>
                            <div align="center" class="form-inline">
                                <div class="checkbox">
                                  <label><input type="checkbox" value="1" name="paq" checked>GRATIS</label>
                                </div>
                                <div class="checkbox">
                                  <label><input type="checkbox" value="2" name="paq">BASICO</label>
                                </div>
                                <div class="checkbox disabled">
                                  <label><input type="checkbox" value="3" disabled name="paq">AVANZADO</label>
                                </div>
                            </div> 
                              </div>
                            <div id="infBasic" align="center" style="display:none;">
                                <h4><span class="label label-warning">Recuerda que el paquete BÁSICO tiene un costo 
                                y tu anuncio no será visible hasta que realices el pago correspondiente.
                                 </span></h4></div>
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
                                     <a href="#ModalSol" data-toggle="modal")>¿No se encuentra tu comunidad o categoria?... Click aquí</a>
                                    <%--<a href="http://www.conociendoregionvalles.com/conociendoregionvalles/AltaComCat">¿No se encuentra tu comunidad o categoria?... Click aquí</a>--%>
                                 </div>
                                <div class="col-md-3">
                                    <div class="form-group">
                                            <asp:Label runat="server" AssociatedControlID="selectTag">Categoria</asp:Label>
                                            <div>
                                                <select class="form-control" id="selectTag" runat="server" ClientIdMode="Static" style="width:250px">
                                                </select>
                                            </div>
                                        </div>
                                 </div>
                             </div>


                            <div class="row" id="upImg" style="display:none;">
                               <div class="col-md-offset-1 col-md-3">
                                     <asp:FileUpload ID="FileUpload1" runat="server" CssClass="form-control" ClientIdMode="Static" />
                                 </div>
        
                            </div>
                        <div class="row" id="Basic" style="display:none;">
                            <div class="col-md-offset-1 col-md-10">
                                 <div class="form-group">
                                            <asp:Label runat="server" AssociatedControlID="txtResumen">Resumen (Productos y/o servicios, 400 Caracteres)</asp:Label>
                                            <div>
                                                <textarea id="txtResumen" cols="8" rows="5" runat="server" class="form-control" style="width:800px;" draggable="false" ClientIdMode="Static" maxlength="400"></textarea>              
                                            </div>
                                        </div>
                                </div>
                            <div class="col-md-offset-1 col-md-10">
                             <div class="form-group">
                                        <asp:Label runat="server" AssociatedControlID="txtMoreSummary">Más información (Sin límite de caracteres)</asp:Label>
                                        <div>
                                            <textarea id="txtMoreSummary" cols="8" rows="5" runat="server" class="form-control" style="width:800px;" draggable="false" ClientIdMode="Static"></textarea>              
                                        </div>
                                    </div>
                            </div>
                            <div class="col-md-offset-1 col-md-10">
                                <div class="form-group">
                                    <asp:Label runat="server" AssociatedControlID="txtMoreSummary">Ubicación:</asp:Label>
                                    <div id="map-canvas"  style="width:500px;height:380px;"class=""></div>
                                </div>
                            </div>
                            </div>
                            <div class="row">
                               <div align="center">
                                    <asp:Button runat="server" ID="RegistingAdd" Text="REGISTRAR" ClientIdMode="Static" OnClick="RegistingAdd_Click" CssClass="btn btn-primary" />       
                                    <asp:Button ID="UpdateAdd" runat="server" Text="MODIFICAR" ClientIdMode="Static" OnClick="UpdateAdd_Click" CssClass="btn btn-primary" />
                               </div>
                                <div style="height:20px"></div>
                            </div>
                        </fieldset>
                        </form>
                    </div>
                  </div>
                </div>
                       <!-- Modal -->
                <div class="modal fade bs-example-modal-lg" tabindex="-1" role="dialog" aria-labelledby="myLargeModalLabel" aria-hidden="true" id="ModalSol">
                  <div class="modal-dialog modal-lg" style="top: 40%; width:500px; background-color:white;">
                      <div class="modal-header">
                        <button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
                        <h3>Alta de comunidad o categoria</h3>
                      </div>
                      <div class="modal-body">
                         <style>
                            .form-control{
                                width:250px;
                            }
                        </style>
                        <h5>Tipo de alta</h5>
                        <select id="Type" class="form-control">
                          <option value="1">Comunidad</option>
                          <option value="2">Categoria</option>
                        </select>
                        <div style="height:10px"></div>
                        <h5>Nombre</h5>
                        <input type="text" id="newValue" class="form-control" placeholder="Nueva comunidad o categoria...">
                        <div style="height:10px"></div>
                        <button type="button" class="btn btn-primary" id="btnSendSol" data-dismiss="modal">Enviar solicitud</button>
                          <div style="height:10px"></div>
                          <h4>O mandanos un correo a <b>soporte@conociendoregionvalles.com</b> solicitando el alta de comunidad o categoria</h4>

                      </div>
                      <div class="modal-footer">
                        <%--<button class="btn" data-dismiss="modal" aria-hidden="true">Close</button>--%>
                        <button class="btn btn-primary" data-dismiss="modal" aria-hidden="true">CERRAR</button>
                      </div>
                    </div>
                    </div>
                <%--  --%>
                </section>
        </div>
    <asp:Button ID="deleteAdd" runat="server" style="display:none" Text="DeleteHidde" ClientIdMode="Static" OnClick="deleteAdd_Click"/>
    <asp:HiddenField ID="HId" runat="server" ClientIdMode="Static" />
    <asp:HiddenField ID="HPaq" runat="server" ClientIdMode="Static"/>
    <asp:HiddenField ID="HLatitude" runat="server" ClientIdMode="Static" />
    <asp:HiddenField ID="HLongitude" runat="server" ClientIdMode="Static" />
<script>
    var array;
    var arrayPay;
    $(".btnEditar").click(function () {
        alert('Editando');
        //__doPostBack('pnlRegistrarEmpresa', JSON.stringify({ INombre: $("#txtCompanyName").val(), ITelefono: $("#txtTelefono").val(), IDomicilio: $("#txtDomicilio").val(), ICorreo: $("#txtCorreo").val(), IRegion: $("#selectRegion").val(), ITag: $("#selectTag").val(), IResumen: $("#txtResumen").val(), Iimgsrc: $("#FileUpload1").val().split('\\').pop() }));
    });
    $("#RegistingAdd").click(function () {
        //alert($("#FileUpload1").val().split('\\').pop());
        //__doPostBack('pnlRegistrarEmpresa', JSON.stringify({ INombre: $("#txtCompanyName").val(), ITelefono: $("#txtTelefono").val(), IDomicilio: $("#txtDomicilio").val(), ICorreo: $("#txtCorreo").val(), IRegion: $("#selectRegion").val(), ITag: $("#selectTag").val(), IResumen: $("#txtResumen").val(), Iimgsrc: $("#FileUpload1").val().split('\\').pop() }));
    });
    $("#FileUpload1").change(function () {
        var tmppath = URL.createObjectURL(event.target.files[0]);
        $("#ImgLogo").fadeIn("fast").attr('src', tmppath);
    });
    $("#btnSendSol").click(function () {
        sendMail();
        alert("Se abrira el correo electrónico, envia el correo que se generó, se revisará y si es correcta la información, se agregará el registro.");
    });
    $("#btnPay").click(function () {
        $("#paycode").show();
    });
    function sendMail() {
        var link = "mailto:soporte@conociendoregionvalles.com"
                 + "?subject=Solicitud"
                 + "&body=Tipo: " + escape(document.getElementById('Type').value) + " Valor:"+escape(document.getElementById('newValue').value)
        ;
        window.location.href = link;
    }
    $(document).ready(function () {
        tableAdd();  
        $("#HPaq").val(1);
    });
    function tableAdd() {
        array = <%=this.json%>;
        arrayPay = <%=this.jsonPayments%>;
        //alert(array[1].INombre);
       
        var table=$("#misAnunciosTable").find('tbody');
        var state;
        var classLabel;
        var classPack;
        var pack;
        for(var c=0;c<array.length;c++){
            if(array[c].IActivo=="Activo"){
                classLabel="ui green huge label";
            }else{
                classLabel="ui red huge label";
            }
            if(array[c].IPack==1){
                classPack="ui blue huge label";
                pack = "GRATIS";
            }else{
                classPack="ui purple huge label";
                pack = "BASICO";
            }
            table.append($('<tr>')
                    .append($('<td>').append(array[c].INombre))
                    //.append($('<td>').append(array[c].IDomicilio))
                    .append($('<td>').append(array[c].IRegion))
                    .append($('<td>').append(array[c].ITag))
                    .append($('<td>').append($('<a>')
                                     .addClass(classPack)
                                     .append(pack)))
                    .append($('<td>').append($('<a>')
                                     .addClass(classLabel)
                                     .append(array[c].IActivo)))
                    .append($('<td>').append($('<button>')
                                     .addClass('ui teal button')
                                     .attr('value',c)
                                     .attr('type','button')
                                     .attr('data-toggle','modal')
                                     .attr('href','#myModal')
                                     .attr('onClick','pagos(this)')
                                     .append('Detalle de pagos')))

                 //<a href="#myModal" role="button" class="btn" data-toggle="modal">Launch demo modal</a>

                    .append($('<td>').append($('<button>')
                                     .addClass('ui blue button')
                                     .attr('value',c)
                                     .attr('type','button')
                                     .attr('data-toggle','modal')
                                     .attr('href','#modalregisting')
                                     .attr('onClick','editar(this)')
                                     .append('Editar')))
                    .append($('<td>').append($('<button>')
                                     .addClass('negative ui button')
                                     .attr('value',c)
                                     .attr('type','button')
                                     .attr('id','btnEliminar')
                                     .attr('onClick','Delete(this)')
                                     .append('Eliminar')))
                    
            );
        }
    }
    function editar(sender){
        $("#packageinfo").hide();
        if( array[sender.getAttribute('value')].IPack==1){
            $("#Basic").hide();
            $("#upImg").hide();
            $("#infBasic").hide();
        }else{
            $("#Basic").show();
            $("#upImg").show();
        }
        $("#HId").val(array[sender.getAttribute('value')].IId);
        $(".modal-content #txtCompanyName").val( array[sender.getAttribute('value')].INombre);
        $(".modal-content #txtTelefono").val( array[sender.getAttribute('value')].ITelefono);
        $(".modal-content #txtDomicilio").val( array[sender.getAttribute('value')].IDomicilio);
        $(".modal-content #txtCorreo").val( array[sender.getAttribute('value')].ICorreo);
        $(".modal-content #txtResumen").val( array[sender.getAttribute('value')].IResumen);
        $(".modal-content #txtMoreSummary").val( array[sender.getAttribute('value')].IMoreSummary);
        $(".modal-content #ImgLogo").attr('src', array[sender.getAttribute('value')].Iimgsrc);
        $(".modal-content #selectRegion option:contains(" + array[sender.getAttribute('value')].IRegion + ")").attr('selected', 'selected');
        $(".modal-content #selectTag option:contains(" + array[sender.getAttribute('value')].ITag + ")").attr('selected', 'selected');
        $("#HLatitude").val( array[sender.getAttribute('value')].ILatitude);
        $("#HLongitude").val( array[sender.getAttribute('value')].ILongitude);
        $(".modal-content #RegistingAdd").hide();
        $(".modal-content #UpdateAdd").show();
        resizeMap();
        loadCoord();
    }
    function pagos(sender){
        $("#paycode").hide();
        $(".modal-body #code").html("RCRV"+array[sender.getAttribute('value')].IId);
        $(".modal-body #paymentsTable tbody tr").remove();
        var tablePay=$(".modal-body #paymentsTable").find('tbody');
        $("#HId").val(array[sender.getAttribute('value')].IId);
        $(".modal-body #txtCompanyNamePayment").html(array[sender.getAttribute('value')].INombre);
        //alert(JSON.stringify(arrayPay));
        for(var c=0;c<arrayPay.length;c++){
            if($("#HId").val()==parseInt(arrayPay[c].IIdEmpresa)){
                tablePay.append($('<tr>')
                   .append($('<td>').append(arrayPay[c].IReferencia))
                   .append($('<td>').append(arrayPay[c].IFechaDePago))
                   .append($('<td>').append(arrayPay[c].IFechaDeVencimiento))
                   .append($('<td>').append(arrayPay[c].IMetodoDePago))
                   .append($('<td>').append(arrayPay[c].IEstado))
                   .append($('<td>').append(arrayPay[c].ICantidad))
                   );
            } 
        }    
    } 
    function clearValues(){
        $(".modal-content #txtCompanyName").val("");
        $(".modal-content #txtTelefono").val("");
        $(".modal-content #txtDomicilio").val("");
        $(".modal-content #txtCorreo").val("");
        $(".modal-content #txtResumen").val("");
        $(".modal-content #txtMoreSummary").val("");
        $(".modal-content #ImgLogo").attr('src', 'Images/img_no_disp_es.jpg');
        $(".modal-content #selectRegion").val('0');
        $(".modal-content #selectTag").val('0');
        $(".modal-content #RegistingAdd").show();
        $(".modal-content #UpdateAdd").hide();
        document.getElementById("HLatitude").value = 20.5388414;
        document.getElementById("HLongitude").value = -104.0472593;
        $("#packageinfo").show();
        resizeMap();
        loadCoord();
    }
    function Delete(sender){
        bootbox.confirm({
            title: '¿ELIMINAR?',
            message: "¿Deseas eliminar el anuncio de "+ array[sender.getAttribute('value')].INombre+"? Recuerda que si lo eliminas se borrara por completo, incluyendo el registro de pagos.",
            buttons: {
                'cancel': {
                    label: 'No, Me equivoqué',
                    className: 'btn-default pull-left'
                },
                'confirm': {
                    label: 'Si, Eliminar.',
                    //className: 'btn btn-danger'
                }
            },
            callback: function(result) {
                if (result) {
                    $("#HId").val( array[sender.getAttribute('value')].IId);
                    $("#deleteAdd").click();
                    //window.location = $("a[data-bb='confirm']").attr('href');
                }
            }
        });
    }
    $("input:checkbox").click(function() {
        if ($(this).is(":checked")) {
            var group = "input:checkbox[name='" + $(this).attr("name") + "']";
            $(group).prop("checked", false);
            $(this).prop("checked", true);
            if($(this).attr("value")==1){
                $("#Basic").hide();
                $("#upImg").hide();
                $("#infBasic").hide(); 
                var control = $("#FileUpload1");
                control.replaceWith( control = control.clone( true ) );
                $("#ImgLogo").fadeIn("fast").attr('src', 'Images/img_no_disp_es.jpg');
            }else{
                $("#Basic").show();
                $("#upImg").show();
                $("#infBasic").show();
            }
            $("#HPaq").val($(this).attr("value"));
            resizeMap();
        } else {
            $(this).prop("checked", false);
            
        }
    });

</script>

</asp:Content>
