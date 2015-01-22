using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using DataAccess;
using AllPages;

namespace Management
{
    public class ManagementCompany
    {
        DataAccessCompany DataAccessObj = new DataAccessCompany();
        public string insertNewCompany(Empresa Company)
        {
            string mensaje;
            int estado=DataAccessObj.SignUpAdd(Company);
            if(estado==1){
                mensaje="Se agregó con exito";
            }else{
                mensaje="El nombre de la empresa/compañia ya existe. Es necesario que escriba otro";
            }
            return mensaje;
        }
        
        public string UpdateCompany(Empresa Company)
        {
            string mensaje;
            int estado = DataAccessObj.EditAdd(Company);
            if (estado == 1)
            {
                mensaje = "Se agregó con exito";
            }
            else
            {
                mensaje = "El nombre de la empresa/compañia ya existe. Es necesario que escriba otro";
            }
            return mensaje;
        }
        public void deleteCompany(int add)
        {
            DataAccessObj.deleteAdd(add);
        }
        public Empresa getCompanyById(int Id)
        {
            return DataAccessObj.getCompanyById(Id);
        }
        public List<File> getVideosByAdd(int Id)
        {
            return DataAccessObj.getVideosByAdd(Id);
        }
        public List<File> getFilesByAdd(int Id)
        {
            return DataAccessObj.getFilesByAdd(Id);
        }
        
        public List<Pagos> getPaymentsByUser(string IdUser)
        {
            return DataAccessObj.getPaymentsByAdd(IdUser);
        }
        public List<File> getVideosByUser(string IdUser)
        {
            return DataAccessObj.getVideosByUser(IdUser);
        }
    }
}