namespace MercadoEnvioDesktop.ABM_Usuario
{
    partial class FormModificacionUsuario
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
            this.tabCliente = new System.Windows.Forms.TabControl();
            this.tabPage1 = new System.Windows.Forms.TabPage();
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
            this.txtDeptoEmpresa = new ApplicationGdd1.TextoAlfanumerico();
            this.txtCuit = new MercadoEnvioDesktop.UserControls.TextoEspecial();
            this.txtPisoEmpresa = new ApplicationGdd1.TextoNumerico();
            this.txtCiudad = new ApplicationGdd1.TextoAlfanumerico();
            this.txtNombreContacto = new ApplicationGdd1.TextoAlfanumerico();
            this.cboLocalidadEmpresa = new ApplicationGdd1.combo();
            this.calFechaCreacion = new ApplicationGdd1.Calendario();
            this.txtCpEmpresa = new ApplicationGdd1.TextoNumerico();
            this.txtCalleEmpresa = new ApplicationGdd1.TextoAlfanumerico();
            this.txtTelefonoEmpresa = new ApplicationGdd1.TextoNumerico();
            this.txtNroDirEmpresa = new ApplicationGdd1.TextoNumerico();
            this.txtRSocial = new ApplicationGdd1.TextoAlfanumerico();
            this.txtEmailEmpresa = new ApplicationGdd1.TextoAlfanumerico();
            this.grupDireccionEmpresa = new ApplicationGdd1.Grupo();
            this.grupContacto = new ApplicationGdd1.Grupo();
            this.txtRubroEmpresa = new ApplicationGdd1.TextoAlfanumerico();
            this.grpBotonera = new System.Windows.Forms.GroupBox();
            this.botonGuardar1 = new ApplicationGdd1.BotonGuardar();
            this.botonLimpiar1 = new ApplicationGdd1.BotonLimpiar();
            this.grpFiltros = new System.Windows.Forms.GroupBox();
            this.chkBloqueado = new ApplicationGdd1.Check();
            this.lblRol = new MercadoEnvioDesktop.UserControls.LabelNoEditable();
            this.lblUsername = new MercadoEnvioDesktop.UserControls.LabelNoEditable();
            this.txtPass = new ApplicationGdd1.TextoPassword();
            this.chkHabilitado = new ApplicationGdd1.Check();
            this.grpPass = new ApplicationGdd1.Grupo();
            this.pictureLogo1 = new ApplicationGdd1.PictureLogo();
            this.tabCliente.SuspendLayout();
            this.tabPage1.SuspendLayout();
            this.tabEmpresa.SuspendLayout();
            this.grpBotonera.SuspendLayout();
            this.grpFiltros.SuspendLayout();
            this.SuspendLayout();
            // 
            // tabCliente
            // 
            this.tabCliente.Controls.Add(this.tabPage1);
            this.tabCliente.Controls.Add(this.tabEmpresa);
            this.tabCliente.Dock = System.Windows.Forms.DockStyle.Fill;
            this.tabCliente.Font = new System.Drawing.Font("Calibri", 9F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.tabCliente.Location = new System.Drawing.Point(0, 147);
            this.tabCliente.Name = "tabCliente";
            this.tabCliente.SelectedIndex = 0;
            this.tabCliente.Size = new System.Drawing.Size(692, 385);
            this.tabCliente.TabIndex = 42;
            // 
            // tabPage1
            // 
            this.tabPage1.Controls.Add(this.cboLocalidad);
            this.tabPage1.Controls.Add(this.calFechaDia);
            this.tabPage1.Controls.Add(this.txtDepto);
            this.tabPage1.Controls.Add(this.txtCP);
            this.tabPage1.Controls.Add(this.calFechaNac);
            this.tabPage1.Controls.Add(this.txtCalle);
            this.tabPage1.Controls.Add(this.txtNroPiso);
            this.tabPage1.Controls.Add(this.txtTelefono);
            this.tabPage1.Controls.Add(this.txtNroCalle);
            this.tabPage1.Controls.Add(this.txtNombre);
            this.tabPage1.Controls.Add(this.txtEmail);
            this.tabPage1.Controls.Add(this.txtDocumento);
            this.tabPage1.Controls.Add(this.txtApellido);
            this.tabPage1.Controls.Add(this.cboTipoDoc);
            this.tabPage1.Controls.Add(this.grupDireccionCliente);
            this.tabPage1.Location = new System.Drawing.Point(4, 23);
            this.tabPage1.Name = "tabPage1";
            this.tabPage1.Padding = new System.Windows.Forms.Padding(3);
            this.tabPage1.Size = new System.Drawing.Size(684, 358);
            this.tabPage1.TabIndex = 0;
            this.tabPage1.Text = "Cliente";
            this.tabPage1.UseVisualStyleBackColor = true;
            // 
            // cboLocalidad
            // 
            this.cboLocalidad.BackColor = System.Drawing.Color.White;
            this.cboLocalidad.ForeColor = System.Drawing.SystemColors.Desktop;
            this.cboLocalidad.Location = new System.Drawing.Point(21, 183);
            this.cboLocalidad.Name = "cboLocalidad";
            this.cboLocalidad.Size = new System.Drawing.Size(412, 25);
            this.cboLocalidad.TabIndex = 38;
            // 
            // calFechaDia
            // 
            this.calFechaDia.BackColor = System.Drawing.SystemColors.ButtonHighlight;
            this.calFechaDia.Location = new System.Drawing.Point(27, 269);
            this.calFechaDia.Name = "calFechaDia";
            this.calFechaDia.Size = new System.Drawing.Size(417, 25);
            this.calFechaDia.TabIndex = 29;
            // 
            // txtDepto
            // 
            this.txtDepto.BackColor = System.Drawing.SystemColors.ButtonHighlight;
            this.txtDepto.Location = new System.Drawing.Point(21, 158);
            this.txtDepto.Name = "txtDepto";
            this.txtDepto.Size = new System.Drawing.Size(412, 25);
            this.txtDepto.TabIndex = 35;
            // 
            // txtCP
            // 
            this.txtCP.BackColor = System.Drawing.SystemColors.ButtonHighlight;
            this.txtCP.ForeColor = System.Drawing.SystemColors.ButtonFace;
            this.txtCP.Location = new System.Drawing.Point(439, 183);
            this.txtCP.Name = "txtCP";
            this.txtCP.Size = new System.Drawing.Size(203, 25);
            this.txtCP.TabIndex = 37;
            // 
            // calFechaNac
            // 
            this.calFechaNac.BackColor = System.Drawing.SystemColors.ButtonHighlight;
            this.calFechaNac.Location = new System.Drawing.Point(27, 244);
            this.calFechaNac.Name = "calFechaNac";
            this.calFechaNac.Size = new System.Drawing.Size(417, 25);
            this.calFechaNac.TabIndex = 3;
            // 
            // txtCalle
            // 
            this.txtCalle.BackColor = System.Drawing.SystemColors.ButtonHighlight;
            this.txtCalle.Location = new System.Drawing.Point(21, 132);
            this.txtCalle.Name = "txtCalle";
            this.txtCalle.Size = new System.Drawing.Size(412, 25);
            this.txtCalle.TabIndex = 33;
            // 
            // txtNroPiso
            // 
            this.txtNroPiso.BackColor = System.Drawing.SystemColors.ButtonHighlight;
            this.txtNroPiso.ForeColor = System.Drawing.SystemColors.ButtonFace;
            this.txtNroPiso.Location = new System.Drawing.Point(439, 158);
            this.txtNroPiso.Name = "txtNroPiso";
            this.txtNroPiso.Size = new System.Drawing.Size(203, 25);
            this.txtNroPiso.TabIndex = 36;
            // 
            // txtTelefono
            // 
            this.txtTelefono.BackColor = System.Drawing.SystemColors.ButtonHighlight;
            this.txtTelefono.ForeColor = System.Drawing.SystemColors.ButtonFace;
            this.txtTelefono.Location = new System.Drawing.Point(21, 81);
            this.txtTelefono.Name = "txtTelefono";
            this.txtTelefono.Size = new System.Drawing.Size(301, 25);
            this.txtTelefono.TabIndex = 32;
            // 
            // txtNroCalle
            // 
            this.txtNroCalle.BackColor = System.Drawing.SystemColors.ButtonHighlight;
            this.txtNroCalle.ForeColor = System.Drawing.SystemColors.ButtonFace;
            this.txtNroCalle.Location = new System.Drawing.Point(439, 132);
            this.txtNroCalle.Name = "txtNroCalle";
            this.txtNroCalle.Size = new System.Drawing.Size(203, 25);
            this.txtNroCalle.TabIndex = 34;
            // 
            // txtNombre
            // 
            this.txtNombre.BackColor = System.Drawing.SystemColors.ButtonHighlight;
            this.txtNombre.Location = new System.Drawing.Point(21, 6);
            this.txtNombre.Name = "txtNombre";
            this.txtNombre.Size = new System.Drawing.Size(301, 25);
            this.txtNombre.TabIndex = 0;
            // 
            // txtEmail
            // 
            this.txtEmail.BackColor = System.Drawing.SystemColors.ButtonHighlight;
            this.txtEmail.Location = new System.Drawing.Point(21, 56);
            this.txtEmail.Name = "txtEmail";
            this.txtEmail.Size = new System.Drawing.Size(621, 25);
            this.txtEmail.TabIndex = 31;
            // 
            // txtDocumento
            // 
            this.txtDocumento.BackColor = System.Drawing.SystemColors.ButtonHighlight;
            this.txtDocumento.ForeColor = System.Drawing.SystemColors.ButtonFace;
            this.txtDocumento.Location = new System.Drawing.Point(341, 28);
            this.txtDocumento.Name = "txtDocumento";
            this.txtDocumento.Size = new System.Drawing.Size(301, 25);
            this.txtDocumento.TabIndex = 1;
            // 
            // txtApellido
            // 
            this.txtApellido.BackColor = System.Drawing.SystemColors.ButtonHighlight;
            this.txtApellido.Location = new System.Drawing.Point(341, 3);
            this.txtApellido.Name = "txtApellido";
            this.txtApellido.Size = new System.Drawing.Size(301, 27);
            this.txtApellido.TabIndex = 30;
            // 
            // cboTipoDoc
            // 
            this.cboTipoDoc.BackColor = System.Drawing.Color.White;
            this.cboTipoDoc.ForeColor = System.Drawing.SystemColors.Desktop;
            this.cboTipoDoc.Location = new System.Drawing.Point(21, 31);
            this.cboTipoDoc.Name = "cboTipoDoc";
            this.cboTipoDoc.Size = new System.Drawing.Size(301, 25);
            this.cboTipoDoc.TabIndex = 28;
            // 
            // grupDireccionCliente
            // 
            this.grupDireccionCliente.Location = new System.Drawing.Point(12, 112);
            this.grupDireccionCliente.Name = "grupDireccionCliente";
            this.grupDireccionCliente.Size = new System.Drawing.Size(648, 114);
            this.grupDireccionCliente.TabIndex = 39;
            // 
            // tabEmpresa
            // 
            this.tabEmpresa.Controls.Add(this.txtDeptoEmpresa);
            this.tabEmpresa.Controls.Add(this.txtCuit);
            this.tabEmpresa.Controls.Add(this.txtPisoEmpresa);
            this.tabEmpresa.Controls.Add(this.txtCiudad);
            this.tabEmpresa.Controls.Add(this.txtNombreContacto);
            this.tabEmpresa.Controls.Add(this.cboLocalidadEmpresa);
            this.tabEmpresa.Controls.Add(this.calFechaCreacion);
            this.tabEmpresa.Controls.Add(this.txtCpEmpresa);
            this.tabEmpresa.Controls.Add(this.txtCalleEmpresa);
            this.tabEmpresa.Controls.Add(this.txtTelefonoEmpresa);
            this.tabEmpresa.Controls.Add(this.txtNroDirEmpresa);
            this.tabEmpresa.Controls.Add(this.txtRSocial);
            this.tabEmpresa.Controls.Add(this.txtEmailEmpresa);
            this.tabEmpresa.Controls.Add(this.grupDireccionEmpresa);
            this.tabEmpresa.Controls.Add(this.grupContacto);
            this.tabEmpresa.Controls.Add(this.txtRubroEmpresa);
            this.tabEmpresa.Location = new System.Drawing.Point(4, 23);
            this.tabEmpresa.Name = "tabEmpresa";
            this.tabEmpresa.Padding = new System.Windows.Forms.Padding(3);
            this.tabEmpresa.Size = new System.Drawing.Size(684, 358);
            this.tabEmpresa.TabIndex = 1;
            this.tabEmpresa.Text = "Empresa";
            this.tabEmpresa.UseVisualStyleBackColor = true;
            // 
            // txtDeptoEmpresa
            // 
            this.txtDeptoEmpresa.BackColor = System.Drawing.SystemColors.ButtonHighlight;
            this.txtDeptoEmpresa.Location = new System.Drawing.Point(428, 136);
            this.txtDeptoEmpresa.Name = "txtDeptoEmpresa";
            this.txtDeptoEmpresa.Size = new System.Drawing.Size(201, 25);
            this.txtDeptoEmpresa.TabIndex = 50;
            // 
            // txtCuit
            // 
            this.txtCuit.BackColor = System.Drawing.Color.White;
            this.txtCuit.Location = new System.Drawing.Point(341, 6);
            this.txtCuit.Name = "txtCuit";
            this.txtCuit.Size = new System.Drawing.Size(301, 25);
            this.txtCuit.TabIndex = 49;
            // 
            // txtPisoEmpresa
            // 
            this.txtPisoEmpresa.BackColor = System.Drawing.SystemColors.ButtonHighlight;
            this.txtPisoEmpresa.ForeColor = System.Drawing.SystemColors.ButtonFace;
            this.txtPisoEmpresa.Location = new System.Drawing.Point(12, 136);
            this.txtPisoEmpresa.Name = "txtPisoEmpresa";
            this.txtPisoEmpresa.Size = new System.Drawing.Size(203, 27);
            this.txtPisoEmpresa.TabIndex = 48;
            // 
            // txtCiudad
            // 
            this.txtCiudad.BackColor = System.Drawing.SystemColors.ButtonHighlight;
            this.txtCiudad.Location = new System.Drawing.Point(12, 186);
            this.txtCiudad.Name = "txtCiudad";
            this.txtCiudad.Size = new System.Drawing.Size(410, 27);
            this.txtCiudad.TabIndex = 46;
            // 
            // txtNombreContacto
            // 
            this.txtNombreContacto.BackColor = System.Drawing.SystemColors.ButtonHighlight;
            this.txtNombreContacto.Location = new System.Drawing.Point(12, 272);
            this.txtNombreContacto.Name = "txtNombreContacto";
            this.txtNombreContacto.Size = new System.Drawing.Size(615, 25);
            this.txtNombreContacto.TabIndex = 37;
            // 
            // cboLocalidadEmpresa
            // 
            this.cboLocalidadEmpresa.BackColor = System.Drawing.Color.White;
            this.cboLocalidadEmpresa.ForeColor = System.Drawing.SystemColors.Desktop;
            this.cboLocalidadEmpresa.Location = new System.Drawing.Point(12, 161);
            this.cboLocalidadEmpresa.Name = "cboLocalidadEmpresa";
            this.cboLocalidadEmpresa.Size = new System.Drawing.Size(410, 25);
            this.cboLocalidadEmpresa.TabIndex = 38;
            // 
            // calFechaCreacion
            // 
            this.calFechaCreacion.BackColor = System.Drawing.SystemColors.ButtonHighlight;
            this.calFechaCreacion.Location = new System.Drawing.Point(12, 315);
            this.calFechaCreacion.Name = "calFechaCreacion";
            this.calFechaCreacion.Size = new System.Drawing.Size(417, 25);
            this.calFechaCreacion.TabIndex = 41;
            // 
            // txtCpEmpresa
            // 
            this.txtCpEmpresa.BackColor = System.Drawing.SystemColors.ButtonHighlight;
            this.txtCpEmpresa.ForeColor = System.Drawing.SystemColors.ButtonFace;
            this.txtCpEmpresa.Location = new System.Drawing.Point(428, 161);
            this.txtCpEmpresa.Name = "txtCpEmpresa";
            this.txtCpEmpresa.Size = new System.Drawing.Size(199, 25);
            this.txtCpEmpresa.TabIndex = 37;
            // 
            // txtCalleEmpresa
            // 
            this.txtCalleEmpresa.BackColor = System.Drawing.SystemColors.ButtonHighlight;
            this.txtCalleEmpresa.Location = new System.Drawing.Point(12, 111);
            this.txtCalleEmpresa.Name = "txtCalleEmpresa";
            this.txtCalleEmpresa.Size = new System.Drawing.Size(410, 25);
            this.txtCalleEmpresa.TabIndex = 33;
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
            this.txtNroDirEmpresa.Location = new System.Drawing.Point(428, 111);
            this.txtNroDirEmpresa.Name = "txtNroDirEmpresa";
            this.txtNroDirEmpresa.Size = new System.Drawing.Size(199, 25);
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
            // grupDireccionEmpresa
            // 
            this.grupDireccionEmpresa.Location = new System.Drawing.Point(6, 87);
            this.grupDireccionEmpresa.Name = "grupDireccionEmpresa";
            this.grupDireccionEmpresa.Size = new System.Drawing.Size(643, 155);
            this.grupDireccionEmpresa.TabIndex = 44;
            // 
            // grupContacto
            // 
            this.grupContacto.Location = new System.Drawing.Point(6, 248);
            this.grupContacto.Name = "grupContacto";
            this.grupContacto.Size = new System.Drawing.Size(646, 61);
            this.grupContacto.TabIndex = 45;
            // 
            // txtRubroEmpresa
            // 
            this.txtRubroEmpresa.BackColor = System.Drawing.SystemColors.ButtonHighlight;
            this.txtRubroEmpresa.Location = new System.Drawing.Point(341, 54);
            this.txtRubroEmpresa.Name = "txtRubroEmpresa";
            this.txtRubroEmpresa.Size = new System.Drawing.Size(301, 27);
            this.txtRubroEmpresa.TabIndex = 47;
            // 
            // grpBotonera
            // 
            this.grpBotonera.BackColor = System.Drawing.Color.White;
            this.grpBotonera.Controls.Add(this.botonGuardar1);
            this.grpBotonera.Controls.Add(this.botonLimpiar1);
            this.grpBotonera.Dock = System.Windows.Forms.DockStyle.Bottom;
            this.grpBotonera.ForeColor = System.Drawing.SystemColors.ControlLightLight;
            this.grpBotonera.Location = new System.Drawing.Point(0, 532);
            this.grpBotonera.Name = "grpBotonera";
            this.grpBotonera.Size = new System.Drawing.Size(692, 53);
            this.grpBotonera.TabIndex = 41;
            this.grpBotonera.TabStop = false;
            // 
            // botonGuardar1
            // 
            this.botonGuardar1.Location = new System.Drawing.Point(533, 15);
            this.botonGuardar1.Name = "botonGuardar1";
            this.botonGuardar1.Size = new System.Drawing.Size(128, 40);
            this.botonGuardar1.TabIndex = 16;
            // 
            // botonLimpiar1
            // 
            this.botonLimpiar1.AutoSize = true;
            this.botonLimpiar1.Location = new System.Drawing.Point(29, 15);
            this.botonLimpiar1.Name = "botonLimpiar1";
            this.botonLimpiar1.Size = new System.Drawing.Size(133, 41);
            this.botonLimpiar1.TabIndex = 17;
            // 
            // grpFiltros
            // 
            this.grpFiltros.BackColor = System.Drawing.Color.White;
            this.grpFiltros.Controls.Add(this.chkBloqueado);
            this.grpFiltros.Controls.Add(this.lblRol);
            this.grpFiltros.Controls.Add(this.lblUsername);
            this.grpFiltros.Controls.Add(this.txtPass);
            this.grpFiltros.Controls.Add(this.chkHabilitado);
            this.grpFiltros.Controls.Add(this.grpPass);
            this.grpFiltros.Dock = System.Windows.Forms.DockStyle.Top;
            this.grpFiltros.Font = new System.Drawing.Font("Calibri", 9F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.grpFiltros.ForeColor = System.Drawing.Color.Black;
            this.grpFiltros.Location = new System.Drawing.Point(0, 30);
            this.grpFiltros.Name = "grpFiltros";
            this.grpFiltros.Size = new System.Drawing.Size(692, 117);
            this.grpFiltros.TabIndex = 39;
            this.grpFiltros.TabStop = false;
            this.grpFiltros.Text = "Usuario";
            // 
            // chkBloqueado
            // 
            this.chkBloqueado.BackColor = System.Drawing.Color.White;
            this.chkBloqueado.Font = new System.Drawing.Font("Calibri", 9.75F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.chkBloqueado.ForeColor = System.Drawing.SystemColors.ButtonHighlight;
            this.chkBloqueado.Location = new System.Drawing.Point(345, 23);
            this.chkBloqueado.Name = "chkBloqueado";
            this.chkBloqueado.Size = new System.Drawing.Size(288, 25);
            this.chkBloqueado.TabIndex = 48;
            // 
            // lblRol
            // 
            this.lblRol.BackColor = System.Drawing.Color.White;
            this.lblRol.Font = new System.Drawing.Font("Calibri", 9F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.lblRol.Location = new System.Drawing.Point(16, 44);
            this.lblRol.Name = "lblRol";
            this.lblRol.Size = new System.Drawing.Size(314, 27);
            this.lblRol.TabIndex = 34;
            // 
            // lblUsername
            // 
            this.lblUsername.BackColor = System.Drawing.Color.White;
            this.lblUsername.Font = new System.Drawing.Font("Calibri", 9F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.lblUsername.Location = new System.Drawing.Point(16, 21);
            this.lblUsername.Name = "lblUsername";
            this.lblUsername.Size = new System.Drawing.Size(314, 27);
            this.lblUsername.TabIndex = 33;
            // 
            // txtPass
            // 
            this.txtPass.BackColor = System.Drawing.Color.White;
            this.txtPass.ForeColor = System.Drawing.Color.Black;
            this.txtPass.Location = new System.Drawing.Point(345, 46);
            this.txtPass.Name = "txtPass";
            this.txtPass.Size = new System.Drawing.Size(301, 50);
            this.txtPass.TabIndex = 32;
            // 
            // chkHabilitado
            // 
            this.chkHabilitado.BackColor = System.Drawing.Color.White;
            this.chkHabilitado.Font = new System.Drawing.Font("Calibri", 9.75F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.chkHabilitado.ForeColor = System.Drawing.SystemColors.ButtonHighlight;
            this.chkHabilitado.Location = new System.Drawing.Point(16, 71);
            this.chkHabilitado.Name = "chkHabilitado";
            this.chkHabilitado.Size = new System.Drawing.Size(301, 25);
            this.chkHabilitado.TabIndex = 31;
            // 
            // grpPass
            // 
            this.grpPass.Location = new System.Drawing.Point(335, 9);
            this.grpPass.Name = "grpPass";
            this.grpPass.Size = new System.Drawing.Size(351, 102);
            this.grpPass.TabIndex = 49;
            // 
            // pictureLogo1
            // 
            this.pictureLogo1.BackColor = System.Drawing.Color.Orange;
            this.pictureLogo1.Dock = System.Windows.Forms.DockStyle.Top;
            this.pictureLogo1.Location = new System.Drawing.Point(0, 0);
            this.pictureLogo1.Name = "pictureLogo1";
            this.pictureLogo1.Size = new System.Drawing.Size(692, 30);
            this.pictureLogo1.TabIndex = 40;
            // 
            // FormModificacionUsuario
            // 
            this.AutoScaleDimensions = new System.Drawing.SizeF(6F, 14F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.ClientSize = new System.Drawing.Size(692, 585);
            this.Controls.Add(this.tabCliente);
            this.Controls.Add(this.grpBotonera);
            this.Controls.Add(this.grpFiltros);
            this.Controls.Add(this.pictureLogo1);
            this.Font = new System.Drawing.Font("Calibri", 9F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.Name = "FormModificacionUsuario";
            this.StartPosition = System.Windows.Forms.FormStartPosition.CenterScreen;
            this.Text = "Modificacion usuario";
            this.Load += new System.EventHandler(this.FormModicacionUsuario_Load);
            this.tabCliente.ResumeLayout(false);
            this.tabPage1.ResumeLayout(false);
            this.tabEmpresa.ResumeLayout(false);
            this.grpBotonera.ResumeLayout(false);
            this.grpBotonera.PerformLayout();
            this.grpFiltros.ResumeLayout(false);
            this.ResumeLayout(false);

        }

        #endregion

        private System.Windows.Forms.TabControl tabCliente;
        private System.Windows.Forms.TabPage tabPage1;
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
        private ApplicationGdd1.combo cboTipoDoc;
        private ApplicationGdd1.Grupo grupDireccionCliente;
        private System.Windows.Forms.TabPage tabEmpresa;
        private ApplicationGdd1.TextoAlfanumerico txtNombreContacto;
        private ApplicationGdd1.combo cboLocalidadEmpresa;
        private ApplicationGdd1.Calendario calFechaCreacion;
        private ApplicationGdd1.TextoNumerico txtCpEmpresa;
        private ApplicationGdd1.TextoAlfanumerico txtCalleEmpresa;
        private ApplicationGdd1.TextoNumerico txtTelefonoEmpresa;
        private ApplicationGdd1.TextoNumerico txtNroDirEmpresa;
        private ApplicationGdd1.TextoAlfanumerico txtRSocial;
        private ApplicationGdd1.TextoAlfanumerico txtEmailEmpresa;
        private ApplicationGdd1.Grupo grupDireccionEmpresa;
        private ApplicationGdd1.Grupo grupContacto;
        private System.Windows.Forms.GroupBox grpBotonera;
        private ApplicationGdd1.BotonGuardar botonGuardar1;
        private ApplicationGdd1.BotonLimpiar botonLimpiar1;
        private System.Windows.Forms.GroupBox grpFiltros;
        private ApplicationGdd1.TextoPassword txtPass;
        private ApplicationGdd1.Check chkHabilitado;
        private ApplicationGdd1.PictureLogo pictureLogo1;
        private UserControls.LabelNoEditable lblRol;
        private UserControls.LabelNoEditable lblUsername;
        private ApplicationGdd1.TextoAlfanumerico txtApellido;
        private ApplicationGdd1.TextoAlfanumerico txtCiudad;
        private ApplicationGdd1.TextoAlfanumerico txtRubroEmpresa;
        private ApplicationGdd1.Check chkBloqueado;
        private ApplicationGdd1.Grupo grpPass;
        private ApplicationGdd1.TextoNumerico txtPisoEmpresa;
        private UserControls.TextoEspecial txtCuit;
        private ApplicationGdd1.TextoAlfanumerico txtDeptoEmpresa;
    }
}