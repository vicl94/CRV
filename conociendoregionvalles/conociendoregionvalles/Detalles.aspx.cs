using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Management;
using conociendoregionvalles.Controls;
using AllPages;

namespace conociendoregionvalles
{
    public partial class Detalles : System.Web.UI.Page
    {
        ManagementCompany ManagementObj = new ManagementCompany();
        Empresa EmpDetails = new Empresa();
        protected void Page_Load(object sender, EventArgs e)
        {
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
            //lblNombre.Text = EmpDetails.INombre;
            //lblNombre.Text = EmpDetails.INombre;
            //ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alertMessage", "alert('" + id + "')", true);
        }
    }
}