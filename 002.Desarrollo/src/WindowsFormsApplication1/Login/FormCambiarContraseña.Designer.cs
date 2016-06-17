namespace MercadoEnvioDesktop.Login
{
    partial class FormCambiarContraseña
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
            this.txtContraseñaAnterior = new ApplicationGdd1.TextoAlfanumerico();
            this.grpContraseñas = new System.Windows.Forms.GroupBox();
            this.txtPass = new ApplicationGdd1.TextoPassword();
            this.btnGuardar = new ApplicationGdd1.BotonGuardar();
            this.grpBotonera = new System.Windows.Forms.GroupBox();
            this.btnLimpiar = new ApplicationGdd1.BotonLimpiar();
            this.grpContraseñas.SuspendLayout();
            this.grpBotonera.SuspendLayout();
            this.SuspendLayout();
            // 
            // pictureLogo1
            // 
            this.pictureLogo1.BackColor = System.Drawing.Color.Orange;
            this.pictureLogo1.Dock = System.Windows.Forms.DockStyle.Top;
            this.pictureLogo1.Location = new System.Drawing.Point(0, 0);
            this.pictureLogo1.Name = "pictureLogo1";
            this.pictureLogo1.Size = new System.Drawing.Size(371, 26);
            this.pictureLogo1.TabIndex = 0;
            // 
            // txtContraseñaAnterior
            // 
            this.txtContraseñaAnterior.BackColor = System.Drawing.SystemColors.ButtonHighlight;
            this.txtContraseñaAnterior.Location = new System.Drawing.Point(12, 21);
            this.txtContraseñaAnterior.Name = "txtContraseñaAnterior";
            this.txtContraseñaAnterior.Size = new System.Drawing.Size(336, 27);
            this.txtContraseñaAnterior.TabIndex = 18;
            // 
            // grpContraseñas
            // 
            this.grpContraseñas.BackColor = System.Drawing.Color.White;
            this.grpContraseñas.Controls.Add(this.txtContraseñaAnterior);
            this.grpContraseñas.Controls.Add(this.txtPass);
            this.grpContraseñas.Dock = System.Windows.Forms.DockStyle.Fill;
            this.grpContraseñas.Location = new System.Drawing.Point(0, 26);
            this.grpContraseñas.Name = "grpContraseñas";
            this.grpContraseñas.Size = new System.Drawing.Size(371, 155);
            this.grpContraseñas.TabIndex = 19;
            this.grpContraseñas.TabStop = false;
            // 
            // txtPass
            // 
            this.txtPass.BackColor = System.Drawing.Color.White;
            this.txtPass.ForeColor = System.Drawing.Color.Black;
            this.txtPass.Location = new System.Drawing.Point(12, 49);
            this.txtPass.Name = "txtPass";
            this.txtPass.Size = new System.Drawing.Size(336, 50);
            this.txtPass.TabIndex = 19;
            // 
            // btnGuardar
            // 
            this.btnGuardar.Location = new System.Drawing.Point(254, 15);
            this.btnGuardar.Name = "btnGuardar";
            this.btnGuardar.Size = new System.Drawing.Size(80, 24);
            this.btnGuardar.TabIndex = 20;
            // 
            // grpBotonera
            // 
            this.grpBotonera.BackColor = System.Drawing.Color.GhostWhite;
            this.grpBotonera.Controls.Add(this.btnGuardar);
            this.grpBotonera.Controls.Add(this.btnLimpiar);
            this.grpBotonera.Dock = System.Windows.Forms.DockStyle.Bottom;
            this.grpBotonera.ForeColor = System.Drawing.SystemColors.ControlLightLight;
            this.grpBotonera.Location = new System.Drawing.Point(0, 181);
            this.grpBotonera.Name = "grpBotonera";
            this.grpBotonera.Size = new System.Drawing.Size(371, 53);
            this.grpBotonera.TabIndex = 41;
            this.grpBotonera.TabStop = false;
            // 
            // btnLimpiar
            // 
            this.btnLimpiar.AutoSize = true;
            this.btnLimpiar.Location = new System.Drawing.Point(29, 15);
            this.btnLimpiar.Name = "btnLimpiar";
            this.btnLimpiar.Size = new System.Drawing.Size(85, 29);
            this.btnLimpiar.TabIndex = 18;
            // 
            // FormCambiarContraseña
            // 
            this.AutoScaleDimensions = new System.Drawing.SizeF(6F, 14F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.ClientSize = new System.Drawing.Size(371, 234);
            this.Controls.Add(this.grpContraseñas);
            this.Controls.Add(this.pictureLogo1);
            this.Controls.Add(this.grpBotonera);
            this.Font = new System.Drawing.Font("Calibri", 9F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.Name = "FormCambiarContraseña";
            this.StartPosition = System.Windows.Forms.FormStartPosition.CenterScreen;
            this.Text = "Cambiar contraseña";
            this.grpContraseñas.ResumeLayout(false);
            this.grpBotonera.ResumeLayout(false);
            this.grpBotonera.PerformLayout();
            this.ResumeLayout(false);

        }

        #endregion

        private ApplicationGdd1.PictureLogo pictureLogo1;
        private ApplicationGdd1.TextoAlfanumerico txtContraseñaAnterior;
        private System.Windows.Forms.GroupBox grpContraseñas;
        private ApplicationGdd1.TextoPassword txtPass;
        private ApplicationGdd1.BotonGuardar btnGuardar;
        private System.Windows.Forms.GroupBox grpBotonera;
        private ApplicationGdd1.BotonLimpiar btnLimpiar;
    }
}