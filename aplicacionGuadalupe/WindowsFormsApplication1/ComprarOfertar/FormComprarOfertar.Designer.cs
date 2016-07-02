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
            this.grpFiltros = new System.Windows.Forms.GroupBox();
            this.grpBotonera = new System.Windows.Forms.GroupBox();
            this.grd = new ApplicationGdd1.Grilla();
            this.paginador1 = new MercadoEnvioDesktop.UserControls.Grilla.Paginador();
            this.btnBuscar = new ApplicationGdd1.BotonBuscar();
            this.btnLimpiar = new ApplicationGdd1.BotonLimpiar();
            this.lstRubros = new ApplicationGdd1.ListaOpciones();
            this.txtDescripcion = new ApplicationGdd1.TextoAlfanumerico();
            this.pictureLogo1 = new ApplicationGdd1.PictureLogo();
            this.grillaPaginada1 = new MercadoEnvioDesktop.UserControls.Grilla.Paginador();
            this.grpFiltros.SuspendLayout();
            this.grpBotonera.SuspendLayout();
            this.SuspendLayout();
            // 
            // grpFiltros
            // 
            this.grpFiltros.BackColor = System.Drawing.Color.White;
            this.grpFiltros.Controls.Add(this.txtDescripcion);
            this.grpFiltros.Dock = System.Windows.Forms.DockStyle.Top;
            this.grpFiltros.Font = new System.Drawing.Font("Calibri", 9F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.grpFiltros.Location = new System.Drawing.Point(0, 26);
            this.grpFiltros.Name = "grpFiltros";
            this.grpFiltros.Size = new System.Drawing.Size(1324, 49);
            this.grpFiltros.TabIndex = 7;
            this.grpFiltros.TabStop = false;
            this.grpFiltros.Text = "Busqueda";
            // 
            // grpBotonera
            // 
            this.grpBotonera.BackColor = System.Drawing.Color.GhostWhite;
            this.grpBotonera.Controls.Add(this.btnBuscar);
            this.grpBotonera.Controls.Add(this.btnLimpiar);
            this.grpBotonera.Dock = System.Windows.Forms.DockStyle.Top;
            this.grpBotonera.Location = new System.Drawing.Point(221, 75);
            this.grpBotonera.Name = "grpBotonera";
            this.grpBotonera.Size = new System.Drawing.Size(1103, 49);
            this.grpBotonera.TabIndex = 8;
            this.grpBotonera.TabStop = false;
            // 
            // grd
            // 
            this.grd.BackColor = System.Drawing.Color.White;
            this.grd.Dock = System.Windows.Forms.DockStyle.Fill;
            this.grd.Location = new System.Drawing.Point(221, 124);
            this.grd.Name = "grd";
            this.grd.Size = new System.Drawing.Size(1103, 410);
            this.grd.TabIndex = 10;
            // 
            // paginador1
            // 
            this.paginador1.BackColor = System.Drawing.Color.White;
            this.paginador1.Dock = System.Windows.Forms.DockStyle.Bottom;
            this.paginador1.Location = new System.Drawing.Point(221, 534);
            this.paginador1.Name = "paginador1";
            this.paginador1.Size = new System.Drawing.Size(1103, 60);
            this.paginador1.TabIndex = 11;
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
            this.btnLimpiar.Size = new System.Drawing.Size(133, 34);
            this.btnLimpiar.TabIndex = 0;
            // 
            // lstRubros
            // 
            this.lstRubros.Dock = System.Windows.Forms.DockStyle.Left;
            this.lstRubros.Location = new System.Drawing.Point(0, 75);
            this.lstRubros.Name = "lstRubros";
            this.lstRubros.Size = new System.Drawing.Size(221, 519);
            this.lstRubros.TabIndex = 6;
            // 
            // txtDescripcion
            // 
            this.txtDescripcion.BackColor = System.Drawing.SystemColors.ButtonHighlight;
            this.txtDescripcion.Location = new System.Drawing.Point(0, 18);
            this.txtDescripcion.Name = "txtDescripcion";
            this.txtDescripcion.Size = new System.Drawing.Size(801, 25);
            this.txtDescripcion.TabIndex = 1;
            // 
            // pictureLogo1
            // 
            this.pictureLogo1.BackColor = System.Drawing.Color.Orange;
            this.pictureLogo1.Dock = System.Windows.Forms.DockStyle.Top;
            this.pictureLogo1.Location = new System.Drawing.Point(0, 0);
            this.pictureLogo1.Name = "pictureLogo1";
            this.pictureLogo1.Size = new System.Drawing.Size(1324, 26);
            this.pictureLogo1.TabIndex = 4;
            // 
            // grillaPaginada1
            // 
            this.grillaPaginada1.BackColor = System.Drawing.Color.White;
            this.grillaPaginada1.Dock = System.Windows.Forms.DockStyle.Bottom;
            this.grillaPaginada1.Location = new System.Drawing.Point(221, 534);
            this.grillaPaginada1.Name = "grillaPaginada1";
            this.grillaPaginada1.Size = new System.Drawing.Size(944, 60);
            this.grillaPaginada1.TabIndex = 9;
            // 
            // FormComprarOfertar
            // 
            this.AutoScaleDimensions = new System.Drawing.SizeF(6F, 14F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.ClientSize = new System.Drawing.Size(1324, 594);
            this.Controls.Add(this.grd);
            this.Controls.Add(this.paginador1);
            this.Controls.Add(this.grpBotonera);
            this.Controls.Add(this.lstRubros);
            this.Controls.Add(this.grpFiltros);
            this.Controls.Add(this.pictureLogo1);
            this.Font = new System.Drawing.Font("Calibri", 9F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.Name = "FormComprarOfertar";
            this.StartPosition = System.Windows.Forms.FormStartPosition.CenterScreen;
            this.Text = "Comprar/Ofertar";
            this.Load += new System.EventHandler(this.FormComprarOfertar_Load);
            this.grpFiltros.ResumeLayout(false);
            this.grpBotonera.ResumeLayout(false);
            this.grpBotonera.PerformLayout();
            this.ResumeLayout(false);

        }

        #endregion

        private ApplicationGdd1.ListaOpciones lstRubros;
        private System.Windows.Forms.GroupBox grpFiltros;
        private ApplicationGdd1.TextoAlfanumerico txtDescripcion;
        private System.Windows.Forms.GroupBox grpBotonera;
        private ApplicationGdd1.BotonBuscar btnBuscar;
        private ApplicationGdd1.BotonLimpiar btnLimpiar;
        private ApplicationGdd1.PictureLogo pictureLogo1;
        private UserControls.Grilla.Paginador grillaPaginada1;
        private ApplicationGdd1.Grilla grd;
        private UserControls.Grilla.Paginador paginador1;
    }
}