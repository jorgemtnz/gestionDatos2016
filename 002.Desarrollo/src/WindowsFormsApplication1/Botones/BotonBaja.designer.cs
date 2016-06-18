namespace ApplicationGdd1
{
    partial class BotonBaja
    {
        /// <summary> 
        /// Variable del diseñador requerida.
        /// </summary>
        private System.ComponentModel.IContainer components = null;

        /// <summary> 
        /// Limpiar los recursos que se estén utilizando.
        /// </summary>
        /// <param name="disposing">true si los recursos administrados se deben eliminar; false en caso contrario.</param>
        protected override void Dispose(bool disposing)
        {
            if (disposing && (components != null))
            {
                components.Dispose();
            }
            base.Dispose(disposing);
        }

        #region Código generado por el Diseñador de componentes

        /// <summary> 
        /// Método necesario para admitir el Diseñador. No se puede modificar 
        /// el contenido del método con el editor de código.
        /// </summary>
        private void InitializeComponent()
        {
            this.btnBaja = new System.Windows.Forms.Button();
            this.SuspendLayout();
            // 
            // btnBuscar
            // 
            this.btnBaja.BackColor = System.Drawing.SystemColors.HotTrack;
            this.btnBaja.FlatAppearance.BorderColor = System.Drawing.Color.White;
            this.btnBaja.FlatAppearance.MouseDownBackColor = System.Drawing.SystemColors.MenuHighlight;
            this.btnBaja.FlatAppearance.MouseOverBackColor = System.Drawing.Color.DeepSkyBlue;
            this.btnBaja.FlatStyle = System.Windows.Forms.FlatStyle.Flat;
            this.btnBaja.Font = new System.Drawing.Font("Calibri", 9F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.btnBaja.ForeColor = System.Drawing.SystemColors.ControlLightLight;
            this.btnBaja.Location = new System.Drawing.Point(0, 0);
            this.btnBaja.Name = "btnBaja";
            this.btnBaja.Size = new System.Drawing.Size(80, 24);
            this.btnBaja.TabIndex = 1;
            this.btnBaja.Text = "Baja";
            this.btnBaja.UseVisualStyleBackColor = false;
            this.btnBaja.Click += new System.EventHandler(this.btnBaja_Click);
            // 
            // BotonBuscar
            // 
            this.AutoScaleDimensions = new System.Drawing.SizeF(6F, 13F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.Controls.Add(this.btnBaja);
            this.Name = "BotonBaja";
            this.Size = new System.Drawing.Size(83, 27);
            this.ResumeLayout(false);

        }

        #endregion

        private System.Windows.Forms.Button btnBaja;
    }
}
