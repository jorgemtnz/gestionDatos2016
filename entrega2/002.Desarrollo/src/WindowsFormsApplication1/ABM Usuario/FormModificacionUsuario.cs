using MercadoEnvioDesktop.Interfaces;
using MercadoEnvioDesktop.Utiles;
using System;
using System.Data.SqlClient;
using System.Linq;
using System.Windows.Forms;

namespace MercadoEnvioDesktop.ABM_Usuario
{
    public partial class FormModificacionUsuario : Form, IForm
    {
        GUI gui = new GUI();
        long idSeleccionado;
        string idUsuario;
        string idCliente;
        string idEmpresa;
        string tipoUsuario;
   
        public FormModificacionUsuario(long unId)
        {
            InitializeComponent();
            idSeleccionado = unId;

            #region inicializarGUI
            gui.inicializar(this);
            gui.controles.AddRange(grpFiltros.Controls.Cast<IControlDeUsuario>());
            gui.controles.AddRange(tabPage1.Controls.Cast<IControlDeUsuario>());
            gui.controles.AddRange(tabEmpresa.Controls.Cast<IControlDeUsuario>());
            foreach (IBoton unBoton in grpBotonera.Controls)
            {
                unBoton.setGUI(gui);
            }
            cboLocalidad.setGUI(gui);
            cboLocalidadEmpresa.setGUI(gui);
            cboTipoDoc.setGUI(gui);
            chkHabilitado.setGUI(gui);
            chkBloqueado.setGUI(gui);
            calFechaCreacion.setGUI(gui);
            calFechaDia.setGUI(gui);
            calFechaNac.setGUI(gui);
            #endregion

            #region inicializarUserControls

            grpPass.inicializar("Resetear contraseña");
            chkBloqueado.inicializar("Cuenta bloqueada");

            //cliente
            txtNombre.inicializar("Nombre",254);
            txtApellido.inicializar("Apellido",254);
            cboTipoDoc.inicializar("Tipo doc.");
            txtDocumento.inicializar("Documento",18);
            txtEmail.inicializar("Correo electrónico", 254, 400);
            txtTelefono.inicializar("Telefono",254);
            txtCalle.inicializar("Calle", 254, 260);
            txtDepto.inicializar("Depto", 50, 40);
            txtNroCalle.inicializar("Nro", 18, 40);
            txtNroPiso.inicializar("Piso", 18, 40);
            cboLocalidad.inicializar("Localidad");
            txtCP.inicializar("CP", 49, 60);
            calFechaNac.inicializar("Fecha nacimiento");
            calFechaDia.inicializar("Fecha de creacion");

            //empresa
            txtCuit.inicializar("CUIT",49);
            txtRSocial.inicializar("Razón social",254);
            txtRubroEmpresa.inicializar("Rubro principal",254);
            txtTelefonoEmpresa.inicializar("Telefono");
            txtEmailEmpresa.inicializar("Correo electrónico", 40, 400);
            txtNombreContacto.inicializar("Nombre contacto", 40, 400);
            txtCiudad.inicializar("Ciudad",255);
            txtCalleEmpresa.inicializar("Calle",254);
            txtNroDirEmpresa.inicializar("Nro",18);
            txtPisoEmpresa.inicializar("Piso",18);
            txtDeptoEmpresa.inicializar("Depto",49);
            txtCpEmpresa.inicializar("CP",49);
            cboLocalidadEmpresa.inicializar("Localidad");
            calFechaCreacion.inicializar("Fecha creacion");

            #endregion

            #region cargarUserControls

            cboTipoDoc.cargarCombo(TiposItemsCombos.tiposDocumentoLS());
            cboLocalidad.cargarCombo("SELECT * from TPGDD.VW_LOCALIDADES_OK order by descripcion", "descripcion");
            cboLocalidadEmpresa.cargarCombo("SELECT * from TPGDD.VW_LOCALIDADES_OK order by descripcion", "descripcion");
            
            string[] array = new string[] { "tipoUsuario","idUsuario", "username", "flagHabilitado", "mail", "telefono", "nroPiso",  "nroDpto",
                "fechaCreacion", "nroCalle", "domCalle", "codPostal", "bajaLogica", "idCliente", "nombre", "apellido",
                "fechaNacimiento","nroDNI","tipoDocumento","idEmpresa","razonSocial","cuit","nombreContacto",
                "nombreRubro","ciudad","descripcion"};
            try
            {
                array = SQL.buscarRegistro("SELECT tipoUsuario, idUsuario, username, flagHabilitado,  mail, telefono, nroPiso, nroDpto"
                  + ",fechaCreacion, nroCalle, domCalle, codPostal, bajaLogica, idCliente, nombre, apellido"
                  + ",fechaNacimiento, nroDNI, tipoDocumento, idEmpresa, razonSocial, cuit, nombreContacto"
                  + ",nombreRubro,ciudad,descripcion FROM TPGDD.VW_CLIENTES_EMPRESAS_OK where tipoUsuario not like 'Administrador' and idUsuario =" + unId, array);

                idUsuario = array[1];
                idCliente = array[13];
                idEmpresa = array[19];
                tipoUsuario = array[0];

                //usuario
                txtPass.inicializar(254, 200, "Nueva contraseña",false);
                lblUsername.inicializar("Usuario", array[2]);
                lblRol.inicializar("Rol", tipoUsuario);
                chkHabilitado.inicializar("Estado activo", Convert.ToBoolean(array[3]));

                if (tipoUsuario == "Cliente")
                {
                    (tabCliente.TabPages[0] as Control).Enabled = true;
                    (tabCliente.TabPages[1] as Control).Enabled = false;
                    tabCliente.SelectedTab = (TabPage)tabCliente.TabPages[0];
                    //cliente
                    txtNombre.setText(array[14]);
                    txtApellido.setText(array[15]);
                    cboTipoDoc.setText(array[18]);
                    txtDocumento.setText(array[17].Substring(0,array[17].Length-3) );
                    txtEmail.setText(array[4]);
                    txtTelefono.setText(array[5]);

                    cboLocalidad.inicializar("Localidad", array[25]);
                    txtCalle.setText(array[10]);
                    txtDepto.setText(array[7]);
                    txtNroCalle.setText(array[9]);
                    txtNroPiso.setText(array[6]);
                    cboLocalidad.setText(array[25]);
                    txtCP.setText(array[11]);

                    calFechaNac.setText(Convert.ToDateTime(array[16]).ToShortDateString());
                    calFechaDia.setText(Convert.ToDateTime(array[8]).ToShortDateString());
                }

                if (tipoUsuario == "Empresa")
                {
                    (tabCliente.TabPages[0] as Control).Enabled = false;
                    (tabCliente.TabPages[1] as Control).Enabled = true;
                    tabCliente.SelectedTab = (TabPage)tabCliente.TabPages[1];
                    //empresa
                    txtCuit.setText(array[21]);
                    txtRSocial.setText(array[20]);
                    txtRubroEmpresa.setText(array[23]);
                    txtTelefonoEmpresa.setText(array[5]);
                    txtEmailEmpresa.setText(array[4]);
                    txtNombreContacto.setText(array[22]);
                    txtCiudad.setText(array[24]);
                    txtCalleEmpresa.setText(array[10]);
                    txtNroDirEmpresa.setText(array[9]);
                    txtPisoEmpresa.setText(array[6]);
                    txtDeptoEmpresa.setText(array[7]);
                    txtCpEmpresa.setText(array[11]);
                    cboLocalidadEmpresa.setText(array[25]);
                    calFechaCreacion.setText(Convert.ToDateTime(array[8]).ToShortDateString());
                }

                grupContacto.inicializar("Contacto");
                grupDireccionEmpresa.inicializar("Direccion");
                grupDireccionCliente.inicializar("Direccion");
            }
            catch
            {

            }
            #endregion
        }

