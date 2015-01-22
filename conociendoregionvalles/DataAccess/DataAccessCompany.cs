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
            int estado = 0,lastid=0;
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
            lastid = int.Parse(rdr["LastId"].ToString());
            conn.Close();
            if(Company.IPack==3){
                insertFiles(Company, lastid,Company.IVideos);
                insertFiles(Company, lastid, Company.IFiles);
            }
            return estado;
        }
        public void insertVideos(Empresa Company, int lastid)
        {
            for(int cont=0;cont<Company.IVideos.Count;cont++){
                SqlDataReader rdr = null;
                string connStr = ConfigurationManager.ConnectionStrings["ConnDataBase"].ConnectionString;
                SqlConnection conn = new SqlConnection(connStr);
                conn.Open();
                SqlCommand cmd = new SqlCommand("sp_InsertNewVideo", conn);
                cmd.Parameters.AddWithValue("@IdUser", Company.IUserId);
                cmd.Parameters.AddWithValue("@IdAdd", lastid);
                cmd.Parameters.AddWithValue("@Url", Company.IVideos[cont].IUrl);
                cmd.Parameters.AddWithValue("@Name", Company.IVideos[cont].IName);
                cmd.CommandType = CommandType.StoredProcedure;
                rdr = cmd.ExecuteReader();
                conn.Close();
            }
        }
        public void insertFiles(Empresa Company, int lastid, List<File> files)
        {
            for (int cont = 0; cont < files.Count; cont++)
            {
                SqlDataReader rdr = null;
                string connStr = ConfigurationManager.ConnectionStrings["ConnDataBase"].ConnectionString;
                SqlConnection conn = new SqlConnection(connStr);
                conn.Open();
                SqlCommand cmd = new SqlCommand("sp_InsertNewFile", conn);
                cmd.Parameters.AddWithValue("@IdUser", Company.IUserId);
                cmd.Parameters.AddWithValue("@IdAdd", lastid);
                cmd.Parameters.AddWithValue("@Url", files[cont].IUrl);
                cmd.Parameters.AddWithValue("@Name", files[cont].IName);
                cmd.Parameters.AddWithValue("@Type", files[cont].IFileType);
                cmd.Parameters.AddWithValue("@Ext", files[cont].IExt);
                cmd.CommandType = CommandType.StoredProcedure;
                rdr = cmd.ExecuteReader();
                conn.Close();
            }
        }
        public void insertFile(File video, int IdAdd)
        {
                SqlDataReader rdr = null;
                string connStr = ConfigurationManager.ConnectionStrings["ConnDataBase"].ConnectionString;
                SqlConnection conn = new SqlConnection(connStr);
                conn.Open();
                SqlCommand cmd = new SqlCommand("sp_InsertNewFile", conn);
                cmd.Parameters.AddWithValue("@IdUser", video.IIdUser);
                cmd.Parameters.AddWithValue("@IdAdd", IdAdd);
                cmd.Parameters.AddWithValue("@Url", video.IUrl);
                cmd.Parameters.AddWithValue("@Name", video.IName);
                cmd.Parameters.AddWithValue("@Type", video.IFileType);
                cmd.Parameters.AddWithValue("@Ext", video.IExt);
                cmd.CommandType = CommandType.StoredProcedure;
                rdr = cmd.ExecuteReader();
                conn.Close();
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
            for (int cont = 0;cont<Company.IVideos.Count;cont++ )
            {
                if (Company.IVideos[cont].IId==0)
                {
                    Company.IVideos[cont].IIdUser = Company.IUserId;
                    insertFile(Company.IVideos[cont], Company.IId);
                }
                else
                {
                    editFile(Company.IVideos[cont]);
                }
            }
            if (Company.IFiles.Count!=0)
            {
                insertFiles(Company, Company.IId, Company.IFiles);
            }
            return estado;
        }
        public void editFile(File File)
        {
                SqlDataReader rdr = null;
                string connStr = ConfigurationManager.ConnectionStrings["ConnDataBase"].ConnectionString;
                SqlConnection conn = new SqlConnection(connStr);
                conn.Open();
                SqlCommand cmd = new SqlCommand("sp_UpdateFileById", conn);
                cmd.Parameters.AddWithValue("@IdVideo", File.IId);
                cmd.Parameters.AddWithValue("@Name", File.IName);
                cmd.Parameters.AddWithValue("@Url", File.IUrl);
                cmd.Parameters.AddWithValue("@Type", File.IFileType);
                cmd.Parameters.AddWithValue("@Ext", File.IExt);
                cmd.CommandType = CommandType.StoredProcedure;
                rdr = cmd.ExecuteReader();
                conn.Close();
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
            temp.IPack = int.Parse(rdr["Paquete"].ToString());
            conn.Close();
            return temp;
        }
        public List<File> getVideosByAdd(int Id)
        {
            List<File> listVideos = new List<File>();
            SqlDataReader rdr = null;
            string connStr = ConfigurationManager.ConnectionStrings["ConnDataBase"].ConnectionString;
            SqlConnection conn = new SqlConnection(connStr);
            conn.Open();
            SqlCommand cmd = new SqlCommand("sp_GetVideosByAdd", conn);
            cmd.Parameters.AddWithValue("@IdAdd", Id);
            cmd.CommandType = CommandType.StoredProcedure;
            rdr = cmd.ExecuteReader();
            while (rdr.Read())
            {
                File temp = new File();
                temp.IId = int.Parse(rdr["Id"].ToString());
                temp.IUrl = rdr["Url"].ToString();
                temp.IName = rdr["Name"].ToString();
                temp.IIdUser = rdr["IdUser"].ToString();
                temp.IIdAdd = int.Parse(rdr["IdAdd"].ToString());
                temp.IFileType = rdr["FileType"].ToString();
                temp.IExt = rdr["Ext"].ToString();
                listVideos.Add(temp);
            }
            conn.Close();
            return listVideos;
        }
        public List<File> getFilesByAdd(int Id)
        {
            List<File> listFiles = new List<File>();
            SqlDataReader rdr = null;
            string connStr = ConfigurationManager.ConnectionStrings["ConnDataBase"].ConnectionString;
            SqlConnection conn = new SqlConnection(connStr);
            conn.Open();
            SqlCommand cmd = new SqlCommand("sp_GetFilesByAdd", conn);
            cmd.Parameters.AddWithValue("@IdAdd", Id);
            cmd.CommandType = CommandType.StoredProcedure;
            rdr = cmd.ExecuteReader();
            while (rdr.Read())
            {
                File temp = new File();
                temp.IId = int.Parse(rdr["Id"].ToString());
                temp.IUrl = rdr["Url"].ToString();
                temp.IName = rdr["Name"].ToString();
                temp.IIdUser = rdr["IdUser"].ToString();
                temp.IIdAdd = int.Parse(rdr["IdAdd"].ToString());
                temp.IFileType = rdr["FileType"].ToString();
                temp.IExt = rdr["Ext"].ToString();
                listFiles.Add(temp);
            }
            conn.Close();
            return listFiles;
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
        public List<File> getVideosByUser(string IdUser)
        {

            List<File> ListaVideos = new List<File>();
            SqlDataReader rdr = null;
            string connStr = ConfigurationManager.ConnectionStrings["ConnDataBase"].ConnectionString;
            SqlConnection conn = new SqlConnection(connStr);
            conn.Open();
            SqlCommand cmd = new SqlCommand("sp_GetVideosByUser", conn);
            cmd.Parameters.AddWithValue("@IdUser", IdUser);
            cmd.CommandType = CommandType.StoredProcedure;
            rdr = cmd.ExecuteReader();
            while (rdr.Read())
            {
                File temp = new File();
                temp.IId = int.Parse(rdr["Id"].ToString());
                temp.IUrl = rdr["Url"].ToString();
                temp.IName = rdr["Name"].ToString();
                temp.IIdUser = rdr["IdUser"].ToString();
                temp.IIdAdd = int.Parse(rdr["IdAdd"].ToString());
                temp.IFileType = rdr["FileType"].ToString();
                ListaVideos.Add(temp);
            }
            conn.Close();
            return ListaVideos;
        }
    }
}