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
            this.groupBox2 = new System.Windows.Forms.GroupBox();
            this.grilla1 = new ApplicationGdd1.Grilla();
            this.grpBotonera = new System.Windows.Forms.GroupBox();
            this.btnBuscar = new ApplicationGdd1.BotonBuscar();
            this.btnLimpiar = new ApplicationGdd1.BotonLimpiar();
            this.tabControl1 = new System.Windows.Forms.TabControl();
            this.tabCliente = new System.Windows.Forms.TabPage();
            this.txtNombre = new ApplicationGdd1.TextoAlfanumerico();
            this.txtEmail = new ApplicationGdd1.TextoAlfanumerico();
            this.txtNroDoc = new ApplicationGdd1.TextoAlfanumerico();
            this.txtApellido = new ApplicationGdd1.TextoAlfanumerico();
            this.tabEmpresa = new System.Windows.Forms.TabPage();
            this.txtCuit = new ApplicationGdd1.TextoNumerico();
            this.txtRSocial = new ApplicationGdd1.TextoAlfanumerico();
            this.txtEmailEmpresa = new ApplicationGdd1.TextoAlfanumerico();
            this.pictureLogo1 = new ApplicationGdd1.PictureLogo();
            this.groupBox2.SuspendLayout();
            this.grpBotonera.SuspendLayout();
            this.tabControl1.SuspendLayout();
            this.tabCliente.SuspendLayout();
            this.tabEmpresa.SuspendLayout();
            this.SuspendLayout();
            // 
            // groupBox2
            // 
            this.groupBox2.BackColor = System.Drawing.Color.White;
            this.groupBox2.Controls.Add(this.grilla1);
            this.groupBox2.Dock = System.Windows.Forms.DockStyle.Fill;
            this.groupBox2.ForeColor = System.Drawing.Color.Black;
            this.groupBox2.Location = new System.Drawing.Point(0, 213);
            this.groupBox2.Name = "groupBox2";
            this.groupBox2.Size = new System.Drawing.Size(996, 367);
            this.groupBox2.TabIndex = 36;
            this.groupBox2.TabStop = false;
            this.groupBox2.Text = "Resultados";
            // 
            // grilla1
            // 
            this.grilla1.BackColor = System.Drawing.SystemColors.ActiveCaptionText;
            this.grilla1.Dock = System.Windows.Forms.DockStyle.Fill;
            this.grilla1.Location = new System.Drawing.Point(3, 18);
            this.grilla1.Name = "grilla1";
            this.grilla1.Size = new System.Drawing.Size(990, 346);
            this.grilla1.TabIndex = 0;
            // 
            // grpBotonera
            // 
            this.grpBotonera.BackColor = System.Drawing.Color.White;
            this.grpBotonera.Controls.Add(this.btnBuscar);
            this.grpBotonera.Controls.Add(this.btnLimpiar);
            this.grpBotonera.Dock = System.Windows.Forms.DockStyle.Top;
            this.grpBotonera.ForeColor = System.Drawing.SystemColors.ControlLightLight;
            this.grpBotonera.Location = new System.Drawing.Point(0, 159);
            this.grpBotonera.Name = "grpBotonera";
            this.grpBotonera.Size = new System.Drawing.Size(996, 54);
            this.grpBotonera.TabIndex = 37;
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
            // tabControl1
            // 
            this.tabControl1.Controls.Add(this.tabCliente);
            this.tabControl1.Controls.Add(this.tabEmpresa);
            this.tabControl1.Dock = System.Windows.Forms.DockStyle.Top;
            this.tabControl1.Location = new System.Drawing.Point(0, 44);
            this.tabControl1.Name = "tabControl1";
            this.tabControl1.SelectedIndex = 0;
            this.tabControl1.Size = new System.Drawing.Size(996, 115);
            this.tabControl1.TabIndex = 39;
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
            this.tabCliente.Size = new System.Drawing.Size(988, 88);
            this.tabCliente.TabIndex = 0;
            this.tabCliente.Text = "Filtros cliente";
            this.tabCliente.UseVisualStyleBackColor = true;
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
            // tabEmpresa
            // 
            this.tabEmpresa.Controls.Add(this.txtCuit);
            this.tabEmpresa.Controls.Add(this.txtRSocial);
            this.tabEmpresa.Controls.Add(this.txtEmailEmpresa);
            this.tabEmpresa.Location = new System.Drawing.Point(4, 23);
            this.tabEmpresa.Name = "tabEmpresa";
            this.tabEmpresa.Padding = new System.Windows.Forms.Padding(3);
            this.tabEmpresa.Size = new System.Drawing.Size(645, 88);
            this.tabEmpresa.TabIndex = 1;
            this.tabEmpresa.Text = "Filtros empresas";
            this.tabEmpresa.UseVisualStyleBackColor = true;
            // 
            // txtCuit
            // 
            this.txtCuit.BackColor = System.Drawing.Color.White;
            this.txtCuit.ForeColor = System.Drawing.SystemColors.ButtonFace;
            this.txtCuit.Location = new System.Drawing.Point(8, 31);
            this.txtCuit.Name = "txtCuit";
            this.txtCuit.Size = new System.Drawing.Size(301, 25);
            this.txtCuit.TabIndex = 35;
            // 
            // txtRSocial
            // 
            this.txtRSocial.BackColor = System.Drawing.SystemColors.ButtonHighlight;
            this.txtRSocial.Location = new System.Drawing.Point(8, 6);
            this.txtRSocial.Name = "txtRSocial";
            this.txtRSocial.Size = new System.Drawing.Size(301, 25);
            this.txtRSocial.TabIndex = 33;
            // 
            // txtEmailEmpresa
            // 
            this.txtEmailEmpresa.BackColor = System.Drawing.SystemColors.ButtonHighlight;
            this.txtEmailEmpresa.Location = new System.Drawing.Point(8, 56);
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
            this.pictureLogo1.Size = new System.Drawing.Size(996, 44);
            this.pictureLogo1.TabIndex = 38;
            // 
            // FormConsultaUsuarios
            // 
            this.AutoScaleDimensions = new System.Drawing.SizeF(6F, 14F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.ClientSize = new System.Drawing.Size(996, 580);
            this.Controls.Add(this.groupBox2);
            this.Controls.Add(this.grpBotonera);
            this.Controls.Add(this.tabControl1);
            this.Controls.Add(this.pictureLogo1);
            this.Font = new System.Drawing.Font("Calibri", 9F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.Name = "FormConsultaUsuarios";
            this.StartPosition = System.Windows.Forms.FormStartPosition.CenterScreen;
            this.Text = "Consulta usuarios";
            this.groupBox2.ResumeLayout(false);
            this.grpBotonera.ResumeLayout(false);
            this.grpBotonera.PerformLayout();
            this.tabControl1.ResumeLayout(false);
            this.tabCliente.ResumeLayout(false);
            this.tabEmpresa.ResumeLayout(false);
            this.ResumeLayout(false);

        }

        #endregion

        private System.Windows.Forms.GroupBox groupBox2;
        private ApplicationGdd1.Grilla grilla1;
        private System.Windows.Forms.GroupBox grpBotonera;
        private ApplicationGdd1.BotonBuscar btnBuscar;
        private ApplicationGdd1.BotonLimpiar btnLimpiar;
        private System.Windows.Forms.TabControl tabControl1;
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
    }
}