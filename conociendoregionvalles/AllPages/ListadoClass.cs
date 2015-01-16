using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
namespace AllPages
{
    public class ListadoClass
    {
        private List<Empresa> Empresas;

        public List<Empresa> IEmpresas
        {
            get { return Empresas; }
            set { Empresas = value; }
        }
        private int TotalEmpresas;

        public int ITotalEmpresas
        {

            get { return TotalEmpresas; }
            set { TotalEmpresas = value; }
        }
        
        
    }
}