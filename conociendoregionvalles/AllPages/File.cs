﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace AllPages
{
    public class File
    {
        private int Id;

        public int IId
        {
            get { return Id; }
            set { Id = value; }
        }
        private string Name;

        public string IName
        {
            get { return Name; }
            set { Name = value; }
        }
        private string Url;

        public string IUrl
        {
            get { return Url; }
            set { Url = value; }
        }
        private int IdAdd;

        public int IIdAdd
        {
            get { return IdAdd; }
            set { IdAdd = value; }
        }
        private string IdUser;

        public string IIdUser
        {
            get { return IdUser; }
            set { IdUser = value; }
        }
        private string FileType;

        public string IFileType
        {
            get { return FileType; }
            set { FileType = value; }
        }
        private string Ext;

        public string IExt
        {
            get { return Ext; }
            set { Ext = value; }
        }
        
        
        
        
    }
}