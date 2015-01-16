<%@ Page Title="Listado" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Listado.aspx.cs" Inherits="conociendoregionvalles.Listado" %>

<%@ Register Src="~/Controls/FilterBox.ascx" TagPrefix="uc1" TagName="FilterBox" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
<%--    <script type="text/javascript">
        window.location = "http://www.conociendoregionvalles.com/Proximamente.html"
    </script>--%>
    <script src="Scripts/jquery.simplePagination.js"></script>
    <link href="css/simplePagination.css" rel="stylesheet" />
    <div class="ui grid">
  <div class="three wide column">
    <div class="ui segment">
       <uc1:FilterBox runat="server" id="FilterBox1" />
    </div>
  </div>
  <div class="ten wide column">
    <div class="ui segment" >
        <%--<div class="jumbotron" style="background-color:#303030;background-image:none;">--%>
            <asp:UpdatePanel ID="panelEmpresas" runat="server" UpdateMode="Conditional">
                <ContentTemplate>
                  
                </ContentTemplate>
            </asp:UpdatePanel>
        <div class="text-center"><div id="pag"></div></div>
          <%--   paginacion custom
             <nav class="text-center" id="paginationcontainer">
                        <ul class="pagination pagination-lg" id="pagination">
                            <li><a href="javascript:void(0)" onclick="before();"><span aria-hidden="true">&laquo;</span><span class="sr-only">Previous</span></a></li>
                            <li id="last"><a href="javascript:void(0)" onclick="after();"><span aria-hidden="true">&raquo;</span><span class="sr-only">Next</span></a></li>
                        </ul>
                    </nav>--%>
      <%--  </div>--%>
    </div>
  </div>
<%--  <div class="three wide column">
    <div class="ui segment"><b>Column Three</b> Donec semper mollis condimentum. Aenean eget rutrum magna. Mauris ornare nibh scelerisque turpis lobortis dignissim. Etiam eleifend justo eget quam semper vulputate. Nulla et risus convallis velit molestie iaculis. Aliquam erat volutpat. </div>
  </div>--%>
</div>

    
    <script>
        var current;
        var paginas;
        $(document).ready(function () {
            $('.ui.dropdown')
              .dropdown({
                  on: 'hover'
              })
            ;
            current = <%: this.currentpage%>;
            var RecorsByPage = $( "#selectRecords" ).val();
            var TotalEmpresas =  <%=this.ControlProp.ITotalEmpresas%>;
            paginas = TotalEmpresas/RecorsByPage;
            if((paginas - Math.floor(paginas)) != 0 ){
                paginas = paginas + 1;
            }
            paginas = parseInt(paginas);
            //paginación custom
            //for(var i=0;i<paginas;i++){
            //    if(i==(current-1)){
            //        var string = '<li class="active"><a href="javascript:void(0)" id="'+(i+1)+'" onclick="update(this)">'+(i+1)+'</a></li>';
            //    }else{
            //        var string = '<li><a href="javascript:void(0)" id="'+(i+1)+'" onclick="update(this)">'+(i+1)+'</a></li>';
            //    }
                
            //    $(string).insertBefore($('ul.pagination li:last'));
            //}
            $('#pag').pagination({
                pages:paginas,
                itemsOnPage: RecorsByPage,
                cssStyle: 'light-theme',
                hrefTextPrefix: 'javascript:void(0)\"  onclick=\"update(this);\"',
                currentPage:current
            });
        });
        function before() {
            if(current>1){
                var before = current - 1;
                __doPostBack('panelEmpresas', JSON.stringify({ ICurrentPage : before, IIdRegion:$( "#selectRegion" ).val(),IIdTag:$( "#selectTag" ).val(), IRecordsByPage:$( "#selectRecords" ).val(),ISearch:$( "#txtSearch" ).val() }));
            }
        }
        function after() {
            if(current<paginas){
                var after = current + 1;
                __doPostBack('panelEmpresas', JSON.stringify({ ICurrentPage : after, IIdRegion:$( "#selectRegion" ).val(),IIdTag:$( "#selectTag" ).val(), IRecordsByPage:$( "#selectRecords" ).val(),ISearch:$( "#txtSearch" ).val() }));
            }
        }
        function update(ele) {

            __doPostBack('panelEmpresas', JSON.stringify({ ICurrentPage :ele.id, IIdRegion:$( "#selectRegion" ).val(),IIdTag:$( "#selectTag" ).val(), IRecordsByPage:$( "#selectRecords" ).val(),ISearch:$( "#txtSearch" ).val() }));
        }
        $( "#btnBuscar" ).click(function() {
           // alert($( "#selectTag" ).val());
            __doPostBack('panelEmpresas', JSON.stringify({ ICurrentPage:1 ,IIdRegion:$( "#selectRegion" ).val() , IIdTag:$( "#selectTag" ).val(), IRecordsByPage:$( "#selectRecords" ).val(),ISearch:$( "#txtSearch" ).val() }));
        });
        $( "#len" ).click(function() {
            $( "#btnBuscar" ).click();
             //alert("Buscando");
            //__doPostBack('panelEmpresas', JSON.stringify({ ICurrentPage:1 ,IIdRegion:$( "#selectRegion" ).val() , IIdTag:$( "#selectTag" ).val(), IRecordsByPage:$( "#selectRecords" ).val() }));
        });
        function searchLocations() {
            //your code
            __doPostBack('panelEmpresas', JSON.stringify({ ICurrentPage:1 ,IIdRegion:$( "#selectRegion" ).val() , IIdTag:$( "#selectTag" ).val(), IRecordsByPage:$( "#selectRecords" ).val(),ISearch: $( "#txtSearch" ).val()}));
        }
    </script>
</asp:Content>
