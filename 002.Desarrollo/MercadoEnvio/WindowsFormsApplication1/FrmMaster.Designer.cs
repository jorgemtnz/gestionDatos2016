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
            this.pnlUsu = new System.Windows.Forms.Panel();
            this.lblUsuRol = new System.Windows.Forms.Label();
            this.lblUsuCod = new System.Windows.Forms.Label();
            this.calendario = new System.Windows.Forms.MonthCalendar();
            this.menGrl = new System.Windows.Forms.MenuStrip();
            this.parámetrosToolStripMenuItem = new System.Windows.Forms.ToolStripMenuItem();
            this.usuariosToolStripMenuItem = new System.Windows.Forms.ToolStripMenuItem();
            this.rolesToolStripMenuItem = new System.Windows.Forms.ToolStripMenuItem();
            this.usuariosToolStripMenuItem1 = new System.Windows.Forms.ToolStripMenuItem();
            this.aBMUsuariosToolStripMenuItem = new System.Windows.Forms.ToolStripMenuItem();
            this.consultaUsuariosToolStripMenuItem = new System.Windows.Forms.ToolStripMenuItem();
            this.comprarOfertarToolStripMenuItem = new System.Windows.Forms.ToolStripMenuItem();
            this.calificarToolStripMenuItem = new System.Windows.Forms.ToolStripMenuItem();
            this.listadoEstadisticoToolStripMenuItem = new System.Windows.Forms.ToolStripMenuItem();
            this.consultaFacturasToolStripMenuItem = new System.Windows.Forms.ToolStripMenuItem();
            this.pnlUsu.SuspendLayout();
            this.menGrl.SuspendLayout();
            this.SuspendLayout();
            // 
            // pnlUsu
            // 
            this.pnlUsu.Anchor = ((System.Windows.Forms.AnchorStyles)((System.Windows.Forms.AnchorStyles.Top | System.Windows.Forms.AnchorStyles.Right)));
            this.pnlUsu.BackColor = System.Drawing.Color.Transparent;
            this.pnlUsu.BackgroundImage = global::MercadoEnvioDesktop.Properties.Resources.BotonPng;
            this.pnlUsu.BackgroundImageLayout = System.Windows.Forms.ImageLayout.Stretch;
            this.pnlUsu.Controls.Add(this.lblUsuRol);
            this.pnlUsu.Controls.Add(this.lblUsuCod);
            this.pnlUsu.ForeColor = System.Drawing.Color.White;
            this.pnlUsu.Location = new System.Drawing.Point(564, 36);
            this.pnlUsu.Name = "pnlUsu";
            this.pnlUsu.Size = new System.Drawing.Size(208, 96);
            this.pnlUsu.TabIndex = 8;
            // 
            // lblUsuRol
            // 
            this.lblUsuRol.Anchor = ((System.Windows.Forms.AnchorStyles)((System.Windows.Forms.AnchorStyles.Top | System.Windows.Forms.AnchorStyles.Right)));
            this.lblUsuRol.AutoSize = true;
            this.lblUsuRol.BackColor = System.Drawing.Color.Transparent;
            this.lblUsuRol.Font = new System.Drawing.Font("Courier New", 9.75F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.lblUsuRol.Location = new System.Drawing.Point(45, 71);
            this.lblUsuRol.Name = "lblUsuRol";
            this.lblUsuRol.RightToLeft = System.Windows.Forms.RightToLeft.No;
            this.lblUsuRol.Size = new System.Drawing.Size(160, 16);
            this.lblUsuRol.TabIndex = 12;
            this.lblUsuRol.Text = "Rol: XXXXXXXXXXXXX.";
            this.lblUsuRol.TextAlign = System.Drawing.ContentAlignment.TopRight;
            // 
            // lblUsuCod
            // 
            this.lblUsuCod.Anchor = ((System.Windows.Forms.AnchorStyles)((System.Windows.Forms.AnchorStyles.Top | System.Windows.Forms.AnchorStyles.Right)));
            this.lblUsuCod.AutoSize = true;
            this.lblUsuCod.BackColor = System.Drawing.Color.Transparent;
            this.lblUsuCod.Font = new System.Drawing.Font("Courier New", 9.75F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.lblUsuCod.Location = new System.Drawing.Point(9, 21);
            this.lblUsuCod.Name = "lblUsuCod";
            this.lblUsuCod.RightToLeft = System.Windows.Forms.RightToLeft.No;
            this.lblUsuCod.Size = new System.Drawing.Size(144, 16);
            this.lblUsuCod.TabIndex = 10;
            this.lblUsuCod.Text = "Usuario: XXNNNNN.";
            this.lblUsuCod.TextAlign = System.Drawing.ContentAlignment.TopRight;
            // 
            // calendario
            // 
            this.calendario.Anchor = ((System.Windows.Forms.AnchorStyles)((System.Windows.Forms.AnchorStyles.Top | System.Windows.Forms.AnchorStyles.Right)));
            this.calendario.BackColor = System.Drawing.Color.SaddleBrown;
            this.calendario.Location = new System.Drawing.Point(574, 144);
            this.calendario.Name = "calendario";
            this.calendario.TabIndex = 12;
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
            this.consultaFacturasToolStripMenuItem});
            this.menGrl.Location = new System.Drawing.Point(0, 0);
            this.menGrl.Name = "menGrl";
            this.menGrl.RenderMode = System.Windows.Forms.ToolStripRenderMode.Professional;
            this.menGrl.Size = new System.Drawing.Size(784, 24);
            this.menGrl.TabIndex = 14;
            // 
            // parámetrosToolStripMenuItem
            // 
            this.parámetrosToolStripMenuItem.DropDownItems.AddRange(new System.Windows.Forms.ToolStripItem[] {
            this.usuariosToolStripMenuItem,
            this.rolesToolStripMenuItem});
            this.parámetrosToolStripMenuItem.Name = "parámetrosToolStripMenuItem";
            this.parámetrosToolStripMenuItem.Size = new System.Drawing.Size(79, 20);
            this.parámetrosToolStripMenuItem.Text = "Parámetros";
            this.parámetrosToolStripMenuItem.Click += new System.EventHandler(this.parámetrosToolStripMenuItem_Click);
            // 
            // usuariosToolStripMenuItem
            // 
            this.usuariosToolStripMenuItem.Name = "usuariosToolStripMenuItem";
            this.usuariosToolStripMenuItem.Size = new System.Drawing.Size(152, 22);
            this.usuariosToolStripMenuItem.Text = "Usuarios";
            this.usuariosToolStripMenuItem.Click += new System.EventHandler(this.usuariosToolStripMenuItem_Click);
            // 
            // rolesToolStripMenuItem
            // 
            this.rolesToolStripMenuItem.Name = "rolesToolStripMenuItem";
            this.rolesToolStripMenuItem.Size = new System.Drawing.Size(152, 22);
            this.rolesToolStripMenuItem.Text = "Roles";
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
            this.aBMUsuariosToolStripMenuItem.Name = "aBMUsuariosToolStripMenuItem";
            this.aBMUsuariosToolStripMenuItem.Size = new System.Drawing.Size(168, 22);
            this.aBMUsuariosToolStripMenuItem.Text = "ABM Usuarios";
            this.aBMUsuariosToolStripMenuItem.Click += new System.EventHandler(this.aBMUsuariosToolStripMenuItem_Click);
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
            // FrmMaster
            // 
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.None;
            this.BackColor = System.Drawing.SystemColors.Control;
            this.BackgroundImage = global::MercadoEnvioDesktop.Properties.Resources.BlueBack;
            this.BackgroundImageLayout = System.Windows.Forms.ImageLayout.Stretch;
            this.ClientSize = new System.Drawing.Size(784, 561);
            this.Controls.Add(this.calendario);
            this.Controls.Add(this.pnlUsu);
            this.Controls.Add(this.menGrl);
            this.Font = new System.Drawing.Font("Courier New", 9.75F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.IsMdiContainer = true;
            this.MainMenuStrip = this.menGrl;
            this.Name = "FrmMaster";
            this.StartPosition = System.Windows.Forms.FormStartPosition.CenterScreen;
            this.Text = "MercadoEnvioDesktop";
            this.WindowState = System.Windows.Forms.FormWindowState.Maximized;
            this.pnlUsu.ResumeLayout(false);
            this.pnlUsu.PerformLayout();
            this.menGrl.ResumeLayout(false);
            this.menGrl.PerformLayout();
            this.ResumeLayout(false);
            this.PerformLayout();

        }

        #endregion

        private System.Windows.Forms.Panel pnlUsu;
        private System.Windows.Forms.Label lblUsuCod;
        private System.Windows.Forms.Label lblUsuRol;
        private System.Windows.Forms.MonthCalendar calendario;
        private System.Windows.Forms.MenuStrip menGrl;
        private System.Windows.Forms.ToolStripMenuItem parámetrosToolStripMenuItem;
        private System.Windows.Forms.ToolStripMenuItem usuariosToolStripMenuItem;
        private System.Windows.Forms.ToolStripMenuItem rolesToolStripMenuItem;
        private System.Windows.Forms.ToolStripMenuItem usuariosToolStripMenuItem1;
        private System.Windows.Forms.ToolStripMenuItem aBMUsuariosToolStripMenuItem;
        private System.Windows.Forms.ToolStripMenuItem consultaUsuariosToolStripMenuItem;
        private System.Windows.Forms.ToolStripMenuItem comprarOfertarToolStripMenuItem;
        private System.Windows.Forms.ToolStripMenuItem calificarToolStripMenuItem;
        private System.Windows.Forms.ToolStripMenuItem listadoEstadisticoToolStripMenuItem;
        private System.Windows.Forms.ToolStripMenuItem consultaFacturasToolStripMenuItem;
    }
}
