using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using DataAccess;
using AllPages;

namespace Management
{
    public class ManagementClass
    {
        SystemClass Systemobj = new SystemClass();
        DataAccessClass DataAccessObj = new DataAccessClass();
        public SystemClass getGeneralManagement()
        {
            return Systemobj = DataAccessObj.getGeneral();

        }
        public List<Empresa> getAllEnterprisesManagement()
        {
            return DataAccessObj.getAllEnterprises();
        }
        public ListadoClass getEnterprisesManagementByFilter(FiltroEmpresas Filtro)
        {
            return DataAccessObj.getEnterprisesByFilter(Filtro);
        }
    }
}