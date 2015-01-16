using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace AllPages
{
    public class Pagos
    {
        private int id;

        public int IId
        {
            get { return id; }
            set { id = value; }
        }
        private string Referencia;

        public string IReferencia
        {
            get { return Referencia; }
            set { Referencia = value; }
        }
        private string FechaDePago;

        public string IFechaDePago
        {
            get { return FechaDePago; }
            set { FechaDePago = value; }
        }
        private string FechaDeVencimiento;

        public string IFechaDeVencimiento
        {
            get { return FechaDeVencimiento; }
            set { FechaDeVencimiento = value; }
        }
        private string MetodoDePago;

        public string IMetodoDePago
        {
            get { return MetodoDePago; }
            set { MetodoDePago = value; }
        }
        private string Estado;

        public string IEstado
        {
            get { return Estado; }
            set { Estado = value; }
        }
        private double Cantidad;

        public double ICantidad
        {
            get { return Cantidad; }
            set { Cantidad = value; }
        }
        private int IdEmpresa;

        public int IIdEmpresa
        {
            get { return IdEmpresa; }
            set { IdEmpresa = value; }
        }
        private string IdUser;

        public string IIdUser
        {
            get { return IdUser; }
            set { IdUser = value; }
        }
        
    }
}