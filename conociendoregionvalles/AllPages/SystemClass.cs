using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace AllPages
{
    public class SystemClass
    {
        private string Nombre;

        public string INombre
        {
            get { return Nombre; }
            set { Nombre = value; }
        }
        private int RecordsByPage;

        public int IRecordsByPage
        {
            get { return RecordsByPage; }
            set { RecordsByPage = value; }
        }
    }
}