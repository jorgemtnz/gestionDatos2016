namespace ApplicationGdd1
{
    partial class Check
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
            this.chkOpcion = new System.Windows.Forms.CheckBox();
            this.SuspendLayout();
            // 
            // chkOpcion
            // 
            this.chkOpcion.AutoSize = true;
            this.chkOpcion.Font = new System.Drawing.Font("Calibri", 9.75F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.chkOpcion.ForeColor = System.Drawing.Color.Black;
            this.chkOpcion.Location = new System.Drawing.Point(12, 3);
            this.chkOpcion.Name = "chkOpcion";
            this.chkOpcion.Size = new System.Drawing.Size(58, 19);
            this.chkOpcion.TabIndex = 1;
            this.chkOpcion.Text = "Check";
            this.chkOpcion.UseVisualStyleBackColor = true;
            this.chkOpcion.CheckedChanged += new System.EventHandler(this.chkOpcion_CheckedChanged);
            // 
            // Check
            // 
            this.AutoScaleDimensions = new System.Drawing.SizeF(7F, 15F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.BackColor = System.Drawing.Color.White;
            this.Controls.Add(this.chkOpcion);
            this.Font = new System.Drawing.Font("Calibri", 9.75F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.ForeColor = System.Drawing.SystemColors.ButtonHighlight;
            this.Name = "Check";
            this.Size = new System.Drawing.Size(94, 25);
            this.ResumeLayout(false);
            this.PerformLayout();

        }

        #endregion

        private System.Windows.Forms.CheckBox chkOpcion;
    }
}
