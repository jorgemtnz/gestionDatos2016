using System;
using System.Drawing;
using System.Windows.Forms;
using System.Globalization;

namespace MercadoEnvioDesktop.UserControls
{
    public partial class TextoDecimal : UserControl, IControlDeUsuario 
    {
        Boolean requerido = false;
        public TextoDecimal()
        {
            InitializeComponent();
        }

        #region eventos

        private void txtNumerico_KeyPress(object sender, KeyPressEventArgs e)
        {
            CultureInfo cc = System.Threading.Thread.CurrentThread.CurrentCulture;
            if (char.IsNumber(e.KeyChar) || e.KeyChar.ToString() == cc.NumberFormat.NumberDecimalSeparator || e.KeyChar == (char)Keys.Back)
                e.Handled = false;
            else
                e.Handled = true;
        }

        private void txtNumerico_EnabledChanged(object sender, EventArgs e)
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

        public string getNumero()
        {
            if (txtNumerico.Text.Trim() != "")
            {
                return txtNumerico.Text.Replace(',', '.');
            }
            else return "0";
        }
        public string getValor()
        {
            if (txtNumerico.Text.Trim() != "")
            {
                return  txtNumerico.Text.Replace(',','.');
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
            return "Completar, solo se admiten números decimales";
        }

        public Boolean esRequerido()
        {
            return requerido;
        }

        public Boolean esValido()
        {
            return ((!requerido) || (txtNumerico.Text.Trim() != "") || (!this.Enabled));
        }

        public void limpiar()
        {
            if (this.Enabled)
                txtNumerico.Text = "";
        }

        #endregion
    }
}

