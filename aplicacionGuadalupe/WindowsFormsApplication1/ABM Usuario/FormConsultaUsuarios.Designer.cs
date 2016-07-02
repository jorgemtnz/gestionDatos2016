namespace MercadoEnvioDesktop.ABM_Usuario
{
    partial class FormConsultaUsuarios
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
            this.tabFiltros = new System.Windows.Forms.TabControl();
            this.tabCliente = new System.Windows.Forms.TabPage();
            this.tabEmpresa = new System.Windows.Forms.TabPage();
            this.tabGrillas = new System.Windows.Forms.TabControl();
            this.tabGrillaClientes = new System.Windows.Forms.TabPage();
            this.tabGrillaEmpresas = new System.Windows.Forms.TabPage();
            this.grdClientes = new ApplicationGdd1.Grilla();
            this.grdEmpresas = new ApplicationGdd1.Grilla();
            this.botonRefrescar1 = new MercadoEnvioDesktop.Botones.BotonRefrescar();
            this.btnBuscar = new ApplicationGdd1.BotonBuscar();
            this.btnLimpiar = new ApplicationGdd1.BotonLimpiar();
            this.txtNombre = new ApplicationGdd1.TextoAlfanumerico();
            this.txtEmail = new ApplicationGdd1.TextoAlfanumerico();
            this.txtNroDoc = new ApplicationGdd1.TextoAlfanumerico();
            this.txtApellido = new ApplicationGdd1.TextoAlfanumerico();
            this.txtCuit = new ApplicationGdd1.TextoNumerico();
            this.txtRSocial = new ApplicationGdd1.TextoAlfanumerico();
            this.txtEmailEmpresa = new ApplicationGdd1.TextoAlfanumerico();
            this.pictureLogo1 = new ApplicationGdd1.PictureLogo();
            this.grpBotonera.SuspendLayout();
            this.tabFiltros.SuspendLayout();
            this.tabCliente.SuspendLayout();
            this.tabEmpresa.SuspendLayout();
            this.tabGrillas.SuspendLayout();
            this.tabGrillaClientes.SuspendLayout();
            this.tabGrillaEmpresas.SuspendLayout();
            this.SuspendLayout();
            // 
            // grpBotonera
            // 
            this.grpBotonera.BackColor = System.Drawing.Color.GhostWhite;
            this.grpBotonera.Controls.Add(this.botonRefrescar1);
            this.grpBotonera.Controls.Add(this.btnBuscar);
            this.grpBotonera.Controls.Add(this.btnLimpiar);
            this.grpBotonera.Dock = System.Windows.Forms.DockStyle.Top;
            this.grpBotonera.ForeColor = System.Drawing.SystemColors.ControlLightLight;
            this.grpBotonera.Location = new System.Drawing.Point(0, 147);
            this.grpBotonera.Name = "grpBotonera";
            this.grpBotonera.Size = new System.Drawing.Size(1274, 53);
            this.grpBotonera.TabIndex = 37;
            this.grpBotonera.TabStop = false;
            // 
            // tabFiltros
            // 
            this.tabFiltros.Controls.Add(this.tabCliente);
            this.tabFiltros.Controls.Add(this.tabEmpresa);
            this.tabFiltros.Dock = System.Windows.Forms.DockStyle.Top;
            this.tabFiltros.Location = new System.Drawing.Point(0, 26);
            this.tabFiltros.Name = "tabFiltros";
            this.tabFiltros.SelectedIndex = 0;
            this.tabFiltros.Size = new System.Drawing.Size(1274, 121);
            this.tabFiltros.TabIndex = 39;
            this.tabFiltros.SelectedIndexChanged += new System.EventHandler(this.tabFiltros_SelectedIndexChanged);
            // 
            // tabCliente
            // 
            this.tabCliente.Controls.Add(this.txtNombre);
            this.tabCliente.Controls.Add(this.txtEmail);
            this.tabCliente.Controls.Add(this.txtNroDoc);
            this.tabCliente.Controls.Add(this.txtApellido);
            this.tabCliente.Location = new System.Drawing.Point(4, 23);
            this.tabCliente.Name = "tabCliente";
            this.tabCliente.Padding = new System.Windows.Forms.Padding(3);
            this.tabCliente.Size = new System.Drawing.Size(1266, 94);
            this.tabCliente.TabIndex = 0;
            this.tabCliente.Text = "Filtros cliente";
            this.tabCliente.UseVisualStyleBackColor = true;
            // 
            // tabEmpresa
            // 
            this.tabEmpresa.Controls.Add(this.txtCuit);
            this.tabEmpresa.Controls.Add(this.txtRSocial);
            this.tabEmpresa.Controls.Add(this.txtEmailEmpresa);
            this.tabEmpresa.Location = new System.Drawing.Point(4, 23);
            this.tabEmpresa.Name = "tabEmpresa";
            this.tabEmpresa.Padding = new System.Windows.Forms.Padding(3);
            this.tabEmpresa.Size = new System.Drawing.Size(1208, 94);
            this.tabEmpresa.TabIndex = 1;
            this.tabEmpresa.Text = "Filtros empresas";
            this.tabEmpresa.UseVisualStyleBackColor = true;
            // 
            // tabGrillas
            // 
            this.tabGrillas.Controls.Add(this.tabGrillaClientes);
            this.tabGrillas.Controls.Add(this.tabGrillaEmpresas);
            this.tabGrillas.Dock = System.Windows.Forms.DockStyle.Fill;
            this.tabGrillas.Location = new System.Drawing.Point(0, 200);
            this.tabGrillas.Name = "tabGrillas";
            this.tabGrillas.SelectedIndex = 0;
            this.tabGrillas.Size = new System.Drawing.Size(1274, 380);
            this.tabGrillas.TabIndex = 1;
            this.tabGrillas.SelectedIndexChanged += new System.EventHandler(this.tabGrillas_SelectedIndexChanged);
            // 
            // tabGrillaClientes
            // 
            this.tabGrillaClientes.Controls.Add(this.grdClientes);
            this.tabGrillaClientes.Location = new System.Drawing.Point(4, 23);
            this.tabGrillaClientes.Name = "tabGrillaClientes";
            this.tabGrillaClientes.Padding = new System.Windows.Forms.Padding(3);
            this.tabGrillaClientes.Size = new System.Drawing.Size(1266, 353);
            this.tabGrillaClientes.TabIndex = 0;
            this.tabGrillaClientes.Text = "Clientes";
            this.tabGrillaClientes.UseVisualStyleBackColor = true;
            // 
            // tabGrillaEmpresas
            // 
            this.tabGrillaEmpresas.Controls.Add(this.grdEmpresas);
            this.tabGrillaEmpresas.Location = new System.Drawing.Point(4, 23);
            this.tabGrillaEmpresas.Name = "tabGrillaEmpresas";
            this.tabGrillaEmpresas.Padding = new System.Windows.Forms.Padding(3);
            this.tabGrillaEmpresas.Size = new System.Drawing.Size(1208, 353);
            this.tabGrillaEmpresas.TabIndex = 1;
            this.tabGrillaEmpresas.Text = "Empresas";
            this.tabGrillaEmpresas.UseVisualStyleBackColor = true;
            // 
            // grdClientes
            // 
            this.grdClientes.BackColor = System.Drawing.SystemColors.ActiveCaptionText;
            this.grdClientes.Dock = System.Windows.Forms.DockStyle.Fill;
            this.grdClientes.Location = new System.Drawing.Point(3, 3);
            this.grdClientes.Name = "grdClientes";
            this.grdClientes.Size = new System.Drawing.Size(1260, 347);
            this.grdClientes.TabIndex = 0;
            // 
            // grdEmpresas
            // 
            this.grdEmpresas.BackColor = System.Drawing.SystemColors.ActiveCaptionText;
            this.grdEmpresas.Dock = System.Windows.Forms.DockStyle.Fill;
            this.grdEmpresas.Location = new System.Drawing.Point(3, 3);
            this.grdEmpresas.Name = "grdEmpresas";
            this.grdEmpresas.Size = new System.Drawing.Size(1202, 348);
            this.grdEmpresas.TabIndex = 0;
            // 
            // botonRefrescar1
            // 
            this.botonRefrescar1.Location = new System.Drawing.Point(1061, 15);
            this.botonRefrescar1.Name = "botonRefrescar1";
            this.botonRefrescar1.Size = new System.Drawing.Size(80, 24);
            this.botonRefrescar1.TabIndex = 34;
            // 
            // btnBuscar
            // 
            this.btnBuscar.Location = new System.Drawing.Point(525, 15);
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
            // txtNombre
            // 
            this.txtNombre.BackColor = System.Drawing.SystemColors.ButtonHighlight;
            this.txtNombre.Location = new System.Drawing.Point(6, 6);
            this.txtNombre.Name = "txtNombre";
            this.txtNombre.Size = new System.Drawing.Size(301, 25);
            this.txtNombre.TabIndex = 0;
            // 
            // txtEmail
            // 
            this.txtEmail.BackColor = System.Drawing.SystemColors.ButtonHighlight;
            this.txtEmail.Location = new System.Drawing.Point(6, 56);
            this.txtEmail.Name = "txtEmail";
            this.txtEmail.Size = new System.Drawing.Size(576, 25);
            this.txtEmail.TabIndex = 32;
            // 
            // txtNroDoc
            // 
            this.txtNroDoc.BackColor = System.Drawing.SystemColors.ButtonHighlight;
            this.txtNroDoc.Location = new System.Drawing.Point(6, 31);
            this.txtNroDoc.Name = "txtNroDoc";
            this.txtNroDoc.Size = new System.Drawing.Size(301, 25);
            this.txtNroDoc.TabIndex = 33;
            // 
            // txtApellido
            // 
            this.txtApellido.BackColor = System.Drawing.SystemColors.ButtonHighlight;
            this.txtApellido.Location = new System.Drawing.Point(314, 6);
            this.txtApellido.Name = "txtApellido";
            this.txtApellido.Size = new System.Drawing.Size(301, 25);
            this.txtApellido.TabIndex = 31;
            // 
            // txtCuit
            // 
            this.txtCuit.BackColor = System.Drawing.Color.White;
            this.txtCuit.ForeColor = System.Drawing.SystemColors.ButtonFace;
            this.txtCuit.Location = new System.Drawing.Point(6, 31);
            this.txtCuit.Name = "txtCuit";
            this.txtCuit.Size = new System.Drawing.Size(301, 25);
            this.txtCuit.TabIndex = 35;
            // 
            // txtRSocial
            // 
            this.txtRSocial.BackColor = System.Drawing.SystemColors.ButtonHighlight;
            this.txtRSocial.Location = new System.Drawing.Point(6, 6);
            this.txtRSocial.Name = "txtRSocial";
            this.txtRSocial.Size = new System.Drawing.Size(301, 25);
            this.txtRSocial.TabIndex = 33;
            // 
            // txtEmailEmpresa
            // 
            this.txtEmailEmpresa.BackColor = System.Drawing.SystemColors.ButtonHighlight;
            this.txtEmailEmpresa.Location = new System.Drawing.Point(6, 56);
            this.txtEmailEmpresa.Name = "txtEmailEmpresa";
            this.txtEmailEmpresa.Size = new System.Drawing.Size(576, 25);
            this.txtEmailEmpresa.TabIndex = 34;
            // 
            // pictureLogo1
            // 
            this.pictureLogo1.BackColor = System.Drawing.Color.Orange;
            this.pictureLogo1.Dock = System.Windows.Forms.DockStyle.Top;
            this.pictureLogo1.Location = new System.Drawing.Point(0, 0);
            this.pictureLogo1.Name = "pictureLogo1";
            this.pictureLogo1.Size = new System.Drawing.Size(1274, 26);
            this.pictureLogo1.TabIndex = 38;
            // 
            // FormConsultaUsuarios
            // 
            this.AutoScaleDimensions = new System.Drawing.SizeF(6F, 14F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.ClientSize = new System.Drawing.Size(1274, 580);
            this.Controls.Add(this.tabGrillas);
            this.Controls.Add(this.grpBotonera);
            this.Controls.Add(this.tabFiltros);
            this.Controls.Add(this.pictureLogo1);
            this.Font = new System.Drawing.Font("Calibri", 9F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.Name = "FormConsultaUsuarios";
            this.StartPosition = System.Windows.Forms.FormStartPosition.CenterScreen;
            this.Text = "Consulta usuarios";
            this.Load += new System.EventHandler(this.FormConsultaUsuarios_Load);
            this.grpBotonera.ResumeLayout(false);
            this.grpBotonera.PerformLayout();
            this.tabFiltros.ResumeLayout(false);
            this.tabCliente.ResumeLayout(false);
            this.tabEmpresa.ResumeLayout(false);
            this.tabGrillas.ResumeLayout(false);
            this.tabGrillaClientes.ResumeLayout(false);
            this.tabGrillaEmpresas.ResumeLayout(false);
            this.ResumeLayout(false);

        }

        #endregion

        private ApplicationGdd1.Grilla grdClientes;
        private System.Windows.Forms.GroupBox grpBotonera;
        private ApplicationGdd1.BotonBuscar btnBuscar;
        private ApplicationGdd1.BotonLimpiar btnLimpiar;
        private System.Windows.Forms.TabControl tabFiltros;
        private System.Windows.Forms.TabPage tabCliente;
        private ApplicationGdd1.TextoAlfanumerico txtNombre;
        private ApplicationGdd1.TextoAlfanumerico txtEmail;
        private ApplicationGdd1.TextoAlfanumerico txtNroDoc;
        private ApplicationGdd1.TextoAlfanumerico txtApellido;
        private System.Windows.Forms.TabPage tabEmpresa;
        private ApplicationGdd1.TextoNumerico txtCuit;
        private ApplicationGdd1.TextoAlfanumerico txtRSocial;
        private ApplicationGdd1.TextoAlfanumerico txtEmailEmpresa;
        private ApplicationGdd1.PictureLogo pictureLogo1;
        private System.Windows.Forms.TabControl tabGrillas;
        private System.Windows.Forms.TabPage tabGrillaClientes;
        private System.Windows.Forms.TabPage tabGrillaEmpresas;
        private ApplicationGdd1.Grilla grdEmpresas;
        private Botones.BotonRefrescar botonRefrescar1;
    }
}