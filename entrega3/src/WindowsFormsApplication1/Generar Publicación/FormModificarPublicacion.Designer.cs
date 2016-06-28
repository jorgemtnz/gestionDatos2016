namespace MercadoEnvioDesktop.Generar_Publicación
{
    partial class FormModificarPublicacion
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
            this.grdPublicaciones = new ApplicationGdd1.Grilla();
            this.pictureLogo1 = new ApplicationGdd1.PictureLogo();
            this.grpBotonera = new System.Windows.Forms.GroupBox();
            this.botonRefrescar1 = new MercadoEnvioDesktop.Botones.BotonRefrescar();
            this.grpBotonera.SuspendLayout();
            this.SuspendLayout();
            // 
            // grdPublicaciones
            // 
            this.grdPublicaciones.BackColor = System.Drawing.Color.White;
            this.grdPublicaciones.Dock = System.Windows.Forms.DockStyle.Fill;
            this.grdPublicaciones.Location = new System.Drawing.Point(0, 26);
            this.grdPublicaciones.Name = "grdPublicaciones";
            this.grdPublicaciones.Size = new System.Drawing.Size(1144, 396);
            this.grdPublicaciones.TabIndex = 0;
            // 
            // pictureLogo1
            // 
            this.pictureLogo1.BackColor = System.Drawing.Color.Orange;
            this.pictureLogo1.Dock = System.Windows.Forms.DockStyle.Top;
            this.pictureLogo1.Location = new System.Drawing.Point(0, 0);
            this.pictureLogo1.Name = "pictureLogo1";
            this.pictureLogo1.Size = new System.Drawing.Size(1144, 26);
            this.pictureLogo1.TabIndex = 1;
            // 
            // grpBotonera
            // 
            this.grpBotonera.BackColor = System.Drawing.Color.GhostWhite;
            this.grpBotonera.Controls.Add(this.botonRefrescar1);
            this.grpBotonera.Dock = System.Windows.Forms.DockStyle.Bottom;
            this.grpBotonera.ForeColor = System.Drawing.SystemColors.ControlLightLight;
            this.grpBotonera.Location = new System.Drawing.Point(0, 422);
            this.grpBotonera.Name = "grpBotonera";
            this.grpBotonera.Size = new System.Drawing.Size(1144, 53);
            this.grpBotonera.TabIndex = 42;
            this.grpBotonera.TabStop = false;
            // 
            // botonRefrescar1
            // 
            this.botonRefrescar1.Location = new System.Drawing.Point(1039, 17);
            this.botonRefrescar1.Name = "botonRefrescar1";
            this.botonRefrescar1.Size = new System.Drawing.Size(80, 24);
            this.botonRefrescar1.TabIndex = 0;
            // 
            // FormModificarPublicacion
            // 
            this.AutoScaleDimensions = new System.Drawing.SizeF(6F, 13F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.ClientSize = new System.Drawing.Size(1144, 475);
            this.Controls.Add(this.grdPublicaciones);
            this.Controls.Add(this.grpBotonera);
            this.Controls.Add(this.pictureLogo1);
            this.Font = new System.Drawing.Font("Calibri", 8.25F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.Name = "FormModificarPublicacion";
            this.StartPosition = System.Windows.Forms.FormStartPosition.CenterScreen;
            this.Text = "Publicaciones";
            this.Load += new System.EventHandler(this.FormModificarPublicacion_Load);
            this.grpBotonera.ResumeLayout(false);
            this.ResumeLayout(false);

        }

        #endregion

        private ApplicationGdd1.Grilla grdPublicaciones;
        private ApplicationGdd1.PictureLogo pictureLogo1;
        private System.Windows.Forms.GroupBox grpBotonera;
        private Botones.BotonRefrescar botonRefrescar1;
    }
}