        #region eventos
        private void FormModicacionUsuario_Load(object sender, EventArgs e)
        {
        }
        #endregion

        #region metodosInterfase
        public void ejecutarSQL()//es un update
        {
            try
            {
                if ((tabCliente.TabPages[1] as Control).Enabled)
                {
                    string sqlUsuario = idUsuario + "," 
                        + cboLocalidadEmpresa.getValorSQL() + ","
                        + "'" + txtPass.getValor() + "',"
                        + "'" + chkBloqueado.getValor() + "',"
                        + "'" + txtEmailEmpresa.getValor() + "',"
                        + "'" + txtTelefonoEmpresa.getValor() + "',"
                        + txtPisoEmpresa.getValor() + ","
                        + "'" + txtDeptoEmpresa.getValor() + "',"
                        + "'" + calFechaCreacion.getValor() + "',"
                        + txtNroDirEmpresa.getValorSQL() + ","
                        + "'" + txtCalleEmpresa.getValor() + "',"
                        + "'" + txtCpEmpresa.getValor() + "',"
                        + "'Empresa', "
                        + "'" + chkHabilitado.getValor() + "',";

                    string sqlEmpresa = " '" + txtRSocial.getValor() + "',"
                        + "'" + txtCuit.getValor() + "',"
                        + "'" + txtNombreContacto.getValor() + "', "
                        + "'" + txtRubroEmpresa.getValor() + "',"
                        + "'" + txtCiudad.getValor() + "'";

                    SQL.ejecutar_SP("EXEC TPGDD.SP_UPDATE_USUARIO_EMPRESA_OK " + sqlUsuario + sqlEmpresa);
                }
                if ((tabCliente.TabPages[0] as Control).Enabled)
                {
                    string sqlUsuario = idUsuario + "," 
                            + cboLocalidad.getValorSQL() + ","
                            + "'" + txtPass.getValor() + "',"
                            + "'" + chkBloqueado.getValor() + "'," 
                            + "'" + txtEmail.getValor() + "',"
                            + "'" + txtTelefono.getValor() + "',"
                            + txtNroPiso.getValorSQL() + ","
                            + "'" + txtDepto.getValor() + "',"
                            + "'" + calFechaCreacion.getValor() + "',"
                            + txtNroCalle.getValorSQL() + ","
                            + "'" + txtCalle.getValor() + "',"
                            + "'" + txtCP.getValorSQL() + "',"
                            + "'Cliente',"
                            + "'" + chkHabilitado.getValor() + "',";

                    string sqlCliente = " '" + txtNombre.getValor() + "', "
                            + "'" + txtApellido.getValor() + "',"
                            + "'" + calFechaNac.getValor() + "',"
                            + txtDocumento.getValor() + ","
                            + " '" + cboTipoDoc.getValorString() + "'";

                    SQL.ejecutar_SP("EXEC TPGDD.SP_UPDATE_USUARIO_CLIENTE_OK " + sqlUsuario + sqlCliente);
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
        { }
        #endregion
    }
}
