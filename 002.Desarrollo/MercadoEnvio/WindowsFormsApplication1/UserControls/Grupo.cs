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
    public partial class Grupo : UserControl, IControlDeUsuario 
    {
        //public List<IControlDeUsuario> controles = new List<IControlDeUsuario>();

        public Grupo()
        { 
            InitializeComponent();
           // controles.AddRange(groupBox1.Controls.Cast<IControlDeUsuario>());  
        }

        #region inicializar

        public void inicializar(string labelText)
        {
            groupBox1.Text = labelText;
        }

        #endregion

        #region metodos

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
