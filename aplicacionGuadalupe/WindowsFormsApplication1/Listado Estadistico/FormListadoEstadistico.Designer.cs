namespace MercadoEnvioDesktop.Listado_Estadistico
{
    partial class FormListadoEstadistico
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
            this.pictureLogo1 = new ApplicationGdd1.PictureLogo();
            this.grdListado = new ApplicationGdd1.Grilla();
            this.grpFiltros = new System.Windows.Forms.GroupBox();
            this.cboListado = new ApplicationGdd1.combo();
            this.cboRubro = new ApplicationGdd1.combo();
            this.txtAo = new ApplicationGdd1.TextoNumerico();
            this.cboVisibilidad = new ApplicationGdd1.combo();
            this.cboTrimestre = new ApplicationGdd1.combo();
            this.grpBotonera = new System.Windows.Forms.GroupBox();
            this.btnBuscar = new ApplicationGdd1.BotonBuscar();
            this.btnLimpiar = new ApplicationGdd1.BotonLimpiar();
            this.grpFiltros.SuspendLayout();
            this.grpBotonera.SuspendLayout();
            this.SuspendLayout();
            // 
            // pictureLogo1
            // 
            this.pictureLogo1.BackColor = System.Drawing.Color.Orange;
            this.pictureLogo1.Dock = System.Windows.Forms.DockStyle.Top;
            this.pictureLogo1.Location = new System.Drawing.Point(0, 0);
            this.pictureLogo1.Name = "pictureLogo1";
            this.pictureLogo1.Size = new System.Drawing.Size(625, 26);
            this.pictureLogo1.TabIndex = 0;
            // 
            // grdListado
            // 
            this.grdListado.BackColor = System.Drawing.SystemColors.ActiveCaptionText;
            this.grdListado.Dock = System.Windows.Forms.DockStyle.Fill;
            this.grdListado.Location = new System.Drawing.Point(0, 284);
            this.grdListado.Name = "grdListado";
            this.grdListado.Size = new System.Drawing.Size(625, 291);
            this.grdListado.TabIndex = 1;
            // 
            // grpFiltros
            // 
            this.grpFiltros.BackColor = System.Drawing.Color.White;
            this.grpFiltros.Controls.Add(this.cboListado);
            this.grpFiltros.Controls.Add(this.cboRubro);
            this.grpFiltros.Controls.Add(this.txtAo);
            this.grpFiltros.Controls.Add(this.cboVisibilidad);
            this.grpFiltros.Controls.Add(this.cboTrimestre);
            this.grpFiltros.Dock = System.Windows.Forms.DockStyle.Top;
            this.grpFiltros.Font = new System.Drawing.Font("Calibri", 9F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.grpFiltros.Location = new System.Drawing.Point(0, 26);
            this.grpFiltros.Name = "grpFiltros";
            this.grpFiltros.Size = new System.Drawing.Size(625, 201);
            this.grpFiltros.TabIndex = 2;
            this.grpFiltros.TabStop = false;
            this.grpFiltros.Text = "Filtros listado";
            // 
            // cboListado
            // 
            this.cboListado.BackColor = System.Drawing.Color.White;
            this.cboListado.ForeColor = System.Drawing.SystemColors.Desktop;
            this.cboListado.Location = new System.Drawing.Point(12, 78);
            this.cboListado.Name = "cboListado";
            this.cboListado.Size = new System.Drawing.Size(548, 34);
            this.cboListado.TabIndex = 5;
            // 
            // cboRubro
            // 
            this.cboRubro.BackColor = System.Drawing.Color.White;
            this.cboRubro.ForeColor = System.Drawing.SystemColors.Desktop;
            this.cboRubro.Location = new System.Drawing.Point(12, 141);
            this.cboRubro.Name = "cboRubro";
            this.cboRubro.Size = new System.Drawing.Size(548, 31);
            this.cboRubro.TabIndex = 4;
            // 
            // txtAo
            // 
            this.txtAo.BackColor = System.Drawing.Color.White;
            this.txtAo.ForeColor = System.Drawing.SystemColors.ButtonFace;
            this.txtAo.Location = new System.Drawing.Point(12, 22);
            this.txtAo.Name = "txtAo";
            this.txtAo.Size = new System.Drawing.Size(301, 27);
            this.txtAo.TabIndex = 3;
            // 
            // cboVisibilidad
            // 
            this.cboVisibilidad.BackColor = System.Drawing.Color.White;
            this.cboVisibilidad.ForeColor = System.Drawing.SystemColors.Desktop;
            this.cboVisibilidad.Location = new System.Drawing.Point(12, 112);
            this.cboVisibilidad.Name = "cboVisibilidad";
            this.cboVisibilidad.Size = new System.Drawing.Size(515, 29);
            this.cboVisibilidad.TabIndex = 2;
            // 
            // cboTrimestre
            // 
            this.cboTrimestre.BackColor = System.Drawing.Color.White;
            this.cboTrimestre.ForeColor = System.Drawing.SystemColors.Desktop;
            this.cboTrimestre.Location = new System.Drawing.Point(12, 49);
            this.cboTrimestre.Name = "cboTrimestre";
            this.cboTrimestre.Size = new System.Drawing.Size(301, 29);
            this.cboTrimestre.TabIndex = 1;
            // 
            // grpBotonera
            // 
            this.grpBotonera.BackColor = System.Drawing.Color.GhostWhite;
            this.grpBotonera.Controls.Add(this.btnBuscar);
            this.grpBotonera.Controls.Add(this.btnLimpiar);
            this.grpBotonera.Dock = System.Windows.Forms.DockStyle.Top;
            this.grpBotonera.ForeColor = System.Drawing.SystemColors.ControlLightLight;
            this.grpBotonera.Location = new System.Drawing.Point(0, 227);
            this.grpBotonera.Name = "grpBotonera";
            this.grpBotonera.Size = new System.Drawing.Size(625, 57);
            this.grpBotonera.TabIndex = 38;
            this.grpBotonera.TabStop = false;
            // 
            // btnBuscar
            // 
            this.btnBuscar.Location = new System.Drawing.Point(516, 16);
            this.btnBuscar.Name = "btnBuscar";
            this.btnBuscar.Size = new System.Drawing.Size(84, 33);
            this.btnBuscar.TabIndex = 18;
            // 
            // btnLimpiar
            // 
            this.btnLimpiar.AutoSize = true;
            this.btnLimpiar.Location = new System.Drawing.Point(29, 16);
            this.btnLimpiar.Name = "btnLimpiar";
            this.btnLimpiar.Size = new System.Drawing.Size(133, 37);
            this.btnLimpiar.TabIndex = 17;
            // 
            // FormListadoEstadistico
            // 
            this.AutoScaleDimensions = new System.Drawing.SizeF(6F, 14F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.AutoValidate = System.Windows.Forms.AutoValidate.EnablePreventFocusChange;
            this.ClientSize = new System.Drawing.Size(625, 575);
            this.Controls.Add(this.grdListado);
            this.Controls.Add(this.grpBotonera);
            this.Controls.Add(this.grpFiltros);
            this.Controls.Add(this.pictureLogo1);
            this.Font = new System.Drawing.Font("Calibri", 9F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.Name = "FormListadoEstadistico";
            this.StartPosition = System.Windows.Forms.FormStartPosition.CenterScreen;
            this.Text = "Listados estadisticos";
            this.Load += new System.EventHandler(this.FormListadoEstadistico_Load);
            this.grpFiltros.ResumeLayout(false);
            this.grpBotonera.ResumeLayout(false);
            this.grpBotonera.PerformLayout();
            this.ResumeLayout(false);

        }

        #endregion

        private ApplicationGdd1.PictureLogo pictureLogo1;
        private ApplicationGdd1.Grilla grdListado;
        private System.Windows.Forms.GroupBox grpFiltros;
        private System.Windows.Forms.GroupBox grpBotonera;
        private ApplicationGdd1.BotonBuscar btnBuscar;
        private ApplicationGdd1.BotonLimpiar btnLimpiar;
        private ApplicationGdd1.TextoNumerico txtAo;
        private ApplicationGdd1.combo cboVisibilidad;
        private ApplicationGdd1.combo cboTrimestre;
        private ApplicationGdd1.combo cboRubro;
        private ApplicationGdd1.combo cboListado;
    }
}