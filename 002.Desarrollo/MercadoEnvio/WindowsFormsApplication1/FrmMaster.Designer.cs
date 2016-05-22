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
            this.menGrl = new System.Windows.Forms.MenuStrip();
            this.parámetrosToolStripMenuItem = new System.Windows.Forms.ToolStripMenuItem();
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
            this.generarPublicacionToolStripMenuItem = new System.Windows.Forms.ToolStripMenuItem();
            this.statusStrip1 = new System.Windows.Forms.StatusStrip();
            this.toolStripStatusLblUsuario = new System.Windows.Forms.ToolStripStatusLabel();
            this.toolStripStatusLblRol = new System.Windows.Forms.ToolStripStatusLabel();
            this.toolStripStatusLblFecha = new System.Windows.Forms.ToolStripStatusLabel();
            this.menGrl.SuspendLayout();
            this.statusStrip1.SuspendLayout();
            this.SuspendLayout();
            // 
            // menGrl
            // 
            this.menGrl.GripStyle = System.Windows.Forms.ToolStripGripStyle.Visible;
            this.menGrl.Items.AddRange(new System.Windows.Forms.ToolStripItem[] {
            this.parámetrosToolStripMenuItem,
            this.usuariosToolStripMenuItem1,
            this.comprarOfertarToolStripMenuItem,
            this.calificarToolStripMenuItem,
            this.listadoEstadisticoToolStripMenuItem,
            this.consultaFacturasToolStripMenuItem,
            this.aBMVisibilidadToolStripMenuItem,
            this.generarPublicacionToolStripMenuItem});
            this.menGrl.Location = new System.Drawing.Point(0, 0);
            this.menGrl.Name = "menGrl";
            this.menGrl.RenderMode = System.Windows.Forms.ToolStripRenderMode.Professional;
            this.menGrl.Size = new System.Drawing.Size(784, 24);
            this.menGrl.TabIndex = 14;
            // 
            // parámetrosToolStripMenuItem
            // 
            this.parámetrosToolStripMenuItem.Name = "parámetrosToolStripMenuItem";
            this.parámetrosToolStripMenuItem.Size = new System.Drawing.Size(76, 20);
            this.parámetrosToolStripMenuItem.Text = "ABM Roles";
            this.parámetrosToolStripMenuItem.Click += new System.EventHandler(this.parámetrosToolStripMenuItem_Click);
            // 
            // usuariosToolStripMenuItem1
            // 
            this.usuariosToolStripMenuItem1.DropDownItems.AddRange(new System.Windows.Forms.ToolStripItem[] {
            this.aBMUsuariosToolStripMenuItem,
            this.consultaUsuariosToolStripMenuItem});
            this.usuariosToolStripMenuItem1.Name = "usuariosToolStripMenuItem1";
            this.usuariosToolStripMenuItem1.Size = new System.Drawing.Size(64, 20);
            this.usuariosToolStripMenuItem1.Text = "Usuarios";
            // 
            // aBMUsuariosToolStripMenuItem
            // 
            this.aBMUsuariosToolStripMenuItem.DropDownItems.AddRange(new System.Windows.Forms.ToolStripItem[] {
            this.altaToolStripMenuItem,
            this.modificaciónBajaToolStripMenuItem});
            this.aBMUsuariosToolStripMenuItem.Name = "aBMUsuariosToolStripMenuItem";
            this.aBMUsuariosToolStripMenuItem.Size = new System.Drawing.Size(168, 22);
            this.aBMUsuariosToolStripMenuItem.Text = "ABM Usuarios";
            this.aBMUsuariosToolStripMenuItem.Click += new System.EventHandler(this.aBMUsuariosToolStripMenuItem_Click);
            // 
            // altaToolStripMenuItem
            // 
            this.altaToolStripMenuItem.Name = "altaToolStripMenuItem";
            this.altaToolStripMenuItem.Size = new System.Drawing.Size(171, 22);
            this.altaToolStripMenuItem.Text = "Alta";
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
            this.comprarOfertarToolStripMenuItem.Click += new System.EventHandler(this.comprarOfertarToolStripMenuItem_Click);
            // 
            // calificarToolStripMenuItem
            // 
            this.calificarToolStripMenuItem.Name = "calificarToolStripMenuItem";
            this.calificarToolStripMenuItem.Size = new System.Drawing.Size(62, 20);
            this.calificarToolStripMenuItem.Text = "Calificar";
            this.calificarToolStripMenuItem.Click += new System.EventHandler(this.calificarToolStripMenuItem_Click);
            // 
            // listadoEstadisticoToolStripMenuItem
            // 
            this.listadoEstadisticoToolStripMenuItem.Name = "listadoEstadisticoToolStripMenuItem";
            this.listadoEstadisticoToolStripMenuItem.Size = new System.Drawing.Size(116, 20);
            this.listadoEstadisticoToolStripMenuItem.Text = "Listado estadistico";
            this.listadoEstadisticoToolStripMenuItem.Click += new System.EventHandler(this.listadoEstadisticoToolStripMenuItem_Click);
            // 
            // consultaFacturasToolStripMenuItem
            // 
            this.consultaFacturasToolStripMenuItem.Name = "consultaFacturasToolStripMenuItem";
            this.consultaFacturasToolStripMenuItem.Size = new System.Drawing.Size(111, 20);
            this.consultaFacturasToolStripMenuItem.Text = "Consulta facturas";
            this.consultaFacturasToolStripMenuItem.Click += new System.EventHandler(this.consultaFacturasToolStripMenuItem_Click);
            // 
            // aBMVisibilidadToolStripMenuItem
            // 
            this.aBMVisibilidadToolStripMenuItem.Name = "aBMVisibilidadToolStripMenuItem";
            this.aBMVisibilidadToolStripMenuItem.Size = new System.Drawing.Size(102, 20);
            this.aBMVisibilidadToolStripMenuItem.Text = "ABM Visibilidad";
            this.aBMVisibilidadToolStripMenuItem.Click += new System.EventHandler(this.aBMVisibilidadToolStripMenuItem_Click);
            // 
            // generarPublicacionToolStripMenuItem
            // 
            this.generarPublicacionToolStripMenuItem.Name = "generarPublicacionToolStripMenuItem";
            this.generarPublicacionToolStripMenuItem.Size = new System.Drawing.Size(125, 20);
            this.generarPublicacionToolStripMenuItem.Text = "Generar Publicacion";
            this.generarPublicacionToolStripMenuItem.Click += new System.EventHandler(this.generarPublicacionToolStripMenuItem_Click);
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
            this.statusStrip1.Size = new System.Drawing.Size(784, 25);
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
            // FrmMaster
            // 
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.None;
            this.BackColor = System.Drawing.SystemColors.Control;
            this.BackgroundImageLayout = System.Windows.Forms.ImageLayout.Stretch;
            this.ClientSize = new System.Drawing.Size(784, 561);
            this.Controls.Add(this.statusStrip1);
            this.Controls.Add(this.menGrl);
            this.Font = new System.Drawing.Font("Courier New", 9.75F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.IsMdiContainer = true;
            this.MainMenuStrip = this.menGrl;
            this.Name = "FrmMaster";
            this.StartPosition = System.Windows.Forms.FormStartPosition.CenterScreen;
            this.Text = "MercadoEnvioDesktop";
            this.WindowState = System.Windows.Forms.FormWindowState.Maximized;
            this.menGrl.ResumeLayout(false);
            this.menGrl.PerformLayout();
            this.statusStrip1.ResumeLayout(false);
            this.statusStrip1.PerformLayout();
            this.ResumeLayout(false);
            this.PerformLayout();

        }

        #endregion

        private System.Windows.Forms.MenuStrip menGrl;
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
    }
}
