using MercadoEnvioDesktop.Interfaces;
using System;
using System.Data.SqlClient;
using System.Linq;
using System.Windows.Forms;

namespace MercadoEnvioDesktop.ComprarOfertar
{
    public partial class FormComprarPublicacion : Form, IForm
    {
        GUI gui = new GUI();
        Usuario miUsuario;
        long id;
        string vendedor;
        string tipo;
        long stock;
        double precio=0;

        public FormComprarPublicacion(Usuario miUsuario,long unId)
        {
            InitializeComponent();

            #region inicailizarVariables
            this.miUsuario = miUsuario;
            id = unId;
            #endregion

            #region inicializarGUI
            gui.inicializar(this);
            gui.controles.Add(txtCantidad);
            gui.controles.Add(checkEnvio);  
            btncomprar.setGUI(gui);
            botonLimpiar1.setGUI(gui);
            cboMedioDePago.setGUI(gui);
            checkEnvio.setGUI(gui);
            #endregion

            #region inicializarUserControls
            txtCantidad.inicializar("Cantidad",12, 50, true);
            cboMedioDePago.inicializar("Medio de pago", 200);
            grpCompletar.inicializar("Completar");
            checkEnvio.inicializar("Envio");
            #endregion

            cargarControles();
        }

        #region eventos
        private void FormConsultarPublicacion_Load(object sender, EventArgs e)
        {
            cboMedioDePago.cargarCombo(SQL.cargarDataTable("select nombre,id from TPGDD.VW_MEDIOS_PAGO_OK"), "nombre", "id");
        }
        #endregion

        #region metodos
        private void cargarControles()
        {
            string[] array = new string[] { "stock", "descripcion", "fecha", "finalizacion", "vendedor", "precio", "rubro", "reputacion", "tipo", "envio", "estado" };
            try
            {
                array = SQL.buscarRegistro("SELECT stock, descripcion,fecha,finalizacion, vendedor, precio, rubro,reputacion,tipo,envio,estado FROM TPGDD.vw_publicaciones_tipo_ok where id =" + id, array);
                lblCantidadDisponible.inicializar("Cantidad disponible", array[0]);
                stock = Convert.ToInt64(array[0]);
                lblDetalle.inicializar("Descripcion", array[1], 500, true);
                lblFechaFin.inicializar("Finaliza el dia ", Convert.ToDateTime(array[2]).ToShortDateString());
                lblFechaInicio.inicializar("Fecha inicial", Convert.ToDateTime(array[3]).ToShortDateString());
                lblVendedor.inicializar("Vendedor", array[4]);
                vendedor = array[4];
                try
                {
                    precio = Convert.ToDouble (array[5]);
                    lblDescripcion.inicializar("Precio", "$" + array[5]);
                }
                catch
                {
                    MessageBox.Show ("no hay precio para esta publicacion");
                }
                lblRubro.inicializar("Rubro", array[6]);
                lblReputacion.inicializar("Reputacion vendedor", array[7]);
                lblTipo.inicializar("Tipo", array[8]);
                tipo = array[8];
                if (tipo.ToLower() == "subasta")
                {
                    btncomprar.setText("Ofertar");
                    txtCantidad.inicializar("Oferta en $");
                    lblCantidad.inicializar("Cantidad ", "1");
                }
                else
                {
                    btncomprar.setText("Comprar");
                    txtCantidad.Enabled = true;
                    lblCantidad.Visible = false;
                }
                checkEnvio.Enabled = Convert.ToBoolean(array[9]);
                btncomprar.Enabled = (array[10].ToLower() == "activa");
                lblEstado.inicializar("Publicacion " + array[10].ToLower(),"");
                if (array[10].ToLower() == "pausada")
                {
                    lblEstado.cambiarColor();
                    txtCantidad.Enabled = false;
                    checkEnvio.Enabled = false; 
                }
            }
            catch
            {
                lblCantidadDisponible.inicializar("Cantidad disponible", "");
                lblDescripcion.inicializar("Precio", "");
                lblDetalle.inicializar("Descripcion", "", 500, true);
                lblFechaFin.inicializar("Finaliza el dia ", "");
                lblFechaInicio.inicializar("Fecha inicial", "");
                lblReputacion.inicializar("Reputacion vendedor", "");
                lblRubro.inicializar("Rubro", "");
                lblVendedor.inicializar("Vendedor", "");
                lblTipo.inicializar("Tipo", "");
                tipo = "";
                vendedor = "";
            }
        }
        #endregion

        #region metodosInterfase
        public void ejecutarSQL()
        {
            try
            {
                long aux;
                try
                {
                    aux = Convert.ToInt64(txtCantidad.getValor());
                }
                catch
                {
                    aux = 0;//ver esto
                }

                if (tipo.ToLower() == "subasta")
                {
                    if (aux <= precio)
                    {
                        MessageBox.Show("La oferta debe superar el precio actual");
                        return;
                    }
                    SQL.ejecutar_SP("exec TPGDD.SP_INSERT_OFERTAS_OK " + id + "," + miUsuario.id + ", '" + Fecha.fechaDeHoy().ToShortDateString() + "'," + aux );
                }
                else
                {
                    if (aux > stock)
                    {
                        MessageBox.Show("La cantidad solicita supera la cantidad disponible del producto, ingrese una cantidad menor");
                        return;
                    }
                    if (aux == 0)
                    {
                        MessageBox.Show("La cantidad solicita no puede ser cero");
                        return;
                    }
                    SQL.ejecutar_SP("exec TPGDD.SP_INSERT_COMPRAS_OK " + id + "," + miUsuario.id + ", '" + Fecha.fechaDeHoy().ToShortDateString() + "'," + aux + ",'" + tipo + "','" + vendedor + "'");
                }

                botonLimpiar1.limpiar();
                btncomprar.Enabled = false;

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
        public void manejarEventoGrilla(int numeroEvento, long idSeleccionado) { }
        #endregion
    }
}