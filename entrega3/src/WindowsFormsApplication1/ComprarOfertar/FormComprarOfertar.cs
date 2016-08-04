using MercadoEnvioDesktop.Interfaces;
using System;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Windows.Forms;

namespace MercadoEnvioDesktop.ComprarOfertar
{
    public partial class FormComprarOfertar : Form,IForm
    {
        GUI gui = new GUI();
        Usuario miUsuario;

        public FormComprarOfertar(Usuario miUsuario)
        {
            InitializeComponent();
            this.miUsuario = miUsuario;

            #region inicializarGUI
            gui.inicializar(this);
            gui.controles.AddRange(grpFiltros.Controls.Cast<IControlDeUsuario>());
            gui.controles.Add(lstRubros);
            foreach (IBoton unBoton in grpBotonera.Controls)
            {
                unBoton.setGUI(gui);
            }
            #endregion

            #region inicializarGrilla
            grd.inicializar(gui);
            paginador1.inicializar(grd.getGrilla());
            #endregion

            #region inicializarUserControls
            lstRubros.inicializar("Rubros");
            txtDescripcion.inicializar("Descripcion", 254, 400);
            #endregion
        }

        #region eventos
        private void FormComprarOfertar_Load(object sender, EventArgs e)
        {
            try
            {
                ejecutarSQL();
                grd.crearBotones();
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
        #endregion

        #region metodos

        private string armarFiltrosWhere()
        {
            string where = "";

            foreach (DataRowView element in lstRubros.getValor())
            {
                where += " idRubro=" + element[0].ToString() + " or ";
            }
            if (where != "")
            {
                where = "( " + where.Substring(0, where.Length - 4) + " )";//saca el ultimo " or " de la cadena
            }

            if (txtDescripcion.getValor() != "")
            {
                if (where != "")
                {
                    where += " and ";
                }
                where += " descripcion like '%" + txtDescripcion.getValor() + "%'";

            }
            if (where != "")
            {
                return where + " and ";

            }
            else
            {
                return "";
            }
        }
        #endregion

        #region metodosInterfase
        public void ejecutarSQL()
        {
            try
            {
                string where = armarFiltrosWhere();
                paginador1.cargarGrilla("select id,descripcion,precio,stock,finalizacion,envio,vendedor,tipo  from TPGDD.vw_publicaciones_tipo_ok where " + where + "  vendedor not like '" + miUsuario.username + "' and idEstado in (2,3)  order by PRIORIDAD");
                paginador1.cargarPaginas();
                lstRubros.cargarList(SQL.cargarDataTable("Select * from TPGDD.VW_RUBROS_OK order by nombre"), "nombre", "id");
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
            FactoryFormularios.crearFormModificacion(2,miUsuario, idSeleccionado).Show();
        }
        #endregion
    }
}
