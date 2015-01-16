using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace AllPages
{
    public class Empresa
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
        private string Descripcion;

        public string IDescripcion
        {
            get { return Descripcion; }
            set { Descripcion = value; }
        }
        private string Telefono;

        public string ITelefono
        {
            get { return Telefono; }
            set { Telefono = value; }
        }

        private string Imgsrc;

        public string Iimgsrc
        {
            get { return Imgsrc; }
            set { Imgsrc = value; }
        }
        private string Resumen;

        public string IResumen
        {
            get { return Resumen; }
            set { Resumen = value; }
        }
        private string Domicilio;

        public string IDomicilio
        {
            get { return Domicilio; }
            set { Domicilio = value; }
        }
        private string Correo;

        public string ICorreo
        {
            get { return Correo; }
            set { Correo = value; }
        }
        private string Region;

        public string IRegion
        {
            get { return Region; }
            set { Region = value; }
        }
        private string Tag;

        public string ITag
        {
            get { return Tag; }
            set { Tag = value; }
        }
        private string UserId;

        public string IUserId
        {
            get { return UserId; }
            set { UserId = value; }
        }
        private string MoreSummary;

        public string IMoreSummary
        {
            get { return MoreSummary; }
            set { MoreSummary = value; }
        }
        private string Latitude;

        public string ILatitude
        {
            get { return Latitude; }
            set { Latitude = value; }
        }
        private string Longitude;

        public string ILongitude
        {
            get { return Longitude; }
            set { Longitude = value; }
        }
        private int Pack;

        public int IPack
        {
            get { return Pack; }
            set { Pack = value; }
        }
    }
}