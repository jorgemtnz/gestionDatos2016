using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Text;
using System.Windows.Forms;

namespace MercadoEnvioDesktop
{
    public partial class FrmMaster : Form
    {
        public FrmMaster(string UsuCod, string UsuRol)
        {
            InitializeComponent();
            this.toolStripStatusLblRol.Text  = "Rol: "     + UsuRol;
            this.toolStripStatusLblUsuario.Text = "Usuario: " + UsuCod;
            this.toolStripStatusLblFecha.Text = "Fecha: " + Fecha.fechaDeHoy().ToShortDateString(); 
        }

        private void aBMUsuariosToolStripMenuItem_Click(object sender, EventArgs e)
        {
            
        }

        private void consultaUsuariosToolStripMenuItem_Click(object sender, EventArgs e)
        {
            FactoryFormularios.crearForm(4, false).Show();
        }

        private void comprarOfertarToolStripMenuItem_Click(object sender, EventArgs e)
        {
            FactoryFormularios.crearForm(5, false).Show();
        }

        private void calificarToolStripMenuItem_Click(object sender, EventArgs e)
        {
            FactoryFormularios.crearForm(6, false).Show();
        }

        private void listadoEstadisticoToolStripMenuItem_Click(object sender, EventArgs e)
        {
            FactoryFormularios.crearForm(7, false).Show();
        }

        private void consultaFacturasToolStripMenuItem_Click(object sender, EventArgs e)
        {
            FactoryFormularios.crearForm(8, false).Show();
        }

        private void aBMVisibilidadToolStripMenuItem_Click(object sender, EventArgs e)
        {
            FactoryFormularios.crearForm(9, false).Show();
        }

        private void generarPublicacionToolStripMenuItem_Click(object sender, EventArgs e)
        {
            FactoryFormularios.crearForm(10, false).Show();
        }

        private void altaToolStripMenuItem_Click(object sender, EventArgs e)
        {
            FactoryFormularios.crearForm(3, false).Show(); 
        }

        private void modificaciónBajaToolStripMenuItem_Click(object sender, EventArgs e)
        {
            FactoryFormularios.crearForm(4, true).Show();
        }

        private void parámetrosToolStripMenuItem_Click(object sender, EventArgs e)
        {
            FactoryFormularios.crearForm(1, true).Show();
        }
    }
}
