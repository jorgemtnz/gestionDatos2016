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
    public partial class TextoAlfanumerico : UserControl, IControlDeUsuario 
    {
        Boolean requerido = false;

        public TextoAlfanumerico()
        {
            InitializeComponent();  
        }

        #region eventos

            private void txtLibre_KeyPress(object sender, KeyPressEventArgs e)
            {
                e.Handled = !(char.IsLetter(e.KeyChar) || e.KeyChar == (char)Keys.Back || char.IsDigit(e.KeyChar) || (e.KeyChar == '@') || (e.KeyChar == '_') || (e.KeyChar == '.'));
            }

        #endregion

        #region inicializar

            public void inicializar(string labelText)
            {
                lblAlfanumerico.Text = labelText;
            }

            public void inicializar(string labelText, int maxLength)
            {
                lblAlfanumerico.Text = labelText;
                txtAlfanumerico.MaxLength = maxLength;
            }

            public void inicializar(string labelText, int maxLength, int width)
            {
                lblAlfanumerico.Text = labelText;
                txtAlfanumerico.Size = new System.Drawing.Size(width, 25);
                txtAlfanumerico.MaxLength = maxLength;
            }

            public void inicializar(string labelText, Boolean requerido)
            {
                this.requerido = requerido;
                if (requerido) lblAlfanumerico.Text = labelText + " (*)";
                else lblAlfanumerico.Text = labelText;
            }

            public void inicializar(string labelText, int maxLength, int width, Boolean requerido)
            {
                this.requerido = requerido;
                if (requerido) lblAlfanumerico.Text = labelText + " (*)";
                else lblAlfanumerico.Text = labelText;
                txtAlfanumerico.Size = new System.Drawing.Size(width, 25);
                txtAlfanumerico.MaxLength = maxLength;
            }
            public void inicializar(string labelText, int maxLength, int width, Boolean requerido, Boolean esMultiline)
            {
                this.requerido = requerido;
                if (requerido) lblAlfanumerico.Text = labelText + " (*)";
                else lblAlfanumerico.Text = labelText;
                txtAlfanumerico.Size = new System.Drawing.Size(width, 116);
                txtAlfanumerico.MaxLength = maxLength;
                txtAlfanumerico.Multiline = esMultiline;
                txtAlfanumerico.ScrollBars = ScrollBars.Vertical;  

            }
        #endregion

        #region metodos

            public string getValor()
            {
                return txtAlfanumerico.Text;
            }

        #endregion

        #region metodosDeInterfase

            public String errorEnErrorProvider()
            {
                return "Completar, solo se admiten caracteres, numeros, @, . o _";
            }

            public Boolean esRequerido()
            {
                return requerido;
            }

            public Boolean esValido()
            {
                return (requerido && txtAlfanumerico.Text != "") || (!requerido); 
            }

            public void limpiar()
            {
                txtAlfanumerico.Text = "";
            }

        #endregion





    }
}