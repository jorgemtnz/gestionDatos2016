namespace ApplicationGdd1
{
    partial class FormSeleccion
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
            this.grpFiltros = new System.Windows.Forms.GroupBox();
            this.grpBotonera = new System.Windows.Forms.GroupBox();
            this.btnBuscar = new ApplicationGdd1.BotonBuscar();
            this.btnLimpiar = new ApplicationGdd1.BotonLimpiar();
            this.grpBotonera.SuspendLayout();
            this.SuspendLayout();
            // 
            // grilla1
            // 
            this.grilla1.BackColor = System.Drawing.SystemColors.ActiveCaptionText;
            this.grilla1.Dock = System.Windows.Forms.DockStyle.Fill;
            this.grilla1.Location = new System.Drawing.Point(0, 146);
            this.grilla1.Name = "grilla1";
            this.grilla1.Size = new System.Drawing.Size(659, 457);
            this.grilla1.TabIndex = 0;
            // 
            // grpFiltros
            // 
            this.grpFiltros.BackColor = System.Drawing.Color.White;
            this.grpFiltros.Dock = System.Windows.Forms.DockStyle.Top;
            this.grpFiltros.Location = new System.Drawing.Point(0, 0);
            this.grpFiltros.Name = "grpFiltros";
            this.grpFiltros.Size = new System.Drawing.Size(659, 92);
            this.grpFiltros.TabIndex = 1;
            this.grpFiltros.TabStop = false;
            this.grpFiltros.Text = "Filtros de busqueda";
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
            this.grpBotonera.Size = new System.Drawing.Size(659, 54);
            this.grpBotonera.TabIndex = 26;
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
            this.btnLimpiar.Load += new System.EventHandler(this.btnLimpiar_Load);
            // 
            // FormSeleccion
            // 
            this.AutoScaleDimensions = new System.Drawing.SizeF(6F, 14F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.ClientSize = new System.Drawing.Size(659, 603);
            this.Controls.Add(this.grilla1);
            this.Controls.Add(this.grpBotonera);
            this.Controls.Add(this.grpFiltros);
            this.Font = new System.Drawing.Font("Calibri", 9F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.Name = "FormSeleccion";
            this.StartPosition = System.Windows.Forms.FormStartPosition.CenterScreen;
            this.Text = "Seleccionar";
            this.grpBotonera.ResumeLayout(false);
            this.grpBotonera.PerformLayout();
            this.ResumeLayout(false);

        }

        #endregion

        private Grilla grilla1;
        private System.Windows.Forms.GroupBox grpFiltros;
        private System.Windows.Forms.GroupBox grpBotonera;
        private BotonBuscar btnBuscar;
        private BotonLimpiar btnLimpiar;
    }
}