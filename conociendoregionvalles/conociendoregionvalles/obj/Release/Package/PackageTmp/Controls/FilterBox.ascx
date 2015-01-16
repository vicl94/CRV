<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="FilterBox.ascx.cs" Inherits="conociendoregionvalles.Controls.FilterBox" %>
           
<div class="ui icon input">
              <input type="text" placeholder="Search...">
              <i class="circular search icon"></i>
           </div>
           <div id="listregions" runat="server" >
           </div>
<div class="divfilter"></div>
<div>
 <select class="form-control" id="selectRegion" runat="server"  ClientIdMode="Static">
        <option value="0">TODOS</option>
 </select>
</div>
<div style="height:10px"></div>
<div>
 <select class="form-control" id="selectTag" runat="server"  ClientIdMode="Static">
      <option value="0">TODOS</option>
 </select>
    </div>
<div style="height:10px"></div>
<div>
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

