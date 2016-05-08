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
    public partial class combo : UserControl, IControlDeUsuario 
    {
        Boolean requerido = false;
        Boolean usaTab = false;
        TabControl tabControl=new TabControl();

        public combo()
        {
            InitializeComponent();
        }

        #region eventos

            private void cboSeleccion_SelectedIndexChanged(object sender, EventArgs e)
            {
                if (usaTab)
                {
                    
                    if (cboSeleccion.SelectedValue.ToString() == "Cliente")
                    {
                        (tabControl.TabPages[0] as Control).Enabled = true;
                        (tabControl.TabPages[1] as Control).Enabled = false;
                        tabControl.SelectedTab = (TabPage)tabControl.TabPages[0]; 
                    }
                    else
                    {
                        (tabControl.TabPages[0] as Control).Enabled = false;
                        (tabControl.TabPages[1] as Control).Enabled = true;
                        tabControl.SelectedTab = (TabPage)tabControl.TabPages[1]; 
                    }
                }
            }

        #endregion

        #region inicializacion 

            //agregar a estos el cargarCbo
            public void inicializar(string labelText)
            {
                lblCombo.Text = labelText;
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

            public void inicializar(string labelText, Boolean requerido, List<String> lista)
            {
                this.requerido = requerido;
                if (requerido) lblCombo.Text = labelText + " (*)";
                else lblCombo.Text = labelText;
                cargarCombo(lista);
            }

            public void inicializar(string labelText, Boolean requerido, List<String> lista, TabControl unTabControl)
            {
                this.requerido = requerido;
                if (requerido) lblCombo.Text = labelText + " (*)";
                else lblCombo.Text = labelText;
                cargarCombo(lista);
                setTabControl(unTabControl);
                usaTab = true;
            }

            public void inicializar(string labelText, int width, Boolean requerido)
            {
                this.requerido = requerido;
                if (requerido) lblCombo.Text = labelText + " (*)";
                else lblCombo.Text = labelText;
                lblCombo.Text = labelText;
                cboSeleccion.Size = new System.Drawing.Size(width, 25);
            }
            
            public void setTabControl(TabControl unTabControl)
            {
                tabControl = unTabControl;
            }

        #endregion

        #region metodos

            public void cargarCombo(List<string> lista)//agregar parametro para cargar segun corresponda
            {
                cboSeleccion.DataSource = lista;
                /*DataTable dt = new DataTable();
                cboSeleccion.DataSource = dt;//una tabla o consulta sql
                cboSeleccion.DisplayMember = "campo";//nombre del campo de la tabla que quiero mostrar
                cboSeleccion.ValueMember = "id";//PK del campo que se muestra para tener a mano
                 */ 
            }

            public string getValor()//podria devolver el value member con el codigo
            {
                return cboSeleccion.Text;
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
