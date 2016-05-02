using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Text;
using System.Windows.Forms;
using System.Data.SqlClient;
using System.Security.Cryptography;

namespace MercadoEnvioDesktop
{
    public partial class FrmLogIn : Form
    {
        public FrmLogIn()
        {
            InitializeComponent();
        }

        public string UsuCod { get; set; }
        public string UsuRol { get; set; }

        private void imgCls_Click(object sender, EventArgs e)
        {
            this.DialogResult = DialogResult.Cancel;
            this.Dispose();
        }

        private void btnLogIn_Click(object sender, EventArgs e)
        {
            try
            {
                string passEnc = DCC.Encriptador.EncriptarPassword(txtCon.Text);
                string comando = "SELECT U.Username, R.Descripcion"
                                 + "FROM USUARIOS U, ROLES R"
                                 + "WHERE U.Id_Rol = R.Id_Rol"
                                 + "AND U.Username = '" + txtUsu.Text + "'"
                                 + "AND U.Password = '" + passEnc + "'";
                DataTable dta = DCC.SQL.SQLQuery(comando);

                if (dta.Rows.Count == 1)
                {
                    this.DialogResult = DialogResult.OK;
                    UsuCod = Convert.ToString(dta.Rows[0][0]);
                    UsuRol = Convert.ToString(dta.Rows[0][1]);
                    this.Close();
                }
                else
                {
                    lblRta.Text = "Usuario/Contraseña incorrectos.";
                    txtUsu.Clear();
                    txtCon.Clear();
                }
            }
            catch(Exception)
            {
                lblRta.Text = "Error al intentar conectarse a la base de datos.";
            }
        }
    }
}

