using ApplicationGdd1;
using MercadoEnvioDesktop.Interfaces;
using System;
using System.Data.SqlClient;
using System.Windows.Forms;

namespace MercadoEnvioDesktop.Facturas
{
    public partial class FormSeleccionVendedor : Form,IForm
    {
        GUI gui = new GUI();
        TextoNoEditable miTextBox;

        public FormSeleccionVendedor(TextoNoEditable unTextbox)
        {
            InitializeComponent();

            #region inicializarGUI
            gui.inicializar((IForm)this);
            gui.controles.Add(txtUsuario);
            foreach (IBoton unBoton in grpBotonera.Controls)
            {
                unBoton.setGUI(gui);
            }
            grdVendedores.inicializar(gui, 0);
            #endregion

            #region inicailizarVariables
            this.miTextBox = unTextbox;
            #endregion

            #region inicializarUserControls
            txtUsuario.inicializar("Usuario", 254,300, false);
            #endregion   
        }

        #region eventos
        private void FormSeleccionVendedor_Load(object sender, EventArgs e)
        {
            ejecutarSQL();
            grdVendedores.crearBotones();
        }
        #endregion

        #region metodos
        private string armarFiltrosWhere()
        {
            if (txtUsuario.getValor().Trim()  != "")
            {
                return " where vendedor like '%" + txtUsuario.getValor() + "%' ";
            }
            return "";
        }
        #endregion

        #region metodosInterfase
        public void ejecutarSQL()
        {
            string where = armarFiltrosWhere();
            try
            {
                grdVendedores.cargarGrilla(SQL.cargarDataTable("select vendedor, reputacion, fechaCreacion, Email from TPGDD.VW_VENDEDORES_OK " + where + " ORDER BY vendedor"));
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

        }
        public void manejarEventoGrilla(int numeroEvento, long idSeleccionado) 
        { 
            miTextBox.setText(grdVendedores.getRetorno());
            this.Close();
        }
        #endregion
    }
}
