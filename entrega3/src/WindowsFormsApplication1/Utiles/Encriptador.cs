﻿using System.Text;
using System.Security.Cryptography;
using System;

namespace MercadoEnvioDesktop
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
            Console.WriteLine("xxx_" + contraseniaEncriptada);
            return contraseniaEncriptada;

        }   
    }
}
