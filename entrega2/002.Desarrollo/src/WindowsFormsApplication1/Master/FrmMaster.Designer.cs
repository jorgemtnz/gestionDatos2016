namespace MercadoEnvioDesktop
{
    partial class FrmMaster
    {
        /// <summary>
        /// Variable del diseñador necesaria.
        /// </summary>
        private System.ComponentModel.IContainer components = null;

        /// <summary>
        /// Limpiar los recursos que se estén usando.
        /// </summary>
        /// <param name="disposing">true si los recursos administrados se deben desechar; false en caso contrario.</param>
        protected override void Dispose(bool disposing)
        {
            if (disposing && (components != null))
            {
                components.Dispose();
            }
            base.Dispose(disposing);
        }

        #region Código generado por el Diseñador de Windows Forms

        /// <summary>
        /// Método necesario para admitir el Diseñador. No se puede modificar
        /// el contenido de este método con el editor de código.
        /// </summary>
        private void InitializeComponent()
        {
            this.menu = new System.Windows.Forms.MenuStrip();
            this.loguinToolStripMenuItem = new System.Windows.Forms.ToolStripMenuItem();
            this.cambiarContraseñaToolStripMenuItem = new System.Windows.Forms.ToolStripMenuItem();
            this.cerrarSesiónToolStripMenuItem = new System.Windows.Forms.ToolStripMenuItem();
            this.parámetrosToolStripMenuItem = new System.Windows.Forms.ToolStripMenuItem();
            this.aBMToolStripMenuItem = new System.Windows.Forms.ToolStripMenuItem();
            this.altaRolToolStripMenuItem = new System.Windows.Forms.ToolStripMenuItem();
            this.modificacionRolToolStripMenuItem = new System.Windows.Forms.ToolStripMenuItem();
            this.consultarRolesToolStripMenuItem = new System.Windows.Forms.ToolStripMenuItem();
            this.usuariosToolStripMenuItem1 = new System.Windows.Forms.ToolStripMenuItem();
            this.aBMUsuariosToolStripMenuItem = new System.Windows.Forms.ToolStripMenuItem();
            this.altaToolStripMenuItem = new System.Windows.Forms.ToolStripMenuItem();
            this.modificaciónBajaToolStripMenuItem = new System.Windows.Forms.ToolStripMenuItem();
            this.consultaUsuariosToolStripMenuItem = new System.Windows.Forms.ToolStripMenuItem();
            this.comprarOfertarToolStripMenuItem = new System.Windows.Forms.ToolStripMenuItem();
            this.calificarToolStripMenuItem = new System.Windows.Forms.ToolStripMenuItem();
            this.listadoEstadisticoToolStripMenuItem = new System.Windows.Forms.ToolStripMenuItem();
            this.consultaFacturasToolStripMenuItem = new System.Windows.Forms.ToolStripMenuItem();
            this.aBMVisibilidadToolStripMenuItem = new System.Windows.Forms.ToolStripMenuItem();
            this.aBMVisibilidadToolStripMenuItem1 = new System.Windows.Forms.ToolStripMenuItem();
            this.altaToolStripMenuItem1 = new System.Windows.Forms.ToolStripMenuItem();
            this.modificacionBajaToolStripMenuItem = new System.Windows.Forms.ToolStripMenuItem();
            this.consultasToolStripMenuItem = new System.Windows.Forms.ToolStripMenuItem();
            this.generarPublicacionToolStripMenuItem = new System.Windows.Forms.ToolStripMenuItem();
            this.aBMToolStripMenuItem1 = new System.Windows.Forms.ToolStripMenuItem();
            this.altaPublicacionToolStripMenuItem = new System.Windows.Forms.ToolStripMenuItem();
            this.modificacionPublicacionToolStripMenuItem = new System.Windows.Forms.ToolStripMenuItem();
            this.consultaToolStripMenuItem = new System.Windows.Forms.ToolStripMenuItem();
            this.rubrosToolStripMenuItem = new System.Windows.Forms.ToolStripMenuItem();
            this.historialClientesToolStripMenuItem = new System.Windows.Forms.ToolStripMenuItem();
            this.statusStrip1 = new System.Windows.Forms.StatusStrip();
            this.toolStripStatusLblUsuario = new System.Windows.Forms.ToolStripStatusLabel();
            this.toolStripStatusLblRol = new System.Windows.Forms.ToolStripStatusLabel();
            this.toolStripStatusLblFecha = new System.Windows.Forms.ToolStripStatusLabel();
            this.pictureLogo1 = new ApplicationGdd1.PictureLogo();
            this.menu.SuspendLayout();
            this.statusStrip1.SuspendLayout();
            this.SuspendLayout();
            // 
            // menu
            // 
            this.menu.BackColor = System.Drawing.Color.GhostWhite;
            this.menu.GripStyle = System.Windows.Forms.ToolStripGripStyle.Visible;
            this.menu.Items.AddRange(new System.Windows.Forms.ToolStripItem[] {
            this.loguinToolStripMenuItem,
            this.parámetrosToolStripMenuItem,
            this.usuariosToolStripMenuItem1,
            this.comprarOfertarToolStripMenuItem,
            this.calificarToolStripMenuItem,
            this.listadoEstadisticoToolStripMenuItem,
            this.consultaFacturasToolStripMenuItem,
            this.aBMVisibilidadToolStripMenuItem,
            this.generarPublicacionToolStripMenuItem,
            this.rubrosToolStripMenuItem,
            this.historialClientesToolStripMenuItem});
            this.menu.Location = new System.Drawing.Point(0, 26);
            this.menu.Name = "menu";
            this.menu.RenderMode = System.Windows.Forms.ToolStripRenderMode.Professional;
            this.menu.Size = new System.Drawing.Size(1106, 24);
            this.menu.TabIndex = 14;
            // 
            // loguinToolStripMenuItem
            // 
            this.loguinToolStripMenuItem.DropDownItems.AddRange(new System.Windows.Forms.ToolStripItem[] {
            this.cambiarContraseñaToolStripMenuItem,
            this.cerrarSesiónToolStripMenuItem});
            this.loguinToolStripMenuItem.Name = "loguinToolStripMenuItem";
            this.loguinToolStripMenuItem.Size = new System.Drawing.Size(49, 20);
            this.loguinToolStripMenuItem.Text = "Login";
            // 
            // cambiarContraseñaToolStripMenuItem
            // 
            this.cambiarContraseñaToolStripMenuItem.Name = "cambiarContraseñaToolStripMenuItem";
            this.cambiarContraseñaToolStripMenuItem.Size = new System.Drawing.Size(180, 22);
            this.cambiarContraseñaToolStripMenuItem.Text = "Cambiar contraseña";
            this.cambiarContraseñaToolStripMenuItem.Visible = false;
            this.cambiarContraseñaToolStripMenuItem.Click += new System.EventHandler(this.cambiarContraseñaToolStripMenuItem_Click);
            // 
            // cerrarSesiónToolStripMenuItem
            // 
            this.cerrarSesiónToolStripMenuItem.Name = "cerrarSesiónToolStripMenuItem";
            this.cerrarSesiónToolStripMenuItem.Size = new System.Drawing.Size(180, 22);
            this.cerrarSesiónToolStripMenuItem.Text = "iniciar sesión";
            this.cerrarSesiónToolStripMenuItem.Click += new System.EventHandler(this.cerrarSesiónToolStripMenuItem_Click);
            // 
            // parámetrosToolStripMenuItem
            // 
            this.parámetrosToolStripMenuItem.DropDownItems.AddRange(new System.Windows.Forms.ToolStripItem[] {
            this.aBMToolStripMenuItem,
            this.consultarRolesToolStripMenuItem});
            this.parámetrosToolStripMenuItem.Name = "parámetrosToolStripMenuItem";
            this.parámetrosToolStripMenuItem.Size = new System.Drawing.Size(47, 20);
            this.parámetrosToolStripMenuItem.Text = "Roles";
            this.parámetrosToolStripMenuItem.Visible = false;
            // 
            // aBMToolStripMenuItem
            // 
            this.aBMToolStripMenuItem.DropDownItems.AddRange(new System.Windows.Forms.ToolStripItem[] {
            this.altaRolToolStripMenuItem,
            this.modificacionRolToolStripMenuItem});
            this.aBMToolStripMenuItem.Name = "aBMToolStripMenuItem";
            this.aBMToolStripMenuItem.Size = new System.Drawing.Size(153, 22);
            this.aBMToolStripMenuItem.Text = "ABM  roles";
            // 
            // altaRolToolStripMenuItem
            // 
            this.altaRolToolStripMenuItem.Name = "altaRolToolStripMenuItem";
            this.altaRolToolStripMenuItem.Size = new System.Drawing.Size(161, 22);
            this.altaRolToolStripMenuItem.Text = "Alta rol";
            this.altaRolToolStripMenuItem.Click += new System.EventHandler(this.altaRolToolStripMenuItem_Click);
            // 
            // modificacionRolToolStripMenuItem
            // 
            this.modificacionRolToolStripMenuItem.Name = "modificacionRolToolStripMenuItem";
            this.modificacionRolToolStripMenuItem.Size = new System.Drawing.Size(161, 22);
            this.modificacionRolToolStripMenuItem.Text = "Modificacion rol";
            this.modificacionRolToolStripMenuItem.Click += new System.EventHandler(this.modificacionRolToolStripMenuItem_Click);
            // 
            // consultarRolesToolStripMenuItem
            // 
            this.consultarRolesToolStripMenuItem.Name = "consultarRolesToolStripMenuItem";
            this.consultarRolesToolStripMenuItem.Size = new System.Drawing.Size(153, 22);
            this.consultarRolesToolStripMenuItem.Text = "Consultar roles";
            this.consultarRolesToolStripMenuItem.Click += new System.EventHandler(this.consultarRolesToolStripMenuItem_Click);
            // 
            // usuariosToolStripMenuItem1
            // 
            this.usuariosToolStripMenuItem1.DropDownItems.AddRange(new System.Windows.Forms.ToolStripItem[] {
            this.aBMUsuariosToolStripMenuItem,
            this.consultaUsuariosToolStripMenuItem});
            this.usuariosToolStripMenuItem1.Name = "usuariosToolStripMenuItem1";
            this.usuariosToolStripMenuItem1.Size = new System.Drawing.Size(64, 20);
            this.usuariosToolStripMenuItem1.Text = "Usuarios";
            this.usuariosToolStripMenuItem1.Visible = false;
            // 
            // aBMUsuariosToolStripMenuItem
            // 
            this.aBMUsuariosToolStripMenuItem.DropDownItems.AddRange(new System.Windows.Forms.ToolStripItem[] {
            this.altaToolStripMenuItem,
            this.modificaciónBajaToolStripMenuItem});
            this.aBMUsuariosToolStripMenuItem.Name = "aBMUsuariosToolStripMenuItem";
            this.aBMUsuariosToolStripMenuItem.Size = new System.Drawing.Size(168, 22);
            this.aBMUsuariosToolStripMenuItem.Text = "ABM Usuarios";
            // 
            // altaToolStripMenuItem
            // 
            this.altaToolStripMenuItem.Name = "altaToolStripMenuItem";
            this.altaToolStripMenuItem.Size = new System.Drawing.Size(171, 22);
            this.altaToolStripMenuItem.Text = "Alta usuario";
            this.altaToolStripMenuItem.Click += new System.EventHandler(this.altaToolStripMenuItem_Click);
            // 
            // modificaciónBajaToolStripMenuItem
            // 
            this.modificaciónBajaToolStripMenuItem.Name = "modificaciónBajaToolStripMenuItem";
            this.modificaciónBajaToolStripMenuItem.Size = new System.Drawing.Size(171, 22);
            this.modificaciónBajaToolStripMenuItem.Text = "Modificación/Baja";
            this.modificaciónBajaToolStripMenuItem.Click += new System.EventHandler(this.modificaciónBajaToolStripMenuItem_Click);
            // 
            // consultaUsuariosToolStripMenuItem
            // 
            this.consultaUsuariosToolStripMenuItem.Name = "consultaUsuariosToolStripMenuItem";
            this.consultaUsuariosToolStripMenuItem.Size = new System.Drawing.Size(168, 22);
            this.consultaUsuariosToolStripMenuItem.Text = "Consulta usuarios";
            this.consultaUsuariosToolStripMenuItem.Click += new System.EventHandler(this.consultaUsuariosToolStripMenuItem_Click);
            // 
            // comprarOfertarToolStripMenuItem
            // 
            this.comprarOfertarToolStripMenuItem.Name = "comprarOfertarToolStripMenuItem";
            this.comprarOfertarToolStripMenuItem.Size = new System.Drawing.Size(108, 20);
            this.comprarOfertarToolStripMenuItem.Text = "Comprar/Ofertar";
            this.comprarOfertarToolStripMenuItem.Visible = false;
            this.comprarOfertarToolStripMenuItem.Click += new System.EventHandler(this.comprarOfertarToolStripMenuItem_Click);
            // 
            // calificarToolStripMenuItem
            // 
            this.calificarToolStripMenuItem.Name = "calificarToolStripMenuItem";
            this.calificarToolStripMenuItem.Size = new System.Drawing.Size(92, 20);
            this.calificarToolStripMenuItem.Text = "Calificaciones";
            this.calificarToolStripMenuItem.Visible = false;
            this.calificarToolStripMenuItem.Click += new System.EventHandler(this.calificarToolStripMenuItem_Click);
            // 
            // listadoEstadisticoToolStripMenuItem
            // 
            this.listadoEstadisticoToolStripMenuItem.Name = "listadoEstadisticoToolStripMenuItem";
            this.listadoEstadisticoToolStripMenuItem.Size = new System.Drawing.Size(116, 20);
            this.listadoEstadisticoToolStripMenuItem.Text = "Listado estadistico";
            this.listadoEstadisticoToolStripMenuItem.Visible = false;
            this.listadoEstadisticoToolStripMenuItem.Click += new System.EventHandler(this.listadoEstadisticoToolStripMenuItem_Click);
            // 
            // consultaFacturasToolStripMenuItem
            // 
            this.consultaFacturasToolStripMenuItem.Name = "consultaFacturasToolStripMenuItem";
            this.consultaFacturasToolStripMenuItem.Size = new System.Drawing.Size(111, 20);
            this.consultaFacturasToolStripMenuItem.Text = "Consulta facturas";
            this.consultaFacturasToolStripMenuItem.Visible = false;
            this.consultaFacturasToolStripMenuItem.Click += new System.EventHandler(this.consultaFacturasToolStripMenuItem_Click);
            // 
            // aBMVisibilidadToolStripMenuItem
            // 
            this.aBMVisibilidadToolStripMenuItem.DropDownItems.AddRange(new System.Windows.Forms.ToolStripItem[] {
            this.aBMVisibilidadToolStripMenuItem1,
            this.consultasToolStripMenuItem});
            this.aBMVisibilidadToolStripMenuItem.Name = "aBMVisibilidadToolStripMenuItem";
            this.aBMVisibilidadToolStripMenuItem.Size = new System.Drawing.Size(84, 20);
            this.aBMVisibilidadToolStripMenuItem.Text = "Visibilidades";
            this.aBMVisibilidadToolStripMenuItem.Visible = false;
            // 
            // aBMVisibilidadToolStripMenuItem1
            // 
            this.aBMVisibilidadToolStripMenuItem1.DropDownItems.AddRange(new System.Windows.Forms.ToolStripItem[] {
            this.altaToolStripMenuItem1,
            this.modificacionBajaToolStripMenuItem});
            this.aBMVisibilidadToolStripMenuItem1.Name = "aBMVisibilidadToolStripMenuItem1";
            this.aBMVisibilidadToolStripMenuItem1.Size = new System.Drawing.Size(188, 22);
            this.aBMVisibilidadToolStripMenuItem1.Text = "ABM visibilidad";
            // 
            // altaToolStripMenuItem1
            // 
            this.altaToolStripMenuItem1.Name = "altaToolStripMenuItem1";
            this.altaToolStripMenuItem1.Size = new System.Drawing.Size(200, 22);
            this.altaToolStripMenuItem1.Text = "Alta visibilidad";
            this.altaToolStripMenuItem1.Click += new System.EventHandler(this.altaToolStripMenuItem1_Click);
            // 
            // modificacionBajaToolStripMenuItem
            // 
            this.modificacionBajaToolStripMenuItem.Name = "modificacionBajaToolStripMenuItem";
            this.modificacionBajaToolStripMenuItem.Size = new System.Drawing.Size(200, 22);
            this.modificacionBajaToolStripMenuItem.Text = "Modificación visibilidad";
            this.modificacionBajaToolStripMenuItem.Click += new System.EventHandler(this.modificacionBajaToolStripMenuItem_Click);
            // 
            // consultasToolStripMenuItem
            // 
            this.consultasToolStripMenuItem.Name = "consultasToolStripMenuItem";
            this.consultasToolStripMenuItem.Size = new System.Drawing.Size(188, 22);
            this.consultasToolStripMenuItem.Text = "Consulta visibilidades";
            this.consultasToolStripMenuItem.Click += new System.EventHandler(this.consultasToolStripMenuItem_Click);
            // 
            // generarPublicacionToolStripMenuItem
            // 
            this.generarPublicacionToolStripMenuItem.DropDownItems.AddRange(new System.Windows.Forms.ToolStripItem[] {
            this.aBMToolStripMenuItem1,
            this.consultaToolStripMenuItem});
            this.generarPublicacionToolStripMenuItem.Name = "generarPublicacionToolStripMenuItem";
            this.generarPublicacionToolStripMenuItem.Size = new System.Drawing.Size(92, 20);
            this.generarPublicacionToolStripMenuItem.Text = "Publicaciones";
            this.generarPublicacionToolStripMenuItem.Visible = false;
            // 
            // aBMToolStripMenuItem1
            // 
            this.aBMToolStripMenuItem1.DropDownItems.AddRange(new System.Windows.Forms.ToolStripItem[] {
            this.altaPublicacionToolStripMenuItem,
            this.modificacionPublicacionToolStripMenuItem});
            this.aBMToolStripMenuItem1.Name = "aBMToolStripMenuItem1";
            this.aBMToolStripMenuItem1.Size = new System.Drawing.Size(197, 22);
            this.aBMToolStripMenuItem1.Text = "ABM publicaciones";
            // 
            // altaPublicacionToolStripMenuItem
            // 
            this.altaPublicacionToolStripMenuItem.Name = "altaPublicacionToolStripMenuItem";
            this.altaPublicacionToolStripMenuItem.Size = new System.Drawing.Size(209, 22);
            this.altaPublicacionToolStripMenuItem.Text = "Alta publicacion";
            this.altaPublicacionToolStripMenuItem.Click += new System.EventHandler(this.altaPublicacionToolStripMenuItem_Click);
            // 
            // modificacionPublicacionToolStripMenuItem
            // 
            this.modificacionPublicacionToolStripMenuItem.Name = "modificacionPublicacionToolStripMenuItem";
            this.modificacionPublicacionToolStripMenuItem.Size = new System.Drawing.Size(209, 22);
            this.modificacionPublicacionToolStripMenuItem.Text = "Modificacion publicacion";
            this.modificacionPublicacionToolStripMenuItem.Click += new System.EventHandler(this.modificacionPublicacionToolStripMenuItem_Click);
            // 
            // consultaToolStripMenuItem
            // 
            this.consultaToolStripMenuItem.Name = "consultaToolStripMenuItem";
            this.consultaToolStripMenuItem.Size = new System.Drawing.Size(197, 22);
            this.consultaToolStripMenuItem.Text = "Consulta publicaciones";
            this.consultaToolStripMenuItem.Click += new System.EventHandler(this.consultaToolStripMenuItem_Click);
            // 
            // rubrosToolStripMenuItem
            // 
            this.rubrosToolStripMenuItem.Enabled = false;
            this.rubrosToolStripMenuItem.Name = "rubrosToolStripMenuItem";
            this.rubrosToolStripMenuItem.Size = new System.Drawing.Size(56, 20);
            this.rubrosToolStripMenuItem.Text = "Rubros";
            this.rubrosToolStripMenuItem.Visible = false;
            this.rubrosToolStripMenuItem.Click += new System.EventHandler(this.rubrosToolStripMenuItem_Click);
            // 
            // historialClientesToolStripMenuItem
            // 
            this.historialClientesToolStripMenuItem.Name = "historialClientesToolStripMenuItem";
            this.historialClientesToolStripMenuItem.Size = new System.Drawing.Size(106, 20);
            this.historialClientesToolStripMenuItem.Text = "Historial clientes";
            this.historialClientesToolStripMenuItem.Visible = false;
            this.historialClientesToolStripMenuItem.Click += new System.EventHandler(this.historialClientesToolStripMenuItem_Click);
            // 
            // statusStrip1
            // 
            this.statusStrip1.Font = new System.Drawing.Font("Calibri", 9F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.statusStrip1.Items.AddRange(new System.Windows.Forms.ToolStripItem[] {
            this.toolStripStatusLblUsuario,
            this.toolStripStatusLblRol,
            this.toolStripStatusLblFecha});
            this.statusStrip1.Location = new System.Drawing.Point(0, 536);
            this.statusStrip1.Name = "statusStrip1";
            this.statusStrip1.Size = new System.Drawing.Size(1106, 25);
            this.statusStrip1.TabIndex = 16;
            // 
            // toolStripStatusLblUsuario
            // 
            this.toolStripStatusLblUsuario.BorderSides = ((System.Windows.Forms.ToolStripStatusLabelBorderSides)((((System.Windows.Forms.ToolStripStatusLabelBorderSides.Left | System.Windows.Forms.ToolStripStatusLabelBorderSides.Top) 
            | System.Windows.Forms.ToolStripStatusLabelBorderSides.Right) 
            | System.Windows.Forms.ToolStripStatusLabelBorderSides.Bottom)));
            this.toolStripStatusLblUsuario.BorderStyle = System.Windows.Forms.Border3DStyle.Etched;
            this.toolStripStatusLblUsuario.Image = global::MercadoEnvioDesktop.Properties.Resources.logo;
            this.toolStripStatusLblUsuario.Name = "toolStripStatusLblUsuario";
            this.toolStripStatusLblUsuario.Size = new System.Drawing.Size(73, 20);
            this.toolStripStatusLblUsuario.Text = "Usuario:";
            // 
            // toolStripStatusLblRol
            // 
            this.toolStripStatusLblRol.BorderSides = ((System.Windows.Forms.ToolStripStatusLabelBorderSides)((((System.Windows.Forms.ToolStripStatusLabelBorderSides.Left | System.Windows.Forms.ToolStripStatusLabelBorderSides.Top) 
            | System.Windows.Forms.ToolStripStatusLabelBorderSides.Right) 
            | System.Windows.Forms.ToolStripStatusLabelBorderSides.Bottom)));
            this.toolStripStatusLblRol.BorderStyle = System.Windows.Forms.Border3DStyle.Etched;
            this.toolStripStatusLblRol.Name = "toolStripStatusLblRol";
            this.toolStripStatusLblRol.Size = new System.Drawing.Size(32, 20);
            this.toolStripStatusLblRol.Text = "Rol:";
            // 
            // toolStripStatusLblFecha
            // 
            this.toolStripStatusLblFecha.BorderSides = ((System.Windows.Forms.ToolStripStatusLabelBorderSides)((((System.Windows.Forms.ToolStripStatusLabelBorderSides.Left | System.Windows.Forms.ToolStripStatusLabelBorderSides.Top) 
            | System.Windows.Forms.ToolStripStatusLabelBorderSides.Right) 
            | System.Windows.Forms.ToolStripStatusLabelBorderSides.Bottom)));
            this.toolStripStatusLblFecha.BorderStyle = System.Windows.Forms.Border3DStyle.Etched;
            this.toolStripStatusLblFecha.Name = "toolStripStatusLblFecha";
            this.toolStripStatusLblFecha.Size = new System.Drawing.Size(46, 20);
            this.toolStripStatusLblFecha.Text = "Fecha:";
            // 
            // pictureLogo1
            // 
            this.pictureLogo1.BackColor = System.Drawing.Color.Orange;
            this.pictureLogo1.Dock = System.Windows.Forms.DockStyle.Top;
            this.pictureLogo1.Location = new System.Drawing.Point(0, 0);
            this.pictureLogo1.Margin = new System.Windows.Forms.Padding(4);
            this.pictureLogo1.Name = "pictureLogo1";
            this.pictureLogo1.Size = new System.Drawing.Size(1106, 26);
            this.pictureLogo1.TabIndex = 18;
            // 
            // FrmMaster
            // 
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.None;
            this.BackColor = System.Drawing.SystemColors.Control;
            this.BackgroundImageLayout = System.Windows.Forms.ImageLayout.Stretch;
            this.ClientSize = new System.Drawing.Size(1106, 561);
            this.Controls.Add(this.statusStrip1);
            this.Controls.Add(this.menu);
            this.Controls.Add(this.pictureLogo1);
            this.Font = new System.Drawing.Font("Calibri", 9F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.IsMdiContainer = true;
            this.MainMenuStrip = this.menu;
            this.Name = "FrmMaster";
            this.StartPosition = System.Windows.Forms.FormStartPosition.CenterScreen;
            this.Text = "Mercado Envios";
            this.WindowState = System.Windows.Forms.FormWindowState.Maximized;
            this.menu.ResumeLayout(false);
            this.menu.PerformLayout();
            this.statusStrip1.ResumeLayout(false);
            this.statusStrip1.PerformLayout();
            this.ResumeLayout(false);
            this.PerformLayout();

        }

        #endregion

        private System.Windows.Forms.MenuStrip menu;
        private System.Windows.Forms.ToolStripMenuItem parámetrosToolStripMenuItem;
        private System.Windows.Forms.ToolStripMenuItem usuariosToolStripMenuItem1;
        private System.Windows.Forms.ToolStripMenuItem aBMUsuariosToolStripMenuItem;
        private System.Windows.Forms.ToolStripMenuItem consultaUsuariosToolStripMenuItem;
        private System.Windows.Forms.ToolStripMenuItem comprarOfertarToolStripMenuItem;
        private System.Windows.Forms.ToolStripMenuItem calificarToolStripMenuItem;
        private System.Windows.Forms.ToolStripMenuItem listadoEstadisticoToolStripMenuItem;
        private System.Windows.Forms.ToolStripMenuItem consultaFacturasToolStripMenuItem;
        private System.Windows.Forms.ToolStripMenuItem aBMVisibilidadToolStripMenuItem;
        private System.Windows.Forms.ToolStripMenuItem generarPublicacionToolStripMenuItem;
        private System.Windows.Forms.StatusStrip statusStrip1;
        private System.Windows.Forms.ToolStripStatusLabel toolStripStatusLblUsuario;
        private System.Windows.Forms.ToolStripStatusLabel toolStripStatusLblRol;
        private System.Windows.Forms.ToolStripStatusLabel toolStripStatusLblFecha;
        private System.Windows.Forms.ToolStripMenuItem altaToolStripMenuItem;
        private System.Windows.Forms.ToolStripMenuItem modificaciónBajaToolStripMenuItem;
        private System.Windows.Forms.ToolStripMenuItem aBMVisibilidadToolStripMenuItem1;
        private System.Windows.Forms.ToolStripMenuItem altaToolStripMenuItem1;
        private System.Windows.Forms.ToolStripMenuItem modificacionBajaToolStripMenuItem;
        private System.Windows.Forms.ToolStripMenuItem consultasToolStripMenuItem;
        private System.Windows.Forms.ToolStripMenuItem loguinToolStripMenuItem;
        private System.Windows.Forms.ToolStripMenuItem cambiarContraseñaToolStripMenuItem;
        private System.Windows.Forms.ToolStripMenuItem cerrarSesiónToolStripMenuItem;
        private System.Windows.Forms.ToolStripMenuItem rubrosToolStripMenuItem;
        private System.Windows.Forms.ToolStripMenuItem historialClientesToolStripMenuItem;
        private System.Windows.Forms.ToolStripMenuItem aBMToolStripMenuItem;
        private System.Windows.Forms.ToolStripMenuItem altaRolToolStripMenuItem;
        private System.Windows.Forms.ToolStripMenuItem modificacionRolToolStripMenuItem;
        private System.Windows.Forms.ToolStripMenuItem consultarRolesToolStripMenuItem;
        private System.Windows.Forms.ToolStripMenuItem aBMToolStripMenuItem1;
        private System.Windows.Forms.ToolStripMenuItem altaPublicacionToolStripMenuItem;
        private System.Windows.Forms.ToolStripMenuItem modificacionPublicacionToolStripMenuItem;
        private System.Windows.Forms.ToolStripMenuItem consultaToolStripMenuItem;
        private ApplicationGdd1.PictureLogo pictureLogo1;
    }
}
