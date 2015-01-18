using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Microsoft.AspNet.Identity;
using Microsoft.AspNet.Identity.EntityFramework;
using Microsoft.AspNet.Identity.Owin;
using conociendoregionvalles.Models;
using Management;
using conociendoregionvalles.Controls;
using AllPages;
using System.Web.Script.Serialization;
using Newtonsoft.Json;
using System.Text;
using PayPal;
using PayPal.Api.Payments;

namespace conociendoregionvalles
{
    public partial class MisAnuncios : System.Web.UI.Page
    {
        public string json;
        public string jsonPayments;
        public string jsonVideos;
        public string idCompany;
        ManagementFilter ManagementObjF = new ManagementFilter();
        protected void Page_Load(object sender, EventArgs e)
        {
            getAddbyUser();
            if (!Page.IsPostBack)
            {
                List<Region> Regiones = new List<Region>();
                List<Tags> Tags = new List<Tags>();

                Regiones = ManagementObjF.getAllRegionsManagement();
                Tags = ManagementObjF.getAllTagsManagement();

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
        }

        protected void RegistingAdd_Click(object sender, EventArgs e)
        {
            Empresa RegEmp = new Empresa();
            string mensaje,ext;
            ext = ".jpg"; 
            ManagementCompany ManagementObj = new ManagementCompany();
            Guid UniqueID = Guid.NewGuid();

            RegEmp.Iimgsrc = "Images/img_no_disp_es" + ext;
            RegEmp.INombre = txtCompanyName.Text;
            RegEmp.IDomicilio = txtDomicilio.Text;
            RegEmp.ICorreo = txtCorreo.Text;
            RegEmp.IRegion = selectRegion.Value.ToString();
            RegEmp.ITag = selectTag.Value.ToString();
            RegEmp.ITelefono = txtTelefono.Text;
            RegEmp.IUserId = Context.User.Identity.GetUserId();
            RegEmp.IPack = int.Parse(HPaq.Value);
            if (RegEmp.IPack == 1)
            {
                RegEmp.IResumen = String.Empty;
                RegEmp.IMoreSummary = String.Empty;
                RegEmp.ILatitude = String.Empty;
                RegEmp.ILongitude = String.Empty;
            }
            if (RegEmp.IPack == 2 || RegEmp.IPack == 3)
            {
                if (FileUpload1.HasFile)
                {
                    ext = System.IO.Path.GetExtension(FileUpload1.FileName);
                    FileUpload1.SaveAs(Server.MapPath("~/Images/") + UniqueID + ext);
                    RegEmp.Iimgsrc = "Images/" + UniqueID + ext;
                }
                RegEmp.IResumen = txtResumen.Value;
                RegEmp.IMoreSummary = txtMoreSummary.Value;
                RegEmp.ILatitude = HLatitude.Value;
                RegEmp.ILongitude = HLongitude.Value;
                if (RegEmp.IPack == 3)
                {
                    RegEmp.IVideos = new JavaScriptSerializer().Deserialize<List<Video>>(HJsonVideo.Value);
                    //ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alertMessage", "alert('" + RegEmp.IVideos[0].Url + "')", true);
                }
            }
            //ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alertMessage", "alert('Name: " + RegEmp.IVideos[0].IName +" URL: "+ RegEmp.IVideos[0].IUrl + "')", true);
            mensaje = ManagementObj.insertNewCompany(RegEmp);
            getAddbyUser();
        
        }

        protected void UpdateAdd_Click(object sender, EventArgs e)
        {
            Empresa RegEmp = new Empresa();
            string mensaje;
            ManagementCompany ManagementObj = new ManagementCompany();
            Guid UniqueID = Guid.NewGuid();
            string ext = System.IO.Path.GetExtension(FileUpload1.FileName);
            FileUpload1.SaveAs(Server.MapPath("~/Images/") + UniqueID + ext);
            RegEmp.IId = int.Parse(HId.Value);
            RegEmp.INombre = txtCompanyName.Text;
            RegEmp.IDomicilio = txtDomicilio.Text;
            RegEmp.ICorreo = txtCorreo.Text;
            RegEmp.IResumen = txtResumen.Value;
            RegEmp.IMoreSummary = txtMoreSummary.Value;
            RegEmp.ILatitude = HLatitude.Value;
            RegEmp.ILongitude = HLongitude.Value;
            if (FileUpload1.HasFile)
            {
                RegEmp.Iimgsrc = "Images/" + UniqueID + ext;
            }
            else
            {
                RegEmp.Iimgsrc = "NC";
            }
          
            RegEmp.IRegion = selectRegion.Value.ToString();
            RegEmp.ITag = selectTag.Value.ToString();
            RegEmp.ITelefono = txtTelefono.Text;
            RegEmp.IUserId = Context.User.Identity.GetUserId();
            mensaje = ManagementObj.UpdateCompany(RegEmp);
            getAddbyUser();
         
        }

        protected void deleteAdd_Click(object sender, EventArgs e)
        {
            int add=int.Parse(HId.Value);
            ManagementCompany ManagementObj = new ManagementCompany();
            ManagementObj.deleteCompany(add);
            getAddbyUser();
        }
        public void getAddbyUser()
        {
            ManagementUser ManagementObjU = new ManagementUser();
            ManagementCompany ManagementObjC = new ManagementCompany();
            var id = User.Identity.GetUserId();
            if (id == null) { Response.Redirect("~/Default.aspx"); }
            var listado = ManagementObjU.getEnterpriseByUser(id);
            var listadoPagos = ManagementObjC.getPaymentsByUser(id);
            var listadoVideos = ManagementObjC.getVideosByUser(id);
            json = new JavaScriptSerializer().Serialize(listado);
            jsonPayments = new JavaScriptSerializer().Serialize(listadoPagos);
            jsonVideos = new JavaScriptSerializer().Serialize(listadoPagos);
        }

        protected void PayPalBtn_Click(object sender, ImageClickEventArgs e)
        {
            string business = "sergioglez25@hotmail.com";
            string itemName = "Registro - Conociendo Región Valles";
            double itemAmount = 20;
            string currencyCode = "MXN";

            StringBuilder ppHref = new StringBuilder();

            ppHref.Append("https://www.paypal.com/cgi-bin/webscr?cmd=_xclick");
            ppHref.Append("&business=" + business);
            ppHref.Append("&item_name=" + itemName);
            ppHref.Append("&amount=" + itemAmount.ToString("#.00"));
            ppHref.Append("&currency_code=" + currencyCode);

            Response.Redirect(ppHref.ToString(), true);

            //Dictionary<string, string> sdkConfig = new Dictionary<string, string>();
            //sdkConfig.Add("mode", "sandbox");
            //string accessToken = new OAuthTokenCredential("AR1MHBBS16gZ5MGiRryUU8ChhRoSSjz_YTZe8lfE-LQS1sRUwl0qvFq56RN6", "EHz1txCsLkgkM4JI9B4gG3wz9RpFQjKfahkVeyTTQeFTT3XNdKoSpnednU0d", sdkConfig).GetAccessToken();
            ////ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alertMessage", "alert('token:  " + accessToken + "')", true);
            //APIContext apiContext = new APIContext(accessToken);
            //apiContext.Config = sdkConfig;

            //Amount amnt = new Amount();
            //amnt.currency = "USD";
            //amnt.total = "12";

            //List<Transaction> transactionList = new List<Transaction>();
            //Transaction tran = new Transaction();
            //tran.description = "creating a payment";
            //tran.amount = amnt;
            //transactionList.Add(tran);

            //Payer payr = new Payer();
            //payr.payment_method = "paypal";

            //RedirectUrls redirUrls = new RedirectUrls();
            //redirUrls.cancel_url = "https://devtools-paypal.com/guide/pay_paypal/dotnet?cancel=true";
            //redirUrls.return_url = "https://devtools-paypal.com/guide/pay_paypal/dotnet?success=true";

            //Payment pymnt = new Payment();
            //pymnt.intent = "sale";
            //pymnt.payer = payr;
            //pymnt.transactions = transactionList;
            //pymnt.redirect_urls = redirUrls;

            //Payment createdPayment = pymnt.Create(apiContext);
        }
    }
}