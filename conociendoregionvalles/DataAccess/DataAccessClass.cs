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
    public class DataAccessClass
    {
        SystemClass Systemobj = new SystemClass();
        public SystemClass getGeneral()
        {
            
            SqlDataReader rdr = null;
            string connStr = ConfigurationManager.ConnectionStrings["ConnDataBase"].ConnectionString;
            SqlConnection conn = new SqlConnection(connStr);
            conn.Open();
            SqlCommand cmd = new SqlCommand("sp_General", conn);
            cmd.CommandType = CommandType.StoredProcedure;
            rdr = cmd.ExecuteReader();
            while (rdr.Read())
            {
                if (rdr["Name"].Equals("NombreMay"))
                {
                    Systemobj.INombre = rdr["Value"].ToString();
                    
                }
                if (rdr["Name"].Equals("RecordsByPage"))
                {
                    Systemobj.IRecordsByPage = int.Parse(rdr["Value"].ToString());
                }
            }
            return Systemobj;
        }
        public List<Empresa> getAllEnterprises()
        {
            List<Empresa> Empresas = new List<Empresa>();
            Paginacion Pagination = new Paginacion();

            SqlDataReader rdr = null;
            string connStr = ConfigurationManager.ConnectionStrings["ConnDataBase"].ConnectionString;
            SqlConnection conn = new SqlConnection(connStr);
            conn.Open();
            SqlCommand cmd = new SqlCommand("sp_GetAllEnterprise", conn);
            cmd.CommandType = CommandType.StoredProcedure;
            rdr = cmd.ExecuteReader();
            while (rdr.Read())
            {
                Empresa temp = new Empresa();
                temp.IId=int.Parse(rdr["Id"].ToString());
                temp.INombre=rdr["Nombre"].ToString();
                temp.IDescripcion=rdr["Descripcion"].ToString();
                temp.ITelefono=rdr["Telefono"].ToString();
                temp.Iimgsrc = rdr["Imagen1"].ToString();
                temp.IResumen = rdr["Resumen"].ToString();
                temp.ICorreo = rdr["Correo"].ToString();
                Empresas.Add(temp);
            }
            conn.Close();
            return Empresas;
        }
        public ListadoClass getEnterprisesByFilter(FiltroEmpresas Filtro)
        {
            ListadoClass ControlProp =new ListadoClass();
            List<Empresa> Empresas = new List<Empresa>();
            Paginacion Pagination = new Paginacion();

            SqlDataReader rdr = null;
            string connStr = ConfigurationManager.ConnectionStrings["ConnDataBase"].ConnectionString;
            SqlConnection conn = new SqlConnection(connStr);
            conn.Open();
            SqlCommand cmd = new SqlCommand("sp_GetEnterprisesByFilter", conn);
            cmd.Parameters.AddWithValue("@RecordsByPage", Filtro.IRecordsByPage);
            cmd.Parameters.AddWithValue("@CurrentPage", Filtro.ICurrentPage);
            cmd.Parameters.AddWithValue("@Tag", Filtro.IIdTag);
            cmd.Parameters.AddWithValue("@Region", Filtro.IIdRegion);
            cmd.Parameters.AddWithValue("@Search", Filtro.ISearch);
            cmd.CommandType = CommandType.StoredProcedure;
            rdr = cmd.ExecuteReader();
            rdr.Read();
            ControlProp.ITotalEmpresas = int.Parse(rdr["TotalEmpresas"].ToString());
            rdr.NextResult();
            while (rdr.Read())
            {
                Empresa temp = new Empresa();
                temp.IId = int.Parse(rdr["Id"].ToString());
                temp.INombre = rdr["Nombre"].ToString();
                temp.IDescripcion = rdr["Descripcion"].ToString();
                temp.ITelefono = rdr["Telefono"].ToString();
                temp.Iimgsrc = rdr["Imagen1"].ToString();
                temp.IResumen = rdr["Resumen"].ToString();
                temp.IDomicilio = rdr["Domicilio"].ToString();
                temp.ICorreo = rdr["Correo"].ToString();
                temp.IRegion = rdr["RName"].ToString();
                temp.ITag = rdr["TName"].ToString();
                temp.IPack = int.Parse(rdr["Paquete"].ToString());
                Empresas.Add(temp);
            }
            conn.Close();
            ControlProp.IEmpresas = Empresas;

            return ControlProp;
        }
    }
}