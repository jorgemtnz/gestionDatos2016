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
            this.lblUsuCod.Text = "Usuario: " + UsuCod;
            this.lblUsuRol.Text = "Rol: "     + UsuRol;
        }

        private void aBMUsuariosToolStripMenuItem_Click(object sender, EventArgs e)
        {
            FactoryFormularios.crearForm(3, false).Show();  
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
    }
}
