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
    public partial class Check : UserControl, IControlDeUsuario 
    {
        public Check()
        {
            InitializeComponent();
        }

        #region inicializar

        public void inicializar(string texto)
        {
            chkOpcion.Text = texto;
        }

        #endregion

        #region metodos

            public Boolean  getValor()
            {
                return chkOpcion.Checked;
            }

        #endregion

        #region metodosDeInterfase

            public String errorEnErrorProvider()
            {
                return "";//poner algo util aca
            }

            public Boolean esRequerido()
            {
                return true;
            }

            public Boolean esValido()
            {
                return true;
            }

            public void limpiar()
            {
                chkOpcion.Checked = false;
            }

         #endregion


    }
}
