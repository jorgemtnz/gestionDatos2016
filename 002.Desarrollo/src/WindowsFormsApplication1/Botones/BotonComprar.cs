using System;
using System.Windows.Forms;
using MercadoEnvioDesktop;
using System.Data.SqlClient;

namespace ApplicationGdd1
{
    public partial class BotonComprar : UserControl, IBoton
    {
        GUI gui;
        Usuario miUsuario;

        public BotonComprar()
        {
            InitializeComponent();
        }

        #region inicializar
            public void setUsuario(Usuario unUsuario)
            {
                this.miUsuario = unUsuario;
            }
        #endregion

        #region eventos

        private void btnBorrar_Click(object sender, EventArgs e)
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

            public void setText(string unText)
            {
                btnComprar.Text = unText;  
            }

        #endregion

    }
}
