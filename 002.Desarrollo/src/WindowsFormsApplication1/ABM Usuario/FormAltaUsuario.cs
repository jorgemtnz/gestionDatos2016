using MercadoEnvioDesktop.Interfaces;
using MercadoEnvioDesktop.Utiles;
using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Windows.Forms;

namespace MercadoEnvioDesktop.ABM_Usuario
{
    public partial class FormAltaUsuario : Form, IForm
    {
        GUI gui = new GUI();

        public FormAltaUsuario()
        {
            InitializeComponent();

            (tabControl.TabPages[0] as Control).Enabled  = true;
            (tabControl.TabPages[1] as Control).Enabled = false;

            #region inicializarGUI
            gui.inicializar(this);
            gui.controles.AddRange(grpFiltros.Controls.Cast<IControlDeUsuario>());
            gui.controles.AddRange(tabCliente.Controls.Cast<IControlDeUsuario>());
            gui.controles.AddRange(tabEmpresa.Controls.Cast<IControlDeUsuario>());
            foreach (IBoton unBoton in grpBotonera.Controls)
            {
                unBoton.setGUI(gui);
            }

            cboRol.inicializar("Rol", true);
            cboRol.setGUI(gui);
            cboLocalidad.setGUI(gui);
            cboLocalidadEmpresa.setGUI(gui);
            cboTipoDoc.setGUI(gui);
            calFechaCreacion.setGUI(gui);
            calFechaDia.setGUI(gui);
            calFechaNac.setGUI(gui);

            #endregion

            #region inicializarUserControls 

            //usuario
            List<string> lista = new List<string>();
            lista.Add("Cliente");
            lista.Add("Empresa");
            txtUserName.inicializar("Usuario",true);

            //cliente
            txtNombre.inicializar("Nombre", true);
            txtApellido.inicializar("Apellido", true);
            cboTipoDoc.inicializar("Tipo doc.",60,true);
            txtDocumento.inicializar("Documento",true);
            txtEmail.inicializar("Correo electrónico",40,400,true);
            txtTelefono.inicializar("Telefono",true);

            txtCalle.inicializar("Calle");
            txtDepto.inicializar("Depto");
            txtNroCalle.inicializar("Nro");
            txtNroPiso.inicializar("Piso");
            cboLocalidad.inicializar("Localidad",280);
            txtCP.inicializar("CP");

            calFechaNac.inicializar("Fecha nacimiento", true);
            calFechaDia.inicializar("Fecha nacimiento", true);
            calFechaCreacion.inicializar("Fecha de creacion", true);

            //empresa
            txtCuit.inicializar("CUIT",true);
            txtRSocial.inicializar("Razón social",true);
            txtRubroEmpresa.inicializar("Rubro principal",true);
            txtTelefonoEmpresa.inicializar("Telefono",true);
            txtEmailEmpresa.inicializar("Correo electrónico",40,400, true);

            txtNombreContacto.inicializar("Nombre",true);
            txtCiudad.inicializar("Ciudad",true);
           
            txtCalleEmpresa.inicializar("Calle");
            txtNroDirEmpresa.inicializar("Nro");
            txtDeptoEmpresa.inicializar("Depto");
            txtPîsoEmpresa.inicializar("Piso");
            txtCpEmpresa.inicializar("CP");
            cboLocalidadEmpresa.inicializar("Localidad", 280);
            
            calFechaDia.inicializar("Fecha de creacion", true);

            grupContacto.inicializar("Contacto");
            grupDireccionEmpresa.inicializar("Direccion");
            grupDireccionCliente.inicializar("Direccion");  

            #endregion
        }

        #region eventos

