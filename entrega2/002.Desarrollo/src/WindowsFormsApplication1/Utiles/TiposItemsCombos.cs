using System;
using System.Collections.Generic;
using System.Data;

namespace MercadoEnvioDesktop.Utiles
{
    static class TiposItemsCombos
    {

        public static DataTable tiposDocumentoDT()
        {
            DataTable tabla = new DataTable("Tipos");
            DataColumn clave = tabla.Columns.Add("id", typeof(Int32));
            clave.AllowDBNull = false;
            clave.Unique = true;
            tabla.Columns.Add("tipo", typeof(string));
            tabla.Rows.Add(new Object[] { 1, "DNI" });
            tabla.Rows.Add(new Object[] { 2, "CI" });
            tabla.Rows.Add(new Object[] { 3, "LC" });
            tabla.Rows.Add(new Object[] { 4, "LD" });

            return tabla;
        }

        public static List<string> tiposDocumentoLS()
        {
            List<string> lista = new List<string>();
            lista.Add("DNI");
            lista.Add("CI");
            lista.Add("LC");
            lista.Add("LD");
            return lista;
        }

        public static DataTable tiposOperacionDT()
        {
            DataTable tabla = new DataTable("Operaciones");
            DataColumn clave = tabla.Columns.Add("id", typeof(Int32));
            clave.AllowDBNull = false;
            clave.Unique = true;
            tabla.Columns.Add("operacion", typeof(string));
            tabla.Rows.Add(new Object[] { 1, "Compra inmediata" });
            tabla.Rows.Add(new Object[] { 2, "Subasta" });

            return tabla;
        }

        public static List<string> tiposOperacionLS()
        {
            List<string> lista = new List<string>();
            lista.Add("Compra inmediata");
            lista.Add("Subasta");
            return lista;
        }

        public static DataTable tiposListado()
        {
            DataTable tabla = new DataTable("Listados");
            DataColumn clave = tabla.Columns.Add("id", typeof(Int32));
            clave.AllowDBNull = false;
            clave.Unique = true;
            tabla.Columns.Add("listado", typeof(string));
            tabla.Rows.Add(new Object[] { 1, "Vendedores con mayor cantidad de productos no vendidos" });
            tabla.Rows.Add(new Object[] { 2, "Clientes con mayor cantidad de productos comprados" });
            tabla.Rows.Add(new Object[] { 3, "Vendedores con mayor cantidad de facturas  en periodo" });
            tabla.Rows.Add(new Object[] { 4, "Vendedores con mayor monto factura en periodo" });
            return tabla;
        }

        public static DataTable trimestres()
        {
            DataTable tabla = new DataTable("Trimestres");
            DataColumn clave = tabla.Columns.Add("id", typeof(Int32));
            clave.AllowDBNull = false;
            clave.Unique = true;
            tabla.Columns.Add("trimestre", typeof(string));
            tabla.Rows.Add(new Object[] { 1, "1º trimestre" });
            tabla.Rows.Add(new Object[] { 2, "2º trimestre" });
            tabla.Rows.Add(new Object[] { 3, "3º trimestre" });
            tabla.Rows.Add(new Object[] { 4, "4º trimestre" });
            return tabla;
        }
    }
}
