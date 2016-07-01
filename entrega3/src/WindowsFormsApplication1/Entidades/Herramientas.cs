﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Windows.Forms;
using System.Data.SqlClient;
using FrbaHotel.Entidades;
using System.Data;
using System.Configuration;
using System.Web;
using System.Xml.Linq;
using System.Security.Cryptography;

namespace FrbaHotel.Entidades
{
    class Herramientas
    {
        public static void msebox_informacion(string texto)
        {
            MessageBox.Show(texto, "Informacion", MessageBoxButtons.OK, MessageBoxIcon.Information);
        }

        public static void msgbox_advertencia(string texto)
        {
            MessageBox.Show(texto, "Advertencia", MessageBoxButtons.OK, MessageBoxIcon.Exclamation);
        }

        public Herramientas()
        {
        }

        public static void HabilitarControles(List<String> funcionalidades) {

            if (funcionalidades.Contains("Dar alta Usuario"))
                Entidades.Funcionalidades.Instance.altaUsuario = 1;
            else Entidades.Funcionalidades.Instance.altaUsuario = 0;

            if (funcionalidades.Contains("Dar baja Usuario"))
                Entidades.Funcionalidades.Instance.bajaUsuario = 1;
            else Entidades.Funcionalidades.Instance.bajaUsuario = 0;

            if (funcionalidades.Contains("Modificar Usuario"))
                Entidades.Funcionalidades.Instance.modificacionUsuario = 1;
            else Entidades.Funcionalidades.Instance.modificacionUsuario = 0;

            if (funcionalidades.Contains("Crear hotel"))
                Entidades.Funcionalidades.Instance.altaHotel = 1;
            else Entidades.Funcionalidades.Instance.altaHotel = 0;

            if (funcionalidades.Contains("Baja Hotel"))
                Entidades.Funcionalidades.Instance.bajaHotel = 1;
            else Entidades.Funcionalidades.Instance.bajaHotel = 0;

            if (funcionalidades.Contains("Modificar hotel"))
                Entidades.Funcionalidades.Instance.modificarHotel = 1;
            else Entidades.Funcionalidades.Instance.modificarHotel = 0;

            if (funcionalidades.Contains("Alta Habitacion"))
                Entidades.Funcionalidades.Instance.altaHabitacion = 1;
            else Entidades.Funcionalidades.Instance.altaHabitacion = 0;

            if (funcionalidades.Contains("Baja Habitacion"))
                Entidades.Funcionalidades.Instance.bajaHabitacion = 1;
            else Entidades.Funcionalidades.Instance.bajaHabitacion = 0;

            if (funcionalidades.Contains("Modificar Habitacion"))
                Entidades.Funcionalidades.Instance.modificarHabitacion = 1;
            else Entidades.Funcionalidades.Instance.modificarHabitacion = 0;

            if (funcionalidades.Contains("Alta cliente"))
                Entidades.Funcionalidades.Instance.altaCliente = 1;
            else Entidades.Funcionalidades.Instance.altaCliente = 0;

            if (funcionalidades.Contains("Dar Baja Cliente "))
                Entidades.Funcionalidades.Instance.bajaCliente = 1;
            else Entidades.Funcionalidades.Instance.bajaCliente = 0;

            if (funcionalidades.Contains("Modificar Cliente"))
                Entidades.Funcionalidades.Instance.modificarCliente = 1;
            else Entidades.Funcionalidades.Instance.modificarCliente = 0;

            if (funcionalidades.Contains("Alta Rol"))
                Entidades.Funcionalidades.Instance.altaRol = 1;
            else Entidades.Funcionalidades.Instance.altaRol = 0;

            if (funcionalidades.Contains("Baja Rol"))
                Entidades.Funcionalidades.Instance.bajaRol = 1;
            else Entidades.Funcionalidades.Instance.bajaRol = 0;

            if (funcionalidades.Contains("Modificar Rol"))
                Entidades.Funcionalidades.Instance.modificarRol = 1;
            else Entidades.Funcionalidades.Instance.modificarRol = 0;

            if (funcionalidades.Contains("Registrar check in"))
                Entidades.Funcionalidades.Instance.registrarCheckIn = 1;
            else Entidades.Funcionalidades.Instance.registrarCheckIn = 0;

            if (funcionalidades.Contains("Registrar check out"))
                Entidades.Funcionalidades.Instance.registrarCheckOut = 1;
            else Entidades.Funcionalidades.Instance.registrarCheckOut = 0;

            if (funcionalidades.Contains("Reservar"))
                Entidades.Funcionalidades.Instance.reservar = 1;
            else Entidades.Funcionalidades.Instance.reservar = 0;

            if (funcionalidades.Contains("Dar baja Reserva"))
                Entidades.Funcionalidades.Instance.bajaReserva = 1;
            else Entidades.Funcionalidades.Instance.bajaReserva = 0;

            if (funcionalidades.Contains("Facturar"))
                Entidades.Funcionalidades.Instance.facturar = 1;
            else Entidades.Funcionalidades.Instance.facturar = 0;

            if (funcionalidades.Contains("Listados estadisticos"))
                Entidades.Funcionalidades.Instance.listados = 1;
            else Entidades.Funcionalidades.Instance.listados = 0;
        }

