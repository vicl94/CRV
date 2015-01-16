using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using DataAccess;
using AllPages;

namespace Management
{
    public class ManagementUser
    {
        DataAccessUser DataAccessObj = new DataAccessUser();
        public int insertNewUserManagement(Usuario Usuario)
        {
            return DataAccessObj.SignUpUser(Usuario);
        }
        public Usuario Login(Usuario Usuario)
        {
            return DataAccessObj.Login(Usuario);
        }
        public List<EmpresaResumen> getEnterpriseByUser(string IdUser)
        {
            return  DataAccessObj.getEnterpriseByUser(IdUser);
        }
    }
}