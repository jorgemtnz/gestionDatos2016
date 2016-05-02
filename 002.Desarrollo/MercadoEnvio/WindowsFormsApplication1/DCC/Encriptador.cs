using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Security.Cryptography;

namespace MercadoEnvioDesktop.DCC
{
    static class Encriptador
    {
        static public string EncriptarPassword(string constrasenia)
        {
            SHA256 encritador = SHA256Managed.Create();
            Encoding encode = Encoding.UTF8;
            encritador.ComputeHash(encode.GetBytes(constrasenia));
            string contraseniaEncriptada  = "";
            foreach (byte bt in encritador.Hash)
            {
                contraseniaEncriptada += bt.ToString("x2");
            }
            return contraseniaEncriptada;

        }
    }
}
