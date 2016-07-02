using MercadoEnvioDesktop.Interfaces;
using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Windows.Forms;

namespace MercadoEnvioDesktop.ABM_Rol
{
    public partial class FormAltaRol : Form, IForm
    {
        GUI gui = new GUI();

        public FormAltaRol(Boolean esModificacion)
        {
            InitializeComponent();

            #region inicializarUserControls
            txtNombre.inicializar("Nombre rol", 254, 300, true);
            lstFuncionalidades.inicializar("Funcionalidades", true);
            #endregion

            #region inicializarGUI

            gui.inicializar((IForm)this);
            gui.controles.AddRange(grpRol.Controls.Cast<IControlDeUsuario>());
            
            foreach (IBoton unBoton in grpBotonera.Controls)
            {
                unBoton.setGUI(gui);
            }
            #endregion
        }

        #region eventos

            private void FormABMRol_Load(object sender, EventArgs e)
            {
                cargarDatos();
            }

        #endregion

        #region metodos

            private void cargarDatos()
            {
                DataTable dt = SQL.cargarDataTable("SELECT * from TPGDD.VW_FUNCIONALIDADES_OK order by id");
                lstFuncionalidades.cargarList(dt, "nombre", "id");
            }
        #endregion

        #region metodosInterfase
            public void ejecutarSQL()
            {
                try //hacer esto bien
                {
                    SQL.ejecutar_SP("EXEC TPGDD.Dar_Alta_Roles '" + txtNombre.getValor() + "'");

                    foreach (DataRowView funcionalidad in lstFuncionalidades.getValor()) 
                    {
                        SQL.ejecutar_SP("EXEC TPGDD.AgregarFuncionalidadRol '" + txtNombre.getValor() + "', '" + funcionalidad[0].ToString() + "'");
                    }
                    botonLimpiar1.limpiar();
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
            { }

            public void manejarEventoGrilla(int numeroEvento, long idSeleccionado) { }
        #endregion
    }
}
