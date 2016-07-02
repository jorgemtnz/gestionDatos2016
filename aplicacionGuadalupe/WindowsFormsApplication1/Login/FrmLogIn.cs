using System;
using System.Windows.Forms;
using System.Data.SqlClient;
using MercadoEnvioDesktop.Interfaces;

namespace MercadoEnvioDesktop
{
    public partial class FrmLogIn : Form, IForm
    {
        FrmMaster miMaster;
        GUI gui = new GUI();
 
        public FrmLogIn(FrmMaster unMaster)
        {
            InitializeComponent();
            this.miMaster = unMaster;

            #region inicializarGui
            cboRol.setGUI(gui);
            gui.inicializar(this);
            gui.controles.Add(txtContraseña);
            gui.controles.Add(txtUsuario);
            botonLogin1.setGUI(gui);
            #endregion

            #region inicializarUserControls
            txtUsuario.inicializar("Usuario", 254,180,true);
            txtContraseña.inicializar("Contraseña", 254, 180, true);
            txtContraseña.convertirEnPass();
            cboRol.inicializar("Rol", true);
            #endregion
        }

        #region eventos
        private void FrmLogIn_Load(object sender, EventArgs e)
        {
            cboRol.cargarCombo(SQL.cargarDataTable("Select DISTINCT rol, idRol from TPGDD.VW_ROLES_OK where habilitado=1"), "rol", "idRol");
        }
        #endregion

        #region metodosInterface
        public void ejecutarSQL()
        {
            string[] array = new string[] { "idUsuario", "tipoUsuario", "intentosFallidos", "bajaLogica", "flagHabilitado", "IDROL" };
            try
            {
                array = SQL.buscarRegistro("EXEC tpgdd.SP_USUARIO_LOGIN_OK '" + txtUsuario.getValor() + "','" + Encriptador.EncriptarPassword(txtContraseña.getValor()) + "','" + cboRol.getValorString() + "'", array);

                if (array[0] == "vacio")
                {
                    MessageBox.Show("No se encontró el usuario con el rol especificado");
                    return;
                }

                int fallidos = Convert.ToInt32(array[2]);
                Boolean baja = Convert.ToBoolean(array[3]);
                Boolean habilitado = Convert.ToBoolean(array[4]);

                if (!baja && habilitado)
                {
                    
                    Usuario USER = new Usuario(array, txtUsuario.getValor(), cboRol.getValorString());

                    miMaster.setMiUsuario(USER);
                    int idRol = Convert.ToInt32(cboRol.getValor()) - 1;
                    miMaster.habilitarMenu(idRol);
                    if (USER.rol.ToLower()  == "administrador")
                    {
                        miMaster.finalizarSubastasVencidas();
                    }
                    this.Close();
                }
            }
            catch (SqlException ex)
            {
                ExceptionManager.manejadorExcepcionesSQL(ex);
            }
            catch
            {
                MessageBox.Show("Usuario o contraseña no validos");
            }
        }

        public void manejarEvento(int numeroEvento)
        {
           
        }

        public void manejarEventoGrilla(int numeroEvento, long idSeleccionado)
        {
            throw new NotImplementedException();//no deberia entrar aca
        }
        #endregion

    }
}

