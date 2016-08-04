using System;
using System.Drawing;
using System.Windows.Forms;
using MercadoEnvioDesktop;

namespace ApplicationGdd1
{
    public partial class TextoNumerico : UserControl, IControlDeUsuario 
    {
        Boolean requerido = false;

        public TextoNumerico()
        {
            InitializeComponent();
        }

        #region eventos

        private void txtLibre_KeyPress(object sender, KeyPressEventArgs e)
        {
            e.Handled = !(char.IsDigit(e.KeyChar) || char.IsControl(e.KeyChar) || e.KeyChar == (char)Keys.Back);
        }

        private void TextoNumerico_EnabledChanged(object sender, EventArgs e)
        {
            if (this.Enabled)
                pctColor.BackColor = Color.Orange;

            else
            {
                pctColor.BackColor = Color.PaleGoldenrod;
            }  
        }
        #endregion

        #region inicializacion

        public void inicializar(string labelText)
        {
            lblNumerico.Text = labelText;
        }
        public void inicializar(string labelText, string Text)
        {
            lblNumerico.Text = labelText;
            txtNumerico.Text = Text;
        }
        public void inicializar(string labelText, int maxLength)
        {
            lblNumerico.Text = labelText;
            txtNumerico.MaxLength = maxLength;
        }

        public void inicializar(string labelText, int maxLength, int width)
        {
            lblNumerico.Text = labelText;
            txtNumerico.Size = new System.Drawing.Size(width, 25);
            txtNumerico.MaxLength = maxLength;
        }

        public void inicializar(string labelText, Boolean requerido)
        {
            this.requerido = requerido;
            if (requerido) lblNumerico.Text = labelText + " (*)";
            else lblNumerico.Text = labelText;
        }

        public void inicializar(string labelText, int maxLength, int width, Boolean requerido)
        {
            this.requerido = requerido;
            txtNumerico.Size = new System.Drawing.Size(width, 25);
            txtNumerico.MaxLength = maxLength;
            if (requerido) lblNumerico.Text = labelText + " (*)";
            else lblNumerico.Text = labelText;
        }

        #endregion

        #region metodos

        public long getNumero()
        {
            if (txtNumerico.Text.Trim() != "")
            {
                return Convert.ToInt64(txtNumerico.Text);
            }
            else return 0;
        }

        public string getValor()
        {
            if (txtNumerico.Text.Trim() != "")
            {
                return txtNumerico.Text;
            }
            else return "";
        }
        public string getValorSQL()
        {
            if (txtNumerico.Text.Trim() != "")
            {
                return txtNumerico.Text;
            }
            else return " null ";
        }
        public void setText(String valor)
        {
            txtNumerico.Text = valor;
        }
        #endregion

        #region metodosDeInterfase

        public String errorEnErrorProvider()
        {
            return "Completar, solo se admiten números";
        }

        public Boolean esRequerido()
        {
            return requerido;
        }

        public Boolean esValido()
        {
            return ((!requerido) || (txtNumerico.Text.Trim()  != "") || (!this.Enabled));
        }
        public void limpiar()
        {
            if (this.Enabled)
            txtNumerico.Text = "";
        }

        #endregion
    }
}
