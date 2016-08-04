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
            gui.controles.Add(txtPass);
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
           
            //cliente
            txtNombre.inicializar("Nombre",254);
            txtApellido.inicializar("Apellido", 254);
            cboTipoDoc.inicializar("Tipo doc.");
            txtDocumento.inicializar("Documento",14);
            txtEmail.inicializar("Correo electrónico", 254, 400);
            txtTelefono.inicializar("Telefono",254,200);
            txtCalle.inicializar("Calle", 254, 260);
            txtDepto.inicializar("Depto", 49, 40);
            txtNroCalle.inicializar("Nro", 14, 40);
            txtNroPiso.inicializar("Piso", 14, 40);
            cboLocalidad.inicializar("Localidad");
            txtCP.inicializar("CP", 49, 60);
            calFechaNac.inicializar("Fecha nacimiento");
            calFechaDia.inicializar("Fecha de creacion");

            //empresa
            txtCuit.inicializar("CUIT", 49);
            txtRSocial.inicializar("Razón social", 254);
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
                  + ",nombreRubro,ciudad,descripcion FROM TPGDD.VW_CLIENTES_EMPRESAS_OK where idUsuario =" + unId, array);

                idUsuario = array[1];
                idCliente = array[13];
                idEmpresa = array[19];
                tipoUsuario = array[0];

                //usuario
                txtPass.inicializar(254, 200, "Nueva contraseña",false);
                lblUsername.inicializar("Usuario", array[2]);
                lblRol.inicializar("Rol", tipoUsuario);
                chkHabilitado.inicializar("Deshabilitado", Convert.ToBoolean(array[12]));
                chkBloqueado.inicializar("Desbloqueo", Convert.ToBoolean(array[3]));
                if (tipoUsuario == "Cliente")
                {
                    (tabCliente.TabPages[0] as Control).Enabled = true;
                    (tabCliente.TabPages[1] as Control).Enabled = false;
                    tabCliente.SelectedTab = (TabPage)tabCliente.TabPages[0];
                    cambiarValidacionControles(1);
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
                    cambiarValidacionControles(2);
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

        #region metodos
        private void cambiarValidacionControles(int tipo)
        {
            if (tipo == 1) //cliente
            {
                //cliente
                txtNombre.inicializar("Nombre", true);
                txtApellido.inicializar("Apellido", true);
                txtDocumento.inicializar("Documento", true);
                calFechaNac.inicializar("Fecha nacimiento", true);
                calFechaDia.inicializar("Fecha de creacion", true);

                //empresa
                txtCuit.inicializar("CUIT", false);
                txtRSocial.inicializar("Razón social", false);
                calFechaCreacion.inicializar("Fecha creacion", false);
            }
            if (tipo == 2)  //empresa
            {
                //cliente
                txtNombre.inicializar("Nombre", false);
                txtApellido.inicializar("Apellido", false);
                txtDocumento.inicializar("Documento", false);
                calFechaNac.inicializar("Fecha nacimiento", false);
                calFechaDia.inicializar("Fecha de creacion", false);

                //empresa
                txtCuit.inicializar("CUIT", true);
                txtRSocial.inicializar("Razón social", true);
                calFechaCreacion.inicializar("Fecha creacion", true);
            }
        }
        #endregion

        #region metodosInterfase
        public void ejecutarSQL()
        {
            try
            {
                if ((tabCliente.TabPages[1] as Control).Enabled)//si esoty modificando una empresa
                {
                    string sqlUsuario = idUsuario + ","
                    + cboLocalidadEmpresa.getValorSQL() + ","
                    + "'" + txtPass.getValor() + "',"
                    + "'" + chkBloqueado.getValor() + "',"
                    + "'" + txtEmailEmpresa.getValor() + "',"
                    + txtTelefonoEmpresa.getValorSQL() + ","
                    + txtPisoEmpresa.getValorSQL() + ","
                    + "'" + txtDeptoEmpresa.getValor() + "',"
                    + "'" + calFechaCreacion.getValor() + "',"
                    + txtNroDirEmpresa.getValorSQL() + ","
                    + "'" + txtCalleEmpresa.getValor() + "',"
                    + txtCpEmpresa.getValorSQL() + ","
                    + "'Empresa', "
                    + "'" + chkHabilitado.getValor() + "',";

                    string sqlEmpresa = " '" + txtRSocial.getValor() + "',"
                    + "'" + txtCuit.getValor() + "',"
                    + "'" + txtNombreContacto.getValor() + "',"
                    + "'" + txtRubroEmpresa.getValor() + "',"
                    + "'" + txtCiudad.getValor() + "'";

                    SQL.ejecutar_SP("EXEC TPGDD.SP_UPDATE_USUARIO_EMPRESA_OK " + sqlUsuario + sqlEmpresa);
                    botonLimpiar1.limpiar();
                    botonGuardar1.Enabled = false;
                }
                if ((tabCliente.TabPages[0] as Control).Enabled)//si estoy modificando un cliente
                {
                    string sqlUsuario = idUsuario + ","
                    + cboLocalidad.getValorSQL() + ","
                    + "'" + txtPass.getValor() + "',"
                    + "'" + chkBloqueado.getValor() + "',"
                    + "'" + txtEmail.getValor() + "',"
                    + txtTelefono.getValorSQL() + ","
                    + txtNroPiso.getValorSQL() + ","
                    + "'" + txtDepto.getValor() + "',"
                    + "'" + calFechaDia.getValor() + "',"
                    + txtNroCalle.getValorSQL() + ","
                    + "'" + txtCalle.getValor() + "',"
                    + txtCP.getValorSQL() + ","
                    + "'Cliente',"
                    + "'" + chkHabilitado.getValor() + "',";

                    string sqlCliente = " '" + txtNombre.getValor() + "', "
                    + "'" + txtApellido.getValor() + "',"
                    + "'" + calFechaNac.getValor() + "',"
                    + txtDocumento.getValorSQL() + ","
                    + cboTipoDoc.getValorSQL();

                    SQL.ejecutar_SP("EXEC TPGDD.SP_UPDATE_USUARIO_CLIENTE_OK " + sqlUsuario + sqlCliente);
                    botonLimpiar1.limpiar();
                    botonGuardar1.Enabled = false;
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
