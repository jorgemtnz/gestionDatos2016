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
    public partial class BotonLimpiar : UserControl, IBoton
    {
        GUI gui;

        public BotonLimpiar()
        {
            InitializeComponent();
        }

        #region eventos

             private void btnGenerico_Click(object sender, EventArgs e)
             {
                try
                {
                    gui.controles.ForEach(unControl => unControl.limpiar());
                    gui.errorProviderClear(); 
                }
                catch (Exception ex) //mejorar esto
                {
                    Console.WriteLine("Ha ocurrido un error: '{0}'", ex);
                }
            }

        #endregion

        #region metodos

             public void setGUI(GUI unaGui)
             {
                 gui = unaGui;
             }

       #endregion
    }
}
