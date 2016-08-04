namespace MercadoEnvioDesktop.Facturas
{
    partial class FormConsultaFacturas
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
            this.txtVendedor = new ApplicationGdd1.TextoNoEditable();
            this.txtDetalle = new ApplicationGdd1.TextoAlfanumerico();
            this.txtImporteMaximo = new ApplicationGdd1.TextoNumerico();
            this.txtImporteMinimo = new ApplicationGdd1.TextoNumerico();
            this.calHasta = new ApplicationGdd1.Calendario();
            this.calDesde = new ApplicationGdd1.Calendario();
            this.grpImportes = new ApplicationGdd1.Grupo();
            this.grpFechas = new ApplicationGdd1.Grupo();
            this.grpBotonera = new System.Windows.Forms.GroupBox();
            this.btnBuscar = new ApplicationGdd1.BotonBuscar();
            this.btnLimpiar = new ApplicationGdd1.BotonLimpiar();
            this.grd = new ApplicationGdd1.Grilla();
            this.Paginador = new MercadoEnvioDesktop.UserControls.Grilla.Paginador();
            this.pictureLogo1 = new ApplicationGdd1.PictureLogo();
            this.botonRefrescar1 = new MercadoEnvioDesktop.Botones.BotonRefrescar();
            this.grpFiltros.SuspendLayout();
            this.grpBotonera.SuspendLayout();
            this.SuspendLayout();
            // 
            // grpFiltros
            // 
            this.grpFiltros.BackColor = System.Drawing.Color.White;
            this.grpFiltros.Controls.Add(this.txtVendedor);
            this.grpFiltros.Controls.Add(this.txtDetalle);
            this.grpFiltros.Controls.Add(this.txtImporteMaximo);
            this.grpFiltros.Controls.Add(this.txtImporteMinimo);
            this.grpFiltros.Controls.Add(this.calHasta);
            this.grpFiltros.Controls.Add(this.calDesde);
            this.grpFiltros.Controls.Add(this.grpImportes);
            this.grpFiltros.Controls.Add(this.grpFechas);
            this.grpFiltros.Dock = System.Windows.Forms.DockStyle.Top;
            this.grpFiltros.Location = new System.Drawing.Point(0, 26);
            this.grpFiltros.Name = "grpFiltros";
            this.grpFiltros.Size = new System.Drawing.Size(880, 169);
            this.grpFiltros.TabIndex = 0;
            this.grpFiltros.TabStop = false;
            this.grpFiltros.Text = "Filtros";
            // 
            // txtVendedor
            // 
            this.txtVendedor.BackColor = System.Drawing.Color.White;
            this.txtVendedor.Location = new System.Drawing.Point(29, 136);
            this.txtVendedor.Name = "txtVendedor";
            this.txtVendedor.Size = new System.Drawing.Size(402, 25);
            this.txtVendedor.TabIndex = 7;
            // 
            // txtDetalle
            // 
            this.txtDetalle.BackColor = System.Drawing.SystemColors.ButtonHighlight;
            this.txtDetalle.Location = new System.Drawing.Point(29, 111);
            this.txtDetalle.Name = "txtDetalle";
            this.txtDetalle.Size = new System.Drawing.Size(826, 25);
            this.txtDetalle.TabIndex = 6;
            // 
            // txtImporteMaximo
            // 
            this.txtImporteMaximo.BackColor = System.Drawing.Color.White;
            this.txtImporteMaximo.ForeColor = System.Drawing.SystemColors.ButtonFace;
            this.txtImporteMaximo.Location = new System.Drawing.Point(433, 80);
            this.txtImporteMaximo.Name = "txtImporteMaximo";
            this.txtImporteMaximo.Size = new System.Drawing.Size(301, 25);
            this.txtImporteMaximo.TabIndex = 5;
            // 
            // txtImporteMinimo
            // 
            this.txtImporteMinimo.BackColor = System.Drawing.Color.White;
            this.txtImporteMinimo.ForeColor = System.Drawing.SystemColors.ButtonFace;
            this.txtImporteMinimo.Location = new System.Drawing.Point(29, 80);
            this.txtImporteMinimo.Name = "txtImporteMinimo";
            this.txtImporteMinimo.Size = new System.Drawing.Size(301, 25);
            this.txtImporteMinimo.TabIndex = 4;
            // 
            // calHasta
            // 
            this.calHasta.BackColor = System.Drawing.Color.White;
            this.calHasta.Location = new System.Drawing.Point(433, 31);
            this.calHasta.Name = "calHasta";
            this.calHasta.Size = new System.Drawing.Size(398, 25);
            this.calHasta.TabIndex = 3;
            // 
            // calDesde
            // 
            this.calDesde.BackColor = System.Drawing.Color.White;
            this.calDesde.Location = new System.Drawing.Point(29, 31);
            this.calDesde.Name = "calDesde";
            this.calDesde.Size = new System.Drawing.Size(398, 25);
            this.calDesde.TabIndex = 2;
            // 
            // grpImportes
            // 
            this.grpImportes.Location = new System.Drawing.Point(12, 63);
            this.grpImportes.Name = "grpImportes";
            this.grpImportes.Size = new System.Drawing.Size(843, 48);
            this.grpImportes.TabIndex = 1;
            // 
            // grpFechas
            // 
            this.grpFechas.Location = new System.Drawing.Point(12, 15);
            this.grpFechas.Name = "grpFechas";
            this.grpFechas.Size = new System.Drawing.Size(843, 48);
            this.grpFechas.TabIndex = 0;
            // 
            // grpBotonera
            // 
            this.grpBotonera.BackColor = System.Drawing.Color.GhostWhite;
            this.grpBotonera.Controls.Add(this.botonRefrescar1);
            this.grpBotonera.Controls.Add(this.btnBuscar);
            this.grpBotonera.Controls.Add(this.btnLimpiar);
            this.grpBotonera.Dock = System.Windows.Forms.DockStyle.Top;
            this.grpBotonera.ForeColor = System.Drawing.SystemColors.ControlLightLight;
            this.grpBotonera.Location = new System.Drawing.Point(0, 195);
            this.grpBotonera.Name = "grpBotonera";
            this.grpBotonera.Size = new System.Drawing.Size(880, 42);
            this.grpBotonera.TabIndex = 39;
            this.grpBotonera.TabStop = false;
            // 
            // btnBuscar
            // 
            this.btnBuscar.Location = new System.Drawing.Point(433, 11);
            this.btnBuscar.Name = "btnBuscar";
            this.btnBuscar.Size = new System.Drawing.Size(130, 30);
            this.btnBuscar.TabIndex = 18;
            // 
            // btnLimpiar
            // 
            this.btnLimpiar.AutoSize = true;
            this.btnLimpiar.Location = new System.Drawing.Point(29, 11);
            this.btnLimpiar.Name = "btnLimpiar";
            this.btnLimpiar.Size = new System.Drawing.Size(94, 30);
            this.btnLimpiar.TabIndex = 17;
            // 
            // grd
            // 
            this.grd.BackColor = System.Drawing.Color.White;
            this.grd.Dock = System.Windows.Forms.DockStyle.Fill;
            this.grd.Location = new System.Drawing.Point(0, 237);
            this.grd.Name = "grd";
            this.grd.Size = new System.Drawing.Size(880, 298);
            this.grd.TabIndex = 2;
            // 
            // Paginador
            // 
            this.Paginador.BackColor = System.Drawing.Color.GhostWhite;
            this.Paginador.Dock = System.Windows.Forms.DockStyle.Bottom;
            this.Paginador.Location = new System.Drawing.Point(0, 535);
            this.Paginador.Name = "Paginador";
            this.Paginador.Size = new System.Drawing.Size(880, 27);
            this.Paginador.TabIndex = 1;
            // 
            // pictureLogo1
            // 
            this.pictureLogo1.BackColor = System.Drawing.Color.Orange;
            this.pictureLogo1.Dock = System.Windows.Forms.DockStyle.Top;
            this.pictureLogo1.Location = new System.Drawing.Point(0, 0);
            this.pictureLogo1.Name = "pictureLogo1";
            this.pictureLogo1.Size = new System.Drawing.Size(880, 26);
            this.pictureLogo1.TabIndex = 1;
            // 
            // botonRefrescar1
            // 
            this.botonRefrescar1.Location = new System.Drawing.Point(775, 12);
            this.botonRefrescar1.Name = "botonRefrescar1";
            this.botonRefrescar1.Size = new System.Drawing.Size(80, 24);
            this.botonRefrescar1.TabIndex = 19;
            // 
            // FormConsultaFacturas
            // 
            this.AutoScaleDimensions = new System.Drawing.SizeF(6F, 14F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.ClientSize = new System.Drawing.Size(880, 562);
            this.Controls.Add(this.grd);
            this.Controls.Add(this.Paginador);
            this.Controls.Add(this.grpBotonera);
            this.Controls.Add(this.grpFiltros);
            this.Controls.Add(this.pictureLogo1);
            this.Font = new System.Drawing.Font("Calibri", 9F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.Name = "FormConsultaFacturas";
            this.StartPosition = System.Windows.Forms.FormStartPosition.CenterScreen;
            this.Text = "Consulta facturas";
            this.Load += new System.EventHandler(this.FormConsultaFacturas_Load);
            this.grpFiltros.ResumeLayout(false);
            this.grpBotonera.ResumeLayout(false);
            this.grpBotonera.PerformLayout();
            this.ResumeLayout(false);

        }

        #endregion

        private System.Windows.Forms.GroupBox grpFiltros;
        private ApplicationGdd1.PictureLogo pictureLogo1;
        private System.Windows.Forms.GroupBox grpBotonera;
        private ApplicationGdd1.BotonBuscar btnBuscar;
        private ApplicationGdd1.BotonLimpiar btnLimpiar;
        private ApplicationGdd1.Grupo grpImportes;
        private ApplicationGdd1.Grupo grpFechas;
        private ApplicationGdd1.TextoNoEditable txtVendedor;
        private ApplicationGdd1.TextoAlfanumerico txtDetalle;
        private ApplicationGdd1.TextoNumerico txtImporteMaximo;
        private ApplicationGdd1.TextoNumerico txtImporteMinimo;
        private ApplicationGdd1.Calendario calHasta;
        private ApplicationGdd1.Calendario calDesde;
        private UserControls.Grilla.Paginador Paginador;
        private ApplicationGdd1.Grilla grd;
        private Botones.BotonRefrescar botonRefrescar1;
    }
}