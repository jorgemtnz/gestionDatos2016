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
                e.Handled = !char.IsDigit(e.KeyChar) && !char.IsControl(e.KeyChar);
            }

        #endregion

       #region inicializacion

            public void inicializar(string labelText)
            {
                lblNumerico.Text = labelText;
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

            public string getValor()
            {
                return txtNumerico.Text;
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
                return (requerido && txtNumerico.Text != "") || (!requerido);
            }

            public void limpiar()
            {
                txtNumerico.Text = "";
            }

       #endregion
    }
}
