namespace MercadoEnvioDesktop.UserControls
{
    partial class LabelNoEditable
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
            this.lblTitulo = new System.Windows.Forms.Label();
            this.pctColor = new System.Windows.Forms.PictureBox();
            this.lblDetalle = new System.Windows.Forms.TextBox();
            ((System.ComponentModel.ISupportInitialize)(this.pctColor)).BeginInit();
            this.SuspendLayout();
            // 
            // lblTitulo
            // 
            this.lblTitulo.AutoSize = true;
            this.lblTitulo.Font = new System.Drawing.Font("Calibri", 9F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.lblTitulo.ForeColor = System.Drawing.SystemColors.ActiveCaptionText;
            this.lblTitulo.Location = new System.Drawing.Point(28, 6);
            this.lblTitulo.Name = "lblTitulo";
            this.lblTitulo.Size = new System.Drawing.Size(60, 14);
            this.lblTitulo.TabIndex = 8;
            this.lblTitulo.Text = "Texto alfa";
            // 
            // pctColor
            // 
            this.pctColor.BackColor = System.Drawing.Color.PaleGoldenrod;
            this.pctColor.Location = new System.Drawing.Point(12, 8);
            this.pctColor.Name = "pctColor";
            this.pctColor.Size = new System.Drawing.Size(10, 10);
            this.pctColor.TabIndex = 7;
            this.pctColor.TabStop = false;
            // 
            // lblDetalle
            // 
            this.lblDetalle.BorderStyle = System.Windows.Forms.BorderStyle.None;
            this.lblDetalle.Location = new System.Drawing.Point(164, 6);
            this.lblDetalle.Multiline = true;
            this.lblDetalle.Name = "lblDetalle";
            this.lblDetalle.Size = new System.Drawing.Size(435, 20);
            this.lblDetalle.TabIndex = 10;
            // 
            // LabelNoEditable
            // 
            this.AutoScaleDimensions = new System.Drawing.SizeF(6F, 14F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.BackColor = System.Drawing.Color.PeachPuff;
            this.Controls.Add(this.lblDetalle);
            this.Controls.Add(this.lblTitulo);
            this.Controls.Add(this.pctColor);
            this.Font = new System.Drawing.Font("Calibri", 9F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.Name = "LabelNoEditable";
            this.Size = new System.Drawing.Size(617, 27);
            ((System.ComponentModel.ISupportInitialize)(this.pctColor)).EndInit();
            this.ResumeLayout(false);
            this.PerformLayout();

        }

        #endregion

        private System.Windows.Forms.Label lblTitulo;
        private System.Windows.Forms.PictureBox pctColor;
        private System.Windows.Forms.TextBox lblDetalle;
    }
}
