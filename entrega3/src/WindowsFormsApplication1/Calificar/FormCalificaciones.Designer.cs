namespace MercadoEnvioDesktop.Calificar
{
    partial class FormCalificaciones
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
            this.gridRealizadas = new ApplicationGdd1.Grilla();
            this.gridPendientes = new ApplicationGdd1.Grilla();
            this.pictureLogo1 = new ApplicationGdd1.PictureLogo();
            this.grpPendientes = new System.Windows.Forms.GroupBox();
            this.groupBox2 = new System.Windows.Forms.GroupBox();
            this.groupBox1 = new System.Windows.Forms.GroupBox();
            this.gridResumenes = new ApplicationGdd1.Grilla();
            this.grpBotonera = new System.Windows.Forms.GroupBox();
            this.botonRefrescar1 = new MercadoEnvioDesktop.Botones.BotonRefrescar();
            this.grpPendientes.SuspendLayout();
            this.groupBox2.SuspendLayout();
            this.groupBox1.SuspendLayout();
            this.grpBotonera.SuspendLayout();
            this.SuspendLayout();
            // 
            // gridRealizadas
            // 
            this.gridRealizadas.BackColor = System.Drawing.SystemColors.ActiveCaptionText;
            this.gridRealizadas.Dock = System.Windows.Forms.DockStyle.Fill;
            this.gridRealizadas.Location = new System.Drawing.Point(3, 18);
            this.gridRealizadas.Name = "gridRealizadas";
            this.gridRealizadas.Size = new System.Drawing.Size(1070, 172);
            this.gridRealizadas.TabIndex = 0;
            // 
            // gridPendientes
            // 
            this.gridPendientes.BackColor = System.Drawing.SystemColors.ActiveCaptionText;
            this.gridPendientes.Dock = System.Windows.Forms.DockStyle.Fill;
            this.gridPendientes.Location = new System.Drawing.Point(3, 18);
            this.gridPendientes.Name = "gridPendientes";
            this.gridPendientes.Size = new System.Drawing.Size(1070, 168);
            this.gridPendientes.TabIndex = 1;
            // 
            // pictureLogo1
            // 
            this.pictureLogo1.BackColor = System.Drawing.Color.Orange;
            this.pictureLogo1.Dock = System.Windows.Forms.DockStyle.Top;
            this.pictureLogo1.Location = new System.Drawing.Point(0, 0);
            this.pictureLogo1.Name = "pictureLogo1";
            this.pictureLogo1.Size = new System.Drawing.Size(1076, 26);
            this.pictureLogo1.TabIndex = 3;
            // 
            // grpPendientes
            // 
            this.grpPendientes.BackColor = System.Drawing.Color.White;
            this.grpPendientes.Controls.Add(this.gridPendientes);
            this.grpPendientes.Dock = System.Windows.Forms.DockStyle.Top;
            this.grpPendientes.Location = new System.Drawing.Point(0, 26);
            this.grpPendientes.Name = "grpPendientes";
            this.grpPendientes.Size = new System.Drawing.Size(1076, 189);
            this.grpPendientes.TabIndex = 4;
            this.grpPendientes.TabStop = false;
            this.grpPendientes.Text = "Calificaciones pendientes";
            // 
            // groupBox2
            // 
            this.groupBox2.BackColor = System.Drawing.Color.White;
            this.groupBox2.Controls.Add(this.gridRealizadas);
            this.groupBox2.Dock = System.Windows.Forms.DockStyle.Fill;
            this.groupBox2.Location = new System.Drawing.Point(0, 215);
            this.groupBox2.Name = "groupBox2";
            this.groupBox2.Size = new System.Drawing.Size(1076, 193);
            this.groupBox2.TabIndex = 0;
            this.groupBox2.TabStop = false;
            this.groupBox2.Text = "Ultimas calificaciones realizadas";
            // 
            // groupBox1
            // 
            this.groupBox1.BackColor = System.Drawing.Color.White;
            this.groupBox1.Controls.Add(this.gridResumenes);
            this.groupBox1.Dock = System.Windows.Forms.DockStyle.Bottom;
            this.groupBox1.Location = new System.Drawing.Point(0, 408);
            this.groupBox1.Name = "groupBox1";
            this.groupBox1.Size = new System.Drawing.Size(1076, 102);
            this.groupBox1.TabIndex = 5;
            this.groupBox1.TabStop = false;
            this.groupBox1.Text = "Resumen de cantidad de estrellas otorgadas por tipo de compra";
            // 
            // gridResumenes
            // 
            this.gridResumenes.BackColor = System.Drawing.SystemColors.ActiveCaptionText;
            this.gridResumenes.Dock = System.Windows.Forms.DockStyle.Fill;
            this.gridResumenes.Location = new System.Drawing.Point(3, 18);
            this.gridResumenes.Name = "gridResumenes";
            this.gridResumenes.Size = new System.Drawing.Size(1070, 81);
            this.gridResumenes.TabIndex = 0;
            // 
            // grpBotonera
            // 
            this.grpBotonera.BackColor = System.Drawing.Color.GhostWhite;
            this.grpBotonera.Controls.Add(this.botonRefrescar1);
            this.grpBotonera.Dock = System.Windows.Forms.DockStyle.Bottom;
            this.grpBotonera.ForeColor = System.Drawing.SystemColors.ControlLightLight;
            this.grpBotonera.Location = new System.Drawing.Point(0, 510);
            this.grpBotonera.Name = "grpBotonera";
            this.grpBotonera.Size = new System.Drawing.Size(1076, 53);
            this.grpBotonera.TabIndex = 42;
            this.grpBotonera.TabStop = false;
            // 
            // botonRefrescar1
            // 
            this.botonRefrescar1.Location = new System.Drawing.Point(957, 17);
            this.botonRefrescar1.Name = "botonRefrescar1";
            this.botonRefrescar1.Size = new System.Drawing.Size(80, 24);
            this.botonRefrescar1.TabIndex = 0;
            // 
            // FormCalificaciones
            // 
            this.AutoScaleDimensions = new System.Drawing.SizeF(6F, 14F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.BackColor = System.Drawing.Color.White;
            this.BackgroundImageLayout = System.Windows.Forms.ImageLayout.Center;
            this.ClientSize = new System.Drawing.Size(1076, 563);
            this.Controls.Add(this.groupBox2);
            this.Controls.Add(this.groupBox1);
            this.Controls.Add(this.grpBotonera);
            this.Controls.Add(this.grpPendientes);
            this.Controls.Add(this.pictureLogo1);
            this.Font = new System.Drawing.Font("Calibri", 9F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.Name = "FormCalificaciones";
            this.StartPosition = System.Windows.Forms.FormStartPosition.CenterScreen;
            this.Text = "Calificaciones";
            this.Load += new System.EventHandler(this.FormCalificaciones_Load);
            this.grpPendientes.ResumeLayout(false);
            this.groupBox2.ResumeLayout(false);
            this.groupBox1.ResumeLayout(false);
            this.grpBotonera.ResumeLayout(false);
            this.ResumeLayout(false);

        }

        #endregion

        private ApplicationGdd1.Grilla gridRealizadas;
        private ApplicationGdd1.Grilla gridPendientes;
        private ApplicationGdd1.PictureLogo pictureLogo1;
        private System.Windows.Forms.GroupBox grpPendientes;
        private System.Windows.Forms.GroupBox groupBox2;
        private System.Windows.Forms.GroupBox groupBox1;
        private ApplicationGdd1.Grilla gridResumenes;
        private System.Windows.Forms.GroupBox grpBotonera;
        private Botones.BotonRefrescar botonRefrescar1;
    }
}