using MercadoEnvioDesktop.Interfaces;
using MercadoEnvioDesktop.Utiles;
using System;
using System.Data.SqlClient;
using System.Linq;
using System.Windows.Forms;

namespace MercadoEnvioDesktop.Generar_Publicación
{
    public partial class FormPublicar : Form, IForm
    {
        GUI gui = new GUI();
        Usuario miUsuario;
        long id;
        Boolean esModificacion;

        public FormPublicar(Boolean esModificacion, Usuario miUsuario,long unId)
        {
            InitializeComponent();

            #region inicializarVariables
            id = unId;
            this.miUsuario = miUsuario;
            this.esModificacion = esModificacion;
            #endregion

            #region inicializarGUI

            gui.inicializar((IForm)this);
            gui.controles.AddRange(grpPublicacion.Controls.Cast<IControlDeUsuario>());
            gui.controles.Add(cboEstado);
            foreach (IBoton unBoton in grpBotonera.Controls)
            {
                unBoton.setGUI(gui);
            }
            cboEstado.setGUI(gui);
            cboRubro.setGUI(gui);
            cboTipoPublicacion.setGUI(gui);
            cboVisibilidad.setGUI(gui);

            calFechaInicio.setGUI(gui);
            chkAdmiteEnvio.setGUI(gui); 
            #endregion

            #region inicializarUserControls
                calFechaInicio.inicializar("Fecha creacion", true);
                lblFechaFin.inicializar("Fecha finalizacion", "");
                cboEstado.inicializar("Estado", true);
                cboRubro.inicializar("Rubro", 200, true);
                cboTipoPublicacion.inicializar("Tipo Publicacion", 130, true);
                cboVisibilidad.inicializar("Visibilidad", true);
                txtDescripcion.inicializar("Descripcion", 254, 800, true);
                txtPrecio.inicializar("Precio", 12, 80, true);
                txtStock.inicializar("Stock", 12, 80, true);
                chkAdmiteEnvio.inicializar("Admite envio");
            #endregion

            if (miUsuario.rol.ToLower().Trim() == "administrador")
            {
                grpPublicacion.Enabled = false;
                grpBotonera.Enabled = false;
            }
        }

        #region eventos
        private void FormPublicar_Load(object sender, EventArgs e)
        {
            cargarCombos();
        }
        #endregion

