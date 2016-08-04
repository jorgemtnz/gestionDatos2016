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
            this.grpFiltros = new System.Windows.Forms.GroupBox();
            this.groupBox1 = new System.Windows.Forms.GroupBox();
            this.tabGillas = new System.Windows.Forms.TabControl();
            this.tabCompras = new System.Windows.Forms.TabPage();
            this.tabOfertas = new System.Windows.Forms.TabPage();
            this.PaginadorCompras = new MercadoEnvioDesktop.UserControls.Grilla.Paginador();
            this.grdCompras = new ApplicationGdd1.Grilla();
            this.paginadorOfertas = new MercadoEnvioDesktop.UserControls.Grilla.Paginador();
            this.grdOfertas = new ApplicationGdd1.Grilla();
            this.lblFaltanCalificar = new MercadoEnvioDesktop.UserControls.LabelNoEditable();
            this.lblPromedioEstrellas = new MercadoEnvioDesktop.UserControls.LabelNoEditable();
            this.btnBuscar = new ApplicationGdd1.BotonBuscar();
            this.btnLimpiar = new ApplicationGdd1.BotonLimpiar();
            this.calHasta = new ApplicationGdd1.Calendario();
            this.pictureLogo1 = new ApplicationGdd1.PictureLogo();
            this.grpBotonera.SuspendLayout();
            this.grpFiltros.SuspendLayout();
            this.groupBox1.SuspendLayout();
            this.tabGillas.SuspendLayout();
            this.tabCompras.SuspendLayout();
            this.tabOfertas.SuspendLayout();
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
            this.grpBotonera.Size = new System.Drawing.Size(1168, 48);
            this.grpBotonera.TabIndex = 40;
            this.grpBotonera.TabStop = false;
            // 
            // grpFiltros
            // 
            this.grpFiltros.BackColor = System.Drawing.Color.White;
            this.grpFiltros.Controls.Add(this.calHasta);
            this.grpFiltros.Dock = System.Windows.Forms.DockStyle.Top;
            this.grpFiltros.Location = new System.Drawing.Point(0, 26);
            this.grpFiltros.Name = "grpFiltros";
            this.grpFiltros.Size = new System.Drawing.Size(1168, 63);
            this.grpFiltros.TabIndex = 41;
            this.grpFiltros.TabStop = false;
            this.grpFiltros.Text = "Filtros";
            // 
            // groupBox1
            // 
            this.groupBox1.BackColor = System.Drawing.Color.White;
            this.groupBox1.Controls.Add(this.lblFaltanCalificar);
            this.groupBox1.Controls.Add(this.lblPromedioEstrellas);
            this.groupBox1.Dock = System.Windows.Forms.DockStyle.Bottom;
            this.groupBox1.Location = new System.Drawing.Point(0, 585);
            this.groupBox1.Name = "groupBox1";
            this.groupBox1.Size = new System.Drawing.Size(1168, 49);
            this.groupBox1.TabIndex = 45;
            this.groupBox1.TabStop = false;
            // 
            // tabGillas
            // 
            this.tabGillas.Controls.Add(this.tabCompras);
            this.tabGillas.Controls.Add(this.tabOfertas);
            this.tabGillas.Dock = System.Windows.Forms.DockStyle.Fill;
            this.tabGillas.Location = new System.Drawing.Point(0, 137);
            this.tabGillas.Name = "tabGillas";
            this.tabGillas.SelectedIndex = 0;
            this.tabGillas.Size = new System.Drawing.Size(1168, 448);
            this.tabGillas.TabIndex = 48;
            // 
            // tabCompras
            // 
            this.tabCompras.Controls.Add(this.PaginadorCompras);
            this.tabCompras.Controls.Add(this.grdCompras);
            this.tabCompras.Location = new System.Drawing.Point(4, 23);
            this.tabCompras.Name = "tabCompras";
            this.tabCompras.Padding = new System.Windows.Forms.Padding(3);
            this.tabCompras.Size = new System.Drawing.Size(1160, 421);
            this.tabCompras.TabIndex = 0;
            this.tabCompras.Text = "Historial de compras realizadas";
            this.tabCompras.UseVisualStyleBackColor = true;
            // 
            // tabOfertas
            // 
            this.tabOfertas.Controls.Add(this.paginadorOfertas);
            this.tabOfertas.Controls.Add(this.grdOfertas);
            this.tabOfertas.Location = new System.Drawing.Point(4, 23);
            this.tabOfertas.Name = "tabOfertas";
            this.tabOfertas.Padding = new System.Windows.Forms.Padding(3);
            this.tabOfertas.Size = new System.Drawing.Size(1160, 421);
            this.tabOfertas.TabIndex = 1;
            this.tabOfertas.Text = "Historial de ofertas ralizadas";
            this.tabOfertas.UseVisualStyleBackColor = true;
            // 
            // PaginadorCompras
            // 
            this.PaginadorCompras.BackColor = System.Drawing.Color.White;
            this.PaginadorCompras.Dock = System.Windows.Forms.DockStyle.Bottom;
            this.PaginadorCompras.Location = new System.Drawing.Point(3, 391);
            this.PaginadorCompras.Name = "PaginadorCompras";
            this.PaginadorCompras.Size = new System.Drawing.Size(1154, 27);
            this.PaginadorCompras.TabIndex = 46;
            // 
            // grdCompras
            // 
            this.grdCompras.BackColor = System.Drawing.Color.White;
            this.grdCompras.Dock = System.Windows.Forms.DockStyle.Fill;
            this.grdCompras.Location = new System.Drawing.Point(3, 3);
            this.grdCompras.Name = "grdCompras";
            this.grdCompras.Size = new System.Drawing.Size(1154, 415);
            this.grdCompras.TabIndex = 47;
            // 
            // paginadorOfertas
            // 
            this.paginadorOfertas.BackColor = System.Drawing.Color.White;
            this.paginadorOfertas.Dock = System.Windows.Forms.DockStyle.Bottom;
            this.paginadorOfertas.Location = new System.Drawing.Point(3, 390);
            this.paginadorOfertas.Name = "paginadorOfertas";
            this.paginadorOfertas.Size = new System.Drawing.Size(1154, 29);
            this.paginadorOfertas.TabIndex = 48;
            // 
            // grdOfertas
            // 
            this.grdOfertas.BackColor = System.Drawing.Color.White;
            this.grdOfertas.Dock = System.Windows.Forms.DockStyle.Fill;
            this.grdOfertas.Location = new System.Drawing.Point(3, 3);
            this.grdOfertas.Name = "grdOfertas";
            this.grdOfertas.Size = new System.Drawing.Size(1154, 416);
            this.grdOfertas.TabIndex = 49;
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
            // calHasta
            // 
            this.calHasta.BackColor = System.Drawing.Color.White;
            this.calHasta.Location = new System.Drawing.Point(31, 23);
            this.calHasta.Name = "calHasta";
            this.calHasta.Size = new System.Drawing.Size(398, 25);
            this.calHasta.TabIndex = 3;
            // 
            // pictureLogo1
            // 
            this.pictureLogo1.BackColor = System.Drawing.Color.Orange;
            this.pictureLogo1.Dock = System.Windows.Forms.DockStyle.Top;
            this.pictureLogo1.Location = new System.Drawing.Point(0, 0);
            this.pictureLogo1.Name = "pictureLogo1";
            this.pictureLogo1.Size = new System.Drawing.Size(1168, 26);
            this.pictureLogo1.TabIndex = 0;
            // 
            // FormHistorial
            // 
            this.AutoScaleDimensions = new System.Drawing.SizeF(6F, 14F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.ClientSize = new System.Drawing.Size(1168, 634);
            this.Controls.Add(this.tabGillas);
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
            this.tabGillas.ResumeLayout(false);
            this.tabCompras.ResumeLayout(false);
            this.tabOfertas.ResumeLayout(false);
            this.ResumeLayout(false);

        }

        #endregion

        private ApplicationGdd1.PictureLogo pictureLogo1;
        private System.Windows.Forms.GroupBox grpBotonera;
        private ApplicationGdd1.BotonBuscar btnBuscar;
        private ApplicationGdd1.BotonLimpiar btnLimpiar;
        private System.Windows.Forms.GroupBox grpFiltros;
        private ApplicationGdd1.Calendario calHasta;
        private UserControls.LabelNoEditable lblFaltanCalificar;
        private UserControls.LabelNoEditable lblPromedioEstrellas;
        private System.Windows.Forms.GroupBox groupBox1;
        private ApplicationGdd1.Grilla grdCompras;
        private UserControls.Grilla.Paginador PaginadorCompras;
        private System.Windows.Forms.TabControl tabGillas;
        private System.Windows.Forms.TabPage tabCompras;
        private System.Windows.Forms.TabPage tabOfertas;
        private ApplicationGdd1.Grilla grdOfertas;
        private UserControls.Grilla.Paginador paginadorOfertas;
    }
}