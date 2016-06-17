namespace MercadoEnvioDesktop.ABM_Visibilidad
{
    partial class FormModificarVisibilidad
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
            this.grpVisibilidad = new System.Windows.Forms.GroupBox();
            this.chkAdmiteEnvio = new ApplicationGdd1.Check();
            this.lblComisionPrecio = new MercadoEnvioDesktop.UserControls.LabelNoEditable();
            this.lblComisionPorcentaje = new MercadoEnvioDesktop.UserControls.LabelNoEditable();
            this.lblComisionEnvio = new MercadoEnvioDesktop.UserControls.LabelNoEditable();
            this.txtPrioridad = new ApplicationGdd1.TextoNumerico();
            this.txtNombreVisibilidad = new ApplicationGdd1.TextoAlfanumerico();
            this.grpComisiones = new ApplicationGdd1.Grupo();
            this.grpBotonera = new System.Windows.Forms.GroupBox();
            this.botonGuardar1 = new ApplicationGdd1.BotonGuardar();
            this.botonLimpiar1 = new ApplicationGdd1.BotonLimpiar();
            this.pictureLogo1 = new ApplicationGdd1.PictureLogo();
            this.grpVisibilidad.SuspendLayout();
            this.grpBotonera.SuspendLayout();
            this.SuspendLayout();
            // 
            // grpVisibilidad
            // 
            this.grpVisibilidad.BackColor = System.Drawing.Color.White;
            this.grpVisibilidad.Controls.Add(this.chkAdmiteEnvio);
            this.grpVisibilidad.Controls.Add(this.lblComisionPrecio);
            this.grpVisibilidad.Controls.Add(this.lblComisionPorcentaje);
            this.grpVisibilidad.Controls.Add(this.lblComisionEnvio);
            this.grpVisibilidad.Controls.Add(this.txtPrioridad);
            this.grpVisibilidad.Controls.Add(this.txtNombreVisibilidad);
            this.grpVisibilidad.Controls.Add(this.grpComisiones);
            this.grpVisibilidad.Dock = System.Windows.Forms.DockStyle.Fill;
            this.grpVisibilidad.Location = new System.Drawing.Point(0, 26);
            this.grpVisibilidad.Name = "grpVisibilidad";
            this.grpVisibilidad.Size = new System.Drawing.Size(378, 259);
            this.grpVisibilidad.TabIndex = 40;
            this.grpVisibilidad.TabStop = false;
            this.grpVisibilidad.Text = "Comisiones";
            // 
            // chkAdmiteEnvio
            // 
            this.chkAdmiteEnvio.BackColor = System.Drawing.Color.White;
            this.chkAdmiteEnvio.Enabled = false;
            this.chkAdmiteEnvio.Font = new System.Drawing.Font("Calibri", 9.75F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.chkAdmiteEnvio.ForeColor = System.Drawing.SystemColors.ButtonHighlight;
            this.chkAdmiteEnvio.Location = new System.Drawing.Point(37, 125);
            this.chkAdmiteEnvio.Name = "chkAdmiteEnvio";
            this.chkAdmiteEnvio.Size = new System.Drawing.Size(259, 25);
            this.chkAdmiteEnvio.TabIndex = 14;
            // 
            // lblComisionPrecio
            // 
            this.lblComisionPrecio.BackColor = System.Drawing.Color.White;
            this.lblComisionPrecio.Font = new System.Drawing.Font("Calibri", 9F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.lblComisionPrecio.Location = new System.Drawing.Point(37, 71);
            this.lblComisionPrecio.Name = "lblComisionPrecio";
            this.lblComisionPrecio.Size = new System.Drawing.Size(290, 27);
            this.lblComisionPrecio.TabIndex = 13;
            // 
            // lblComisionPorcentaje
            // 
            this.lblComisionPorcentaje.BackColor = System.Drawing.Color.White;
            this.lblComisionPorcentaje.Font = new System.Drawing.Font("Calibri", 9F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.lblComisionPorcentaje.Location = new System.Drawing.Point(37, 98);
            this.lblComisionPorcentaje.Name = "lblComisionPorcentaje";
            this.lblComisionPorcentaje.Size = new System.Drawing.Size(290, 27);
            this.lblComisionPorcentaje.TabIndex = 12;
            // 
            // lblComisionEnvio
            // 
            this.lblComisionEnvio.BackColor = System.Drawing.Color.White;
            this.lblComisionEnvio.Font = new System.Drawing.Font("Calibri", 9F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.lblComisionEnvio.Location = new System.Drawing.Point(37, 150);
            this.lblComisionEnvio.Name = "lblComisionEnvio";
            this.lblComisionEnvio.Size = new System.Drawing.Size(290, 27);
            this.lblComisionEnvio.TabIndex = 11;
            // 
            // txtPrioridad
            // 
            this.txtPrioridad.BackColor = System.Drawing.Color.White;
            this.txtPrioridad.ForeColor = System.Drawing.SystemColors.ButtonFace;
            this.txtPrioridad.Location = new System.Drawing.Point(37, 203);
            this.txtPrioridad.Name = "txtPrioridad";
            this.txtPrioridad.Size = new System.Drawing.Size(301, 25);
            this.txtPrioridad.TabIndex = 10;
            // 
            // txtNombreVisibilidad
            // 
            this.txtNombreVisibilidad.BackColor = System.Drawing.SystemColors.ButtonHighlight;
            this.txtNombreVisibilidad.Location = new System.Drawing.Point(37, 21);
            this.txtNombreVisibilidad.Name = "txtNombreVisibilidad";
            this.txtNombreVisibilidad.Size = new System.Drawing.Size(301, 25);
            this.txtNombreVisibilidad.TabIndex = 4;
            // 
            // grpComisiones
            // 
            this.grpComisiones.Location = new System.Drawing.Point(29, 52);
            this.grpComisiones.Name = "grpComisiones";
            this.grpComisiones.Size = new System.Drawing.Size(319, 145);
            this.grpComisiones.TabIndex = 8;
            // 
            // grpBotonera
            // 
            this.grpBotonera.BackColor = System.Drawing.Color.GhostWhite;
            this.grpBotonera.Controls.Add(this.botonGuardar1);
            this.grpBotonera.Controls.Add(this.botonLimpiar1);
            this.grpBotonera.Dock = System.Windows.Forms.DockStyle.Bottom;
            this.grpBotonera.ForeColor = System.Drawing.SystemColors.ControlLightLight;
            this.grpBotonera.Location = new System.Drawing.Point(0, 285);
            this.grpBotonera.Name = "grpBotonera";
            this.grpBotonera.Size = new System.Drawing.Size(378, 53);
            this.grpBotonera.TabIndex = 41;
            this.grpBotonera.TabStop = false;
            // 
            // botonGuardar1
            // 
            this.botonGuardar1.Location = new System.Drawing.Point(269, 16);
            this.botonGuardar1.Name = "botonGuardar1";
            this.botonGuardar1.Size = new System.Drawing.Size(128, 40);
            this.botonGuardar1.TabIndex = 17;
            // 
            // botonLimpiar1
            // 
            this.botonLimpiar1.AutoSize = true;
            this.botonLimpiar1.Location = new System.Drawing.Point(29, 15);
            this.botonLimpiar1.Name = "botonLimpiar1";
            this.botonLimpiar1.Size = new System.Drawing.Size(133, 41);
            this.botonLimpiar1.TabIndex = 18;
            // 
            // pictureLogo1
            // 
            this.pictureLogo1.BackColor = System.Drawing.Color.Orange;
            this.pictureLogo1.Dock = System.Windows.Forms.DockStyle.Top;
            this.pictureLogo1.Location = new System.Drawing.Point(0, 0);
            this.pictureLogo1.Name = "pictureLogo1";
            this.pictureLogo1.Size = new System.Drawing.Size(378, 26);
            this.pictureLogo1.TabIndex = 39;
            // 
            // FormModificarVisibilidad
            // 
            this.AutoScaleDimensions = new System.Drawing.SizeF(6F, 13F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.ClientSize = new System.Drawing.Size(378, 338);
            this.Controls.Add(this.grpVisibilidad);
            this.Controls.Add(this.grpBotonera);
            this.Controls.Add(this.pictureLogo1);
            this.Name = "FormModificarVisibilidad";
            this.StartPosition = System.Windows.Forms.FormStartPosition.CenterScreen;
            this.Text = "Modificar visibilidad";
            this.grpVisibilidad.ResumeLayout(false);
            this.grpBotonera.ResumeLayout(false);
            this.grpBotonera.PerformLayout();
            this.ResumeLayout(false);

        }

        #endregion

        private System.Windows.Forms.GroupBox grpVisibilidad;
        private ApplicationGdd1.TextoNumerico txtPrioridad;
        private ApplicationGdd1.TextoAlfanumerico txtNombreVisibilidad;
        private ApplicationGdd1.Grupo grpComisiones;
        private System.Windows.Forms.GroupBox grpBotonera;
        private ApplicationGdd1.BotonGuardar botonGuardar1;
        private ApplicationGdd1.BotonLimpiar botonLimpiar1;
        private ApplicationGdd1.PictureLogo pictureLogo1;
        private UserControls.LabelNoEditable lblComisionEnvio;
        private UserControls.LabelNoEditable lblComisionPrecio;
        private UserControls.LabelNoEditable lblComisionPorcentaje;
        private ApplicationGdd1.Check chkAdmiteEnvio;
    }
}