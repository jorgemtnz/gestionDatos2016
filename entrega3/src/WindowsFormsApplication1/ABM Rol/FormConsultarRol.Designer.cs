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
            this.grdRoles = new ApplicationGdd1.Grilla();
            this.pictureLogo1 = new ApplicationGdd1.PictureLogo();
            this.grpBotonera = new System.Windows.Forms.GroupBox();
            this.botonRefrescar1 = new MercadoEnvioDesktop.Botones.BotonRefrescar();
            this.grpBotonera.SuspendLayout();
            this.SuspendLayout();
            // 
            // grdRoles
            // 
            this.grdRoles.BackColor = System.Drawing.Color.White;
            this.grdRoles.Dock = System.Windows.Forms.DockStyle.Fill;
            this.grdRoles.Location = new System.Drawing.Point(0, 26);
            this.grdRoles.Name = "grdRoles";
            this.grdRoles.Size = new System.Drawing.Size(334, 259);
            this.grdRoles.TabIndex = 43;
            // 
            // pictureLogo1
            // 
            this.pictureLogo1.BackColor = System.Drawing.Color.Orange;
            this.pictureLogo1.Dock = System.Windows.Forms.DockStyle.Top;
            this.pictureLogo1.Location = new System.Drawing.Point(0, 0);
            this.pictureLogo1.Name = "pictureLogo1";
            this.pictureLogo1.Size = new System.Drawing.Size(334, 26);
            this.pictureLogo1.TabIndex = 0;
            // 
            // grpBotonera
            // 
            this.grpBotonera.BackColor = System.Drawing.Color.GhostWhite;
            this.grpBotonera.Controls.Add(this.botonRefrescar1);
            this.grpBotonera.Dock = System.Windows.Forms.DockStyle.Bottom;
            this.grpBotonera.ForeColor = System.Drawing.SystemColors.ControlLightLight;
            this.grpBotonera.Location = new System.Drawing.Point(0, 285);
            this.grpBotonera.Name = "grpBotonera";
            this.grpBotonera.Size = new System.Drawing.Size(334, 53);
            this.grpBotonera.TabIndex = 44;
            this.grpBotonera.TabStop = false;
            // 
            // botonRefrescar1
            // 
            this.botonRefrescar1.Location = new System.Drawing.Point(232, 17);
            this.botonRefrescar1.Name = "botonRefrescar1";
            this.botonRefrescar1.Size = new System.Drawing.Size(80, 24);
            this.botonRefrescar1.TabIndex = 0;
            // 
            // FormConsultarRol
            // 
            this.AutoScaleDimensions = new System.Drawing.SizeF(6F, 14F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.ClientSize = new System.Drawing.Size(334, 338);
            this.Controls.Add(this.grdRoles);
            this.Controls.Add(this.grpBotonera);
            this.Controls.Add(this.pictureLogo1);
            this.Font = new System.Drawing.Font("Calibri", 9F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.Name = "FormConsultarRol";
            this.StartPosition = System.Windows.Forms.FormStartPosition.CenterScreen;
            this.Text = "Roles";
            this.Load += new System.EventHandler(this.FormConsultarRol_Load);
            this.grpBotonera.ResumeLayout(false);
            this.ResumeLayout(false);

        }

        #endregion

        private ApplicationGdd1.PictureLogo pictureLogo1;
        private ApplicationGdd1.Grilla grdRoles;
        private System.Windows.Forms.GroupBox grpBotonera;
        private Botones.BotonRefrescar botonRefrescar1;
    }
}