        private void FormAltaUsuario_Load(object sender, EventArgs e)
        {
            string sql = "select  DISTINCT idRol as id ,rol as nombre from TPGDD.VW_ROLES_OK where habilitado='TRUE' and rol !='Administrador' order by nombre";
            cboRol.cargarCombo(SQL.cargarDataTable(sql), "nombre", "id");
            cboTipoDoc.cargarCombo(TiposItemsCombos.tiposDocumentoDT(), "tipo", "id");
             sql = "SELECT * from TPGDD.VW_LOCALIDADES_OK order by descripcion";
            cboLocalidad.cargarCombo(SQL.cargarDataTable(sql), "descripcion", "id");
            cboLocalidadEmpresa.cargarCombo(SQL.cargarDataTable(sql), "descripcion", "id");
        
        }

        #endregion

        #region metodos

        public void cambiarValidacionControles(int tipo)
        {
            
            if (tipo == 1) //cliente
            {
                //estos los pongo requeridos porque quiero insertar clientes
                txtNombre.inicializar("Nombre", true);
                txtApellido.inicializar("Apellido", true);
                cboTipoDoc.inicializar("Tipo doc.", 60, true);
                txtDocumento.inicializar("Documento", true);
                txtEmail.inicializar("Correo electrónico", 40, 400, true);
                txtTelefono.inicializar("Telefono", true);
                calFechaNac.inicializar("Fecha nacimiento", true);
                calFechaDia.inicializar("Fecha de creacion", true);
                calFechaDia.inicializar("Fecha nacimiento", true);

                //estos son no requeridos porque son para insertar empresas
                txtCuit.inicializar("CUIT", false);
                txtRSocial.inicializar("Razón social", false);
                txtRubroEmpresa.inicializar("Rubro principal", false);
                txtTelefonoEmpresa.inicializar("Telefono", false);
                txtEmailEmpresa.inicializar("Correo electrónico",false);
                txtNombreContacto.inicializar("Nombre", false);
                txtCiudad.inicializar("Ciudad", false);
                calFechaCreacion.inicializar("Fecha de creacion", false);
            }
            if (tipo == 2)  //empresa
            {
                
                //estos los pongo requeridos porque quiero insertar empresas
                txtCuit.inicializar("CUIT", true);
                txtRSocial.inicializar("Razón social", true);
                txtRubroEmpresa.inicializar("Rubro principal", true); 
                txtTelefonoEmpresa.inicializar("Telefono", true);
                txtEmailEmpresa.inicializar("Correo electrónico", true);
                txtNombreContacto.inicializar("Nombre", true);
                txtCiudad.inicializar("Ciudad", true);
                calFechaCreacion.inicializar("Fecha de creacion", true);

                //estos son no requeridos porque son para insertar clientes
                txtNombre.inicializar("Nombre", false);
                txtApellido.inicializar("Apellido", false);
                cboTipoDoc.inicializar("Tipo doc.", false);
                txtDocumento.inicializar("Documento", false);
                txtEmail.inicializar("Correo electrónico", false);
                txtTelefono.inicializar("Telefono", false);
                calFechaNac.inicializar("Fecha nacimiento", false);
                calFechaDia.inicializar("Fecha de creacion", false);
            }
            if (tipo == 3)  //admin
            {

                //estos son no requeridos porque son para insertar empresas
                txtCuit.inicializar("CUIT", false);
                txtRSocial.inicializar("Razón social", false);
                txtRubroEmpresa.inicializar("Rubro principal", false);
                txtTelefonoEmpresa.inicializar("Telefono", false);
                txtEmailEmpresa.inicializar("Correo electrónico", false);
                txtNombreContacto.inicializar("Nombre", false);
                txtCiudad.inicializar("Ciudad", false);
                calFechaCreacion.inicializar("Fecha de creacion", false);

                //estos son no requeridos porque son para insertar clientes
                txtNombre.inicializar("Nombre", false);
                txtApellido.inicializar("Apellido", false);
                cboTipoDoc.inicializar("Tipo doc.", false);
                txtDocumento.inicializar("Documento", false);
                txtEmail.inicializar("Correo electrónico", false);
                txtTelefono.inicializar("Telefono", false);
                calFechaNac.inicializar("Fecha nacimiento", false);
                calFechaDia.inicializar("Fecha de creacion", false);
            }
        }
        #endregion

