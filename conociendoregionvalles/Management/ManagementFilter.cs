using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using AllPages;
using DataAccess;   

namespace Management
{
    public class ManagementFilter
    {
        DataAccessFilter DataAccessObj = new DataAccessFilter();
        public List<Region> getAllRegionsManagement()
        {
            return DataAccessObj.getAllRegions();
        }
        public List<Tags> getAllTagsManagement()
        {
            return DataAccessObj.getAllTags();
        }
    }
}