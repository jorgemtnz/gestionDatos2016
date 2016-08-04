using System;
using System.Windows.Forms;
using MercadoEnvioDesktop;

namespace ApplicationGdd1
{
    public partial class Check : UserControl, IControlDeUsuario 
    {
        GUI gui;

        public Check()
        {
            InitializeComponent();
        }

            #region eventos
            private void chkOpcion_CheckedChanged(object sender, EventArgs e)
            {
                try
                {
                    gui.manejarEvento(2);
                }
                catch { }
            }
            #endregion

            #region inicializar

            public void inicializar(string texto)
            {
                chkOpcion.Text = texto;
            }
            public void inicializar(string texto, Boolean valor)
            {
                chkOpcion.Text = texto;
                chkOpcion.Checked = valor;
            }
            #endregion

            #region metodos

            public Boolean getValor()
            {
                return chkOpcion.Checked;
            }
            public void setGUI(GUI unaGui)
            {
                gui = unaGui;
            }
            public void setValor(Boolean valor)
            {
                chkOpcion.Checked = valor;
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
                if (this.Enabled)
                chkOpcion.Checked = false;
            }

            #endregion
    }
}
