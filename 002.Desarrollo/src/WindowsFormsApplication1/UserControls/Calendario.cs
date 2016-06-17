using System;
using System.Drawing;
using System.Windows.Forms;
using MercadoEnvioDesktop;
using System.Data.SqlClient;

namespace ApplicationGdd1
{
    public partial class Calendario : UserControl, IControlDeUsuario 
    {
        Boolean requerido = false;
        GUI gui;

        public Calendario()
        {
            InitializeComponent();
        }

            #region eventos

            private void btnSeleccionar_Click(object sender, EventArgs e)
            {
                FormCalendario calendario = new FormCalendario(txtFecha);
                calendario.ShowDialog(); 
            }

            private void Calendario_EnabledChanged(object sender, EventArgs e)
            {
                if (this.Enabled)
                    pctColor.BackColor = Color.Orange;
                else
                {
                    pctColor.BackColor = Color.PaleGoldenrod;
                    txtFecha.Text = "";
                }
            }

            private void txtFecha_TextChanged(object sender, EventArgs e)
            {
                try
                {
                    gui.manejarEvento(3);
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

            #region inicializar

            public void inicializar(string labelText)
            {
                lblFecha.Text = labelText;
            }
            public void inicializar(string labelText, string text)
            {
                lblFecha.Text = labelText;
                txtFecha.Text = text; 
            }
            public void inicializar(string labelText, Boolean requerido)
            {
                this.requerido = requerido;
                if (requerido) lblFecha.Text = labelText + " (*)";
                else lblFecha.Text = labelText;
            }

            #endregion

            #region metodos

            public string getValor()
            {
                if (txtFecha.Text.Trim() != "")
                {
                    return txtFecha.Text;
                }
                else return "";
            }
            public void setText(string text)
            {
                txtFecha.Text = text;
            }
            #endregion

            #region metodosDeInterfase

            public String errorEnErrorProvider()
            {
                return "Seleccionar una fecha haciendo clic en el boton de la izquierda";
            }

            public Boolean esRequerido()
            {
                return requerido;
            }

            public Boolean esValido()
            {
                return ((!requerido) || (txtFecha.Text != ""));
            }

            public void limpiar()
            {
                txtFecha.Text = "";
            }

            public void setGUI(GUI unaGui)
            {
                gui = unaGui;
            }

            #endregion
    }
}
