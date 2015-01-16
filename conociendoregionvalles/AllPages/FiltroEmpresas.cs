using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace AllPages
{
    public class FiltroEmpresas
    {
        private int RecordsByPage;

        public int IRecordsByPage
        {
            get { return RecordsByPage; }
            set { RecordsByPage = value; }
        }
        private int CurrentPage;

        public int ICurrentPage
        {
            get { return CurrentPage; }
            set { CurrentPage = value; }
        }
        private int IdRegion;

        public int IIdRegion
        {
            get { return IdRegion; }
            set { IdRegion = value; }
        }
        private int IdTag;

        public int IIdTag
        {
            get { return IdTag; }
            set { IdTag = value; }
        }
        private string Search;

        public string ISearch
        {
            get { return Search; }
            set { Search = value; }
        }
        
        
    }
}