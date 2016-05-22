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
    public partial class BotonComprar : UserControl, IBoton
    {
        GUI gui;
        Boolean confirmado = false;
        public BotonComprar()
        {
            InitializeComponent();
        }

        #region eventos

            private void btnBorrar_Click(object sender, EventArgs e)
            {
                try
                {
                    if (confirmado) //si esta en aceptar compra chequea antes de guardar en bd
                    {
                        if (gui.validar())
                        {
                            MessageBox.Show("validado");
                            //gui.guardar();
                        }
                        else
                        {
                            gui.marcarErrores();
                        }
                    }
                    else //si esta en consultar publicacion carga el formulario de confirmar compra
                    {
                        FactoryFormularios.crearForm(12, true).Show();
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

            public void setConfirmado()
            {
                confirmado = true;
            }
        #endregion

    }
}
