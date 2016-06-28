using System;
using System.Drawing;
using System.Windows.Forms;
using MercadoEnvioDesktop;

namespace ApplicationGdd1
{
    public partial class TextoNoEditable :UserControl, IControlDeUsuario 
    {
        Boolean requerido = false;
        int nroFormularioAsociado;
        Usuario miUsuario;

        public TextoNoEditable()
        {
            InitializeComponent();
        }

        #region eventos

            private void btnSeleccionar_Click(object sender, EventArgs e)
            {
                FactoryFormularios.crearForm(nroFormularioAsociado, this).ShowDialog();
            }
        
            private void TextoNoEditable_EnabledChanged(object sender, EventArgs e)
            {
                this.requerido = this.Enabled;
                if (this.Enabled)
                    pctColor.BackColor = Color.Orange;
                else
                {
                    pctColor.BackColor = Color.PaleGoldenrod;
                    txtNoEditable.Text = "";
                }
            }

        #endregion

            #region inicializacion

            public void inicializar(string labelText, int nroFormularioAsociado)
            {
                lblNoEditable.Text = labelText;
                this.nroFormularioAsociado = nroFormularioAsociado;
            }
            public void inicializar(string labelText, string Text)
            {
                lblNoEditable.Text = labelText;
                txtNoEditable.Text = Text;
            }
            public void inicializar(string labelText, Boolean requerido, int nroFormularioAsociado, Usuario unUsuario)
            {
                this.miUsuario = unUsuario;
                this.requerido = requerido;
                if (requerido) lblNoEditable.Text = labelText + " (*)";
                else lblNoEditable.Text = labelText;
                this.nroFormularioAsociado = nroFormularioAsociado;
            }

            public void inicializar(string labelText, int width, Boolean requerido, int nroFormularioAsociado, Usuario unUsuario)
            {
                this.miUsuario = unUsuario;
                this.requerido = requerido;
                txtNoEditable.Size = new System.Drawing.Size(width, 25);
                if (requerido) lblNoEditable.Text = labelText + " (*)";
                else lblNoEditable.Text = labelText;
                this.nroFormularioAsociado = nroFormularioAsociado;
            }

            #endregion

            #region metodos

            public string getValor()
            {
                if (txtNoEditable.Text.Trim() != "")
                {
                    return txtNoEditable.Text;
                }
                else return "";
            }

            public void setText(String valor)
            {
                txtNoEditable.Text = valor;
            }
            #endregion

            #region metodosDeInterfase

            public String errorEnErrorProvider()
            {
                return "Seleccione haciendo clic en el boton seleccionar";
            }

            public Boolean esRequerido()
            {
                return requerido;
            }

            public Boolean esValido()
            {
                return true;//(requerido && txtNoEditable.Text == "");
            }

            public void limpiar()
            {
                txtNoEditable.Text = "";
            }

            #endregion

    }
}
