using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Management;
using conociendoregionvalles.Controls;
using AllPages;
using System.Web.Script.Serialization;
using Newtonsoft.Json;

namespace conociendoregionvalles
{
    public partial class Detalles : System.Web.UI.Page
    {
        ManagementCompany ManagementObj = new ManagementCompany();
        Empresa EmpDetails = new Empresa();
        List<Video> listaVideos = new List<Video>();
        public string jsonVideos;
        protected void Page_Load(object sender, EventArgs e)
        {
            divAdvance.Visible = false;
            int id = int.Parse(Request.QueryString["id"]);
            EmpDetails = ManagementObj.getCompanyById(id);
            lblNombre.Text = EmpDetails.INombre;
            lblCorreo.Text = EmpDetails.ICorreo;
            lblTelefono.Text = EmpDetails.ITelefono;
            lblRegion.Text = EmpDetails.IRegion;
            lblCategoria.Text = EmpDetails.ITag;
            lblDomicilio.Text = EmpDetails.IDomicilio;
            txtMoreSummary.Value = EmpDetails.IMoreSummary;
            ImgLogo.ImageUrl = EmpDetails.Iimgsrc;
            HLatitude.Value = EmpDetails.ILatitude;
            HLongitude.Value = EmpDetails.ILongitude;
            listaVideos = ManagementObj.getVideosByAdd(id);
            jsonVideos = new JavaScriptSerializer().Serialize(listaVideos);
            if (EmpDetails.IPack == 3)
            {
                divAdvance.Visible = true;
            }
            //lblNombre.Text = EmpDetails.INombre;
            //lblNombre.Text = EmpDetails.INombre;
            //ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alertMessage", "alert('" + id + "')", true);
            
        }
    }
}