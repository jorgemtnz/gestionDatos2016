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
        #endregion

        #region inicializar

            public void inicializar(string labelText)
            {
                lblOpciones.Text = labelText;
                cargarList();
            }

            public void inicializar(string labelText, Boolean requerido)
            {
                this.requerido = requerido;
                if (requerido) lblOpciones.Text = labelText + " (*)";
                else lblOpciones.Text = labelText;
            }

       #endregion

       #region metodos

            public void cargarList()//cargar con algo util
            {
                List<string> lista = new List<string>();
                lista.Add("opcion 1");
                lista.Add("opcion 2");
                lista.Add("opcion 3");
                lista.Add("opcion 4");
                lista.Add("opcion 5");
                lstOpciones.DataSource = lista;
            }
        /*
            public List<string> getValor()//agregar devolver los seleccionados
            {
                return
            }
        */
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
