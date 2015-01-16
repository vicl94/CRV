using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace AllPages
{
    public class Tags
    {
        private int Id;

        public int IId
        {
            get { return Id; }
            set { Id = value; }
        }
        private string Nombre;

        public string INombre
        {
            get { return Nombre; }
            set { Nombre = value; }
        }
        
    }
}