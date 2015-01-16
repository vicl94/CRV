using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Management;
using AllPages;

namespace conociendoregionvalles.Controls
{
    public partial class FilterBox : System.Web.UI.UserControl
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
            {

                ManagementFilter ManagementObj = new ManagementFilter();
                List<Region> Regiones = new List<Region>();
                List<Tags> Tags = new List<Tags>();
                Regiones = ManagementObj.getAllRegionsManagement();
                Tags = ManagementObj.getAllTagsManagement();

                selectRegion.Items.Clear();
                selectTag.Items.Clear();
                selectRegion.Items.Add(new ListItem("Todos", "0"));
                selectTag.Items.Add(new ListItem("Todos", "0"));
                foreach (Region reg in Regiones)
                {
                    selectRegion.Items.Add(new ListItem(reg.INombre, reg.IId.ToString()));
                }
                foreach (Tags tag in Tags)
                {
                    selectTag.Items.Add(new ListItem(tag.INombre, tag.IId.ToString()));
                }
            }
            else
            {
            }
        }
    }
}