        public static void llenarComboBox(ComboBox cb, String nombreStoreProcedure, List<SqlParameter> parametrosSP)
        {
            DataTable tablaRoles = Herramientas.EjecutarStoredProcedure(nombreStoreProcedure, parametrosSP);
            foreach (DataRow row in tablaRoles.Rows)
            {
                cb.Items.Add(row[0]);
            }
            cb.SelectedIndex = 0;
            
        }

        public static void llenarComboBox(ComboBox cb, String nombreStoreProcedure)
        {
            DataTable tablaRoles = Herramientas.EjecutarStoredProcedureSinParametros(nombreStoreProcedure);
            foreach (DataRow row in tablaRoles.Rows)
            {
                cb.Items.Add(row[0]);
            }
            cb.SelectedIndex = 0;

        }

        public static void llenarComboBox(ComboBox cb, string consulta, Boolean b)
        {
            SqlDataReader dReader;
            try
            {

                conexion cn = new conexion();
                cn.abrir_conexion();

                SqlCommand query = new SqlCommand(consulta, cn.abrir_conexion());
                dReader = query.ExecuteReader();

                while (dReader.Read())
                {
                    cb.Items.Add(dReader[0]);
                }
                dReader.Close();
            }
            catch (Exception ex)
            {
                MessageBox.Show("No se pudo cargar el combo Box " + ex.ToString());

            }
        }

        public static DataTable EjecutarStoredProcedureSinParametros(string nombreSP)
        {
                DataTable dtable = new DataTable();
                conexion conection = new conexion();
                SqlCommand query = new SqlCommand(nombreSP, conection.abrir_conexion());
                query.CommandType = CommandType.StoredProcedure;

                SqlDataAdapter da = new SqlDataAdapter(query);
                da.Fill(dtable);

                return dtable;
        }

        public static SqlDataReader ejecutarConsultaSimple(string consulta)
        {
            try
            {
                SqlDataReader dReader;
                conexion cn = new conexion();

                SqlCommand query = new SqlCommand(consulta, cn.abrir_conexion());
                dReader = query.ExecuteReader();

                return dReader;
            }
            catch (Exception ex)
            {
                MessageBox.Show("ERROR" + ex.ToString());
                return null;
            }
        }

        public static DataTable EjecutarStoredProcedure(string nombreSP, List<SqlParameter> parametros)
        {
                DataTable dtable = new DataTable();
                conexion conection = new conexion();
                SqlCommand query = new SqlCommand(nombreSP, conection.abrir_conexion());
                query.CommandType = CommandType.StoredProcedure;
                //paso lo parametros como array
                query.Parameters.AddRange(parametros.ToArray());
                SqlDataAdapter da = new SqlDataAdapter(query);
                da.Fill(dtable);//EJECUTA LA QUERY

                return dtable;
        }

        public static int ejec_SP_NOQUERY(string noquery, List<SqlParameter> lista)
        {

            conexion conection = new conexion();
            SqlCommand query = new SqlCommand(noquery, conection.abrir_conexion());
            query.CommandType = CommandType.StoredProcedure;
            //paso lo parametros como array
            query.Parameters.AddRange(lista.ToArray());
            try
            {
                int filas_afectadas = query.ExecuteNonQuery();
                return filas_afectadas;

            }
            catch (Exception ex)
            {
                MessageBox.Show(ex.Message, "ADVERTENCIA", MessageBoxButtons.OK, MessageBoxIcon.Exclamation);
                return 0;
            }

        }

        public static List<SqlParameter> GenerarListaDeParametros(params object[] values)
        {
            if (values.Length % 2 != 0)
            {
                throw new ArgumentException("La cantidad de argumentos no puede ser impar " +
                    "ya que son pares clave-valor");
            }

            List<SqlParameter> paramList = new List<SqlParameter>();
            for (int i = 0; i < values.Length; i++)
            {
                if (i % 2 == 0)
                {
                    String nombreParam = values[i].ToString();
                    object paramValue = values[i + 1];
                    paramList.Add(new SqlParameter(nombreParam, paramValue));
                }
            }
            return paramList;
        }

