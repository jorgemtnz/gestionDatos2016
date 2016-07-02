namespace MercadoEnvioDesktop
{
    partial class FrmLogIn
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
            this.components = new System.ComponentModel.Container();
            this.lblRta = new System.Windows.Forms.Label();
            this.errorLabelUsername = new System.Windows.Forms.Label();
            this.errorProvider1 = new System.Windows.Forms.ErrorProvider(this.components);
            this.txtUsuario = new ApplicationGdd1.TextoAlfanumerico();
            this.txtContraseña = new ApplicationGdd1.TextoAlfanumerico();
            this.pictureLogo1 = new ApplicationGdd1.PictureLogo();
            this.cboRol = new ApplicationGdd1.combo();
            this.logoMercadoEnvios1 = new MercadoEnvioDesktop.UserControls.LogoMercadoEnvios();
            this.botonLogin1 = new MercadoEnvioDesktop.Botones.BotonLogin();
            ((System.ComponentModel.ISupportInitialize)(this.errorProvider1)).BeginInit();
            this.SuspendLayout();
            // 
            // lblRta
            // 
            this.lblRta.AutoSize = true;
            this.lblRta.BackColor = System.Drawing.Color.Transparent;
            this.lblRta.Font = new System.Drawing.Font("Courier New", 9.75F, System.Drawing.FontStyle.Italic, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.lblRta.ForeColor = System.Drawing.Color.White;
            this.lblRta.Location = new System.Drawing.Point(181, 243);
            this.lblRta.Name = "lblRta";
            this.lblRta.Size = new System.Drawing.Size(0, 17);
            this.lblRta.TabIndex = 11;
            // 
            // errorLabelUsername
            // 
            this.errorLabelUsername.AutoSize = true;
            this.errorLabelUsername.Location = new System.Drawing.Point(22, 110);
            this.errorLabelUsername.Name = "errorLabelUsername";
            this.errorLabelUsername.Size = new System.Drawing.Size(0, 14);
            this.errorLabelUsername.TabIndex = 12;
            // 
            // errorProvider1
            // 
            this.errorProvider1.ContainerControl = this;
            // 
            // txtUsuario
            // 
            this.txtUsuario.BackColor = System.Drawing.SystemColors.ButtonHighlight;
            this.txtUsuario.Location = new System.Drawing.Point(184, 69);
            this.txtUsuario.Name = "txtUsuario";
            this.txtUsuario.Size = new System.Drawing.Size(387, 25);
            this.txtUsuario.TabIndex = 14;
            // 
            // txtContraseña
            // 
            this.txtContraseña.BackColor = System.Drawing.SystemColors.ButtonHighlight;
            this.txtContraseña.Location = new System.Drawing.Point(184, 94);
            this.txtContraseña.Name = "txtContraseña";
            this.txtContraseña.Size = new System.Drawing.Size(387, 25);
            this.txtContraseña.TabIndex = 15;
            // 
            // pictureLogo1
            // 
            this.pictureLogo1.BackColor = System.Drawing.Color.Orange;
            this.pictureLogo1.Dock = System.Windows.Forms.DockStyle.Top;
            this.pictureLogo1.Location = new System.Drawing.Point(0, 0);
            this.pictureLogo1.Name = "pictureLogo1";
            this.pictureLogo1.Size = new System.Drawing.Size(601, 26);
            this.pictureLogo1.TabIndex = 16;
            // 
            // cboRol
            // 
            this.cboRol.BackColor = System.Drawing.Color.White;
            this.cboRol.ForeColor = System.Drawing.SystemColors.Desktop;
            this.cboRol.Location = new System.Drawing.Point(184, 119);
            this.cboRol.Name = "cboRol";
            this.cboRol.Size = new System.Drawing.Size(301, 27);
            this.cboRol.TabIndex = 18;
            // 
            // logoMercadoEnvios1
            // 
            this.logoMercadoEnvios1.Location = new System.Drawing.Point(25, 69);
            this.logoMercadoEnvios1.Name = "logoMercadoEnvios1";
            this.logoMercadoEnvios1.Size = new System.Drawing.Size(133, 147);
            this.logoMercadoEnvios1.TabIndex = 19;
            // 
            // botonLogin1
            // 
            this.botonLogin1.Location = new System.Drawing.Point(391, 177);
            this.botonLogin1.Name = "botonLogin1";
            this.botonLogin1.Size = new System.Drawing.Size(80, 24);
            this.botonLogin1.TabIndex = 20;
            // 
            // FrmLogIn
            // 
            this.BackColor = System.Drawing.Color.White;
            this.BackgroundImageLayout = System.Windows.Forms.ImageLayout.Stretch;
            this.ClientSize = new System.Drawing.Size(601, 238);
            this.Controls.Add(this.botonLogin1);
            this.Controls.Add(this.logoMercadoEnvios1);
            this.Controls.Add(this.cboRol);
            this.Controls.Add(this.pictureLogo1);
            this.Controls.Add(this.txtContraseña);
            this.Controls.Add(this.txtUsuario);
            this.Controls.Add(this.errorLabelUsername);
            this.Controls.Add(this.lblRta);
            this.DoubleBuffered = true;
            this.Font = new System.Drawing.Font("Calibri", 9F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.FormBorderStyle = System.Windows.Forms.FormBorderStyle.FixedSingle;
            this.Margin = new System.Windows.Forms.Padding(8, 6, 8, 6);
            this.Name = "FrmLogIn";
            this.StartPosition = System.Windows.Forms.FormStartPosition.CenterScreen;
            this.Text = "LogIn";
            this.Load += new System.EventHandler(this.FrmLogIn_Load);
            ((System.ComponentModel.ISupportInitialize)(this.errorProvider1)).EndInit();
            this.ResumeLayout(false);
            this.PerformLayout();

        }

        #endregion

        private System.Windows.Forms.Label lblRta;
        public System.Windows.Forms.Label errorLabelUsername;
        private System.Windows.Forms.ErrorProvider errorProvider1;
        private ApplicationGdd1.PictureLogo pictureLogo1;
        private ApplicationGdd1.TextoAlfanumerico txtContraseña;
        private ApplicationGdd1.TextoAlfanumerico txtUsuario;
        private ApplicationGdd1.combo cboRol;
        private UserControls.LogoMercadoEnvios logoMercadoEnvios1;
        private Botones.BotonLogin botonLogin1;
    }
}
