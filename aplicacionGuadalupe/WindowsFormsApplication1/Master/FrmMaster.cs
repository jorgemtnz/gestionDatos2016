using MercadoEnvioDesktop.Master;
using System;
using System.Windows.Forms;

namespace MercadoEnvioDesktop
{
    public partial class FrmMaster : Form
    {
        Usuario miUsuario;
        MenuPrincipal miMenu = new MenuPrincipal(); 

        public FrmMaster()
        {
            InitializeComponent();
            miMenu.crearMenu(menu);
            this.toolStripStatusLblFecha.Text = "Fecha: " + Fecha.fechaDeHoy().ToShortDateString();
        }

        #region eventos
        private void consultaUsuariosToolStripMenuItem_Click(object sender, EventArgs e)
        {
            Form unForm = FactoryFormularios.crearForm(4);
            unForm.MdiParent = this;  
            unForm.Show();
        }

        private void comprarOfertarToolStripMenuItem_Click(object sender, EventArgs e)
        {
            Form unForm = FactoryFormularios.crearForm(5, miUsuario);
            unForm.MdiParent = this;
            unForm.Show();
        }

        private void calificarToolStripMenuItem_Click(object sender, EventArgs e)
        {
            Form unForm = FactoryFormularios.crearForm(13, miUsuario);
            unForm.MdiParent = this;
            unForm.Show();
        }

        private void listadoEstadisticoToolStripMenuItem_Click(object sender, EventArgs e)
        {
            Form unForm = FactoryFormularios.crearForm(7);
            unForm.MdiParent = this;
            unForm.Show();
        }

        private void consultaFacturasToolStripMenuItem_Click(object sender, EventArgs e)
        {
            Form unForm = FactoryFormularios.crearForm(8, miUsuario);
            unForm.MdiParent = this;
            unForm.Show();
        }

        private void altaToolStripMenuItem_Click(object sender, EventArgs e)
        {
            Form unForm = FactoryFormularios.crearForm(3);
            unForm.MdiParent = this;
            unForm.Show();
        }

        private void modificaciónBajaToolStripMenuItem_Click(object sender, EventArgs e)
        {
            Form unForm = FactoryFormularios.crearFormModificacion(4);
            unForm.MdiParent = this;
            unForm.Show();
        }

        private void altaToolStripMenuItem1_Click(object sender, EventArgs e)
        {
            Form unForm = FactoryFormularios.crearForm(9);
            unForm.MdiParent = this;
            unForm.Show();
        }

        private void consultasToolStripMenuItem_Click(object sender, EventArgs e)
        {
            Form unForm = FactoryFormularios.crearForm(14);
            unForm.MdiParent = this;
            unForm.Show();
        }

        private void modificacionBajaToolStripMenuItem_Click(object sender, EventArgs e)
        {
            Form unForm = FactoryFormularios.crearFormModificacion(14);
            unForm.MdiParent = this;
            unForm.Show();
        }

        private void cerrarSesiónToolStripMenuItem_Click(object sender, EventArgs e)
        {
            if (cerrarSesiónToolStripMenuItem.Text == "iniciar sesión")
            {
                cerrarSesiónToolStripMenuItem.Text = "Cerrar sesión";//esto depende del login ok
                cambiarContraseñaToolStripMenuItem.Visible = true;
                Form unForm = FactoryFormularios.crearForm(16,this); 
                unForm.MdiParent = this;
                unForm.Show();
            }
            else
            {
                this.toolStripStatusLblRol.Text = "Rol: ";
                this.toolStripStatusLblUsuario.Text = "Usuario: ";
                miUsuario = null;
                cerrarSesiónToolStripMenuItem.Text = "iniciar sesión";
                miMenu.desHabilitarMenu();
                loguinToolStripMenuItem.Visible = true;
                cerrarSesiónToolStripMenuItem.Visible = true;
            }
        }

        private void cambiarContraseñaToolStripMenuItem_Click(object sender, EventArgs e)
        {
            Form unForm = FactoryFormularios.crearForm(19, miUsuario);
            unForm.MdiParent = this;
            unForm.Show();
        }

        private void historialClientesToolStripMenuItem_Click(object sender, EventArgs e)
        {
            Form unForm = FactoryFormularios.crearForm(18, miUsuario);
            unForm.MdiParent = this;
            unForm.Show();
        }

        private void altaRolToolStripMenuItem_Click(object sender, EventArgs e)
        {
            Form unForm = FactoryFormularios.crearForm(1);
            unForm.MdiParent = this;
            unForm.Show();
        }

        private void consultarRolesToolStripMenuItem_Click(object sender, EventArgs e)
        {
            Form unForm = FactoryFormularios.crearForm(20);
            unForm.MdiParent = this;
            unForm.Show();
        }

        private void modificacionRolToolStripMenuItem_Click(object sender, EventArgs e)
        {
            Form unForm = FactoryFormularios.crearFormModificacion(20);
            unForm.MdiParent = this;
            unForm.Show();
        }

        private void altaPublicacionToolStripMenuItem_Click(object sender, EventArgs e)
        {
            Form unForm = FactoryFormularios.crearForm(10, miUsuario, 1);
            unForm.MdiParent = this;
            unForm.Show();
        }

        private void rubrosToolStripMenuItem_Click(object sender, EventArgs e)
        {
            Form unForm = FactoryFormularios.crearForm(23, miUsuario);
            unForm.MdiParent = this;
            unForm.Show();
        }

        private void consultaToolStripMenuItem_Click(object sender, EventArgs e)
        {
            Form unForm = FactoryFormularios.crearForm(22, miUsuario,1);
            unForm.MdiParent = this;
            unForm.Show();
        }

        private void modificacionPublicacionToolStripMenuItem_Click(object sender, EventArgs e)
        {
            Form unForm = FactoryFormularios.crearFormModificacion(22, miUsuario, 1);
            unForm.MdiParent = this;
            unForm.Show();
        }
        #endregion

        #region metodos
        public void finalizarSubastasVencidas()
        {
            int error = SQL.ejecutar_SP("EXEC TPGDD.SP_FINALIZAR_SUBASTAS_VENCIDAS_OK '" + Fecha.fechaDeHoy() + "'");
        }
        public void habilitarMenu(int unRol)
        {
            miMenu.habilitarMenu(unRol);
        }
        public void setMiUsuario(Usuario miUsuario)
        {
            this.miUsuario = miUsuario;
            this.toolStripStatusLblRol.Text = "Rol: " + miUsuario.rol;
            this.toolStripStatusLblUsuario.Text = "Usuario: " + miUsuario.username;
            miMenu.habilitarMenu(miUsuario.idRol);
        }
        #endregion

    }
}
