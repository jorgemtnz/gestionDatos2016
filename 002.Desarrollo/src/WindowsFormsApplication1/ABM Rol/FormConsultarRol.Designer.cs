namespace MercadoEnvioDesktop.ABM_Rol
{
    partial class FormConsultarRol
    {
        /// <summary>
        /// Required designer variable.
        /// </summary>
        private System.ComponentModel.IContainer components = null;

        /// <summary>
        /// Clean up any resources being used.
        /// </summary>
        /// <param name="disposing">true if managed resources should be disposed; otherwise, false.</param>
        protected override void Dispose(bool disposing)
        {
            if (disposing && (components != null))
            {
                components.Dispose();
            }
            base.Dispose(disposing);
        }

        #region Windows Form Designer generated code

        /// <summary>
        /// Required method for Designer support - do not modify
        /// the contents of this method with the code editor.
        /// </summary>
        private void InitializeComponent()
        {
            this.grpBotonera = new System.Windows.Forms.GroupBox();
            this.groupBox1 = new System.Windows.Forms.GroupBox();
            this.fileSystemWatcher1 = new System.IO.FileSystemWatcher();
            this.textoAlfanumerico1 = new ApplicationGdd1.TextoAlfanumerico();
            this.grilla1 = new ApplicationGdd1.Grilla();
            this.grdRoles = new ApplicationGdd1.Grilla();
            this.botonLimpiar1 = new ApplicationGdd1.BotonLimpiar();
            this.botonBuscar1 = new ApplicationGdd1.BotonBuscar();
            this.pictureLogo1 = new ApplicationGdd1.PictureLogo();
            this.grpBotonera.SuspendLayout();
            this.groupBox1.SuspendLayout();
            ((System.ComponentModel.ISupportInitialize)(this.fileSystemWatcher1)).BeginInit();
            this.SuspendLayout();
            // 
            // grpBotonera
            // 
            this.grpBotonera.BackColor = System.Drawing.Color.GhostWhite;
            this.grpBotonera.Controls.Add(this.botonLimpiar1);
            this.grpBotonera.Controls.Add(this.botonBuscar1);
            this.grpBotonera.Dock = System.Windows.Forms.DockStyle.Bottom;
            this.grpBotonera.ForeColor = System.Drawing.SystemColors.ControlLightLight;
            this.grpBotonera.Location = new System.Drawing.Point(0, 264);
            this.grpBotonera.Name = "grpBotonera";
            this.grpBotonera.Size = new System.Drawing.Size(605, 53);
            this.grpBotonera.TabIndex = 44;
            this.grpBotonera.TabStop = false;
            // 
            // groupBox1
            // 
            this.groupBox1.Controls.Add(this.textoAlfanumerico1);
            this.groupBox1.Location = new System.Drawing.Point(2, 28);
            this.groupBox1.Name = "groupBox1";
            this.groupBox1.Size = new System.Drawing.Size(602, 67);
            this.groupBox1.TabIndex = 46;
            this.groupBox1.TabStop = false;
            this.groupBox1.Text = "groupBox1";
            // 
            // fileSystemWatcher1
            // 
            this.fileSystemWatcher1.EnableRaisingEvents = true;
            this.fileSystemWatcher1.SynchronizingObject = this;
            // 
            // textoAlfanumerico1
            // 
            this.textoAlfanumerico1.BackColor = System.Drawing.SystemColors.ButtonHighlight;
            this.textoAlfanumerico1.Location = new System.Drawing.Point(31, 21);
            this.textoAlfanumerico1.Name = "textoAlfanumerico1";
            this.textoAlfanumerico1.Size = new System.Drawing.Size(515, 25);
            this.textoAlfanumerico1.TabIndex = 0;
            // 
            // grilla1
            // 
            this.grilla1.BackColor = System.Drawing.Color.White;
            this.grilla1.Location = new System.Drawing.Point(0, 93);
            this.grilla1.Name = "grilla1";
            this.grilla1.Size = new System.Drawing.Size(604, 170);
            this.grilla1.TabIndex = 45;
            // 
            // grdRoles
            // 
            this.grdRoles.BackColor = System.Drawing.Color.White;
            this.grdRoles.Dock = System.Windows.Forms.DockStyle.Fill;
            this.grdRoles.Location = new System.Drawing.Point(0, 26);
            this.grdRoles.Name = "grdRoles";
            this.grdRoles.Size = new System.Drawing.Size(605, 238);
            this.grdRoles.TabIndex = 43;
            // 
            // botonLimpiar1
            // 
            this.botonLimpiar1.AutoSize = true;
            this.botonLimpiar1.Location = new System.Drawing.Point(33, 17);
            this.botonLimpiar1.Name = "botonLimpiar1";
            this.botonLimpiar1.Size = new System.Drawing.Size(83, 29);
            this.botonLimpiar1.TabIndex = 2;
            // 
            // botonBuscar1
            // 
            this.botonBuscar1.Location = new System.Drawing.Point(488, 17);
            this.botonBuscar1.Name = "botonBuscar1";
            this.botonBuscar1.Size = new System.Drawing.Size(83, 27);
            this.botonBuscar1.TabIndex = 1;
            // 
            // pictureLogo1
            // 
            this.pictureLogo1.BackColor = System.Drawing.Color.Orange;
            this.pictureLogo1.Dock = System.Windows.Forms.DockStyle.Top;
            this.pictureLogo1.Location = new System.Drawing.Point(0, 0);
            this.pictureLogo1.Name = "pictureLogo1";
            this.pictureLogo1.Size = new System.Drawing.Size(605, 26);
            this.pictureLogo1.TabIndex = 0;
            // 
            // FormConsultarRol
            // 
            this.AutoScaleDimensions = new System.Drawing.SizeF(6F, 14F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.ClientSize = new System.Drawing.Size(605, 317);
            this.Controls.Add(this.groupBox1);
            this.Controls.Add(this.grilla1);
            this.Controls.Add(this.grdRoles);
            this.Controls.Add(this.grpBotonera);
            this.Controls.Add(this.pictureLogo1);
            this.Font = new System.Drawing.Font("Calibri", 9F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.Name = "FormConsultarRol";
            this.StartPosition = System.Windows.Forms.FormStartPosition.CenterScreen;
            this.Text = "Roles";
            this.Load += new System.EventHandler(this.FormConsultarRol_Load);
            this.grpBotonera.ResumeLayout(false);
            this.grpBotonera.PerformLayout();
            this.groupBox1.ResumeLayout(false);
            ((System.ComponentModel.ISupportInitialize)(this.fileSystemWatcher1)).EndInit();
            this.ResumeLayout(false);

        }

        #endregion

        private ApplicationGdd1.PictureLogo pictureLogo1;
        private ApplicationGdd1.Grilla grdRoles;
        private System.Windows.Forms.GroupBox grpBotonera;
        private ApplicationGdd1.BotonLimpiar botonLimpiar1;
        private ApplicationGdd1.BotonBuscar botonBuscar1;
        private ApplicationGdd1.Grilla grilla1;
        private System.Windows.Forms.GroupBox groupBox1;
        private System.IO.FileSystemWatcher fileSystemWatcher1;
        private ApplicationGdd1.TextoAlfanumerico textoAlfanumerico1;
    }
}