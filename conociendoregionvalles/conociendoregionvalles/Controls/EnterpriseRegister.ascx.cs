using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using AllPages;
using Management;

namespace conociendoregionvalles.Controls
{
    public partial class EnterpriseRegister : System.Web.UI.UserControl
    {
        ManagementFilter ManagementObj = new ManagementFilter();
        Empresa Company = new Empresa();

        protected void Page_Load(object sender, EventArgs e)
        {
            
            List<Region> Regiones = new List<Region>();
            List<Tags> Tags = new List<Tags>();

            Regiones = ManagementObj.getAllRegionsManagement();
            Tags = ManagementObj.getAllTagsManagement();

            selectRegion.Items.Clear();
            selectTag.Items.Clear();
            selectRegion.Items.Add(new ListItem("Seleccione alguna comunidad", "0"));
            selectTag.Items.Add(new ListItem("Seleccione alguna categoria", "0"));
            foreach (Region reg in Regiones)
            {
                selectRegion.Items.Add(new ListItem(reg.INombre, reg.IId.ToString()));
            }
            foreach (Tags tag in Tags)
            {
                selectTag.Items.Add(new ListItem(tag.INombre, tag.IId.ToString()));
            }
        }
        protected void RegistingAdd_Click(object sender, EventArgs e)
        {
            Company.INombre = txtCompanyName.Text;
            Company.ITelefono = txtTelefono.Text;
            Company.IDomicilio = txtDomicilio.Text;
            Company.IDescripcion = txtResumen.Value;
            Company.IRegion = selectRegion.SelectedIndex.ToString();
            Company.ITag = selectTag.SelectedIndex.ToString();
            ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alertMessage", "alert('Record Inserted Successfully')", true);

        }
    }
}