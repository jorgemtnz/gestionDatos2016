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
            this.btnLogIn = new System.Windows.Forms.Button();
            this.txtUsu = new System.Windows.Forms.TextBox();
            this.txtCon = new System.Windows.Forms.TextBox();
            this.lblUsu = new System.Windows.Forms.Label();
            this.lblCon = new System.Windows.Forms.Label();
            this.lblRta = new System.Windows.Forms.Label();
            this.errorLabelUsername = new System.Windows.Forms.Label();
            this.button1 = new System.Windows.Forms.Button();
            this.errorProvider1 = new System.Windows.Forms.ErrorProvider(this.components);
            this.txtUsuario = new ApplicationGdd1.TextoAlfanumerico();
            this.txtContraseña = new ApplicationGdd1.TextoAlfanumerico();
            this.pictureLogo1 = new ApplicationGdd1.PictureLogo();
            this.pictureBox1 = new System.Windows.Forms.PictureBox();
            ((System.ComponentModel.ISupportInitialize)(this.errorProvider1)).BeginInit();
            ((System.ComponentModel.ISupportInitialize)(this.pictureBox1)).BeginInit();
            this.SuspendLayout();
            // 
            // btnLogIn
            // 
            this.btnLogIn.BackColor = System.Drawing.Color.LightSteelBlue;
            this.btnLogIn.BackgroundImageLayout = System.Windows.Forms.ImageLayout.None;
            this.btnLogIn.FlatAppearance.BorderColor = System.Drawing.Color.LightSteelBlue;
            this.btnLogIn.FlatAppearance.MouseDownBackColor = System.Drawing.Color.GhostWhite;
            this.btnLogIn.FlatAppearance.MouseOverBackColor = System.Drawing.Color.AliceBlue;
            this.btnLogIn.FlatStyle = System.Windows.Forms.FlatStyle.Flat;
            this.btnLogIn.Font = new System.Drawing.Font("Courier New", 11.25F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.btnLogIn.ForeColor = System.Drawing.Color.Black;
            this.btnLogIn.Location = new System.Drawing.Point(367, 327);
            this.btnLogIn.Margin = new System.Windows.Forms.Padding(5, 4, 5, 4);
            this.btnLogIn.Name = "btnLogIn";
            this.btnLogIn.Size = new System.Drawing.Size(91, 27);
            this.btnLogIn.TabIndex = 2;
            this.btnLogIn.Text = "Ingresar";
            this.btnLogIn.UseVisualStyleBackColor = false;
            this.btnLogIn.Click += new System.EventHandler(this.btnLogIn_Click);
            // 
            // txtUsu
            // 
            this.txtUsu.BackColor = System.Drawing.Color.LightCyan;
            this.txtUsu.BorderStyle = System.Windows.Forms.BorderStyle.FixedSingle;
            this.txtUsu.Font = new System.Drawing.Font("Courier New", 15.75F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.txtUsu.Location = new System.Drawing.Point(204, 243);
            this.txtUsu.Margin = new System.Windows.Forms.Padding(5, 4, 5, 4);
            this.txtUsu.Name = "txtUsu";
            this.txtUsu.Size = new System.Drawing.Size(254, 31);
            this.txtUsu.TabIndex = 3;
            // 
            // txtCon
            // 
            this.txtCon.BackColor = System.Drawing.Color.LightCyan;
            this.txtCon.BorderStyle = System.Windows.Forms.BorderStyle.FixedSingle;
            this.txtCon.Font = new System.Drawing.Font("Courier New", 15.75F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.txtCon.Location = new System.Drawing.Point(204, 288);
            this.txtCon.Margin = new System.Windows.Forms.Padding(5, 4, 5, 4);
            this.txtCon.Name = "txtCon";
            this.txtCon.Size = new System.Drawing.Size(254, 31);
            this.txtCon.TabIndex = 4;
            this.txtCon.UseSystemPasswordChar = true;
            // 
            // lblUsu
            // 
            this.lblUsu.AutoSize = true;
            this.lblUsu.BackColor = System.Drawing.Color.Transparent;
            this.lblUsu.Font = new System.Drawing.Font("Courier New", 15.75F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.lblUsu.ForeColor = System.Drawing.SystemColors.ActiveCaption;
            this.lblUsu.Location = new System.Drawing.Point(28, 245);
            this.lblUsu.Margin = new System.Windows.Forms.Padding(5, 0, 5, 0);
            this.lblUsu.Name = "lblUsu";
            this.lblUsu.Size = new System.Drawing.Size(127, 23);
            this.lblUsu.TabIndex = 5;
            this.lblUsu.Text = "Usuario *";
            // 
            // lblCon
            // 
            this.lblCon.AutoSize = true;
            this.lblCon.BackColor = System.Drawing.Color.Transparent;
            this.lblCon.Font = new System.Drawing.Font("Courier New", 15.75F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.lblCon.ForeColor = System.Drawing.SystemColors.ActiveCaption;
            this.lblCon.Location = new System.Drawing.Point(28, 290);
            this.lblCon.Margin = new System.Windows.Forms.Padding(5, 0, 5, 0);
            this.lblCon.Name = "lblCon";
            this.lblCon.Size = new System.Drawing.Size(166, 23);
            this.lblCon.TabIndex = 6;
            this.lblCon.Text = "Contraseña *";
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
            // button1
            // 
            this.button1.BackColor = System.Drawing.SystemColors.HotTrack;
            this.button1.BackgroundImageLayout = System.Windows.Forms.ImageLayout.None;
            this.button1.FlatAppearance.BorderColor = System.Drawing.Color.LightSteelBlue;
            this.button1.FlatAppearance.MouseDownBackColor = System.Drawing.Color.GhostWhite;
            this.button1.FlatAppearance.MouseOverBackColor = System.Drawing.Color.AliceBlue;
            this.button1.FlatStyle = System.Windows.Forms.FlatStyle.Flat;
            this.button1.Font = new System.Drawing.Font("Calibri", 11.25F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.button1.ForeColor = System.Drawing.Color.White;
            this.button1.Location = new System.Drawing.Point(362, 167);
            this.button1.Margin = new System.Windows.Forms.Padding(5, 4, 5, 4);
            this.button1.Name = "button1";
            this.button1.Size = new System.Drawing.Size(110, 27);
            this.button1.TabIndex = 13;
            this.button1.Text = "Sin_login";
            this.button1.UseVisualStyleBackColor = false;
            this.button1.Click += new System.EventHandler(this.button1_Click);
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
            this.txtUsuario.Size = new System.Drawing.Size(301, 25);
            this.txtUsuario.TabIndex = 14;
            // 
            // txtContraseña
            // 
            this.txtContraseña.BackColor = System.Drawing.SystemColors.ButtonHighlight;
            this.txtContraseña.Location = new System.Drawing.Point(184, 100);
            this.txtContraseña.Name = "txtContraseña";
            this.txtContraseña.Size = new System.Drawing.Size(301, 25);
            this.txtContraseña.TabIndex = 15;
            // 
            // pictureLogo1
            // 
            this.pictureLogo1.BackColor = System.Drawing.Color.Orange;
            this.pictureLogo1.Dock = System.Windows.Forms.DockStyle.Top;
            this.pictureLogo1.Location = new System.Drawing.Point(0, 0);
            this.pictureLogo1.Name = "pictureLogo1";
            this.pictureLogo1.Size = new System.Drawing.Size(529, 46);
            this.pictureLogo1.TabIndex = 16;
            // 
            // pictureBox1
            // 
            this.pictureBox1.BackColor = System.Drawing.Color.White;
            this.pictureBox1.BackgroundImage = global::MercadoEnvioDesktop.Properties.Resources.logo_utn_envios;
            this.pictureBox1.Location = new System.Drawing.Point(25, 69);
            this.pictureBox1.Name = "pictureBox1";
            this.pictureBox1.Size = new System.Drawing.Size(129, 140);
            this.pictureBox1.TabIndex = 17;
            this.pictureBox1.TabStop = false;
            // 
            // FrmLogIn
            // 
            this.BackColor = System.Drawing.Color.White;
            this.BackgroundImageLayout = System.Windows.Forms.ImageLayout.Stretch;
            this.ClientSize = new System.Drawing.Size(529, 376);
            this.Controls.Add(this.pictureBox1);
            this.Controls.Add(this.pictureLogo1);
            this.Controls.Add(this.txtContraseña);
            this.Controls.Add(this.txtUsuario);
            this.Controls.Add(this.button1);
            this.Controls.Add(this.errorLabelUsername);
            this.Controls.Add(this.lblRta);
            this.Controls.Add(this.lblCon);
            this.Controls.Add(this.lblUsu);
            this.Controls.Add(this.txtCon);
            this.Controls.Add(this.txtUsu);
            this.Controls.Add(this.btnLogIn);
            this.DoubleBuffered = true;
            this.Font = new System.Drawing.Font("Calibri", 9F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.FormBorderStyle = System.Windows.Forms.FormBorderStyle.None;
            this.Margin = new System.Windows.Forms.Padding(8, 6, 8, 6);
            this.Name = "FrmLogIn";
            this.StartPosition = System.Windows.Forms.FormStartPosition.CenterScreen;
            this.Text = "LogIn";
            ((System.ComponentModel.ISupportInitialize)(this.errorProvider1)).EndInit();
            ((System.ComponentModel.ISupportInitialize)(this.pictureBox1)).EndInit();
            this.ResumeLayout(false);
            this.PerformLayout();

        }

        #endregion

        private System.Windows.Forms.Button btnLogIn;
        private System.Windows.Forms.TextBox txtUsu;
        private System.Windows.Forms.TextBox txtCon;
        private System.Windows.Forms.Label lblUsu;
        private System.Windows.Forms.Label lblCon;
        private System.Windows.Forms.Label lblRta;
        public System.Windows.Forms.Label errorLabelUsername;
        private System.Windows.Forms.Button button1;
        private System.Windows.Forms.ErrorProvider errorProvider1;
        private ApplicationGdd1.PictureLogo pictureLogo1;
        private ApplicationGdd1.TextoAlfanumerico txtContraseña;
        private ApplicationGdd1.TextoAlfanumerico txtUsuario;
        private System.Windows.Forms.PictureBox pictureBox1;
    }
}
