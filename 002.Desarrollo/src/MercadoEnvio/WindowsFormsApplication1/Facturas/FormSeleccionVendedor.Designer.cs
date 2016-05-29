namespace MercadoEnvioDesktop.Facturas
{
    partial class FormSeleccionVendedor
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
            this.grilla1 = new ApplicationGdd1.Grilla();
            this.grpBotonera = new System.Windows.Forms.GroupBox();
            this.btnBuscar = new ApplicationGdd1.BotonBuscar();
            this.btnLimpiar = new ApplicationGdd1.BotonLimpiar();
            this.grpFiltros = new System.Windows.Forms.GroupBox();
            this.txtNombre = new ApplicationGdd1.TextoAlfanumerico();
            this.txtApellido = new ApplicationGdd1.TextoAlfanumerico();
            this.txtUsuario = new ApplicationGdd1.TextoAlfanumerico();
            this.grpBotonera.SuspendLayout();
            this.grpFiltros.SuspendLayout();
            this.SuspendLayout();
            // 
            // grilla1
            // 
            this.grilla1.BackColor = System.Drawing.SystemColors.ActiveCaptionText;
            this.grilla1.Dock = System.Windows.Forms.DockStyle.Fill;
            this.grilla1.Location = new System.Drawing.Point(0, 146);
            this.grilla1.Name = "grilla1";
            this.grilla1.Size = new System.Drawing.Size(654, 294);
            this.grilla1.TabIndex = 27;
            // 
            // grpBotonera
            // 
            this.grpBotonera.BackColor = System.Drawing.Color.White;
            this.grpBotonera.Controls.Add(this.btnBuscar);
            this.grpBotonera.Controls.Add(this.btnLimpiar);
            this.grpBotonera.Dock = System.Windows.Forms.DockStyle.Top;
            this.grpBotonera.ForeColor = System.Drawing.SystemColors.ControlLightLight;
            this.grpBotonera.Location = new System.Drawing.Point(0, 92);
            this.grpBotonera.Name = "grpBotonera";
            this.grpBotonera.Size = new System.Drawing.Size(654, 54);
            this.grpBotonera.TabIndex = 29;
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
            // grpFiltros
            // 
            this.grpFiltros.BackColor = System.Drawing.Color.White;
            this.grpFiltros.Controls.Add(this.txtUsuario);
            this.grpFiltros.Controls.Add(this.txtApellido);
            this.grpFiltros.Controls.Add(this.txtNombre);
            this.grpFiltros.Dock = System.Windows.Forms.DockStyle.Top;
            this.grpFiltros.Location = new System.Drawing.Point(0, 0);
            this.grpFiltros.Name = "grpFiltros";
            this.grpFiltros.Size = new System.Drawing.Size(654, 92);
            this.grpFiltros.TabIndex = 28;
            this.grpFiltros.TabStop = false;
            this.grpFiltros.Text = "Filtros de busqueda";
            // 
            // txtNombre
            // 
            this.txtNombre.BackColor = System.Drawing.SystemColors.ButtonHighlight;
            this.txtNombre.Location = new System.Drawing.Point(12, 21);
            this.txtNombre.Name = "txtNombre";
            this.txtNombre.Size = new System.Drawing.Size(301, 25);
            this.txtNombre.TabIndex = 0;
            // 
            // txtApellido
            // 
            this.txtApellido.BackColor = System.Drawing.SystemColors.ButtonHighlight;
            this.txtApellido.Location = new System.Drawing.Point(310, 21);
            this.txtApellido.Name = "txtApellido";
            this.txtApellido.Size = new System.Drawing.Size(301, 25);
            this.txtApellido.TabIndex = 1;
            // 
            // txtUsuario
            // 
            this.txtUsuario.BackColor = System.Drawing.SystemColors.ButtonHighlight;
            this.txtUsuario.Location = new System.Drawing.Point(12, 46);
            this.txtUsuario.Name = "txtUsuario";
            this.txtUsuario.Size = new System.Drawing.Size(301, 25);
            this.txtUsuario.TabIndex = 2;
            // 
            // FormSeleccionVendedor
            // 
            this.AutoScaleDimensions = new System.Drawing.SizeF(6F, 14F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.ClientSize = new System.Drawing.Size(654, 440);
            this.Controls.Add(this.grilla1);
            this.Controls.Add(this.grpBotonera);
            this.Controls.Add(this.grpFiltros);
            this.Font = new System.Drawing.Font("Calibri", 9F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.Name = "FormSeleccionVendedor";
            this.StartPosition = System.Windows.Forms.FormStartPosition.CenterScreen;
            this.Text = "Seleccionar";
            this.grpBotonera.ResumeLayout(false);
            this.grpBotonera.PerformLayout();
            this.grpFiltros.ResumeLayout(false);
            this.ResumeLayout(false);

        }

        #endregion

        private ApplicationGdd1.Grilla grilla1;
        private System.Windows.Forms.GroupBox grpBotonera;
        private ApplicationGdd1.BotonBuscar btnBuscar;
        private ApplicationGdd1.BotonLimpiar btnLimpiar;
        private System.Windows.Forms.GroupBox grpFiltros;
        private ApplicationGdd1.TextoAlfanumerico txtUsuario;
        private ApplicationGdd1.TextoAlfanumerico txtApellido;
        private ApplicationGdd1.TextoAlfanumerico txtNombre;
    }
}