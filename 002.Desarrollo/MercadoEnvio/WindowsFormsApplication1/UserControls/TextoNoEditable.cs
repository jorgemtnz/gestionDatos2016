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
    public partial class TextoNoEditable :UserControl, IControlDeUsuario 
    {
        Boolean requerido = false;
        int nroFormularioAsociado;

        public TextoNoEditable()
        {
            InitializeComponent();
        }

        #region eventos

            private void btnSeleccionar_Click(object sender, EventArgs e)
            {
                FactoryFormularios.crearForm(nroFormularioAsociado, txtNoEditable).ShowDialog();
            }

        #endregion

        #region inicializacion

            public void inicializar(string labelText, int nroFormularioAsociado)
            {
                lblNoEditable.Text = labelText;
                this.nroFormularioAsociado = nroFormularioAsociado;
            }

            public void inicializar(string labelText, Boolean requerido, int nroFormularioAsociado)
            {
                this.requerido = requerido;
                if (requerido) lblNoEditable.Text = labelText + " (*)";
                else lblNoEditable.Text = labelText;
                this.nroFormularioAsociado = nroFormularioAsociado;
            }

            public void inicializar(string labelText, int width, Boolean requerido, int nroFormularioAsociado)
            {
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
                return txtNoEditable.Text;
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
                return (requerido && txtNoEditable.Text != "") || (!requerido); 
            }

            public void limpiar()
            {
                txtNoEditable.Text = "";
            }

        #endregion

    }
}
