using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using AllPages;
using Management;
using conociendoregionvalles.Controls;
using System.Web.UI.HtmlControls;
using System.Web.Script.Serialization;
using Newtonsoft.Json;

namespace conociendoregionvalles
{

    public partial class Listado : System.Web.UI.Page
    {
        
        ManagementClass ManagementObj = new ManagementClass();
        public ListadoClass ControlProp = new ListadoClass();
        FiltroEmpresas Filtro = new FiltroEmpresas();
        public int currentpage;
        protected void Page_Load(object sender, EventArgs e)
        {

            if(Page.IsPostBack) {
                Filtro = JsonConvert.DeserializeObject<FiltroEmpresas>(this.Request.Params.Get("__EVENTARGUMENT"));
                string eventTarget = this.Request.Params.Get("__EVENTTARGET");
                if (Filtro != null)
                {
                    currentpage = Filtro.ICurrentPage;
                    loadEnterprises(Filtro);
                }
            }
            else {
                Filtro.IRecordsByPage = 5;
                Filtro.ICurrentPage = 1;
                currentpage = Filtro.ICurrentPage;
                Filtro.ISearch = "";
                loadEnterprises(Filtro);
            //int.Parse(Session["Paginacion"].ToString());
            }

        }
        public void loadEnterprises(FiltroEmpresas Filtro)
        {
            ControlProp = ManagementObj.getEnterprisesManagementByFilter(Filtro);
            foreach (Empresa Enterprise in ControlProp.IEmpresas)
            {
                EnterpriseBox box1 = (EnterpriseBox)Page.LoadControl("~/Controls/EnterpriseBox.ascx");
                Label lblInsideControl = new Label();
                Label lblResumen = new Label();
                Label lblTelefono = new Label();
                Label lblDomicilio = new Label();
                Label lblcorreo = new Label();
                Label lblRegion = new Label();
                Label lblTag = new Label();
                Image img = new Image();
                HyperLink LinkSeeMore = new HyperLink();

                lblInsideControl = box1.FindControl("lblNombre") as Label;
                lblResumen = box1.FindControl("lblResumen") as Label;
                lblTelefono = box1.FindControl("lblTelefono") as Label;
                lblDomicilio = box1.FindControl("lblDomicilio") as Label;
                lblcorreo = box1.FindControl("lblcorreo") as Label;
                lblRegion = box1.FindControl("lblRegion") as Label;
                lblTag = box1.FindControl("lblTag") as Label;
                img = box1.FindControl("img") as Image;
                LinkSeeMore = box1.FindControl("LinkSeeMore") as HyperLink;

                img.Attributes["src"] = ResolveUrl(Enterprise.Iimgsrc);
                lblInsideControl.Text = Enterprise.INombre;
                lblResumen.Text = Enterprise.IResumen;
                lblTelefono.Text = Enterprise.ITelefono;
                lblDomicilio.Text = Enterprise.IDomicilio;
                lblcorreo.Text = Enterprise.ICorreo;
                lblRegion.Text = Enterprise.IRegion;
                lblTag.Text = Enterprise.ITag;
                if(Enterprise.IPack!=1){
                    LinkSeeMore.NavigateUrl = "../Detalles.aspx?id=" + Enterprise.IId;
                }
                else
                {
                    LinkSeeMore.Visible = false;
                }
                panelEmpresas.ContentTemplateContainer.Controls.Add(box1);
            }
        }
    }
    public class SomeDTO
    {
        public int Pag { get; set; }
        public int IdRegion { get; set; }
        public int IdTag { get; set; }
        public int RecordsByPage { get; set; }
    }
}