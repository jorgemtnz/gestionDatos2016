using System;
using System.Drawing;
using System.Windows.Forms;
using MercadoEnvioDesktop;

namespace ApplicationGdd1
{
    public partial class TextoPassword : UserControl, IControlDeUsuario 
    {
        Boolean requerido = false;

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

            private void TextoPassword_EnabledChanged(object sender, EventArgs e)
            {
                if (this.Enabled)
                    pctColor.BackColor = Color.Orange;
                else
                    pctColor.BackColor = Color.PaleGoldenrod; 
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
            public void inicializar(int maxLength, int width, string labelText, Boolean requerido)
            {
                txtConfirmar.Size = new System.Drawing.Size(width, 25);
                txtConfirmar.MaxLength = maxLength;
                txtPass.Size = new System.Drawing.Size(width, 25);
                txtPass.MaxLength = maxLength;

                this.requerido = requerido;
                if (requerido)
                {
                    lblAlfanumerico.Text = labelText + "(*)";
                    label1.Text = label1.Text + "(*)";
                }
                else
                {
                    lblAlfanumerico.Text = labelText;
                }
            }
            #endregion

            #region metodos

            public string getValor()
            {
                if (txtConfirmar.Text.Trim() != "")
                {
                    return Encriptador.EncriptarPassword(txtConfirmar.Text);
                }
                else return "";
            }

            #endregion

            #region metodosDeInterfase

            public String errorEnErrorProvider()
            {
                return "Completar ingresando dos veces la misma contraseña";
            }

            public Boolean esRequerido()
            {
                return requerido;
            }

            public Boolean esValido()
            {
                return ((txtConfirmar.Text != "") && (txtPass.Text != "") && (txtConfirmar.Text == txtPass.Text)) || (!requerido);
            }

            public void limpiar()
            {
                txtConfirmar.Text = "";
                txtPass.Text = "";
            }

            #endregion
    }
}
