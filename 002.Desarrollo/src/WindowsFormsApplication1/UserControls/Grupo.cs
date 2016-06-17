using System;
using System.Windows.Forms;
using MercadoEnvioDesktop;

namespace ApplicationGdd1
{
    public partial class Grupo : UserControl, IControlDeUsuario 
    {
        public Grupo()
        { 
            InitializeComponent();
        }

        #region inicializar

        public void inicializar(string labelText)
        {
            groupBox1.Text = labelText;
        }

        #endregion

        #region metodosDeInterfase

        public String errorEnErrorProvider()
            {
                return null;
            }

            public Boolean esRequerido()
            {
                return false;
            }

            public Boolean esValido()
            {
                return true;
            }

            public void limpiar()
            {
            }

        #endregion

    }
}
