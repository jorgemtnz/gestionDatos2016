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
            this.grilla1 = new ApplicationGdd1.Grilla();
            this.grpFiltros = new System.Windows.Forms.GroupBox();
            this.txtAo = new ApplicationGdd1.TextoNumerico();
            this.cboVisibilidad = new ApplicationGdd1.combo();
            this.cboTrimestre = new ApplicationGdd1.combo();
            this.cboListado = new ApplicationGdd1.combo();
            this.grpBotonera = new System.Windows.Forms.GroupBox();
            this.btnBuscar = new ApplicationGdd1.BotonBuscar();
            this.btnLimpiar = new ApplicationGdd1.BotonLimpiar();
            this.cboRubro = new ApplicationGdd1.combo();
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
            this.pictureLogo1.Size = new System.Drawing.Size(649, 46);
            this.pictureLogo1.TabIndex = 0;
            // 
            // grilla1
            // 
            this.grilla1.BackColor = System.Drawing.SystemColors.ActiveCaptionText;
            this.grilla1.Dock = System.Windows.Forms.DockStyle.Fill;
            this.grilla1.Location = new System.Drawing.Point(0, 171);
            this.grilla1.Name = "grilla1";
            this.grilla1.Size = new System.Drawing.Size(649, 162);
            this.grilla1.TabIndex = 1;
            // 
            // grpFiltros
            // 
            this.grpFiltros.BackColor = System.Drawing.Color.White;
            this.grpFiltros.Controls.Add(this.cboRubro);
            this.grpFiltros.Controls.Add(this.txtAo);
            this.grpFiltros.Controls.Add(this.cboVisibilidad);
            this.grpFiltros.Controls.Add(this.cboTrimestre);
            this.grpFiltros.Controls.Add(this.cboListado);
            this.grpFiltros.Dock = System.Windows.Forms.DockStyle.Top;
            this.grpFiltros.Font = new System.Drawing.Font("Calibri", 9F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.grpFiltros.Location = new System.Drawing.Point(0, 46);
            this.grpFiltros.Name = "grpFiltros";
            this.grpFiltros.Size = new System.Drawing.Size(649, 125);
            this.grpFiltros.TabIndex = 2;
            this.grpFiltros.TabStop = false;
            this.grpFiltros.Text = "Filtros listado";
            // 
            // txtAo
            // 
            this.txtAo.BackColor = System.Drawing.Color.White;
            this.txtAo.ForeColor = System.Drawing.SystemColors.ButtonFace;
            this.txtAo.Location = new System.Drawing.Point(12, 21);
            this.txtAo.Name = "txtAo";
            this.txtAo.Size = new System.Drawing.Size(301, 25);
            this.txtAo.TabIndex = 3;
            // 
            // cboVisibilidad
            // 
            this.cboVisibilidad.BackColor = System.Drawing.Color.White;
            this.cboVisibilidad.ForeColor = System.Drawing.SystemColors.Desktop;
            this.cboVisibilidad.Location = new System.Drawing.Point(11, 73);
            this.cboVisibilidad.Name = "cboVisibilidad";
            this.cboVisibilidad.Size = new System.Drawing.Size(301, 27);
            this.cboVisibilidad.TabIndex = 2;
            // 
            // cboTrimestre
            // 
            this.cboTrimestre.BackColor = System.Drawing.Color.White;
            this.cboTrimestre.ForeColor = System.Drawing.SystemColors.Desktop;
            this.cboTrimestre.Location = new System.Drawing.Point(12, 46);
            this.cboTrimestre.Name = "cboTrimestre";
            this.cboTrimestre.Size = new System.Drawing.Size(301, 27);
            this.cboTrimestre.TabIndex = 1;
            // 
            // cboListado
            // 
            this.cboListado.BackColor = System.Drawing.Color.White;
            this.cboListado.ForeColor = System.Drawing.SystemColors.Desktop;
            this.cboListado.Location = new System.Drawing.Point(319, 46);
            this.cboListado.Name = "cboListado";
            this.cboListado.Size = new System.Drawing.Size(301, 27);
            this.cboListado.TabIndex = 0;
            // 
            // grpBotonera
            // 
            this.grpBotonera.BackColor = System.Drawing.Color.White;
            this.grpBotonera.Controls.Add(this.btnBuscar);
            this.grpBotonera.Controls.Add(this.btnLimpiar);
            this.grpBotonera.Dock = System.Windows.Forms.DockStyle.Bottom;
            this.grpBotonera.ForeColor = System.Drawing.SystemColors.ControlLightLight;
            this.grpBotonera.Location = new System.Drawing.Point(0, 333);
            this.grpBotonera.Name = "grpBotonera";
            this.grpBotonera.Size = new System.Drawing.Size(649, 54);
            this.grpBotonera.TabIndex = 38;
            this.grpBotonera.TabStop = false;
            // 
            // btnBuscar
            // 
            this.btnBuscar.Location = new System.Drawing.Point(489, 15);
            this.btnBuscar.Name = "btnBuscar";
            this.btnBuscar.Size = new System.Drawing.Size(130, 30);
            this.btnBuscar.TabIndex = 18;
            // 
            // btnLimpiar
            // 
            this.btnLimpiar.AutoSize = true;
            this.btnLimpiar.Location = new System.Drawing.Point(29, 15);
            this.btnLimpiar.Name = "btnLimpiar";
            this.btnLimpiar.Size = new System.Drawing.Size(133, 35);
            this.btnLimpiar.TabIndex = 17;
            // 
            // cboRubro
            // 
            this.cboRubro.BackColor = System.Drawing.Color.White;
            this.cboRubro.ForeColor = System.Drawing.SystemColors.Desktop;
            this.cboRubro.Location = new System.Drawing.Point(320, 73);
            this.cboRubro.Name = "cboRubro";
            this.cboRubro.Size = new System.Drawing.Size(301, 29);
            this.cboRubro.TabIndex = 4;
            // 
            // FormListadoEstadistico
            // 
            this.AutoScaleDimensions = new System.Drawing.SizeF(6F, 13F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.AutoValidate = System.Windows.Forms.AutoValidate.EnablePreventFocusChange;
            this.ClientSize = new System.Drawing.Size(649, 387);
            this.Controls.Add(this.grilla1);
            this.Controls.Add(this.grpBotonera);
            this.Controls.Add(this.grpFiltros);
            this.Controls.Add(this.pictureLogo1);
            this.Name = "FormListadoEstadistico";
            this.StartPosition = System.Windows.Forms.FormStartPosition.CenterScreen;
            this.Text = "Listados estadisticos";
            this.grpFiltros.ResumeLayout(false);
            this.grpBotonera.ResumeLayout(false);
            this.grpBotonera.PerformLayout();
            this.ResumeLayout(false);

        }

        #endregion

        private ApplicationGdd1.PictureLogo pictureLogo1;
        private ApplicationGdd1.Grilla grilla1;
        private System.Windows.Forms.GroupBox grpFiltros;
        private System.Windows.Forms.GroupBox grpBotonera;
        private ApplicationGdd1.BotonBuscar btnBuscar;
        private ApplicationGdd1.BotonLimpiar btnLimpiar;
        private ApplicationGdd1.TextoNumerico txtAo;
        private ApplicationGdd1.combo cboVisibilidad;
        private ApplicationGdd1.combo cboTrimestre;
        private ApplicationGdd1.combo cboListado;
        private ApplicationGdd1.combo cboRubro;
    }
}