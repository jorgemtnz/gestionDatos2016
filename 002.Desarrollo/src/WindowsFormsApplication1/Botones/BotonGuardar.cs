using System;
using System.Windows.Forms;
using MercadoEnvioDesktop;
using System.Data.SqlClient;

namespace ApplicationGdd1
{
    public partial class BotonGuardar : UserControl, IBoton
    {
        GUI gui;
        public BotonGuardar()
        {
            InitializeComponent();
        }

        #region eventos

            private void btnGuardar_Click(object sender, EventArgs e)
            {

                try
                {
                    if (gui.validar()) 
                    {
                        gui.guardar();
                    }
                    else
                    {
                        gui.marcarErrores();
                        MessageBox.Show("Falta cargar datos");
                    }
                }
                catch (SqlException ex)
                {
                    ExceptionManager.manejadorExcepcionesSQL(ex);

                }
                catch (Exception ex)
                {
                    ExceptionManager.manejarExcepcion(ex);
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
