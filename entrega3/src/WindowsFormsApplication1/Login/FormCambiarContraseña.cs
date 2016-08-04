using MercadoEnvioDesktop.Interfaces;
using System;
using System.Data.SqlClient;
using System.Linq;
using System.Windows.Forms;

namespace MercadoEnvioDesktop.Login
{
    public partial class FormCambiarContraseña : Form, IForm
    {
        GUI gui = new GUI();
        Usuario miUsuario;

        public FormCambiarContraseña(Usuario miUsuario)
        {
            InitializeComponent();
            this.miUsuario = miUsuario;

            #region inicializarGUI
            gui.inicializar((IForm)this);
            gui.controles.AddRange(grpContraseñas.Controls.Cast<IControlDeUsuario>());
            btnGuardar.setGUI(gui);
            btnLimpiar.setGUI(gui);
            #endregion

            #region inicializarUserControls
            txtContraseñaAnterior.inicializar("Contraseña anterior", 254, 160, true);
            txtContraseñaAnterior.convertirEnPass();  
            txtPass.inicializar(254, 160,true);
            #endregion
        }

        #region MetodosInterfase
        public void ejecutarSQL()
        {
            try
            {
                string passAnterior = Encriptador.EncriptarPassword(txtContraseñaAnterior.getValor());
                SQL.ejecutar_SP("EXEC TPGDD.SP_CAMBIAR_CONTRASEÑA_OK " + miUsuario.id + ", '" + passAnterior + "', '" + txtPass.getValor() + "'");
                btnLimpiar.limpiar();
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
            throw new NotImplementedException(); 
        }
        public void manejarEventoGrilla(int numeroEvento, long idSeleccionado)
        {
            throw new NotImplementedException();
        }
        #endregion
    }
}
