namespace MercadoEnvioDesktop.Calificar
{
    partial class FormCalificar
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
            this.grpCalificar = new System.Windows.Forms.GroupBox();
            this.option1 = new MercadoEnvioDesktop.UserControls.Option();
            this.lblVendedor = new MercadoEnvioDesktop.UserControls.LabelNoEditable();
            this.lblPublicacion = new MercadoEnvioDesktop.UserControls.LabelNoEditable();
            this.txtComentarios = new ApplicationGdd1.TextoAlfanumerico();
            this.grpBotonera = new System.Windows.Forms.GroupBox();
            this.botonGuardar1 = new ApplicationGdd1.BotonGuardar();
            this.botonLimpiar1 = new ApplicationGdd1.BotonLimpiar();
            this.grpCalificar.SuspendLayout();
            this.grpBotonera.SuspendLayout();
            this.SuspendLayout();
            // 
            // pictureLogo1
            // 
            this.pictureLogo1.BackColor = System.Drawing.Color.Orange;
            this.pictureLogo1.Dock = System.Windows.Forms.DockStyle.Top;
            this.pictureLogo1.Location = new System.Drawing.Point(0, 0);
            this.pictureLogo1.Name = "pictureLogo1";
            this.pictureLogo1.Size = new System.Drawing.Size(489, 26);
            this.pictureLogo1.TabIndex = 0;
            // 
            // grpCalificar
            // 
            this.grpCalificar.BackColor = System.Drawing.Color.White;
            this.grpCalificar.Controls.Add(this.option1);
            this.grpCalificar.Controls.Add(this.lblVendedor);
            this.grpCalificar.Controls.Add(this.lblPublicacion);
            this.grpCalificar.Controls.Add(this.txtComentarios);
            this.grpCalificar.Dock = System.Windows.Forms.DockStyle.Fill;
            this.grpCalificar.Location = new System.Drawing.Point(0, 26);
            this.grpCalificar.Name = "grpCalificar";
            this.grpCalificar.Size = new System.Drawing.Size(489, 229);
            this.grpCalificar.TabIndex = 1;
            this.grpCalificar.TabStop = false;
            this.grpCalificar.Text = "Completar calificación";
            // 
            // option1
            // 
            this.option1.BackColor = System.Drawing.Color.White;
            this.option1.Location = new System.Drawing.Point(6, 71);
            this.option1.Name = "option1";
            this.option1.Size = new System.Drawing.Size(130, 125);
            this.option1.TabIndex = 19;
            // 
            // lblVendedor
            // 
            this.lblVendedor.BackColor = System.Drawing.Color.White;
            this.lblVendedor.Font = new System.Drawing.Font("Calibri", 9F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.lblVendedor.Location = new System.Drawing.Point(6, 46);
            this.lblVendedor.Name = "lblVendedor";
            this.lblVendedor.Size = new System.Drawing.Size(471, 25);
            this.lblVendedor.TabIndex = 2;
            // 
            // lblPublicacion
            // 
            this.lblPublicacion.BackColor = System.Drawing.Color.White;
            this.lblPublicacion.Font = new System.Drawing.Font("Calibri", 9F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.lblPublicacion.Location = new System.Drawing.Point(6, 21);
            this.lblPublicacion.Name = "lblPublicacion";
            this.lblPublicacion.Size = new System.Drawing.Size(471, 25);
            this.lblPublicacion.TabIndex = 1;
            // 
            // txtComentarios
            // 
            this.txtComentarios.BackColor = System.Drawing.Color.White;
            this.txtComentarios.Location = new System.Drawing.Point(161, 71);
            this.txtComentarios.Name = "txtComentarios";
            this.txtComentarios.Size = new System.Drawing.Size(316, 129);
            this.txtComentarios.TabIndex = 0;
            // 
            // grpBotonera
            // 
            this.grpBotonera.BackColor = System.Drawing.Color.GhostWhite;
            this.grpBotonera.Controls.Add(this.botonGuardar1);
            this.grpBotonera.Controls.Add(this.botonLimpiar1);
            this.grpBotonera.Dock = System.Windows.Forms.DockStyle.Bottom;
            this.grpBotonera.ForeColor = System.Drawing.SystemColors.ControlLightLight;
            this.grpBotonera.Location = new System.Drawing.Point(0, 255);
            this.grpBotonera.Name = "grpBotonera";
            this.grpBotonera.Size = new System.Drawing.Size(489, 53);
            this.grpBotonera.TabIndex = 38;
            this.grpBotonera.TabStop = false;
            // 
            // botonGuardar1
            // 
            this.botonGuardar1.Location = new System.Drawing.Point(367, 18);
            this.botonGuardar1.Name = "botonGuardar1";
            this.botonGuardar1.Size = new System.Drawing.Size(97, 27);
            this.botonGuardar1.TabIndex = 17;
            // 
            // botonLimpiar1
            // 
            this.botonLimpiar1.AutoSize = true;
            this.botonLimpiar1.Location = new System.Drawing.Point(32, 18);
            this.botonLimpiar1.Name = "botonLimpiar1";
            this.botonLimpiar1.Size = new System.Drawing.Size(89, 29);
            this.botonLimpiar1.TabIndex = 18;
            // 
            // FormCalificar
            // 
            this.AutoScaleDimensions = new System.Drawing.SizeF(6F, 14F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.ClientSize = new System.Drawing.Size(489, 308);
            this.Controls.Add(this.grpCalificar);
            this.Controls.Add(this.pictureLogo1);
            this.Controls.Add(this.grpBotonera);
            this.Font = new System.Drawing.Font("Calibri", 9F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.Name = "FormCalificar";
            this.StartPosition = System.Windows.Forms.FormStartPosition.CenterScreen;
            this.Text = "Calificar";
            this.Load += new System.EventHandler(this.FormCalificar_Load);
            this.grpCalificar.ResumeLayout(false);
            this.grpBotonera.ResumeLayout(false);
            this.grpBotonera.PerformLayout();
            this.ResumeLayout(false);

        }

        #endregion

        private ApplicationGdd1.PictureLogo pictureLogo1;
        private System.Windows.Forms.GroupBox grpCalificar;
        private System.Windows.Forms.GroupBox grpBotonera;
        private ApplicationGdd1.BotonGuardar botonGuardar1;
        private ApplicationGdd1.BotonLimpiar botonLimpiar1;
        private ApplicationGdd1.TextoAlfanumerico txtComentarios;
        private UserControls.LabelNoEditable lblVendedor;
        private UserControls.LabelNoEditable lblPublicacion;
        private UserControls.Option option1;
    }
}