﻿using System;
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
        List<File> listaVideos = new List<File>();
        List<File> listaArchivos = new List<File>();
        public string jsonFiles;
        public string jsonImages;
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
            listaArchivos = ManagementObj.getFilesByAdd(id);
            jsonFiles = new JavaScriptSerializer().Serialize(listaVideos);
            jsonImages = new JavaScriptSerializer().Serialize(listaArchivos);
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