﻿namespace MercadoEnvioDesktop.ABM_Rol
{
    partial class FormAltaRol
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
            this.grpRol = new System.Windows.Forms.GroupBox();
            this.lstFuncionalidades = new ApplicationGdd1.ListaOpciones();
            this.txtNombre = new ApplicationGdd1.TextoAlfanumerico();
            this.grpBotonera = new System.Windows.Forms.GroupBox();
            this.botonGuardar1 = new ApplicationGdd1.BotonGuardar();
            this.botonLimpiar1 = new ApplicationGdd1.BotonLimpiar();
            this.pictureLogo1 = new ApplicationGdd1.PictureLogo();
            this.grpRol.SuspendLayout();
            this.grpBotonera.SuspendLayout();
            this.SuspendLayout();
            // 
            // grpRol
            // 
            this.grpRol.BackColor = System.Drawing.Color.White;
            this.grpRol.Controls.Add(this.lstFuncionalidades);
            this.grpRol.Controls.Add(this.txtNombre);
            this.grpRol.Dock = System.Windows.Forms.DockStyle.Fill;
            this.grpRol.Location = new System.Drawing.Point(0, 26);
            this.grpRol.Name = "grpRol";
            this.grpRol.Size = new System.Drawing.Size(526, 407);
            this.grpRol.TabIndex = 2;
            this.grpRol.TabStop = false;
            // 
            // lstFuncionalidades
            // 
            this.lstFuncionalidades.Location = new System.Drawing.Point(29, 80);
            this.lstFuncionalidades.Name = "lstFuncionalidades";
            this.lstFuncionalidades.Size = new System.Drawing.Size(467, 264);
            this.lstFuncionalidades.TabIndex = 2;
            // 
            // txtNombre
            // 
            this.txtNombre.BackColor = System.Drawing.SystemColors.ButtonHighlight;
            this.txtNombre.Location = new System.Drawing.Point(29, 40);
            this.txtNombre.Name = "txtNombre";
            this.txtNombre.Size = new System.Drawing.Size(467, 25);
            this.txtNombre.TabIndex = 1;
            // 
            // grpBotonera
            // 
            this.grpBotonera.BackColor = System.Drawing.Color.GhostWhite;
            this.grpBotonera.Controls.Add(this.botonGuardar1);
            this.grpBotonera.Controls.Add(this.botonLimpiar1);
            this.grpBotonera.Dock = System.Windows.Forms.DockStyle.Bottom;
            this.grpBotonera.ForeColor = System.Drawing.SystemColors.ControlLightLight;
            this.grpBotonera.Location = new System.Drawing.Point(0, 433);
            this.grpBotonera.Name = "grpBotonera";
            this.grpBotonera.Size = new System.Drawing.Size(526, 53);
            this.grpBotonera.TabIndex = 40;
            this.grpBotonera.TabStop = false;
            // 
            // botonGuardar1
            // 
            this.botonGuardar1.Location = new System.Drawing.Point(416, 13);
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
            this.pictureLogo1.Size = new System.Drawing.Size(526, 26);
            this.pictureLogo1.TabIndex = 0;
            // 
            // FormAltaRol
            // 
            this.AutoScaleDimensions = new System.Drawing.SizeF(6F, 14F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.ClientSize = new System.Drawing.Size(526, 486);
            this.Controls.Add(this.grpRol);
            this.Controls.Add(this.grpBotonera);
            this.Controls.Add(this.pictureLogo1);
            this.Font = new System.Drawing.Font("Calibri", 9F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.Name = "FormAltaRol";
            this.StartPosition = System.Windows.Forms.FormStartPosition.CenterScreen;
            this.Text = "ABM Rol";
            this.Load += new System.EventHandler(this.FormABMRol_Load);
            this.grpRol.ResumeLayout(false);
            this.grpBotonera.ResumeLayout(false);
            this.grpBotonera.PerformLayout();
            this.ResumeLayout(false);

        }

        #endregion

        private ApplicationGdd1.PictureLogo pictureLogo1;
        private ApplicationGdd1.TextoAlfanumerico txtNombre;
        private System.Windows.Forms.GroupBox grpRol;
        private System.Windows.Forms.GroupBox grpBotonera;
        private ApplicationGdd1.BotonGuardar botonGuardar1;
        private ApplicationGdd1.BotonLimpiar botonLimpiar1;
        private ApplicationGdd1.ListaOpciones lstFuncionalidades;
    }
}