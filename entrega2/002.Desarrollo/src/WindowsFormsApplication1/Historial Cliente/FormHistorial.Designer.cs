namespace MercadoEnvioDesktop.Historial_Cliente
{
    partial class FormHistorial
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
            this.btnBuscar = new ApplicationGdd1.BotonBuscar();
            this.btnLimpiar = new ApplicationGdd1.BotonLimpiar();
            this.grpFiltros = new System.Windows.Forms.GroupBox();
            this.cboOperacion = new ApplicationGdd1.combo();
            this.calHasta = new ApplicationGdd1.Calendario();
            this.groupBox1 = new System.Windows.Forms.GroupBox();
            this.lblFaltanCalificar = new MercadoEnvioDesktop.UserControls.LabelNoEditable();
            this.lblPromedioEstrellas = new MercadoEnvioDesktop.UserControls.LabelNoEditable();
            this.pictureLogo1 = new ApplicationGdd1.PictureLogo();
            this.grd = new ApplicationGdd1.Grilla();
            this.Paginador1 = new MercadoEnvioDesktop.UserControls.Grilla.Paginador();
            this.grpBotonera.SuspendLayout();
            this.grpFiltros.SuspendLayout();
            this.groupBox1.SuspendLayout();
            this.SuspendLayout();
            // 
            // grpBotonera
            // 
            this.grpBotonera.BackColor = System.Drawing.Color.GhostWhite;
            this.grpBotonera.Controls.Add(this.btnBuscar);
            this.grpBotonera.Controls.Add(this.btnLimpiar);
            this.grpBotonera.Dock = System.Windows.Forms.DockStyle.Top;
            this.grpBotonera.ForeColor = System.Drawing.SystemColors.ControlLightLight;
            this.grpBotonera.Location = new System.Drawing.Point(0, 89);
            this.grpBotonera.Name = "grpBotonera";
            this.grpBotonera.Size = new System.Drawing.Size(937, 48);
            this.grpBotonera.TabIndex = 40;
            this.grpBotonera.TabStop = false;
            // 
            // btnBuscar
            // 
            this.btnBuscar.Location = new System.Drawing.Point(615, 15);
            this.btnBuscar.Name = "btnBuscar";
            this.btnBuscar.Size = new System.Drawing.Size(91, 30);
            this.btnBuscar.TabIndex = 18;
            // 
            // btnLimpiar
            // 
            this.btnLimpiar.AutoSize = true;
            this.btnLimpiar.Location = new System.Drawing.Point(41, 15);
            this.btnLimpiar.Name = "btnLimpiar";
            this.btnLimpiar.Size = new System.Drawing.Size(133, 35);
            this.btnLimpiar.TabIndex = 17;
            // 
            // grpFiltros
            // 
            this.grpFiltros.BackColor = System.Drawing.Color.White;
            this.grpFiltros.Controls.Add(this.cboOperacion);
            this.grpFiltros.Controls.Add(this.calHasta);
            this.grpFiltros.Dock = System.Windows.Forms.DockStyle.Top;
            this.grpFiltros.Location = new System.Drawing.Point(0, 26);
            this.grpFiltros.Name = "grpFiltros";
            this.grpFiltros.Size = new System.Drawing.Size(937, 63);
            this.grpFiltros.TabIndex = 41;
            this.grpFiltros.TabStop = false;
            this.grpFiltros.Text = "Filtros";
            // 
            // cboOperacion
            // 
            this.cboOperacion.BackColor = System.Drawing.Color.White;
            this.cboOperacion.ForeColor = System.Drawing.SystemColors.Desktop;
            this.cboOperacion.Location = new System.Drawing.Point(29, 21);
            this.cboOperacion.Name = "cboOperacion";
            this.cboOperacion.Size = new System.Drawing.Size(375, 27);
            this.cboOperacion.TabIndex = 7;
            // 
            // calHasta
            // 
            this.calHasta.BackColor = System.Drawing.Color.White;
            this.calHasta.Location = new System.Drawing.Point(452, 23);
            this.calHasta.Name = "calHasta";
            this.calHasta.Size = new System.Drawing.Size(398, 25);
            this.calHasta.TabIndex = 3;
            // 
            // groupBox1
            // 
            this.groupBox1.BackColor = System.Drawing.Color.White;
            this.groupBox1.Controls.Add(this.lblFaltanCalificar);
            this.groupBox1.Controls.Add(this.lblPromedioEstrellas);
            this.groupBox1.Dock = System.Windows.Forms.DockStyle.Bottom;
            this.groupBox1.Location = new System.Drawing.Point(0, 518);
            this.groupBox1.Name = "groupBox1";
            this.groupBox1.Size = new System.Drawing.Size(937, 49);
            this.groupBox1.TabIndex = 45;
            this.groupBox1.TabStop = false;
            // 
            // lblFaltanCalificar
            // 
            this.lblFaltanCalificar.BackColor = System.Drawing.Color.White;
            this.lblFaltanCalificar.Font = new System.Drawing.Font("Calibri", 9F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.lblFaltanCalificar.Location = new System.Drawing.Point(0, 16);
            this.lblFaltanCalificar.Name = "lblFaltanCalificar";
            this.lblFaltanCalificar.Size = new System.Drawing.Size(260, 27);
            this.lblFaltanCalificar.TabIndex = 43;
            // 
            // lblPromedioEstrellas
            // 
            this.lblPromedioEstrellas.BackColor = System.Drawing.Color.White;
            this.lblPromedioEstrellas.Font = new System.Drawing.Font("Calibri", 9F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.lblPromedioEstrellas.Location = new System.Drawing.Point(433, 16);
            this.lblPromedioEstrellas.Name = "lblPromedioEstrellas";
            this.lblPromedioEstrellas.Size = new System.Drawing.Size(260, 27);
            this.lblPromedioEstrellas.TabIndex = 44;
            // 
            // pictureLogo1
            // 
            this.pictureLogo1.BackColor = System.Drawing.Color.Orange;
            this.pictureLogo1.Dock = System.Windows.Forms.DockStyle.Top;
            this.pictureLogo1.Location = new System.Drawing.Point(0, 0);
            this.pictureLogo1.Name = "pictureLogo1";
            this.pictureLogo1.Size = new System.Drawing.Size(937, 26);
            this.pictureLogo1.TabIndex = 0;
            // 
            // grd
            // 
            this.grd.BackColor = System.Drawing.Color.White;
            this.grd.Dock = System.Windows.Forms.DockStyle.Fill;
            this.grd.Location = new System.Drawing.Point(0, 137);
            this.grd.Name = "grd";
            this.grd.Size = new System.Drawing.Size(937, 354);
            this.grd.TabIndex = 47;
            // 
            // Paginador1
            // 
            this.Paginador1.BackColor = System.Drawing.Color.White;
            this.Paginador1.Dock = System.Windows.Forms.DockStyle.Bottom;
            this.Paginador1.Location = new System.Drawing.Point(0, 491);
            this.Paginador1.Name = "Paginador1";
            this.Paginador1.Size = new System.Drawing.Size(937, 27);
            this.Paginador1.TabIndex = 46;
            // 
            // FormHistorial
            // 
            this.AutoScaleDimensions = new System.Drawing.SizeF(6F, 14F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.ClientSize = new System.Drawing.Size(937, 567);
            this.Controls.Add(this.grd);
            this.Controls.Add(this.Paginador1);
            this.Controls.Add(this.groupBox1);
            this.Controls.Add(this.grpBotonera);
            this.Controls.Add(this.grpFiltros);
            this.Controls.Add(this.pictureLogo1);
            this.Font = new System.Drawing.Font("Calibri", 9F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.Name = "FormHistorial";
            this.StartPosition = System.Windows.Forms.FormStartPosition.CenterScreen;
            this.Text = "Historial cliente";
            this.Load += new System.EventHandler(this.FormHistorial_Load);
            this.grpBotonera.ResumeLayout(false);
            this.grpBotonera.PerformLayout();
            this.grpFiltros.ResumeLayout(false);
            this.groupBox1.ResumeLayout(false);
            this.ResumeLayout(false);

        }

        #endregion

        private ApplicationGdd1.PictureLogo pictureLogo1;
        private System.Windows.Forms.GroupBox grpBotonera;
        private ApplicationGdd1.BotonBuscar btnBuscar;
        private ApplicationGdd1.BotonLimpiar btnLimpiar;
        private System.Windows.Forms.GroupBox grpFiltros;
        private ApplicationGdd1.combo cboOperacion;
        private ApplicationGdd1.Calendario calHasta;
        private UserControls.LabelNoEditable lblFaltanCalificar;
        private UserControls.LabelNoEditable lblPromedioEstrellas;
        private System.Windows.Forms.GroupBox groupBox1;
        private ApplicationGdd1.Grilla grd;
        private UserControls.Grilla.Paginador Paginador1;
    }
}