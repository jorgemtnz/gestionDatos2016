using MercadoEnvioDesktop.Interfaces;
using System;
using System.Data;
using System.Data.SqlClient;
using System.Windows.Forms;

namespace MercadoEnvioDesktop.ABM_Rol
{
    public partial class FormModificarRol : Form, IForm
    {
        ListBox listaAsignadas = new ListBox();
        ListBox listaDisponibles = new ListBox();
        GUI gui = new GUI();
        long id;
        Boolean habilitado;

        public FormModificarRol(long unId)
        {
            InitializeComponent();
            id = unId;

            #region inicializarGui
            gui.inicializar(this);
            botonGuardar1.setGUI(gui);
            botonLimpiar1.setGUI(gui);
            gui.controles.Add(lstFuncionActuales);
            gui.controles.Add(lstFuncionDisponibles);
            gui.controles.Add(txtNombre);
            gui.controles.Add(chkHabilitado);
            chkHabilitado.setGUI(gui);
            #endregion

            #region inicializarUserControls
            lstFuncionActuales.inicializar("Asignadas",false,false);
            lstFuncionDisponibles.inicializar("No asignadas",false,false);
            txtNombre.inicializar("Nombre", 254);
            chkHabilitado.inicializar("Habilitar");
            #endregion

            #region cargarUserControls
            string[] array = new string[2] { "rol" ,"habilitado"};
            try
            {
                array = SQL.buscarRegistro("SELECT DISTINCT rol, habilitado FROM TPGDD.VW_ROLES_OK where idROL =" + id, array);
                txtNombre.setText(array[0]);
                habilitado = Convert.ToBoolean(array[1]);
                chkHabilitado.inicializar("Habilitado", Convert.ToBoolean(array[1]));
                lstFuncionActuales.Enabled = chkHabilitado.getValor();
                lstFuncionDisponibles.Enabled = chkHabilitado.getValor();
            }
            catch
            { 
            }
            #endregion
        }

        #region eventos
        private void FormModificarRol_Load(object sender, EventArgs e)
        {
            listaAsignadas = lstFuncionActuales.getList();
            listaDisponibles = lstFuncionDisponibles.getList();
            DataTable dt = SQL.cargarDataTable("select funcionalidad from TPGDD.VW_ROLES_OK where idRol =" + id + " ORDER BY  funcionalidad ");
            foreach(DataRow row in dt.Rows) 
            {
                listaAsignadas.Items.Add(row["funcionalidad"].ToString());
            }
            dt = SQL.cargarDataTable("SELECT * FROM TPGDD.FX_FUNCIONALIDADES_NO_ASIGNADAS_OK (" + id + ")");
            foreach(DataRow row in dt.Rows) 
            {
                listaDisponibles.Items.Add(row["nombre"].ToString());
            }   
        }

        private void btnAsignar_Click(object sender, EventArgs e)
        {
            if (listaDisponibles.SelectedItem == null) return;
                listaAsignadas.Items.Add(listaDisponibles.SelectedItem);
                listaDisponibles.Items.Remove(listaDisponibles.SelectedItem);
        }

       private void btnDesasignar_Click(object sender, EventArgs e)
       {
           if (listaAsignadas.SelectedItem == null) return;
           listaDisponibles.Items.Add(listaAsignadas.SelectedItem);
           listaAsignadas.Items.Remove(listaAsignadas.SelectedItem);
       }
        #endregion

        #region metodos
        private void MoveListBoxItems(ListBox source, ListBox destination)
        {
            ListBox.SelectedObjectCollection sourceItems = source.SelectedItems;
            foreach (var item in sourceItems)
            {
                destination.Items.Add(item);
            }
            while (source.SelectedItems.Count > 0)
            {
                source.Items.Remove(source.SelectedItems[0]);
            }
        }

        #endregion

        #region metodosInterfase
           public void ejecutarSQL()
           {
               try //hacer esto bien
               {
                   if ((!Convert.ToBoolean(chkHabilitado.getValor())) && habilitado )
                   {
                       DialogResult result = MessageBox.Show("Si desahibilita el rol todas las funcionalidades asignadas seran eliminadas, ¿Desea continuar de todas formas?", "Confirmar accion", MessageBoxButtons.YesNoCancel, MessageBoxIcon.Question);
                       if (result == DialogResult.Yes)
                       {
                           SQL.ejecutar_SP("EXEC TPGDD.SP_UPDATE_ROLES_OK " + id + ", '" + txtNombre.getValor() + "','" + chkHabilitado.getValor() + "'");
                       }
                   }
                   else
                   {
                       SQL.ejecutar_SP("EXEC TPGDD.SP_UPDATE_ROLES_OK " + id + ", '" + txtNombre.getValor() + "','" + chkHabilitado.getValor() + "'");
                       if (Convert.ToBoolean(chkHabilitado.getValor()))
                       {
                           foreach (var item in listaAsignadas.Items)
                           {
                               if (item.ToString().Trim() != "")
                                   SQL.ejecutar_SP("EXEC TPGDD.SP_INSERT_FUNCIONALIDAD_ROL_OK '" + txtNombre.getValor() + "', '" + item.ToString() + "'");
                           }
                       }
                   }

                   botonLimpiar1.limpiar();
                   botonGuardar1.Enabled = false;
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

           public void manejarEvento(int numeroEvento)
           {
               lstFuncionActuales.Enabled = chkHabilitado.getValor();
               lstFuncionDisponibles.Enabled = chkHabilitado.getValor();
           }
           public void manejarEventoGrilla(int numeroEvento, long idSeleccionado) { }
        #endregion
    }
}
