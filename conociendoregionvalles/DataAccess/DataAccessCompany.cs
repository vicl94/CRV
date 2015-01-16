using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Configuration;
using System.Data.SqlClient;
using System.Data;
using System.Configuration;
using AllPages;

namespace DataAccess
{
    public class DataAccessCompany
    {
        public int SignUpAdd(Empresa Company)
        {
            int estado = 0;
            SqlDataReader rdr = null;
            string connStr = ConfigurationManager.ConnectionStrings["ConnDataBase"].ConnectionString;
            SqlConnection conn = new SqlConnection(connStr);
            conn.Open();
            SqlCommand cmd = new SqlCommand("sp_InsertNewAdd", conn);
            cmd.Parameters.AddWithValue("@CompanyName", Company.INombre);
            cmd.Parameters.AddWithValue("@Address", Company.IDomicilio);
            cmd.Parameters.AddWithValue("@Email", Company.ICorreo);
            cmd.Parameters.AddWithValue("@Summary", Company.IResumen);
            cmd.Parameters.AddWithValue("@LogoSRC", Company.Iimgsrc);
            cmd.Parameters.AddWithValue("@IdRegion", Company.IRegion);
            cmd.Parameters.AddWithValue("@IdTag", Company.ITag);
            cmd.Parameters.AddWithValue("@Telephone", Company.ITelefono);
            cmd.Parameters.AddWithValue("@IdUser", Company.IUserId);
            cmd.Parameters.AddWithValue("@MoreSummary", Company.IMoreSummary);
            cmd.Parameters.AddWithValue("@Latitude", Company.ILatitude);
            cmd.Parameters.AddWithValue("@Longitude", Company.ILongitude);
            cmd.Parameters.AddWithValue("@Pack", Company.IPack);
            cmd.CommandType = CommandType.StoredProcedure;
            rdr = cmd.ExecuteReader();
            rdr.Read();
            estado = int.Parse(rdr["ESTADO"].ToString());
            conn.Close();
            return estado;
        }
        public int EditAdd(Empresa Company)
        {
            int estado = 0;
            SqlDataReader rdr = null;
            string connStr = ConfigurationManager.ConnectionStrings["ConnDataBase"].ConnectionString;
            SqlConnection conn = new SqlConnection(connStr);
            conn.Open();
            SqlCommand cmd = new SqlCommand("sp_UpdateAdd", conn);
            cmd.Parameters.AddWithValue("@CompanyName", Company.INombre);
            cmd.Parameters.AddWithValue("@Address", Company.IDomicilio);
            cmd.Parameters.AddWithValue("@Email", Company.ICorreo);
            cmd.Parameters.AddWithValue("@Summary", Company.IResumen);
            cmd.Parameters.AddWithValue("@LogoSRC", Company.Iimgsrc);
            cmd.Parameters.AddWithValue("@IdRegion", Company.IRegion);
            cmd.Parameters.AddWithValue("@IdTag", Company.ITag);
            cmd.Parameters.AddWithValue("@Telephone", Company.ITelefono);
            cmd.Parameters.AddWithValue("@IdCompany", Company.IId);
            cmd.Parameters.AddWithValue("@MoreSummary", Company.IMoreSummary);
            cmd.Parameters.AddWithValue("@Latitude", Company.ILatitude);
            cmd.Parameters.AddWithValue("@Longitude", Company.ILongitude);
            cmd.CommandType = CommandType.StoredProcedure;
            rdr = cmd.ExecuteReader();
            rdr.Read();
            estado = int.Parse(rdr["ESTADO"].ToString());
            conn.Close();
            return estado;
        }
        public void deleteAdd(int add)
        {
            SqlDataReader rdr = null;
            string connStr = ConfigurationManager.ConnectionStrings["ConnDataBase"].ConnectionString;
            SqlConnection conn = new SqlConnection(connStr);
            conn.Open();
            SqlCommand cmd = new SqlCommand("sp_DeleteAdd", conn);
            cmd.Parameters.AddWithValue("@IdAdd", add);
            cmd.CommandType = CommandType.StoredProcedure;
            rdr = cmd.ExecuteReader();
            conn.Close();
        }
        public Empresa getCompanyById(int Id)
        {
            Empresa temp = new Empresa();
            SqlDataReader rdr = null;
            string connStr = ConfigurationManager.ConnectionStrings["ConnDataBase"].ConnectionString;
            SqlConnection conn = new SqlConnection(connStr);
            conn.Open();
            SqlCommand cmd = new SqlCommand("sp_GetEnterprisesById", conn);
            cmd.Parameters.AddWithValue("@id", Id);
            cmd.CommandType = CommandType.StoredProcedure;
            rdr = cmd.ExecuteReader();
            rdr.Read();
            temp.IId = int.Parse(rdr["Id"].ToString());
            temp.INombre = rdr["Nombre"].ToString();
            temp.IDescripcion = rdr["Descripcion"].ToString();
            temp.ITelefono = rdr["Telefono"].ToString();
            temp.Iimgsrc = rdr["Imagen1"].ToString();
            temp.IResumen = rdr["Resumen"].ToString();
            temp.ICorreo = rdr["Correo"].ToString();
            temp.IDomicilio = rdr["Domicilio"].ToString();
            temp.IMoreSummary = rdr["ResumenDos"].ToString();
            temp.ILatitude = rdr["Latitud"].ToString();
            temp.ILongitude = rdr["Longitud"].ToString();
            temp.ITag = rdr["Tag"].ToString();
            temp.IRegion = rdr["Region"].ToString();
            conn.Close();
            return temp;
        }
        public List<Pagos> getPaymentsByAdd(string IdUser)
        {
            
            List<Pagos> ListaPagos = new List<Pagos>();
            SqlDataReader rdr = null;
            string connStr = ConfigurationManager.ConnectionStrings["ConnDataBase"].ConnectionString;
            SqlConnection conn = new SqlConnection(connStr);
            conn.Open();
            SqlCommand cmd = new SqlCommand("sp_GetPaymentsByUser", conn);
            cmd.Parameters.AddWithValue("@UserId", IdUser);
            cmd.CommandType = CommandType.StoredProcedure;
            rdr = cmd.ExecuteReader();
            while (rdr.Read())
            {
                Pagos temp = new Pagos();
                temp.IId = int.Parse(rdr["Id"].ToString());
                temp.IReferencia = rdr["Reference"].ToString();
                temp.IFechaDePago = rdr["PaymentDate"].ToString();
                temp.IFechaDeVencimiento = rdr["DueDate"].ToString();
                temp.IMetodoDePago = rdr["PaymentMethod"].ToString();
                temp.IEstado = rdr["State"].ToString();
                temp.ICantidad = double.Parse(rdr["Amount"].ToString());
                temp.IIdEmpresa = int.Parse(rdr["AddId"].ToString());
                temp.IIdUser = rdr["UserId"].ToString();
                ListaPagos.Add(temp);
            }
            conn.Close();
            return ListaPagos;
        }
    }
}