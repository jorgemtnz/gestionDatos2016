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
    public partial class Calendario : UserControl, IControlDeUsuario 
    {
        Boolean requerido = false;

        public Calendario()
        {
            InitializeComponent();
        }

        #region eventos

            private void btnSeleccionar_Click(object sender, EventArgs e)
            {
                FormCalendario calendario = new FormCalendario(txtFecha);
                calendario.ShowDialog(); 
            }

        #endregion

        #region inicializar

            public void inicializar(string labelText)
            {
                lblFecha.Text = labelText;
            }

            public void inicializar(string labelText, Boolean requerido)
            {
                this.requerido = requerido;
                if (requerido) lblFecha.Text = labelText + " (*)";
                else lblFecha.Text = labelText;
            }

        #endregion

        #region metodos

           public string getValor()
           {
               return txtFecha.Text;
           }

        #endregion

        #region metodosDeInterfase

            public String errorEnErrorProvider()
            {
                return "Seleccionar una fecha haciendo clic en el boton de la izquierda";
            }

            public Boolean esRequerido()
            {
                return requerido;
            }

            public Boolean esValido()
            {
                return txtFecha.Text !="" ;//validar con algo util
            }

            public void limpiar()
            {
                txtFecha.Text = "";
            }

       #endregion
    }
}
