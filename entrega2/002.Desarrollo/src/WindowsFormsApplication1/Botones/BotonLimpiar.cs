using System;
using System.Windows.Forms;
using MercadoEnvioDesktop;
using System.Data.SqlClient;

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
                 limpiar();
             }
        #endregion

        #region metodos
             public void limpiar()
             {
                 try
                 {
                     gui.controles.ForEach(unControl => unControl.limpiar());
                     gui.errorProviderClear();
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
             public void setGUI(GUI unaGui)
             {
                 gui = unaGui;
             }
       #endregion
    }
}
