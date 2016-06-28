namespace MercadoEnvioDesktop.ABM_Rol
{
    partial class FormModificarRol
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
            this.grpFuncionalidades = new System.Windows.Forms.GroupBox();
            this.groupBox1 = new System.Windows.Forms.GroupBox();
            this.btnAsignar = new System.Windows.Forms.Button();
            this.btnDesasignar = new System.Windows.Forms.Button();
            this.groupBox2 = new System.Windows.Forms.GroupBox();
            this.lstFuncionDisponibles = new ApplicationGdd1.ListaOpciones();
            this.lstFuncionActuales = new ApplicationGdd1.ListaOpciones();
            this.txtNombre = new ApplicationGdd1.TextoAlfanumerico();
            this.chkHabilitado = new ApplicationGdd1.Check();
            this.botonGuardar1 = new ApplicationGdd1.BotonGuardar();
            this.botonLimpiar1 = new ApplicationGdd1.BotonLimpiar();
            this.pictureLogo1 = new ApplicationGdd1.PictureLogo();
            this.grpBotonera.SuspendLayout();
            this.grpFuncionalidades.SuspendLayout();
            this.groupBox1.SuspendLayout();
            this.groupBox2.SuspendLayout();
            this.SuspendLayout();
            // 
            // grpBotonera
            // 
            this.grpBotonera.BackColor = System.Drawing.Color.GhostWhite;
            this.grpBotonera.Controls.Add(this.botonGuardar1);
            this.grpBotonera.Controls.Add(this.botonLimpiar1);
            this.grpBotonera.Dock = System.Windows.Forms.DockStyle.Bottom;
            this.grpBotonera.ForeColor = System.Drawing.SystemColors.ControlLightLight;
            this.grpBotonera.Location = new System.Drawing.Point(0, 468);
            this.grpBotonera.Name = "grpBotonera";
            this.grpBotonera.Size = new System.Drawing.Size(513, 53);
            this.grpBotonera.TabIndex = 43;
            this.grpBotonera.TabStop = false;
            // 
            // grpFuncionalidades
            // 
            this.grpFuncionalidades.Controls.Add(this.groupBox1);
            this.grpFuncionalidades.Controls.Add(this.lstFuncionDisponibles);
            this.grpFuncionalidades.Controls.Add(this.lstFuncionActuales);
            this.grpFuncionalidades.Dock = System.Windows.Forms.DockStyle.Fill;
            this.grpFuncionalidades.Location = new System.Drawing.Point(0, 123);
            this.grpFuncionalidades.Name = "grpFuncionalidades";
            this.grpFuncionalidades.Size = new System.Drawing.Size(513, 345);
            this.grpFuncionalidades.TabIndex = 45;
            this.grpFuncionalidades.TabStop = false;
            this.grpFuncionalidades.Text = "Funcionalidades";
            // 
            // groupBox1
            // 
            this.groupBox1.BackColor = System.Drawing.Color.GhostWhite;
            this.groupBox1.Controls.Add(this.btnAsignar);
            this.groupBox1.Controls.Add(this.btnDesasignar);
            this.groupBox1.Location = new System.Drawing.Point(240, 57);
            this.groupBox1.Name = "groupBox1";
            this.groupBox1.Size = new System.Drawing.Size(30, 273);
            this.groupBox1.TabIndex = 50;
            this.groupBox1.TabStop = false;
            // 
            // btnAsignar
            // 
            this.btnAsignar.BackColor = System.Drawing.SystemColors.HotTrack;
            this.btnAsignar.ForeColor = System.Drawing.Color.White;
            this.btnAsignar.Location = new System.Drawing.Point(0, 79);
            this.btnAsignar.Name = "btnAsignar";
            this.btnAsignar.Size = new System.Drawing.Size(30, 23);
            this.btnAsignar.TabIndex = 45;
            this.btnAsignar.Text = ">";
            this.btnAsignar.UseVisualStyleBackColor = false;
            this.btnAsignar.Click += new System.EventHandler(this.btnAsignar_Click);
            // 
            // btnDesasignar
            // 
            this.btnDesasignar.BackColor = System.Drawing.SystemColors.HotTrack;
            this.btnDesasignar.ForeColor = System.Drawing.Color.White;
            this.btnDesasignar.Location = new System.Drawing.Point(0, 139);
            this.btnDesasignar.Name = "btnDesasignar";
            this.btnDesasignar.Size = new System.Drawing.Size(30, 23);
            this.btnDesasignar.TabIndex = 48;
            this.btnDesasignar.Text = "<";
            this.btnDesasignar.UseVisualStyleBackColor = false;
            this.btnDesasignar.Click += new System.EventHandler(this.btnDesasignar_Click);
            // 
            // groupBox2
            // 
            this.groupBox2.Controls.Add(this.txtNombre);
            this.groupBox2.Controls.Add(this.chkHabilitado);
            this.groupBox2.Dock = System.Windows.Forms.DockStyle.Top;
            this.groupBox2.Font = new System.Drawing.Font("Calibri", 9F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.groupBox2.Location = new System.Drawing.Point(0, 26);
            this.groupBox2.Name = "groupBox2";
            this.groupBox2.Size = new System.Drawing.Size(513, 97);
            this.groupBox2.TabIndex = 50;
            this.groupBox2.TabStop = false;
            // 
            // lstFuncionDisponibles
            // 
            this.lstFuncionDisponibles.Dock = System.Windows.Forms.DockStyle.Left;
            this.lstFuncionDisponibles.Location = new System.Drawing.Point(3, 16);
            this.lstFuncionDisponibles.Name = "lstFuncionDisponibles";
            this.lstFuncionDisponibles.Size = new System.Drawing.Size(215, 326);
            this.lstFuncionDisponibles.TabIndex = 42;
            // 
            // lstFuncionActuales
            // 
            this.lstFuncionActuales.Dock = System.Windows.Forms.DockStyle.Right;
            this.lstFuncionActuales.Location = new System.Drawing.Point(295, 16);
            this.lstFuncionActuales.Name = "lstFuncionActuales";
            this.lstFuncionActuales.Size = new System.Drawing.Size(215, 326);
            this.lstFuncionActuales.TabIndex = 44;
            // 
            // txtNombre
            // 
            this.txtNombre.BackColor = System.Drawing.SystemColors.ButtonHighlight;
            this.txtNombre.Location = new System.Drawing.Point(29, 21);
            this.txtNombre.Name = "txtNombre";
            this.txtNombre.Size = new System.Drawing.Size(467, 27);
            this.txtNombre.TabIndex = 41;
            // 
            // chkHabilitado
            // 
            this.chkHabilitado.BackColor = System.Drawing.Color.White;
            this.chkHabilitado.Font = new System.Drawing.Font("Calibri", 9.75F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.chkHabilitado.ForeColor = System.Drawing.SystemColors.ButtonHighlight;
            this.chkHabilitado.Location = new System.Drawing.Point(29, 59);
            this.chkHabilitado.Name = "chkHabilitado";
            this.chkHabilitado.Size = new System.Drawing.Size(288, 25);
            this.chkHabilitado.TabIndex = 49;
            // 
            // botonGuardar1
            // 
            this.botonGuardar1.Location = new System.Drawing.Point(398, 13);
            this.botonGuardar1.Name = "botonGuardar1";
            this.botonGuardar1.Size = new System.Drawing.Size(80, 28);
            this.botonGuardar1.TabIndex = 17;
            // 
            // botonLimpiar1
            // 
            this.botonLimpiar1.AutoSize = true;
            this.botonLimpiar1.Location = new System.Drawing.Point(29, 15);
            this.botonLimpiar1.Name = "botonLimpiar1";
            this.botonLimpiar1.Size = new System.Drawing.Size(85, 29);
            this.botonLimpiar1.TabIndex = 18;
            // 
            // pictureLogo1
            // 
            this.pictureLogo1.BackColor = System.Drawing.Color.Orange;
            this.pictureLogo1.Dock = System.Windows.Forms.DockStyle.Top;
            this.pictureLogo1.Location = new System.Drawing.Point(0, 0);
            this.pictureLogo1.Name = "pictureLogo1";
            this.pictureLogo1.Size = new System.Drawing.Size(513, 26);
            this.pictureLogo1.TabIndex = 0;
            // 
            // FormModificarRol
            // 
            this.AutoScaleDimensions = new System.Drawing.SizeF(6F, 13F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.BackColor = System.Drawing.Color.White;
            this.ClientSize = new System.Drawing.Size(513, 521);
            this.Controls.Add(this.grpFuncionalidades);
            this.Controls.Add(this.groupBox2);
            this.Controls.Add(this.grpBotonera);
            this.Controls.Add(this.pictureLogo1);
            this.Name = "FormModificarRol";
            this.StartPosition = System.Windows.Forms.FormStartPosition.CenterScreen;
            this.Text = "Modificar rol";
            this.Load += new System.EventHandler(this.FormModificarRol_Load);
            this.grpBotonera.ResumeLayout(false);
            this.grpBotonera.PerformLayout();
            this.grpFuncionalidades.ResumeLayout(false);
            this.groupBox1.ResumeLayout(false);
            this.groupBox2.ResumeLayout(false);
            this.ResumeLayout(false);

        }

        #endregion

        private ApplicationGdd1.PictureLogo pictureLogo1;
        private System.Windows.Forms.GroupBox grpBotonera;
        private ApplicationGdd1.BotonGuardar botonGuardar1;
        private ApplicationGdd1.BotonLimpiar botonLimpiar1;
        private ApplicationGdd1.ListaOpciones lstFuncionDisponibles;
        private ApplicationGdd1.TextoAlfanumerico txtNombre;
        private ApplicationGdd1.ListaOpciones lstFuncionActuales;
        private System.Windows.Forms.GroupBox grpFuncionalidades;
        private System.Windows.Forms.Button btnDesasignar;
        private System.Windows.Forms.Button btnAsignar;
        private ApplicationGdd1.Check chkHabilitado;
        private System.Windows.Forms.GroupBox groupBox1;
        private System.Windows.Forms.GroupBox groupBox2;
    }
}