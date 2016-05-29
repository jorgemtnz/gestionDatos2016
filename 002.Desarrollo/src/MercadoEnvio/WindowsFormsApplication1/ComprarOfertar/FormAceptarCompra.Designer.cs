namespace MercadoEnvioDesktop.ComprarOfertar
{
    partial class FormAceptarCompra
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
            this.lblDescripcionPublicacion = new MercadoEnvioDesktop.UserControls.LabelNoEditable();
            this.lblCodPublicacion = new MercadoEnvioDesktop.UserControls.LabelNoEditable();
            this.lblVendedor = new MercadoEnvioDesktop.UserControls.LabelNoEditable();
            this.txtCantidad = new ApplicationGdd1.TextoNumerico();
            this.cboMedioDePago = new ApplicationGdd1.combo();
            this.checkEnvio = new ApplicationGdd1.Check();
            this.grpComprar = new System.Windows.Forms.GroupBox();
            this.grpBotonera = new System.Windows.Forms.GroupBox();
            this.botonLimpiar1 = new ApplicationGdd1.BotonLimpiar();
            this.btnComprar = new ApplicationGdd1.BotonComprar();
            this.grpCompletar = new ApplicationGdd1.Grupo();
            this.grpComprar.SuspendLayout();
            this.grpBotonera.SuspendLayout();
            this.SuspendLayout();
            // 
            // pictureLogo1
            // 
            this.pictureLogo1.BackColor = System.Drawing.Color.Orange;
            this.pictureLogo1.Dock = System.Windows.Forms.DockStyle.Top;
            this.pictureLogo1.Location = new System.Drawing.Point(0, 0);
            this.pictureLogo1.Name = "pictureLogo1";
            this.pictureLogo1.Size = new System.Drawing.Size(1005, 46);
            this.pictureLogo1.TabIndex = 0;
            // 
            // lblDescripcionPublicacion
            // 
            this.lblDescripcionPublicacion.BackColor = System.Drawing.Color.White;
            this.lblDescripcionPublicacion.Font = new System.Drawing.Font("Calibri", 9F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.lblDescripcionPublicacion.Location = new System.Drawing.Point(29, 21);
            this.lblDescripcionPublicacion.Name = "lblDescripcionPublicacion";
            this.lblDescripcionPublicacion.Size = new System.Drawing.Size(826, 27);
            this.lblDescripcionPublicacion.TabIndex = 1;
            // 
            // lblCodPublicacion
            // 
            this.lblCodPublicacion.BackColor = System.Drawing.Color.White;
            this.lblCodPublicacion.Font = new System.Drawing.Font("Calibri", 9F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.lblCodPublicacion.Location = new System.Drawing.Point(29, 48);
            this.lblCodPublicacion.Name = "lblCodPublicacion";
            this.lblCodPublicacion.Size = new System.Drawing.Size(826, 27);
            this.lblCodPublicacion.TabIndex = 2;
            // 
            // lblVendedor
            // 
            this.lblVendedor.BackColor = System.Drawing.Color.White;
            this.lblVendedor.Font = new System.Drawing.Font("Calibri", 9F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.lblVendedor.Location = new System.Drawing.Point(29, 75);
            this.lblVendedor.Name = "lblVendedor";
            this.lblVendedor.Size = new System.Drawing.Size(826, 27);
            this.lblVendedor.TabIndex = 3;
            // 
            // txtCantidad
            // 
            this.txtCantidad.BackColor = System.Drawing.Color.White;
            this.txtCantidad.ForeColor = System.Drawing.SystemColors.ButtonFace;
            this.txtCantidad.Location = new System.Drawing.Point(43, 137);
            this.txtCantidad.Name = "txtCantidad";
            this.txtCantidad.Size = new System.Drawing.Size(231, 25);
            this.txtCantidad.TabIndex = 4;
            // 
            // cboMedioDePago
            // 
            this.cboMedioDePago.BackColor = System.Drawing.Color.White;
            this.cboMedioDePago.ForeColor = System.Drawing.SystemColors.Desktop;
            this.cboMedioDePago.Location = new System.Drawing.Point(43, 162);
            this.cboMedioDePago.Name = "cboMedioDePago";
            this.cboMedioDePago.Size = new System.Drawing.Size(385, 27);
            this.cboMedioDePago.TabIndex = 5;
            // 
            // checkEnvio
            // 
            this.checkEnvio.BackColor = System.Drawing.Color.White;
            this.checkEnvio.Font = new System.Drawing.Font("Calibri", 9.75F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.checkEnvio.ForeColor = System.Drawing.SystemColors.ButtonHighlight;
            this.checkEnvio.Location = new System.Drawing.Point(43, 189);
            this.checkEnvio.Name = "checkEnvio";
            this.checkEnvio.Size = new System.Drawing.Size(94, 25);
            this.checkEnvio.TabIndex = 6;
            // 
            // grpComprar
            // 
            this.grpComprar.BackColor = System.Drawing.Color.White;
            this.grpComprar.Controls.Add(this.checkEnvio);
            this.grpComprar.Controls.Add(this.cboMedioDePago);
            this.grpComprar.Controls.Add(this.lblDescripcionPublicacion);
            this.grpComprar.Controls.Add(this.lblCodPublicacion);
            this.grpComprar.Controls.Add(this.lblVendedor);
            this.grpComprar.Controls.Add(this.txtCantidad);
            this.grpComprar.Controls.Add(this.grpCompletar);
            this.grpComprar.Dock = System.Windows.Forms.DockStyle.Fill;
            this.grpComprar.Location = new System.Drawing.Point(0, 46);
            this.grpComprar.Name = "grpComprar";
            this.grpComprar.Size = new System.Drawing.Size(895, 239);
            this.grpComprar.TabIndex = 7;
            this.grpComprar.TabStop = false;
            // 
            // grpBotonera
            // 
            this.grpBotonera.BackColor = System.Drawing.Color.White;
            this.grpBotonera.Controls.Add(this.botonLimpiar1);
            this.grpBotonera.Dock = System.Windows.Forms.DockStyle.Bottom;
            this.grpBotonera.ForeColor = System.Drawing.SystemColors.ControlLightLight;
            this.grpBotonera.Location = new System.Drawing.Point(0, 285);
            this.grpBotonera.Name = "grpBotonera";
            this.grpBotonera.Size = new System.Drawing.Size(895, 63);
            this.grpBotonera.TabIndex = 38;
            this.grpBotonera.TabStop = false;
            // 
            // botonLimpiar1
            // 
            this.botonLimpiar1.AutoSize = true;
            this.botonLimpiar1.Location = new System.Drawing.Point(29, 15);
            this.botonLimpiar1.Name = "botonLimpiar1";
            this.botonLimpiar1.Size = new System.Drawing.Size(133, 41);
            this.botonLimpiar1.TabIndex = 18;
            // 
            // btnComprar
            // 
            this.btnComprar.Dock = System.Windows.Forms.DockStyle.Right;
            this.btnComprar.Location = new System.Drawing.Point(895, 46);
            this.btnComprar.Name = "btnComprar";
            this.btnComprar.Size = new System.Drawing.Size(110, 302);
            this.btnComprar.TabIndex = 19;
            // 
            // grpCompletar
            // 
            this.grpCompletar.Location = new System.Drawing.Point(29, 108);
            this.grpCompletar.Name = "grpCompletar";
            this.grpCompletar.Size = new System.Drawing.Size(443, 116);
            this.grpCompletar.TabIndex = 7;
            // 
            // FormAceptarCompra
            // 
            this.AutoScaleDimensions = new System.Drawing.SizeF(6F, 14F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.ClientSize = new System.Drawing.Size(1005, 348);
            this.Controls.Add(this.grpComprar);
            this.Controls.Add(this.grpBotonera);
            this.Controls.Add(this.btnComprar);
            this.Controls.Add(this.pictureLogo1);
            this.Font = new System.Drawing.Font("Calibri", 9F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.Name = "FormAceptarCompra";
            this.StartPosition = System.Windows.Forms.FormStartPosition.CenterScreen;
            this.Text = "Aceptar compra";
            this.grpComprar.ResumeLayout(false);
            this.grpBotonera.ResumeLayout(false);
            this.grpBotonera.PerformLayout();
            this.ResumeLayout(false);

        }

        #endregion

        private ApplicationGdd1.PictureLogo pictureLogo1;
        private UserControls.LabelNoEditable lblDescripcionPublicacion;
        private UserControls.LabelNoEditable lblCodPublicacion;
        private UserControls.LabelNoEditable lblVendedor;
        private ApplicationGdd1.TextoNumerico txtCantidad;
        private ApplicationGdd1.combo cboMedioDePago;
        private ApplicationGdd1.Check checkEnvio;
        private System.Windows.Forms.GroupBox grpComprar;
        private System.Windows.Forms.GroupBox grpBotonera;
        private ApplicationGdd1.BotonLimpiar botonLimpiar1;
        private ApplicationGdd1.BotonComprar btnComprar;
        private ApplicationGdd1.Grupo grpCompletar;
    }
}