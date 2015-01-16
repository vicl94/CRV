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
    public class DataAccessUser
    {
        public int SignUpUser(Usuario Usuario)
        {
            int estado = 0;
            SqlDataReader rdr = null;
            string connStr = ConfigurationManager.ConnectionStrings["ConnDataBase"].ConnectionString;
            SqlConnection conn = new SqlConnection(connStr);
            conn.Open();
            SqlCommand cmd = new SqlCommand("sp_InsertNewUser", conn);
            cmd.Parameters.AddWithValue("@UserName", Usuario.IUserName);
            cmd.Parameters.AddWithValue("@Name", Usuario.INombres);
            cmd.Parameters.AddWithValue("@LastName", Usuario.IApellidos);
            cmd.Parameters.AddWithValue("@Email", Usuario.ICorreo);
            cmd.Parameters.AddWithValue("@Password", Usuario.IMD5Pass);
            cmd.CommandType = CommandType.StoredProcedure;
            rdr = cmd.ExecuteReader();
            rdr.Read();
            estado = int.Parse(rdr["ESTADO"].ToString());
            conn.Close();
            return estado;
        }
        public Usuario Login(Usuario Usuario)
        {
            Usuario temp = new Usuario();
            SqlDataReader rdr = null;
            string connStr = ConfigurationManager.ConnectionStrings["ConnDataBase"].ConnectionString;
            SqlConnection conn = new SqlConnection(connStr);
            conn.Open();
            SqlCommand cmd = new SqlCommand("sp_Login", conn);
            cmd.Parameters.AddWithValue("@UserName", Usuario.IUserName);
            cmd.Parameters.AddWithValue("@Password", Usuario.IMD5Pass);
            cmd.CommandType = CommandType.StoredProcedure;
            rdr = cmd.ExecuteReader();
            while (rdr.Read())
            {
                temp = new Usuario();
                temp.IUserName = rdr["UserName"].ToString();
                temp.INombres = rdr["Name"].ToString();
                temp.IApellidos = rdr["LastName"].ToString();
                temp.ICorreo = rdr["Email"].ToString();
            }
            
            conn.Close();
            return temp;
        }
        public List<EmpresaResumen> getEnterpriseByUser(string IdUser)
        {
            EmpresaResumen temp;
            List<EmpresaResumen> ListaEmpresas = new List<EmpresaResumen>();
            SqlDataReader rdr = null;
            string connStr = ConfigurationManager.ConnectionStrings["ConnDataBase"].ConnectionString;
            SqlConnection conn = new SqlConnection(connStr);
            conn.Open();
            SqlCommand cmd = new SqlCommand("sp_GetEnterprisesByUser", conn);
            cmd.Parameters.AddWithValue("@IdUser", IdUser);
            cmd.CommandType = CommandType.StoredProcedure;
            rdr = cmd.ExecuteReader();
            while (rdr.Read())
            {
                temp = new EmpresaResumen();
                temp.IId = rdr["Id"].ToString();
                temp.INombre = rdr["Nombre"].ToString();
                //temp.IDescripcion = rdr["Descripcion"].ToString();
                temp.ITelefono = rdr["Telefono"].ToString();
                temp.Iimgsrc = rdr["Imagen1"].ToString();
                temp.IResumen = rdr["Resumen"].ToString();
                temp.IDomicilio = rdr["Domicilio"].ToString();
                temp.ICorreo = rdr["Correo"].ToString();
                temp.ITag = rdr["Tag"].ToString();
                temp.IRegion = rdr["Region"].ToString();
                temp.IMoreSummary = rdr["ResumenDos"].ToString();
                temp.ILatitude = rdr["Latitud"].ToString();
                temp.ILongitude = rdr["Longitud"].ToString();
                temp.IActivo = rdr["Activo"].ToString();
                temp.IPack = int.Parse(rdr["Paquete"].ToString());
                ListaEmpresas.Add(temp);
            }
            conn.Close();
            return ListaEmpresas;
        }
    }
}