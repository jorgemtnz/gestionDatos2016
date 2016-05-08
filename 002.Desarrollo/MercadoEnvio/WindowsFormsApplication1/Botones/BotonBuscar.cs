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
    public partial class BotonBuscar : UserControl, IBoton
    {
        GUI gui;

        public BotonBuscar()
        {
            InitializeComponent();
        }

        #region eventos

            private void btnBuscar_Click(object sender, EventArgs e)
            {
                try
                {
                    if (gui.validar())
                    {
                        //hacer algo util acá
                        MessageBox.Show("validado");
                        //gui.buscar();
                    }
                    else
                    {
                        gui.marcarErrores();
                    }
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
