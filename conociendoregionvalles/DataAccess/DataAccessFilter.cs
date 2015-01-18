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
    public class DataAccessFilter
    {
        
       public List<Region> getAllRegions()
       {
            List<Region> Regiones = new List<Region>();
            SqlDataReader rdr = null;
            string connStr = ConfigurationManager.ConnectionStrings["ConnDataBase"].ConnectionString;
            SqlConnection conn = new SqlConnection(connStr);
            conn.Open();
            SqlCommand cmd = new SqlCommand("sp_GetAllRegions", conn);
            cmd.CommandType = CommandType.StoredProcedure;
            rdr = cmd.ExecuteReader();
            while (rdr.Read())
            {
                Region temp = new Region();
                temp.IId = int.Parse(rdr["Id"].ToString());
                temp.INombre = rdr["Name"].ToString();
                Regiones.Add(temp);
            }
            return Regiones;
       }
       public List<Tags> getAllTags()
       {
           List<Tags> Tags = new List<Tags>();
           SqlDataReader rdr = null;
           string connStr = ConfigurationManager.ConnectionStrings["ConnDataBase"].ConnectionString;
           SqlConnection conn = new SqlConnection(connStr);
           conn.Open();
           SqlCommand cmd = new SqlCommand("sp_GetAllTags", conn);
           cmd.CommandType = CommandType.StoredProcedure;
           rdr = cmd.ExecuteReader();
           while (rdr.Read())
           {
               Tags temp = new Tags();
               temp.IId = int.Parse(rdr["Id"].ToString());
               temp.INombre = rdr["Name"].ToString();
               Tags.Add(temp);
           }
           return Tags;
       }
    }
}