using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using AllPages;
using Management;
using conociendoregionvalles.Models;
using Microsoft.AspNet.Identity;
using Microsoft.AspNet.Identity.EntityFramework;
using Microsoft.AspNet.Identity.Owin;

namespace conociendoregionvalles.Controls
{
    public partial class SignUp : System.Web.UI.UserControl
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {

                //Your code for Bind data 

            }
        }

        protected void btnRegistrar_Click(object sender, EventArgs e)
        {
            //ManagementUser ManagementObj = new ManagementUser();
            //Usuario Usuario = new Usuario();
            //Usuario.INombres = txtNombres.Text;
            //Usuario.IApellidos = txtApellidos.Text;
            //Usuario.IUserName = txtUserName.Text;
            //Usuario.ICorreo = txtCorreo.Text;
            //Usuario.IPassword = txtPassword.Text;

            //if(ManagementObj.insertNewUserManagement(Usuario)==1)
            //{
            //    lblEstado.Text = "Usuario creado exitosamente";
            //    Response.AddHeader("REFRESH", "5;URL=Login");
            //    //Session["UserName"] = txtUserName.Text;
            //    //Session["Nombres"] = txtNombres.Text;

            //}
            //else
            //{
            //    lblEstado.Text = "El nombre de usuario ya existe";
            //}
            var manager = new UserManager();
            var user = new ApplicationUser() { UserName = txtUserName.Text, Names = txtNombres.Text, LastNames = txtApellidos.Text ,
                                               Email = txtCorreo.Text
            };
            IdentityResult result = manager.Create(user, txtPassword.Text);
            if (result.Succeeded)
            {
                IdentityHelper.SignIn(manager, user, isPersistent: false);
                IdentityHelper.RedirectToReturnUrl(Request.QueryString["ReturnUrl"], Response);
            }
            else
            {
                ErrorMessage.Text = result.Errors.FirstOrDefault();
            }
            ScriptManager.RegisterStartupScript(this.Page, this.GetType(), "tmp", "<script type='text/javascript'>document.getElementById(\"modal\").click();</script>", false);
        }

      
    }
}