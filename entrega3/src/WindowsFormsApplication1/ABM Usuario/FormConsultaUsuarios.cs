using MercadoEnvioDesktop.Interfaces;
using System;
using System.Data.SqlClient;
using System.Linq;
using System.Windows.Forms;

namespace MercadoEnvioDesktop.ABM_Usuario
{
    public partial class FormConsultaUsuarios : Form, IForm
    {
        GUI gui = new GUI();
        Boolean esModificacion;

        public FormConsultaUsuarios(Boolean esModificacion)
        {
            InitializeComponent();

            #region inicializarGUI

            gui.inicializar(this);
            gui.controles.AddRange(tabCliente.Controls.Cast<IControlDeUsuario>());
            gui.controles.AddRange(tabEmpresa.Controls.Cast<IControlDeUsuario>());

            foreach (IBoton unBoton in grpBotonera.Controls)
            {
                unBoton.setGUI(gui);
            }
            grdEmpresas.inicializar(gui);
            grdClientes.inicializar(gui);
            #endregion

            #region inicializarVariables
            this.esModificacion = esModificacion;
            #endregion

            #region inicializarUserControls
            //cliente
            txtNombre.inicializar("Nombre",254);
            txtApellido.inicializar("Apellido",254);
            txtEmail.inicializar("Correo electronico", 254, 400);
            txtNroDoc.inicializar("Nro de documento",10);
            //empresa
            txtCuit.inicializar("CUIT",49);
            txtEmailEmpresa.inicializar("Correo electronico", 254, 400);
            txtRSocial.inicializar("Razon social",254);
            #endregion
        }

        #region eventos
        private void FormConsultaUsuarios_Load(object sender, EventArgs e)
        {
            ejecutarSQL();
            if (esModificacion)
            {
                grdEmpresas.crearBotones();
                grdClientes.crearBotones();
            }
        }
        private void tabFiltros_SelectedIndexChanged(object sender, EventArgs e)
        {
            tabGrillas.SelectedIndex = tabFiltros.SelectedIndex;   
        }
        private void tabGrillas_SelectedIndexChanged(object sender, EventArgs e)
        {
            tabFiltros.SelectedIndex = tabGrillas.SelectedIndex;
        }
        #endregion

        #region metodos

        private string armarFiltrosWhere()
        {
            string where = "";

            if ((tabFiltros.TabPages[0] as Control).Enabled) //si quiero filtrar por cliente
            {
                if (txtNombre.getValor().Trim() != "")
                    where = " and nombre_razon like '%" + txtNombre.getValor() + "%' ";
                if (txtApellido.getValor().Trim() != "")
                {
                    where += " and apellido_rubro like '%" + txtApellido.getValor() + "%' ";
                }
                if (txtNroDoc.getValor().Trim() != "")
                {
                    where += " and dni_cuit like '" + txtNroDoc.getValor() + "'";
                }
                if (txtEmail.getValor().Trim() != "")
                {
                    where += " and Email like '%" + txtEmail.getValor() + "%'";
                }
            }

            if ((tabFiltros.TabPages[1] as Control).Enabled) //si quiero filtrar por empresa
            {
                if (txtRSocial.getValor().Trim() != "")
                    where = " and nombre_razon like '%" + txtRSocial.getValor() + "%' ";
                if (txtCuit.getValor() != "")
                {
                    where += " and dni_cuit like '" + txtCuit.getValor() + "'";
                }
                if (txtEmailEmpresa.getValor().Trim() != "")
                {
                    where += " and Email like '%" + txtEmailEmpresa.getValor() + "%'";
                }
            }
            return where;
        }
        #endregion

        #region metodosInterfase
        public void ejecutarSQL()
        {
            string where = armarFiltrosWhere();
            try
            {
                if ((tabFiltros.TabPages[0] as Control).Enabled) //si quiero filtrar por cliente
                {
                    grdClientes.cargarGrilla(SQL.cargarDataTable("select id,usuario, nombre_razon as nombre, apellido_rubro as apellido,dni_cuit as documento, reputacion, fechaCreacion  as [fecha creacion], Email, bajaLogica as deshabilitado, flagHabilitado as desbloqueado from TPGDD.VW_USUARIOS_OK where tipoUsuario like 'Cliente' " + where + " ORDER BY fechaCreacion,usuario "));
                }
                if ((tabFiltros.TabPages[1] as Control).Enabled) //si quiero filtrar por empresa
                {
                    grdEmpresas.cargarGrilla(SQL.cargarDataTable("select id,usuario, nombre_razon as [razon social], apellido_rubro as [rubro principal],dni_cuit as CUIT, reputacion, fechaCreacion as [fecha creacion], Email ,bajaLogica as deshabilitado, flagHabilitado as desbloqueado from TPGDD.VW_USUARIOS_OK where tipoUsuario like 'Empresa' " + where + " ORDER BY fechaCreacion,usuario "));
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
        public void manejarEvento(int numeroEvento)
        { }
        public void manejarEventoGrilla(int numeroEvento, long idSeleccionado) 
        {
            if (esModificacion)
            {
                FactoryFormularios.crearFormModificacion(11, idSeleccionado).Show();
            }
        }
        #endregion
    }
}
