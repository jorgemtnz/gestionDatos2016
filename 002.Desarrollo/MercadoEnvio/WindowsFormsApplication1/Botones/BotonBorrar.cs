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
    public partial class BotonBorrar : UserControl, IBoton
    {
        GUI gui;

        public BotonBorrar()
        {
            InitializeComponent();
        }

        #region eventos

            private void btnBorrar_Click(object sender, EventArgs e)
            {
                try
                {
                    //hacer algo util aca
                }
                catch (Exception ex)//mejorar
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
