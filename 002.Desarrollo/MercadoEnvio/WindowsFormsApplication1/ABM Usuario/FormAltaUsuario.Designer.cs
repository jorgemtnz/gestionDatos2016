namespace MercadoEnvioDesktop.ABM_Usuario
{
    partial class FormAltaUsuario
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
            this.tabControl = new System.Windows.Forms.TabControl();
            this.tabCliente = new System.Windows.Forms.TabPage();
            this.cboLocalidad = new ApplicationGdd1.combo();
            this.calFechaDia = new ApplicationGdd1.Calendario();
            this.txtDepto = new ApplicationGdd1.TextoAlfanumerico();
            this.txtCP = new ApplicationGdd1.TextoNumerico();
            this.calFechaNac = new ApplicationGdd1.Calendario();
            this.txtCalle = new ApplicationGdd1.TextoAlfanumerico();
            this.txtNroPiso = new ApplicationGdd1.TextoNumerico();
            this.txtTelefono = new ApplicationGdd1.TextoNumerico();
            this.txtNroCalle = new ApplicationGdd1.TextoNumerico();
            this.txtNombre = new ApplicationGdd1.TextoAlfanumerico();
            this.txtEmail = new ApplicationGdd1.TextoAlfanumerico();
            this.txtDocumento = new ApplicationGdd1.TextoNumerico();
            this.txtApellido = new ApplicationGdd1.TextoAlfanumerico();
            this.cboTipoDoc = new ApplicationGdd1.combo();
            this.grupDireccionCliente = new ApplicationGdd1.Grupo();
            this.tabEmpresa = new System.Windows.Forms.TabPage();
            this.txtNombreContacto = new ApplicationGdd1.TextoAlfanumerico();
            this.txtApellidoContacto = new ApplicationGdd1.TextoAlfanumerico();
            this.cboLocalidadEmpresa = new ApplicationGdd1.combo();
            this.txtPisoEmpresa = new ApplicationGdd1.TextoAlfanumerico();
            this.calFechaCreacion = new ApplicationGdd1.Calendario();
            this.txtCpEmpresa = new ApplicationGdd1.TextoNumerico();
            this.txtCalleEmpresa = new ApplicationGdd1.TextoAlfanumerico();
            this.txtDeptoEmpresa = new ApplicationGdd1.TextoNumerico();
            this.txtTelefonoEmpresa = new ApplicationGdd1.TextoNumerico();
            this.txtNroDirEmpresa = new ApplicationGdd1.TextoNumerico();
            this.txtRSocial = new ApplicationGdd1.TextoAlfanumerico();
            this.txtEmailEmpresa = new ApplicationGdd1.TextoAlfanumerico();
            this.txtCuit = new ApplicationGdd1.TextoAlfanumerico();
            this.txtRubroEmpresa = new ApplicationGdd1.combo();
            this.grupDireccionEmpresa = new ApplicationGdd1.Grupo();
            this.grupContacto = new ApplicationGdd1.Grupo();
            this.grpBotonera = new System.Windows.Forms.GroupBox();
            this.botonGuardar1 = new ApplicationGdd1.BotonGuardar();
            this.botonLimpiar1 = new ApplicationGdd1.BotonLimpiar();
            this.grpFiltros = new System.Windows.Forms.GroupBox();
            this.txtpass = new ApplicationGdd1.TextoPassword();
            this.cboRol = new ApplicationGdd1.combo();
            this.txtUserName = new ApplicationGdd1.TextoAlfanumerico();
            this.pictureLogo1 = new ApplicationGdd1.PictureLogo();
            this.tabControl.SuspendLayout();
            this.tabCliente.SuspendLayout();
            this.tabEmpresa.SuspendLayout();
            this.grpBotonera.SuspendLayout();
            this.grpFiltros.SuspendLayout();
            this.SuspendLayout();
            // 
            // tabControl
            // 
            this.tabControl.Controls.Add(this.tabCliente);
            this.tabControl.Controls.Add(this.tabEmpresa);
            this.tabControl.Dock = System.Windows.Forms.DockStyle.Fill;
            this.tabControl.Font = new System.Drawing.Font("Calibri", 9F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.tabControl.Location = new System.Drawing.Point(0, 130);
            this.tabControl.Name = "tabControl";
            this.tabControl.SelectedIndex = 0;
            this.tabControl.Size = new System.Drawing.Size(697, 334);
            this.tabControl.TabIndex = 38;
            // 
            // tabCliente
            // 
            this.tabCliente.Controls.Add(this.cboLocalidad);
            this.tabCliente.Controls.Add(this.calFechaDia);
            this.tabCliente.Controls.Add(this.txtDepto);
            this.tabCliente.Controls.Add(this.txtCP);
            this.tabCliente.Controls.Add(this.calFechaNac);
            this.tabCliente.Controls.Add(this.txtCalle);
            this.tabCliente.Controls.Add(this.txtNroPiso);
            this.tabCliente.Controls.Add(this.txtTelefono);
            this.tabCliente.Controls.Add(this.txtNroCalle);
            this.tabCliente.Controls.Add(this.txtNombre);
            this.tabCliente.Controls.Add(this.txtEmail);
            this.tabCliente.Controls.Add(this.txtDocumento);
            this.tabCliente.Controls.Add(this.txtApellido);
            this.tabCliente.Controls.Add(this.cboTipoDoc);
            this.tabCliente.Controls.Add(this.grupDireccionCliente);
            this.tabCliente.Location = new System.Drawing.Point(4, 23);
            this.tabCliente.Name = "tabCliente";
            this.tabCliente.Padding = new System.Windows.Forms.Padding(3);
            this.tabCliente.Size = new System.Drawing.Size(689, 307);
            this.tabCliente.TabIndex = 0;
            this.tabCliente.Tag = "1";
            this.tabCliente.Text = "Cliente";
            this.tabCliente.UseVisualStyleBackColor = true;
            // 
            // cboLocalidad
            // 
            this.cboLocalidad.BackColor = System.Drawing.Color.White;
            this.cboLocalidad.ForeColor = System.Drawing.SystemColors.Desktop;
            this.cboLocalidad.Location = new System.Drawing.Point(11, 194);
            this.cboLocalidad.Name = "cboLocalidad";
            this.cboLocalidad.Size = new System.Drawing.Size(301, 25);
            this.cboLocalidad.TabIndex = 11;
            // 
            // calFechaDia
            // 
            this.calFechaDia.BackColor = System.Drawing.SystemColors.ButtonHighlight;
            this.calFechaDia.Location = new System.Drawing.Point(12, 263);
            this.calFechaDia.Name = "calFechaDia";
            this.calFechaDia.Size = new System.Drawing.Size(417, 25);
            this.calFechaDia.TabIndex = 16;
            // 
            // txtDepto
            // 
            this.txtDepto.BackColor = System.Drawing.SystemColors.ButtonHighlight;
            this.txtDepto.Location = new System.Drawing.Point(11, 169);
            this.txtDepto.Name = "txtDepto";
            this.txtDepto.Size = new System.Drawing.Size(301, 25);
            this.txtDepto.TabIndex = 10;
            // 
            // txtCP
            // 
            this.txtCP.BackColor = System.Drawing.SystemColors.ButtonHighlight;
            this.txtCP.ForeColor = System.Drawing.SystemColors.ButtonFace;
            this.txtCP.Location = new System.Drawing.Point(331, 194);
            this.txtCP.Name = "txtCP";
            this.txtCP.Size = new System.Drawing.Size(301, 25);
            this.txtCP.TabIndex = 14;
            // 
            // calFechaNac
            // 
            this.calFechaNac.BackColor = System.Drawing.SystemColors.ButtonHighlight;
            this.calFechaNac.Location = new System.Drawing.Point(12, 236);
            this.calFechaNac.Name = "calFechaNac";
            this.calFechaNac.Size = new System.Drawing.Size(417, 25);
            this.calFechaNac.TabIndex = 15;
            // 
            // txtCalle
            // 
            this.txtCalle.BackColor = System.Drawing.SystemColors.ButtonHighlight;
            this.txtCalle.Location = new System.Drawing.Point(11, 144);
            this.txtCalle.Name = "txtCalle";
            this.txtCalle.Size = new System.Drawing.Size(301, 25);
            this.txtCalle.TabIndex = 9;
            // 
            // txtNroPiso
            // 
            this.txtNroPiso.BackColor = System.Drawing.SystemColors.ButtonHighlight;
            this.txtNroPiso.ForeColor = System.Drawing.SystemColors.ButtonFace;
            this.txtNroPiso.Location = new System.Drawing.Point(331, 169);
            this.txtNroPiso.Name = "txtNroPiso";
            this.txtNroPiso.Size = new System.Drawing.Size(301, 25);
            this.txtNroPiso.TabIndex = 13;
            // 
            // txtTelefono
            // 
            this.txtTelefono.BackColor = System.Drawing.SystemColors.ButtonHighlight;
            this.txtTelefono.ForeColor = System.Drawing.SystemColors.ButtonFace;
            this.txtTelefono.Location = new System.Drawing.Point(6, 84);
            this.txtTelefono.Name = "txtTelefono";
            this.txtTelefono.Size = new System.Drawing.Size(301, 25);
            this.txtTelefono.TabIndex = 6;
            // 
            // txtNroCalle
            // 
            this.txtNroCalle.BackColor = System.Drawing.SystemColors.ButtonHighlight;
            this.txtNroCalle.ForeColor = System.Drawing.SystemColors.ButtonFace;
            this.txtNroCalle.Location = new System.Drawing.Point(331, 144);
            this.txtNroCalle.Name = "txtNroCalle";
            this.txtNroCalle.Size = new System.Drawing.Size(301, 25);
            this.txtNroCalle.TabIndex = 12;
            // 
            // txtNombre
            // 
            this.txtNombre.BackColor = System.Drawing.SystemColors.ButtonHighlight;
            this.txtNombre.Location = new System.Drawing.Point(6, 9);
            this.txtNombre.Name = "txtNombre";
            this.txtNombre.Size = new System.Drawing.Size(301, 25);
            this.txtNombre.TabIndex = 3;
            // 
            // txtEmail
            // 
            this.txtEmail.BackColor = System.Drawing.SystemColors.ButtonHighlight;
            this.txtEmail.Location = new System.Drawing.Point(6, 59);
            this.txtEmail.Name = "txtEmail";
            this.txtEmail.Size = new System.Drawing.Size(621, 25);
            this.txtEmail.TabIndex = 5;
            // 
            // txtDocumento
            // 
            this.txtDocumento.BackColor = System.Drawing.SystemColors.ButtonHighlight;
            this.txtDocumento.ForeColor = System.Drawing.SystemColors.ButtonFace;
            this.txtDocumento.Location = new System.Drawing.Point(331, 34);
            this.txtDocumento.Name = "txtDocumento";
            this.txtDocumento.Size = new System.Drawing.Size(301, 25);
            this.txtDocumento.TabIndex = 8;
            // 
            // txtApellido
            // 
            this.txtApellido.BackColor = System.Drawing.SystemColors.ButtonHighlight;
            this.txtApellido.Location = new System.Drawing.Point(331, 9);
            this.txtApellido.Name = "txtApellido";
            this.txtApellido.Size = new System.Drawing.Size(301, 25);
            this.txtApellido.TabIndex = 7;
            // 
            // cboTipoDoc
            // 
            this.cboTipoDoc.BackColor = System.Drawing.Color.White;
            this.cboTipoDoc.ForeColor = System.Drawing.SystemColors.Desktop;
            this.cboTipoDoc.Location = new System.Drawing.Point(6, 34);
            this.cboTipoDoc.Name = "cboTipoDoc";
            this.cboTipoDoc.Size = new System.Drawing.Size(301, 25);
            this.cboTipoDoc.TabIndex = 4;
            // 
            // grupDireccionCliente
            // 
            this.grupDireccionCliente.Location = new System.Drawing.Point(8, 122);
            this.grupDireccionCliente.Name = "grupDireccionCliente";
            this.grupDireccionCliente.Size = new System.Drawing.Size(648, 108);
            this.grupDireccionCliente.TabIndex = 39;
            // 
            // tabEmpresa
            // 
            this.tabEmpresa.Controls.Add(this.txtNombreContacto);
            this.tabEmpresa.Controls.Add(this.txtApellidoContacto);
            this.tabEmpresa.Controls.Add(this.cboLocalidadEmpresa);
            this.tabEmpresa.Controls.Add(this.txtPisoEmpresa);
            this.tabEmpresa.Controls.Add(this.calFechaCreacion);
            this.tabEmpresa.Controls.Add(this.txtCpEmpresa);
            this.tabEmpresa.Controls.Add(this.txtCalleEmpresa);
            this.tabEmpresa.Controls.Add(this.txtDeptoEmpresa);
            this.tabEmpresa.Controls.Add(this.txtTelefonoEmpresa);
            this.tabEmpresa.Controls.Add(this.txtNroDirEmpresa);
            this.tabEmpresa.Controls.Add(this.txtRSocial);
            this.tabEmpresa.Controls.Add(this.txtEmailEmpresa);
            this.tabEmpresa.Controls.Add(this.txtCuit);
            this.tabEmpresa.Controls.Add(this.txtRubroEmpresa);
            this.tabEmpresa.Controls.Add(this.grupDireccionEmpresa);
            this.tabEmpresa.Controls.Add(this.grupContacto);
            this.tabEmpresa.Location = new System.Drawing.Point(4, 23);
            this.tabEmpresa.Name = "tabEmpresa";
            this.tabEmpresa.Padding = new System.Windows.Forms.Padding(3);
            this.tabEmpresa.Size = new System.Drawing.Size(689, 307);
            this.tabEmpresa.TabIndex = 1;
            this.tabEmpresa.Tag = "2";
            this.tabEmpresa.Text = "Empresa";
            this.tabEmpresa.UseVisualStyleBackColor = true;
            // 
            // txtNombreContacto
            // 
            this.txtNombreContacto.BackColor = System.Drawing.SystemColors.ButtonHighlight;
            this.txtNombreContacto.Location = new System.Drawing.Point(12, 216);
            this.txtNombreContacto.Name = "txtNombreContacto";
            this.txtNombreContacto.Size = new System.Drawing.Size(301, 25);
            this.txtNombreContacto.TabIndex = 37;
            // 
            // txtApellidoContacto
            // 
            this.txtApellidoContacto.BackColor = System.Drawing.SystemColors.ButtonHighlight;
            this.txtApellidoContacto.Location = new System.Drawing.Point(341, 216);
            this.txtApellidoContacto.Name = "txtApellidoContacto";
            this.txtApellidoContacto.Size = new System.Drawing.Size(301, 25);
            this.txtApellidoContacto.TabIndex = 38;
            // 
            // cboLocalidadEmpresa
            // 
            this.cboLocalidadEmpresa.BackColor = System.Drawing.Color.White;
            this.cboLocalidadEmpresa.ForeColor = System.Drawing.SystemColors.Desktop;
            this.cboLocalidadEmpresa.Location = new System.Drawing.Point(12, 159);
            this.cboLocalidadEmpresa.Name = "cboLocalidadEmpresa";
            this.cboLocalidadEmpresa.Size = new System.Drawing.Size(301, 25);
            this.cboLocalidadEmpresa.TabIndex = 38;
            // 
            // txtPisoEmpresa
            // 
            this.txtPisoEmpresa.BackColor = System.Drawing.SystemColors.ButtonHighlight;
            this.txtPisoEmpresa.Location = new System.Drawing.Point(12, 134);
            this.txtPisoEmpresa.Name = "txtPisoEmpresa";
            this.txtPisoEmpresa.Size = new System.Drawing.Size(301, 25);
            this.txtPisoEmpresa.TabIndex = 35;
            // 
            // calFechaCreacion
            // 
            this.calFechaCreacion.BackColor = System.Drawing.SystemColors.ButtonHighlight;
            this.calFechaCreacion.Location = new System.Drawing.Point(8, 264);
            this.calFechaCreacion.Name = "calFechaCreacion";
            this.calFechaCreacion.Size = new System.Drawing.Size(417, 25);
            this.calFechaCreacion.TabIndex = 41;
            // 
            // txtCpEmpresa
            // 
            this.txtCpEmpresa.BackColor = System.Drawing.SystemColors.ButtonHighlight;
            this.txtCpEmpresa.ForeColor = System.Drawing.SystemColors.ButtonFace;
            this.txtCpEmpresa.Location = new System.Drawing.Point(341, 159);
            this.txtCpEmpresa.Name = "txtCpEmpresa";
            this.txtCpEmpresa.Size = new System.Drawing.Size(301, 25);
            this.txtCpEmpresa.TabIndex = 37;
            // 
            // txtCalleEmpresa
            // 
            this.txtCalleEmpresa.BackColor = System.Drawing.SystemColors.ButtonHighlight;
            this.txtCalleEmpresa.Location = new System.Drawing.Point(12, 109);
            this.txtCalleEmpresa.Name = "txtCalleEmpresa";
            this.txtCalleEmpresa.Size = new System.Drawing.Size(301, 25);
            this.txtCalleEmpresa.TabIndex = 33;
            // 
            // txtDeptoEmpresa
            // 
            this.txtDeptoEmpresa.BackColor = System.Drawing.SystemColors.ButtonHighlight;
            this.txtDeptoEmpresa.ForeColor = System.Drawing.SystemColors.ButtonFace;
            this.txtDeptoEmpresa.Location = new System.Drawing.Point(341, 134);
            this.txtDeptoEmpresa.Name = "txtDeptoEmpresa";
            this.txtDeptoEmpresa.Size = new System.Drawing.Size(301, 25);
            this.txtDeptoEmpresa.TabIndex = 36;
            // 
            // txtTelefonoEmpresa
            // 
            this.txtTelefonoEmpresa.BackColor = System.Drawing.SystemColors.ButtonHighlight;
            this.txtTelefonoEmpresa.ForeColor = System.Drawing.SystemColors.ButtonFace;
            this.txtTelefonoEmpresa.Location = new System.Drawing.Point(6, 56);
            this.txtTelefonoEmpresa.Name = "txtTelefonoEmpresa";
            this.txtTelefonoEmpresa.Size = new System.Drawing.Size(301, 25);
            this.txtTelefonoEmpresa.TabIndex = 38;
            // 
            // txtNroDirEmpresa
            // 
            this.txtNroDirEmpresa.BackColor = System.Drawing.SystemColors.ButtonHighlight;
            this.txtNroDirEmpresa.ForeColor = System.Drawing.SystemColors.ButtonFace;
            this.txtNroDirEmpresa.Location = new System.Drawing.Point(341, 109);
            this.txtNroDirEmpresa.Name = "txtNroDirEmpresa";
            this.txtNroDirEmpresa.Size = new System.Drawing.Size(301, 25);
            this.txtNroDirEmpresa.TabIndex = 34;
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
            this.txtEmailEmpresa.Location = new System.Drawing.Point(6, 31);
            this.txtEmailEmpresa.Name = "txtEmailEmpresa";
            this.txtEmailEmpresa.Size = new System.Drawing.Size(621, 25);
            this.txtEmailEmpresa.TabIndex = 37;
            // 
            // txtCuit
            // 
            this.txtCuit.BackColor = System.Drawing.SystemColors.ButtonHighlight;
            this.txtCuit.Location = new System.Drawing.Point(341, 6);
            this.txtCuit.Name = "txtCuit";
            this.txtCuit.Size = new System.Drawing.Size(301, 25);
            this.txtCuit.TabIndex = 36;
            // 
            // txtRubroEmpresa
            // 
            this.txtRubroEmpresa.BackColor = System.Drawing.Color.White;
            this.txtRubroEmpresa.ForeColor = System.Drawing.SystemColors.Desktop;
            this.txtRubroEmpresa.Location = new System.Drawing.Point(341, 56);
            this.txtRubroEmpresa.Name = "txtRubroEmpresa";
            this.txtRubroEmpresa.Size = new System.Drawing.Size(301, 25);
            this.txtRubroEmpresa.TabIndex = 35;
            // 
            // grupDireccionEmpresa
            // 
            this.grupDireccionEmpresa.Location = new System.Drawing.Point(11, 90);
            this.grupDireccionEmpresa.Name = "grupDireccionEmpresa";
            this.grupDireccionEmpresa.Size = new System.Drawing.Size(643, 104);
            this.grupDireccionEmpresa.TabIndex = 44;
            // 
            // grupContacto
            // 
            this.grupContacto.Location = new System.Drawing.Point(11, 197);
            this.grupContacto.Name = "grupContacto";
            this.grupContacto.Size = new System.Drawing.Size(646, 61);
            this.grupContacto.TabIndex = 45;
            // 
            // grpBotonera
            // 
            this.grpBotonera.BackColor = System.Drawing.Color.White;
            this.grpBotonera.Controls.Add(this.botonGuardar1);
            this.grpBotonera.Controls.Add(this.botonLimpiar1);
            this.grpBotonera.Dock = System.Windows.Forms.DockStyle.Bottom;
            this.grpBotonera.ForeColor = System.Drawing.SystemColors.ControlLightLight;
            this.grpBotonera.Location = new System.Drawing.Point(0, 464);
            this.grpBotonera.Name = "grpBotonera";
            this.grpBotonera.Size = new System.Drawing.Size(697, 63);
            this.grpBotonera.TabIndex = 37;
            this.grpBotonera.TabStop = false;
            // 
            // botonGuardar1
            // 
            this.botonGuardar1.Location = new System.Drawing.Point(503, 15);
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
            // grpFiltros
            // 
            this.grpFiltros.BackColor = System.Drawing.Color.White;
            this.grpFiltros.Controls.Add(this.txtpass);
            this.grpFiltros.Controls.Add(this.cboRol);
            this.grpFiltros.Controls.Add(this.txtUserName);
            this.grpFiltros.Dock = System.Windows.Forms.DockStyle.Top;
            this.grpFiltros.Font = new System.Drawing.Font("Calibri", 9F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.grpFiltros.ForeColor = System.Drawing.Color.Black;
            this.grpFiltros.Location = new System.Drawing.Point(0, 44);
            this.grpFiltros.Name = "grpFiltros";
            this.grpFiltros.Size = new System.Drawing.Size(697, 86);
            this.grpFiltros.TabIndex = 35;
            this.grpFiltros.TabStop = false;
            this.grpFiltros.Text = "Usuario";
            // 
            // txtpass
            // 
            this.txtpass.BackColor = System.Drawing.Color.White;
            this.txtpass.ForeColor = System.Drawing.Color.Black;
            this.txtpass.Location = new System.Drawing.Point(335, 21);
            this.txtpass.Name = "txtpass";
            this.txtpass.Size = new System.Drawing.Size(301, 50);
            this.txtpass.TabIndex = 2;
            // 
            // cboRol
            // 
            this.cboRol.BackColor = System.Drawing.Color.White;
            this.cboRol.ForeColor = System.Drawing.SystemColors.Desktop;
            this.cboRol.Location = new System.Drawing.Point(16, 46);
            this.cboRol.Name = "cboRol";
            this.cboRol.Size = new System.Drawing.Size(301, 25);
            this.cboRol.TabIndex = 1;
            // 
            // txtUserName
            // 
            this.txtUserName.BackColor = System.Drawing.SystemColors.ButtonHighlight;
            this.txtUserName.Location = new System.Drawing.Point(16, 21);
            this.txtUserName.Name = "txtUserName";
            this.txtUserName.Size = new System.Drawing.Size(301, 25);
            this.txtUserName.TabIndex = 0;
            // 
            // pictureLogo1
            // 
            this.pictureLogo1.BackColor = System.Drawing.Color.Orange;
            this.pictureLogo1.Dock = System.Windows.Forms.DockStyle.Top;
            this.pictureLogo1.Location = new System.Drawing.Point(0, 0);
            this.pictureLogo1.Name = "pictureLogo1";
            this.pictureLogo1.Size = new System.Drawing.Size(697, 44);
            this.pictureLogo1.TabIndex = 36;
            // 
            // FormAltaUsuario
            // 
            this.AutoScaleDimensions = new System.Drawing.SizeF(6F, 14F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.ClientSize = new System.Drawing.Size(697, 527);
            this.Controls.Add(this.tabControl);
            this.Controls.Add(this.grpBotonera);
            this.Controls.Add(this.grpFiltros);
            this.Controls.Add(this.pictureLogo1);
            this.Font = new System.Drawing.Font("Calibri", 9F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.Name = "FormAltaUsuario";
            this.StartPosition = System.Windows.Forms.FormStartPosition.CenterScreen;
            this.Text = "Alta usuario";
            this.tabControl.ResumeLayout(false);
            this.tabCliente.ResumeLayout(false);
            this.tabEmpresa.ResumeLayout(false);
            this.grpBotonera.ResumeLayout(false);
            this.grpBotonera.PerformLayout();
            this.grpFiltros.ResumeLayout(false);
            this.ResumeLayout(false);

        }

        #endregion

        private System.Windows.Forms.TabControl tabControl;
        private System.Windows.Forms.TabPage tabCliente;
        private ApplicationGdd1.combo cboLocalidad;
        private ApplicationGdd1.Calendario calFechaDia;
        private ApplicationGdd1.TextoAlfanumerico txtDepto;
        private ApplicationGdd1.TextoNumerico txtCP;
        private ApplicationGdd1.Calendario calFechaNac;
        private ApplicationGdd1.TextoAlfanumerico txtCalle;
        private ApplicationGdd1.TextoNumerico txtNroPiso;
        private ApplicationGdd1.TextoNumerico txtTelefono;
        private ApplicationGdd1.TextoNumerico txtNroCalle;
        private ApplicationGdd1.TextoAlfanumerico txtNombre;
        private ApplicationGdd1.TextoAlfanumerico txtEmail;
        private ApplicationGdd1.TextoNumerico txtDocumento;
        private ApplicationGdd1.TextoAlfanumerico txtApellido;
        private ApplicationGdd1.combo cboTipoDoc;
        private ApplicationGdd1.Grupo grupDireccionCliente;
        private System.Windows.Forms.TabPage tabEmpresa;
        private ApplicationGdd1.TextoAlfanumerico txtNombreContacto;
        private ApplicationGdd1.TextoAlfanumerico txtApellidoContacto;
        private ApplicationGdd1.combo cboLocalidadEmpresa;
        private ApplicationGdd1.TextoAlfanumerico txtPisoEmpresa;
        private ApplicationGdd1.Calendario calFechaCreacion;
        private ApplicationGdd1.TextoNumerico txtCpEmpresa;
        private ApplicationGdd1.TextoAlfanumerico txtCalleEmpresa;
        private ApplicationGdd1.TextoNumerico txtDeptoEmpresa;
        private ApplicationGdd1.TextoNumerico txtTelefonoEmpresa;
        private ApplicationGdd1.TextoNumerico txtNroDirEmpresa;
        private ApplicationGdd1.TextoAlfanumerico txtRSocial;
        private ApplicationGdd1.TextoAlfanumerico txtEmailEmpresa;
        private ApplicationGdd1.TextoAlfanumerico txtCuit;
        private ApplicationGdd1.combo txtRubroEmpresa;
        private ApplicationGdd1.Grupo grupDireccionEmpresa;
        private ApplicationGdd1.Grupo grupContacto;
        private System.Windows.Forms.GroupBox grpBotonera;
        private ApplicationGdd1.BotonGuardar botonGuardar1;
        private ApplicationGdd1.BotonLimpiar botonLimpiar1;
        private System.Windows.Forms.GroupBox grpFiltros;
        private ApplicationGdd1.TextoPassword txtpass;
        private ApplicationGdd1.combo cboRol;
        private ApplicationGdd1.TextoAlfanumerico txtUserName;
        private ApplicationGdd1.PictureLogo pictureLogo1;
    }
}