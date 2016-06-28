namespace MercadoEnvioDesktop.Generar_Publicación
{
    partial class FormPublicar
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
            this.grpPublicacion = new System.Windows.Forms.GroupBox();
            this.txtPrecio = new MercadoEnvioDesktop.UserControls.TextoDecimal();
            this.lblFechaFin = new MercadoEnvioDesktop.UserControls.LabelNoEditable();
            this.cboTipoPublicacion = new ApplicationGdd1.combo();
            this.calFechaInicio = new ApplicationGdd1.Calendario();
            this.chkAdmiteEnvio = new ApplicationGdd1.Check();
            this.txtStock = new ApplicationGdd1.TextoNumerico();
            this.txtDescripcion = new ApplicationGdd1.TextoAlfanumerico();
            this.cboRubro = new ApplicationGdd1.combo();
            this.cboVisibilidad = new ApplicationGdd1.combo();
            this.cboEstado = new ApplicationGdd1.combo();
            this.grpBotonera = new System.Windows.Forms.GroupBox();
            this.botonGuardar1 = new ApplicationGdd1.BotonGuardar();
            this.btnLimpiar = new ApplicationGdd1.BotonLimpiar();
            this.grpEstados = new System.Windows.Forms.GroupBox();
            this.grpPublicacion.SuspendLayout();
            this.grpBotonera.SuspendLayout();
            this.grpEstados.SuspendLayout();
            this.SuspendLayout();
            // 
            // pictureLogo1
            // 
            this.pictureLogo1.BackColor = System.Drawing.Color.Orange;
            this.pictureLogo1.Dock = System.Windows.Forms.DockStyle.Top;
            this.pictureLogo1.Location = new System.Drawing.Point(0, 0);
            this.pictureLogo1.Name = "pictureLogo1";
            this.pictureLogo1.Size = new System.Drawing.Size(683, 26);
            this.pictureLogo1.TabIndex = 0;
            // 
            // grpPublicacion
            // 
            this.grpPublicacion.BackColor = System.Drawing.Color.White;
            this.grpPublicacion.Controls.Add(this.txtPrecio);
            this.grpPublicacion.Controls.Add(this.lblFechaFin);
            this.grpPublicacion.Controls.Add(this.cboTipoPublicacion);
            this.grpPublicacion.Controls.Add(this.calFechaInicio);
            this.grpPublicacion.Controls.Add(this.chkAdmiteEnvio);
            this.grpPublicacion.Controls.Add(this.txtStock);
            this.grpPublicacion.Controls.Add(this.txtDescripcion);
            this.grpPublicacion.Controls.Add(this.cboRubro);
            this.grpPublicacion.Controls.Add(this.cboVisibilidad);
            this.grpPublicacion.Dock = System.Windows.Forms.DockStyle.Fill;
            this.grpPublicacion.Location = new System.Drawing.Point(0, 26);
            this.grpPublicacion.Name = "grpPublicacion";
            this.grpPublicacion.Size = new System.Drawing.Size(683, 243);
            this.grpPublicacion.TabIndex = 1;
            this.grpPublicacion.TabStop = false;
            // 
            // txtPrecio
            // 
            this.txtPrecio.BackColor = System.Drawing.Color.White;
            this.txtPrecio.Location = new System.Drawing.Point(12, 129);
            this.txtPrecio.Name = "txtPrecio";
            this.txtPrecio.Size = new System.Drawing.Size(301, 25);
            this.txtPrecio.TabIndex = 13;
            // 
            // lblFechaFin
            // 
            this.lblFechaFin.BackColor = System.Drawing.Color.White;
            this.lblFechaFin.Font = new System.Drawing.Font("Calibri", 9F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.lblFechaFin.Location = new System.Drawing.Point(12, 204);
            this.lblFechaFin.Name = "lblFechaFin";
            this.lblFechaFin.Size = new System.Drawing.Size(617, 27);
            this.lblFechaFin.TabIndex = 12;
            // 
            // cboTipoPublicacion
            // 
            this.cboTipoPublicacion.BackColor = System.Drawing.Color.White;
            this.cboTipoPublicacion.ForeColor = System.Drawing.SystemColors.Desktop;
            this.cboTipoPublicacion.Location = new System.Drawing.Point(12, 21);
            this.cboTipoPublicacion.Name = "cboTipoPublicacion";
            this.cboTipoPublicacion.Size = new System.Drawing.Size(348, 29);
            this.cboTipoPublicacion.TabIndex = 11;
            // 
            // calFechaInicio
            // 
            this.calFechaInicio.BackColor = System.Drawing.Color.White;
            this.calFechaInicio.Location = new System.Drawing.Point(12, 179);
            this.calFechaInicio.Name = "calFechaInicio";
            this.calFechaInicio.Size = new System.Drawing.Size(334, 25);
            this.calFechaInicio.TabIndex = 10;
            // 
            // chkAdmiteEnvio
            // 
            this.chkAdmiteEnvio.BackColor = System.Drawing.Color.White;
            this.chkAdmiteEnvio.Font = new System.Drawing.Font("Calibri", 9.75F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.chkAdmiteEnvio.ForeColor = System.Drawing.SystemColors.ButtonHighlight;
            this.chkAdmiteEnvio.Location = new System.Drawing.Point(12, 154);
            this.chkAdmiteEnvio.Name = "chkAdmiteEnvio";
            this.chkAdmiteEnvio.Size = new System.Drawing.Size(348, 25);
            this.chkAdmiteEnvio.TabIndex = 7;
            // 
            // txtStock
            // 
            this.txtStock.BackColor = System.Drawing.Color.White;
            this.txtStock.ForeColor = System.Drawing.SystemColors.ButtonFace;
            this.txtStock.Location = new System.Drawing.Point(334, 129);
            this.txtStock.Name = "txtStock";
            this.txtStock.Size = new System.Drawing.Size(248, 25);
            this.txtStock.TabIndex = 6;
            // 
            // txtDescripcion
            // 
            this.txtDescripcion.BackColor = System.Drawing.SystemColors.ButtonHighlight;
            this.txtDescripcion.Location = new System.Drawing.Point(12, 104);
            this.txtDescripcion.Name = "txtDescripcion";
            this.txtDescripcion.Size = new System.Drawing.Size(608, 25);
            this.txtDescripcion.TabIndex = 4;
            // 
            // cboRubro
            // 
            this.cboRubro.BackColor = System.Drawing.Color.White;
            this.cboRubro.ForeColor = System.Drawing.SystemColors.Desktop;
            this.cboRubro.Location = new System.Drawing.Point(12, 77);
            this.cboRubro.Name = "cboRubro";
            this.cboRubro.Size = new System.Drawing.Size(608, 27);
            this.cboRubro.TabIndex = 3;
            // 
            // cboVisibilidad
            // 
            this.cboVisibilidad.BackColor = System.Drawing.Color.White;
            this.cboVisibilidad.ForeColor = System.Drawing.SystemColors.Desktop;
            this.cboVisibilidad.Location = new System.Drawing.Point(12, 50);
            this.cboVisibilidad.Name = "cboVisibilidad";
            this.cboVisibilidad.Size = new System.Drawing.Size(301, 27);
            this.cboVisibilidad.TabIndex = 2;
            // 
            // cboEstado
            // 
            this.cboEstado.BackColor = System.Drawing.Color.White;
            this.cboEstado.ForeColor = System.Drawing.SystemColors.Desktop;
            this.cboEstado.Location = new System.Drawing.Point(12, 14);
            this.cboEstado.Name = "cboEstado";
            this.cboEstado.Size = new System.Drawing.Size(301, 27);
            this.cboEstado.TabIndex = 1;
            // 
            // grpBotonera
            // 
            this.grpBotonera.BackColor = System.Drawing.Color.GhostWhite;
            this.grpBotonera.Controls.Add(this.botonGuardar1);
            this.grpBotonera.Controls.Add(this.btnLimpiar);
            this.grpBotonera.Dock = System.Windows.Forms.DockStyle.Bottom;
            this.grpBotonera.ForeColor = System.Drawing.SystemColors.ControlLightLight;
            this.grpBotonera.Location = new System.Drawing.Point(0, 321);
            this.grpBotonera.Name = "grpBotonera";
            this.grpBotonera.Size = new System.Drawing.Size(683, 47);
            this.grpBotonera.TabIndex = 39;
            this.grpBotonera.TabStop = false;
            // 
            // botonGuardar1
            // 
            this.botonGuardar1.Location = new System.Drawing.Point(524, 17);
            this.botonGuardar1.Name = "botonGuardar1";
            this.botonGuardar1.Size = new System.Drawing.Size(93, 30);
            this.botonGuardar1.TabIndex = 17;
            // 
            // btnLimpiar
            // 
            this.btnLimpiar.AutoSize = true;
            this.btnLimpiar.Location = new System.Drawing.Point(29, 15);
            this.btnLimpiar.Name = "btnLimpiar";
            this.btnLimpiar.Size = new System.Drawing.Size(98, 29);
            this.btnLimpiar.TabIndex = 18;
            // 
            // grpEstados
            // 
            this.grpEstados.BackColor = System.Drawing.Color.White;
            this.grpEstados.Controls.Add(this.cboEstado);
            this.grpEstados.Dock = System.Windows.Forms.DockStyle.Bottom;
            this.grpEstados.Location = new System.Drawing.Point(0, 269);
            this.grpEstados.Name = "grpEstados";
            this.grpEstados.Size = new System.Drawing.Size(683, 52);
            this.grpEstados.TabIndex = 14;
            this.grpEstados.TabStop = false;
            // 
            // FormPublicar
            // 
            this.AutoScaleDimensions = new System.Drawing.SizeF(6F, 14F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.ClientSize = new System.Drawing.Size(683, 368);
            this.Controls.Add(this.grpPublicacion);
            this.Controls.Add(this.grpEstados);
            this.Controls.Add(this.grpBotonera);
            this.Controls.Add(this.pictureLogo1);
            this.Font = new System.Drawing.Font("Calibri", 9F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.Name = "FormPublicar";
            this.StartPosition = System.Windows.Forms.FormStartPosition.CenterScreen;
            this.Text = "Publicar";
            this.Load += new System.EventHandler(this.FormPublicar_Load);
            this.grpPublicacion.ResumeLayout(false);
            this.grpBotonera.ResumeLayout(false);
            this.grpBotonera.PerformLayout();
            this.grpEstados.ResumeLayout(false);
            this.ResumeLayout(false);

        }

        #endregion

        private ApplicationGdd1.PictureLogo pictureLogo1;
        private System.Windows.Forms.GroupBox grpPublicacion;
        private ApplicationGdd1.Calendario calFechaInicio;
        private ApplicationGdd1.Check chkAdmiteEnvio;
        private ApplicationGdd1.TextoNumerico txtStock;
        private ApplicationGdd1.TextoAlfanumerico txtDescripcion;
        private ApplicationGdd1.combo cboRubro;
        private ApplicationGdd1.combo cboVisibilidad;
        private ApplicationGdd1.combo cboEstado;
        private System.Windows.Forms.GroupBox grpBotonera;
        private ApplicationGdd1.BotonGuardar botonGuardar1;
        private ApplicationGdd1.BotonLimpiar btnLimpiar;
        private ApplicationGdd1.combo cboTipoPublicacion;
        private UserControls.LabelNoEditable lblFechaFin;
        private UserControls.TextoDecimal txtPrecio;
        private System.Windows.Forms.GroupBox grpEstados;
    }
}