        #region metodosInterfase
        public void ejecutarSQL()
        {
            if (cboRol.getValorString().ToLower() == "Administrador")
            {
                return;
            }
            try
            {
                if(  (tabControl.TabPages[1] as Control).Enabled  )
                {
                    string sqlUsuario = cboLocalidadEmpresa.getValorSQL() + ","
                        + "'" + txtUserName.getValor() + "',"
                        + "'" + txtpass.getValor() + "',"
                        + "'" + txtEmailEmpresa.getValor() + "',"
                        + "'" + txtTelefonoEmpresa.getValor() + "',"
                        + txtPîsoEmpresa.getValorSQL() + ","
                        + "'" + txtDeptoEmpresa.getValor() + "',"
                        + "'" + calFechaCreacion.getValor() + "',"
                        + txtNroDirEmpresa.getValorSQL() + ","
                        + "'" + txtCalleEmpresa.getValor() + "',"
                        + "'" + txtCpEmpresa.getValor() + "',"
                        + "'Empresa', ";

                    string sqlEmpresa = " '" + txtRSocial.getValor() + "',"
                        + "'" + txtCuit.getValor() + "',"
                        + "'" + txtNombreContacto.getValor() + "', "
                        + "'" + txtRubroEmpresa.getValor() + "',"
                        + "'" + txtCiudad.getValor() + "'";
                    SQL.ejecutar_SP("EXEC TPGDD.SP_INSERT_EMPRESA_OK " + sqlUsuario + sqlEmpresa);
                }
                if ((tabControl.TabPages[0] as Control).Enabled)
                {
                    string sqlUsuario = cboLocalidad.getValorSQL() + ","
                            + "'" + txtUserName.getValor() + "',"
                            + "'" + txtpass.getValor() + "',"
                            + "'" + txtEmail.getValor() + "',"
                            + "'" + txtTelefono.getValor() + "',"
                            + txtNroPiso.getValorSQL() + ","
                            + "'" + txtDepto.getValor() + "',"
                            + "'" + calFechaDia.getValor() + "',"
                            + txtNroCalle.getValorSQL() + ","
                            + "'" + txtCalle.getValor() + "',"
                            + "'" + txtCP.getValorSQL() + "',"
                            + "'Cliente', ";

                    string sqlCliente = " '" + txtNombre.getValor() + "', "
                                       + "'" + txtApellido.getValor() + "',"
                                       + "'" + calFechaNac.getValor() + "',"
                                       + txtDocumento.getValor() + ","
                                       + " '" + cboTipoDoc.getValorString() + "'";

                    SQL.ejecutar_SP("EXEC TPGDD.SP_INSERT_CLIENTE_OK " + sqlUsuario + sqlCliente);
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

        public void manejarEvento(int numeroEvento)//si el numero es 1 es selected item changed en un combo
        {
                if (cboRol.getValorString().ToLower() == "cliente")
            {
                (tabControl.TabPages[0] as Control).Enabled = true;
                (tabControl.TabPages[1] as Control).Enabled = false;
                tabControl.SelectedTab = (TabPage)tabControl.TabPages[0];
                cambiarValidacionControles(1);
            }
            else if (cboRol.getValorString().ToLower() == "empresa")
            {
                (tabControl.TabPages[0] as Control).Enabled = false;
                (tabControl.TabPages[1] as Control).Enabled = true;
                tabControl.SelectedTab = (TabPage)tabControl.TabPages[1];
                cambiarValidacionControles(2);
            }
            else//es admin
            {
                (tabControl.TabPages[0] as Control).Enabled = false;
                (tabControl.TabPages[1] as Control).Enabled = false;
                cambiarValidacionControles(3);
            }
            
        }
        public void manejarEventoGrilla(int numeroEvento, long idSeleccionado) { }
        #endregion

        private void tabCliente_Click(object sender, EventArgs e)
        {

        }

    }
}

