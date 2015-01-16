
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Security.Cryptography;
using System.Text;

namespace AllPages
{
    public class Usuario
    {
        private string Nombres;

        public string INombres
        {
            get { return Nombres; }
            set { Nombres = value; }
        }
        private string Apellidos;

        public string IApellidos
        {
            get { return Apellidos; }
            set { Apellidos = value; }
        }
        private string UserName;

        public string IUserName
        {
            get { return UserName; }
            set { UserName = value; }
        }
        private string Correo;

        public string ICorreo
        {
            get { return Correo; }
            set { Correo = value; }
        }
        private string Password;

        public string IPassword
        {
            set { Password = value; }
        }
        private string MD5Pass;

        public string IMD5Pass
        {
            get {
                MD5 md5 = MD5CryptoServiceProvider.Create();
                ASCIIEncoding encoding = new ASCIIEncoding();
                byte[] stream = null;
                StringBuilder sb = new StringBuilder();
                stream = md5.ComputeHash(encoding.GetBytes(Password));
                for (int i = 0; i < stream.Length; i++) sb.AppendFormat("{0:x2}", stream[i]);
                return sb.ToString();
                }
           
        }
        
        
        
        
    }
}