namespace MercadoEnvioDesktop.ABM_Visibilidad
{
    partial class FormConsultaVisbilidades
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
            this.gridVisibilidades = new ApplicationGdd1.Grilla();
            this.pictureLogo1 = new ApplicationGdd1.PictureLogo();
            this.grpBotonera = new System.Windows.Forms.GroupBox();
            this.botonRefrescar1 = new MercadoEnvioDesktop.Botones.BotonRefrescar();
            this.grpBotonera.SuspendLayout();
            this.SuspendLayout();
            // 
            // gridVisibilidades
            // 
            this.gridVisibilidades.BackColor = System.Drawing.SystemColors.ActiveCaptionText;
            this.gridVisibilidades.Dock = System.Windows.Forms.DockStyle.Fill;
            this.gridVisibilidades.Location = new System.Drawing.Point(0, 26);
            this.gridVisibilidades.Name = "gridVisibilidades";
            this.gridVisibilidades.Size = new System.Drawing.Size(629, 329);
            this.gridVisibilidades.TabIndex = 0;
            // 
            // pictureLogo1
            // 
            this.pictureLogo1.BackColor = System.Drawing.Color.Orange;
            this.pictureLogo1.Dock = System.Windows.Forms.DockStyle.Top;
            this.pictureLogo1.Location = new System.Drawing.Point(0, 0);
            this.pictureLogo1.Name = "pictureLogo1";
            this.pictureLogo1.Size = new System.Drawing.Size(629, 26);
            this.pictureLogo1.TabIndex = 1;
            // 
            // grpBotonera
            // 
            this.grpBotonera.BackColor = System.Drawing.Color.GhostWhite;
            this.grpBotonera.Controls.Add(this.botonRefrescar1);
            this.grpBotonera.Dock = System.Windows.Forms.DockStyle.Bottom;
            this.grpBotonera.ForeColor = System.Drawing.SystemColors.ControlLightLight;
            this.grpBotonera.Location = new System.Drawing.Point(0, 355);
            this.grpBotonera.Name = "grpBotonera";
            this.grpBotonera.Size = new System.Drawing.Size(629, 53);
            this.grpBotonera.TabIndex = 41;
            this.grpBotonera.TabStop = false;
            // 
            // botonRefrescar1
            // 
            this.botonRefrescar1.Location = new System.Drawing.Point(537, 17);
            this.botonRefrescar1.Name = "botonRefrescar1";
            this.botonRefrescar1.Size = new System.Drawing.Size(80, 24);
            this.botonRefrescar1.TabIndex = 0;
            // 
            // FormConsultaVisbilidades
            // 
            this.AutoScaleDimensions = new System.Drawing.SizeF(6F, 14F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.ClientSize = new System.Drawing.Size(629, 408);
            this.Controls.Add(this.gridVisibilidades);
            this.Controls.Add(this.grpBotonera);
            this.Controls.Add(this.pictureLogo1);
            this.Font = new System.Drawing.Font("Calibri", 9F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.Name = "FormConsultaVisbilidades";
            this.StartPosition = System.Windows.Forms.FormStartPosition.CenterScreen;
            this.Text = "Visbilidades";
            this.Load += new System.EventHandler(this.FormVisbilidades_Load);
            this.grpBotonera.ResumeLayout(false);
            this.ResumeLayout(false);

        }

        #endregion

        private ApplicationGdd1.Grilla gridVisibilidades;
        private ApplicationGdd1.PictureLogo pictureLogo1;
        private System.Windows.Forms.GroupBox grpBotonera;
        private Botones.BotonRefrescar botonRefrescar1;
    }
}