using System;
using System.Collections.Generic;
using System.Drawing;
using System.Data;
using System.Windows.Forms;
using MercadoEnvioDesktop;
using System.Data.SqlClient;

namespace ApplicationGdd1
{
    public partial class ListaOpciones : UserControl, IControlDeUsuario 
    {
        Boolean requerido = false;

        public ListaOpciones()
        {
            InitializeComponent();
        }

           #region eventos

            private void lstOpciones_SelectedIndexChanged(object sender, EventArgs e)
            {
                //filtrar por opcion seleccionada
            }

       
            private void ListaOpciones_EnabledChanged(object sender, EventArgs e)
            {
                this.requerido = this.Enabled;
                if (this.Enabled)
                    pctColor.BackColor = Color.Orange;
                else
                    pctColor.BackColor = Color.PaleGoldenrod; 
            }

            #endregion

            #region inicializar

            public void inicializar(string labelText)
            {
                lblOpciones.Text = labelText;
            }

            public void inicializar(string labelText, Boolean requerido)
            {
                this.requerido = requerido;
                if (requerido) lblOpciones.Text = labelText + " (*)";
                else lblOpciones.Text = labelText;
            }

            public void inicializar(string labelText, Boolean requerido, Boolean seleccionMultiple)
            {
                this.requerido = requerido;
                if (requerido) lblOpciones.Text = labelText + " (*)";
                else lblOpciones.Text = labelText;
                if (seleccionMultiple)
                    lstOpciones.SelectionMode = SelectionMode.MultiExtended;
                else
                    lstOpciones.SelectionMode = SelectionMode.One; 
            }

            #endregion

            #region metodos

            public void cargarList(DataTable dt, string campo, string id)
            {
                try
                {
                    lstOpciones.DataSource = dt;
                    lstOpciones.DisplayMember = campo;
                    lstOpciones.ValueMember = id;
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
            public void cargarList(List<string> lista)
            {
                try
                {
                    lstOpciones.DataSource = lista;
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

            public ListBox getList()
            {
                return lstOpciones;
            }

            public ListBox.SelectedObjectCollection getValor() //
            {               
                return lstOpciones.SelectedItems;
            }
            public void addRange(ListBox.ObjectCollection nuevosItems)
            {
                //foreach(DataRowView element in lstOpciones.SelectedItems) 
                //{
                //  MessageBox.Show( lstOpciones.Items.ToString ());//element[0].ToString());
                //}
                lstOpciones.Items.AddRange(nuevosItems);
            }
            #endregion

            #region metodosInterfase

            public String errorEnErrorProvider()
            {
                return "Seleccionar al menos una opcion";
            }

            public Boolean esRequerido()
            {
                return requerido;
            }

            public Boolean esValido()
            {
                return true;//validar aca 
            }

            public void limpiar()
            {
                lstOpciones.SelectedIndices.Clear();//.Remove(lstOpciones.SelectedIndex);//si solo quiero borrar uno
            }

            #endregion


    }
}
