<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="FilterBox.ascx.cs" Inherits="conociendoregionvalles.Controls.FilterBox" %> 
<div class="ui search" align="center">
  <div class="ui icon input">
    <input class="prompt" type="text" placeholder="BUSCAR..." runat="server" ClientIdMode="Static" id="txtSearch" onkeydown="if (window.event.keyCode == 13) 
{
    searchLocations();
    event.returnValue=false; 
    event.cancel = true;
    
    
}" />
    <i class="search icon"  id="len"></i>
  </div>
  <div class="results"></div>
</div>
           <div id="listregions" runat="server" >
           </div>

<div>
<h5>Regiones</h5>
 <select class="form-control" id="selectRegion" runat="server"  ClientIdMode="Static">
        <option value="0">TODOS</option>
 </select>
</div>
<div style="height:10px"></div>
<div>
<h5>Categorias</h5>
 <select class="form-control" id="selectTag" runat="server"  ClientIdMode="Static">
      <option value="0">TODOS</option>
 </select>
    </div>
<div style="height:10px"></div>
<div>
<h5>Registros por página</h5>
 <select class="form-control" id="selectRecords" style="width:70px;" runat="server" ClientIdMode="Static">
     <option value="5">5</option>
     <option value="6">6</option>
     <option value="7">7</option>
     <option value="8">8</option>
     <option value="9">9</option>
     <option value="10">10</option>
 </select>
</div>
<div style="height:15px"></div>
<div class="ui secondary button" id="btnBuscar">
  BUSCAR
</div>