        public static void llenarComboPaises(ComboBox combo)
        {
            List<String> lista = new List<string>();
            lista.Add("Afganistán");
            lista.Add("Albania");
            lista.Add("Alemania");
            lista.Add("Andorra");
            lista.Add("Angola");
            lista.Add("Antigua y Barbuda");
            lista.Add("Arabia Saudita");
            lista.Add("Argelia");
            lista.Add("Argentina");
            lista.Add("Armenia");
            lista.Add("Australia");
            lista.Add("Austria");
            lista.Add("Azerbaiyán");
            lista.Add("Bahamas");
            lista.Add("Bangladés");
            lista.Add("Barbados");
            lista.Add("Baréin");
            lista.Add("Bélgica");
            lista.Add("Belice");
            lista.Add("Benín");
            lista.Add("Bielorrusia");
            lista.Add("Birmania");
            lista.Add("Bolivia");
            lista.Add("Bosnia y Herzegovina");
            lista.Add("Botsuana");
            lista.Add("Brasil");
            lista.Add("Bulgaria");
            lista.Add("Burkina Faso");
            lista.Add("Burundi");
            lista.Add("Bután");
            lista.Add("Camboya");
            lista.Add("Camerún");
            lista.Add("Canadá");
            lista.Add("Catar");
            lista.Add("Chad");
            lista.Add("Chile");
            lista.Add("China");
            lista.Add("Chipre");
            lista.Add("Ciudad del Vaticano");
            lista.Add("Colombia");
            lista.Add("Comoras");
            lista.Add("Corea del Norte");
            lista.Add("Corea del Sur");
            lista.Add("Costa de Marfil");
            lista.Add("Costa Rica");
            lista.Add("Croacia");
            lista.Add("Cuba");
            lista.Add("Dinamarca");
            lista.Add("Dominica");
            lista.Add("Ecuador");
            lista.Add("Egipto");
            lista.Add("El Salvador");
            lista.Add("Emiratos Árabes Unidos");
            lista.Add("Eritrea");
            lista.Add("Eslovaquia");
            lista.Add("Eslovenia");
            lista.Add("España");
            lista.Add("Estados Unidos");
            lista.Add("Estonia");
            lista.Add("Etiopía");
            lista.Add("Filipinas");
            lista.Add("Finlandia");
            lista.Add("Fiyi");
            lista.Add("Francia");
            lista.Add("Gabón");
            lista.Add("Gambia");
            lista.Add("Georgia");
            lista.Add("Ghana");
            lista.Add("Granada");
            lista.Add("Grecia");
            lista.Add("Guatemala");
            lista.Add("Guyana");
            lista.Add("Guinea");
            lista.Add("Guinea ecuatorial");
            lista.Add("Guinea-Bisáu");
            lista.Add("Haití");
            lista.Add("Honduras");
            lista.Add("Hungría");
            lista.Add("India");
            lista.Add("Indonesia");
            lista.Add("Irak");
            lista.Add("Irán");
            lista.Add("Irlanda");
            lista.Add("Islandia");
            lista.Add("Islas Marshall");
            lista.Add("Islas Salomón");
            lista.Add("Israel");
            lista.Add("Italia");
            lista.Add("Jamaica");
            lista.Add("Japón");
            lista.Add("Jordania");
            lista.Add("Kazajistán");
            lista.Add("Kenia");
            lista.Add("Kirguistán");
            lista.Add("Kiribati");
            lista.Add("Kuwait");
            lista.Add("Laos");
            lista.Add("Lesoto");
            lista.Add("Letonia");
            lista.Add("Líbano");
            lista.Add("Liberia");
            lista.Add("Libia");
            lista.Add("Liechtenstein");
            lista.Add("Lituania");
            lista.Add("Luxemburgo");
            lista.Add("Madagascar");
            lista.Add("Malasia");
            lista.Add("Malaui");
            lista.Add("Maldivas");
            lista.Add("Malí");
            lista.Add("Malta");
            lista.Add("Marruecos");
            lista.Add("Mauricio");
            lista.Add("Mauritania");
            lista.Add("Mexico");
            lista.Add("Micronesia");
            lista.Add("Moldavia");
            lista.Add("Mónaco");
            lista.Add("Mongolia");
            lista.Add("Montenegro");
            lista.Add("Mozambique");
            lista.Add("Namibia");
            lista.Add("Nauru");
            lista.Add("Nepal");
            lista.Add("Nicaragua");
            lista.Add("Níger");
            lista.Add("Nigeria");
            lista.Add("Nueva zelanda");
            lista.Add("Omán");
            lista.Add("Países Bajos");
            lista.Add("Pakistán");
            lista.Add("Palaos");
            lista.Add("Panamá");
            lista.Add("Papúa Nueva Guinea");
            lista.Add("Paraguay");
            lista.Add("Perú");
            lista.Add("Polonia");
            lista.Add("Portugal");
            lista.Add("Reino Unido");
            lista.Add("República Centroafricana");
            lista.Add("República Checa");
            lista.Add("República de Macedonia");
            lista.Add("República del Congo");
            lista.Add("República Democrática del Congo");
            lista.Add("República Dominicana");
            lista.Add("República Sudafricana");
            lista.Add("Ruanda");
            lista.Add("Rusia");
            lista.Add("Samoa");
            lista.Add("San Cristóbal y Nieves");
            lista.Add("San Marino");
            lista.Add("San Vicente y las Granadinas");
            lista.Add("Santa Lucía");
            lista.Add("Santo Tomé y Príncipe");
            lista.Add("Senegal");
            lista.Add("Serbia");
            lista.Add("Seychelles");
            lista.Add("Sierra Leona");
            lista.Add("Singapur");
            lista.Add("Siria");
            lista.Add("Somalia");
            lista.Add("Sri Lanka");
            lista.Add("Suazilandia");
            lista.Add("Sudán");
            lista.Add("Sudán del Sur");
            lista.Add("Suecia");
            lista.Add("Suiza");
            lista.Add("Surinam");
            lista.Add("Tailandia");
            lista.Add("Tanzania");
            lista.Add("Tayikistán");
            lista.Add("Timor Oriental");
            lista.Add("Togo");
            lista.Add("Tonga");
            lista.Add("Trinidad y Tobago");
            lista.Add("Túnez");
            lista.Add("Turkmenistán");
            lista.Add("Turquia");
            lista.Add("Tuvalu");
            lista.Add("Ucrania");
            lista.Add("Uganda");
            lista.Add("Uruguay");
            lista.Add("Uzbekistán");
            lista.Add("Vanuatu");
            lista.Add("Venezuela");
            lista.Add("Vietnam");
            lista.Add("Yemen");
            lista.Add("Yibuti");
            lista.Add("Zambia");
            lista.Add("Zimbabue");

            combo.Items.AddRange(lista.ToArray());
        }
       //Llave de la clase

