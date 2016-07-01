using System;
using System.Drawing;
using System.Data;
using System.Windows.Forms;
using MercadoEnvioDesktop;
using System.Data.SqlClient;
using System.Collections.Generic;

namespace ApplicationGdd1
{
    public partial class combo : UserControl, IControlDeUsuario, IBoton
    {
        Boolean requerido = false;
        GUI gui;

        public combo()
        {
            InitializeComponent();
        }

        #region eventos

            private void cboSeleccion_SelectedIndexChanged(object sender, EventArgs e)
            {
                try
                {
                    gui.manejarEvento(1);
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

            private void combo_EnabledChanged(object sender, EventArgs e)
            {
                
                this.requerido = this.Enabled;
                if (this.Enabled)
                    pctColor.BackColor = Color.Orange;
                else
                {
                    pctColor.BackColor = Color.PaleGoldenrod;
                    cboSeleccion.Text = "";
                }
            }

        #endregion

            #region inicializacion

            public void inicializar(string labelText)
            {
                lblCombo.Text = labelText;
            }

            public void inicializar(string labelText, string text)
            {
                lblCombo.Text = labelText;
                cboSeleccion.Text = text;  
            }

            public void inicializar(string labelText, int width)
            {
                lblCombo.Text = labelText;
                cboSeleccion.Size = new System.Drawing.Size(width, 25);
            }

            public void inicializar(string labelText, Boolean requerido)
            {
                this.requerido = requerido;
                if (requerido) lblCombo.Text = labelText + " (*)";
                else lblCombo.Text = labelText;
            }

            public void inicializar(string labelText, int width, Boolean requerido)
            {
                this.requerido = requerido;
                if (requerido) lblCombo.Text = labelText + " (*)";
                else lblCombo.Text = labelText;
                cboSeleccion.Size = new System.Drawing.Size(width, 25);
            }

            #endregion

            #region metodos

            public void mostrarData(DataTable dt, string campo, string id)//este despues borrarlo solo sirve para mostrar
            {

                foreach (DataRow row in dt.Rows)
                {
                    MessageBox.Show(row[campo].ToString() + " - " + row[id].ToString());
                }
            }

            public void cargarCombo(List<string> lista)
            {
                lista.ForEach(item => cboSeleccion.Items.Add(item));
            }

            public void cargarCombo(string consulta, string campo)
            {
                try
                {
                    DataTable dt = SQL.cargarDataTable(consulta);
  
                    if (dt.Rows.Count < 2) return;
                    foreach (DataRow row in dt.Rows)
                    {
                        cboSeleccion.Items.Add(row[campo].ToString());
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

            public void cargarCombo(DataTable dt, string campo, string id)
            {
                try
                {
                    //if (dt.Rows.Count <2) return;
                    cboSeleccion.DataSource = dt;// lista;
                    cboSeleccion.DisplayMember = campo;//nombre del campo de la tabla que quiero mostrar
                    cboSeleccion.ValueMember = id;//PK del campo que se muestra para tener a mano
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

            public void cargarCombo(string item)
            {
                cboSeleccion.Items.Add(item);
            }

            public string getValor()
            {
                if (cboSeleccion.Text.Trim() != "")
                {
                    return cboSeleccion.SelectedValue.ToString();
                }
                else
                {
                    return null;
                }
            }
            public string getValorSQL()
            {
                if (cboSeleccion.Text.Trim() != "")
                {
                    return "'" + cboSeleccion.SelectedValue.ToString() + "'";
                }
                else
                {
                    return " null ";
                }
            }
            public string getValorString()
            {
                if (cboSeleccion.Text != "")
                {
                    return cboSeleccion.Text;
                }
                else
                {
                    return null;
                }
            }

            public void setGUI(GUI unaGui)
            {
                gui = unaGui;
            }

            public void setText(string unTexto)
            {
                cboSeleccion.Text = unTexto;
            }

            #endregion

            #region metodosInterfase

            public String errorEnErrorProvider()
            {
                return "Seleccionar una opcion";
            }

            public Boolean esRequerido()
            {
                return requerido;
            }

            public Boolean esValido()
            {
                return (requerido && cboSeleccion.Text != "") || (!requerido);
            }

            public void limpiar()
            {
                cboSeleccion.Text = "";
            }

            #endregion
    }
}
