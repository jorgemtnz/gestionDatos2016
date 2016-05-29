namespace MercadoEnvioDesktop.ComprarOfertar
{
    partial class FormComprarOfertar
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
            this.grdPublicaciones = new ApplicationGdd1.GrillaPaginada();
            this.lstRubros = new ApplicationGdd1.ListaOpciones();
            this.grpFiltros = new System.Windows.Forms.GroupBox();
            this.txtDescripcion = new ApplicationGdd1.TextoAlfanumerico();
            this.grpBotonera = new System.Windows.Forms.GroupBox();
            this.btnBuscar = new ApplicationGdd1.BotonBuscar();
            this.btnLimpiar = new ApplicationGdd1.BotonLimpiar();
            this.pictureLogo1 = new ApplicationGdd1.PictureLogo();
            this.grpFiltros.SuspendLayout();
            this.grpBotonera.SuspendLayout();
            this.SuspendLayout();
            // 
            // grdPublicaciones
            // 
            this.grdPublicaciones.BackColor = System.Drawing.Color.White;
            this.grdPublicaciones.Dock = System.Windows.Forms.DockStyle.Fill;
            this.grdPublicaciones.Location = new System.Drawing.Point(156, 96);
            this.grdPublicaciones.Name = "grdPublicaciones";
            this.grdPublicaciones.Size = new System.Drawing.Size(749, 435);
            this.grdPublicaciones.TabIndex = 5;
            // 
            // lstRubros
            // 
            this.lstRubros.Dock = System.Windows.Forms.DockStyle.Left;
            this.lstRubros.Location = new System.Drawing.Point(0, 96);
            this.lstRubros.Name = "lstRubros";
            this.lstRubros.Size = new System.Drawing.Size(156, 435);
            this.lstRubros.TabIndex = 6;
            // 
            // grpFiltros
            // 
            this.grpFiltros.BackColor = System.Drawing.Color.White;
            this.grpFiltros.Controls.Add(this.txtDescripcion);
            this.grpFiltros.Dock = System.Windows.Forms.DockStyle.Top;
            this.grpFiltros.Font = new System.Drawing.Font("Calibri", 9F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.grpFiltros.Location = new System.Drawing.Point(0, 47);
            this.grpFiltros.Name = "grpFiltros";
            this.grpFiltros.Size = new System.Drawing.Size(905, 49);
            this.grpFiltros.TabIndex = 7;
            this.grpFiltros.TabStop = false;
            this.grpFiltros.Text = "Busqueda";
            // 
            // txtDescripcion
            // 
            this.txtDescripcion.BackColor = System.Drawing.SystemColors.ButtonHighlight;
            this.txtDescripcion.Location = new System.Drawing.Point(144, 18);
            this.txtDescripcion.Name = "txtDescripcion";
            this.txtDescripcion.Size = new System.Drawing.Size(591, 25);
            this.txtDescripcion.TabIndex = 1;
            // 
            // grpBotonera
            // 
            this.grpBotonera.BackColor = System.Drawing.Color.White;
            this.grpBotonera.Controls.Add(this.btnBuscar);
            this.grpBotonera.Controls.Add(this.btnLimpiar);
            this.grpBotonera.Dock = System.Windows.Forms.DockStyle.Bottom;
            this.grpBotonera.Location = new System.Drawing.Point(0, 531);
            this.grpBotonera.Name = "grpBotonera";
            this.grpBotonera.Size = new System.Drawing.Size(905, 63);
            this.grpBotonera.TabIndex = 8;
            this.grpBotonera.TabStop = false;
            // 
            // btnBuscar
            // 
            this.btnBuscar.Location = new System.Drawing.Point(503, 15);
            this.btnBuscar.Name = "btnBuscar";
            this.btnBuscar.Size = new System.Drawing.Size(130, 30);
            this.btnBuscar.TabIndex = 1;
            // 
            // btnLimpiar
            // 
            this.btnLimpiar.AutoSize = true;
            this.btnLimpiar.Location = new System.Drawing.Point(29, 15);
            this.btnLimpiar.Name = "btnLimpiar";
            this.btnLimpiar.Size = new System.Drawing.Size(133, 35);
            this.btnLimpiar.TabIndex = 0;
            // 
            // pictureLogo1
            // 
            this.pictureLogo1.BackColor = System.Drawing.Color.Orange;
            this.pictureLogo1.Dock = System.Windows.Forms.DockStyle.Top;
            this.pictureLogo1.Location = new System.Drawing.Point(0, 0);
            this.pictureLogo1.Name = "pictureLogo1";
            this.pictureLogo1.Size = new System.Drawing.Size(905, 47);
            this.pictureLogo1.TabIndex = 4;
            // 
            // FormComprarOfertar
            // 
            this.AutoScaleDimensions = new System.Drawing.SizeF(6F, 14F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.ClientSize = new System.Drawing.Size(905, 594);
            this.Controls.Add(this.grdPublicaciones);
            this.Controls.Add(this.lstRubros);
            this.Controls.Add(this.grpFiltros);
            this.Controls.Add(this.grpBotonera);
            this.Controls.Add(this.pictureLogo1);
            this.Font = new System.Drawing.Font("Calibri", 9F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.Name = "FormComprarOfertar";
            this.StartPosition = System.Windows.Forms.FormStartPosition.CenterScreen;
            this.Text = "Comprar/Ofertar";
            this.grpFiltros.ResumeLayout(false);
            this.grpBotonera.ResumeLayout(false);
            this.grpBotonera.PerformLayout();
            this.ResumeLayout(false);

        }

        #endregion

        private ApplicationGdd1.GrillaPaginada grdPublicaciones;
        private ApplicationGdd1.ListaOpciones lstRubros;
        private System.Windows.Forms.GroupBox grpFiltros;
        private ApplicationGdd1.TextoAlfanumerico txtDescripcion;
        private System.Windows.Forms.GroupBox grpBotonera;
        private ApplicationGdd1.BotonBuscar btnBuscar;
        private ApplicationGdd1.BotonLimpiar btnLimpiar;
        private ApplicationGdd1.PictureLogo pictureLogo1;
    }
}