        public static void ClearAllControls(Control con)
        {
            foreach (Control c in con.Controls)
            {
                if (c is TextBox)
                    ((TextBox)c).Clear();
                
                if (c is DataGridView)               
                    ((DataGridView)c).DataSource = null;           

                else
                    ClearAllControls(c);
            }
        }

        internal static void llenarComboBoxLocalidades(ComboBox comboBoxLocalidad)
        {
            Herramientas.llenarComboBox(comboBoxLocalidad, "TPGDD.localidadesSP");

        }

        internal static void VerificarSeleccionDataGrid(DataGridView dataGridView)
        {
            if (dataGridView.CurrentRow == null)
                throw new Exception("DEBE SELECCIONAR UNA FILA.");
        }

        internal static void MostrarMessageBox(Exception ex)
        {
            MessageBox.Show(ex.Message , "Error", MessageBoxButtons.OK, MessageBoxIcon.Error);                
        }

        internal static void MostrarFormularioAsShowDialog(Form form)
        {
            form.ShowDialog();
        }

        internal static string encriptarSHA256(string text)
        {
            SHA256CryptoServiceProvider provider = new SHA256CryptoServiceProvider();

            byte[] contraseniaBytes = Encoding.UTF8.GetBytes(text);
            byte[] hashedByte = provider.ComputeHash(contraseniaBytes);

            StringBuilder salida = new StringBuilder();

            for (int i = 0; i < hashedByte.Length; i++)
                salida.Append(hashedByte[i].ToString("x2").ToLower());

            return salida.ToString();
        }

        internal static DataTable convertToDataTableRowsSelected(DataGridView sourceDataGridView)
        {

            DataTable selectedRows = (sourceDataGridView.DataSource as DataTable).Clone();

            foreach (DataGridViewRow row in sourceDataGridView.SelectedRows)
            {
                selectedRows.Rows.Add((row.DataBoundItem as DataRowView).Row.ItemArray);
            }
            return selectedRows;
        }
    }
}