        #region metodos
        private void cargarCombos()
        {
            if (esModificacion) 
            {
                cboTipoPublicacion.cargarCombo(TiposItemsCombos.tiposOperacionLS());
                cboRubro.cargarCombo("select nombre from TPGDD.VW_RUBROS_OK order by nombre", "nombre");
                cboVisibilidad.cargarComboEspecial();
                string[] array = new string[] { "descripcion", "precio", "visibilidad", "rubro", "estado", "stock", "fecha", "finalizacion", "envio", "tipo" };
                try
                {
                    array = SQL.buscarRegistro("SELECT descripcion, precio, visibilidad, rubro, estado, stock, fecha, finalizacion, envio, tipo FROM TPGDD.vw_publicaciones_tipo_ok where id =" + id, array);
                    string estado = array[4];
                    switch (estado.ToLower())
                    {
                        case "pausada":
                            cboEstado.cargarCombo("Activa");
                            cboEstado.cargarCombo("Pausada");
                            grpPublicacion.Enabled = false;
                            break;
                        case "activa":
                            cboEstado.cargarCombo("Activa");
                            cboEstado.cargarCombo("Finalizada");
                            cboEstado.cargarCombo("Pausada");
                            grpPublicacion.Enabled = false;
                            break;
                        case "borrador":
                            cboEstado.cargarCombo("select descripcion from TPGDD.VW_ESTADOS_OK where descripcion not like 'Finalizada'", "descripcion");
                            break;
                    }
                    cboEstado.setText(estado); 
                    cboRubro.setText(array[3]); 
                    cboTipoPublicacion.setText(array[9]);  
                    cboVisibilidad.setText(array[2]);
                    txtDescripcion.setText(array[0]);
                    txtPrecio.setText(array[1]);
                    txtStock.setText(array[5]);
                    calFechaInicio.setText( Convert.ToDateTime(array[6]).ToShortDateString() );
                    lblFechaFin.setText(Convert.ToDateTime(array[7]).ToShortDateString());  
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
            else  
            {
                cboTipoPublicacion.cargarCombo(TiposItemsCombos.tiposOperacionDT(), "operacion", "id");
                cboEstado.cargarCombo(SQL.cargarDataTable("select descripcion , id from TPGDD.VW_ESTADOS_OK where descripcion not like 'Finalizada'"), "descripcion", "id");
                cboRubro.cargarCombo(SQL.cargarDataTable("select nombre , id from TPGDD.VW_RUBROS_OK order by nombre"), "nombre", "id");
                cboVisibilidad.cargarComboEspecial();// cargarCombo(SQL.cargarDataTable("select descripcion , id from TPGDD.VW_VISIBILIDADES_OK "), "descripcion", "id"); 
            }
        }

        #endregion

        #region metodosInterfase
        public void ejecutarSQL()
        {
            try
            {
                if (esModificacion)
                {
                    if (!grpPublicacion.Enabled)
                    {
                        SQL.ejecutar_SP("EXEC TPGDD.SP_UPDATE_PUBLICACION_ESTADO_OK '" + cboEstado.getValorString() + "', " + id + ",'" + calFechaInicio.getValor() + "'");
                    }
                    else
                    {
                        string sql = " '" + cboVisibilidad.getValorString() + "', '" + cboRubro.getValorString() + "', '" + cboEstado.getValorString() + "',"
                                     + miUsuario.id + ", '" + txtDescripcion.getValor() + "'," + txtStock.getNumero() + ", '" + calFechaInicio.getValor() + "',"
                                     + "'" + Convert.ToDateTime(calFechaInicio.getValor()).AddDays(90).ToShortDateString() + "',"
                                     + "'" + txtPrecio.getNumero() + "', '" + chkAdmiteEnvio.getValor() + "'," + id + ", '" + cboTipoPublicacion.getValorString() + "'";              
                      
                        Console.WriteLine(sql);
                        SQL.ejecutar_SP("EXEC TPGDD.SP_UPDATE_PUBLICACION_OK " + sql);
                    }
                    this.Close();
                }
                else
                {
                    string sql = " '" + cboTipoPublicacion.getValorString() + "','" + cboVisibilidad.getValorString() + "'," + cboRubro.getValor()
                        + ", " + cboEstado.getValor() + ", " + miUsuario.id + ", '" + txtDescripcion.getValor() + "', "
                        + txtStock.getValor() + ", '" + calFechaInicio.getValor() + "', '" + Convert.ToDateTime(calFechaInicio.getValor()).AddDays(90).ToShortDateString() + "',"
                        + txtPrecio.getValor() + ", '" + chkAdmiteEnvio.getValor() + "'";
                    Console.WriteLine(sql);
                    SQL.ejecutar_SP("EXEC TPGDD.SP_INSERT_PUBLICACION_OK " + sql);
                }
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
            switch (numeroEvento)
            {
                case 1://cbo selected index changed  
                    try{
                        if (cboTipoPublicacion.getValorString().ToLower() == "subasta") //si cambia de compra inmediata a subasta
                        {
                            txtStock.Enabled = false;
                            txtStock.setText("1");
                        }
                        if (cboTipoPublicacion.getValorString().ToLower() == "compra inmediata")
                        {
                            txtStock.Enabled = true;
                        }
                        if (!char.IsUpper(cboVisibilidad.getValorString(), 0))
                        {
                            chkAdmiteEnvio.Enabled = false;
                            chkAdmiteEnvio.setValor(false);
                        }
                        if (char.IsUpper(cboVisibilidad.getValorString(), 0))
                        {
                            chkAdmiteEnvio.Enabled = true;
                        }                
                    }
                    catch 
                    {
                    }
                    break;
                case 3://text changed
                    try
                    {
                        lblFechaFin.setText(Convert.ToDateTime(calFechaInicio.getValor()).AddDays(90).ToShortDateString() + "  (toda publicacion finalizará a 90 dias de su fecha de creación)");
                    }
                    catch
                    {
                        lblFechaFin.setText("");
                    }
                    break;
            }
        }
        public void manejarEventoGrilla(int numeroEvento, long idSeleccionado) { }
        #endregion
    }
}