using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Drawing;
using System.Data;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;
using MercadoEnvioDesktop;

namespace ApplicationGdd1
{
    public partial class TextoPassword : UserControl, IControlDeUsuario 
    {
        public TextoPassword()
        {
            InitializeComponent();
        }
           
        #region eventos

            private void txtPass_KeyPress(object sender, KeyPressEventArgs e)
            {
                e.Handled = !(char.IsLetter(e.KeyChar) || e.KeyChar == (char)Keys.Back || char.IsDigit(e.KeyChar));
            }

            private void txtConfirmar_KeyPress(object sender, KeyPressEventArgs e)
            {
                e.Handled = !(char.IsLetter(e.KeyChar) || e.KeyChar == (char)Keys.Back || char.IsDigit(e.KeyChar));
            }

        #endregion

        #region inicializacion

            public void inicializar(int maxLength, int width)
            {
                txtConfirmar.Size = new System.Drawing.Size(width, 25);
                txtConfirmar.MaxLength = maxLength;
                txtPass.Size = new System.Drawing.Size(width, 25);
                txtPass.MaxLength = maxLength;
            }

        #endregion

        #region metodos

            public string getValor()
            {
                return txtConfirmar.Text; //encriptar esto antes de mandar
            }

        #endregion

        #region metodosDeInterfase

            public String errorEnErrorProvider()
            {
                return "Completar ingresando dos veces la misma contraseña";
            }

            public Boolean esRequerido()
            {
                return true;
            }

            public Boolean esValido()
            {
                return  ((txtConfirmar.Text != "") && (txtPass.Text != "") && (txtConfirmar.Text == txtPass.Text));
            }

            public void limpiar()
            {
                txtConfirmar.Text = "";
                txtPass.Text = "";
            }

        #endregion

    }
}
