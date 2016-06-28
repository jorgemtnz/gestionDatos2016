namespace MercadoEnvioDesktop.UserControls
{
    partial class TextoDecimal
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
            this.lblNumerico = new System.Windows.Forms.Label();
            this.pctColor = new System.Windows.Forms.PictureBox();
            this.txtNumerico = new System.Windows.Forms.TextBox();
            ((System.ComponentModel.ISupportInitialize)(this.pctColor)).BeginInit();
            this.SuspendLayout();
            // 
            // lblNumerico
            // 
            this.lblNumerico.AutoSize = true;
            this.lblNumerico.BackColor = System.Drawing.Color.White;
            this.lblNumerico.Font = new System.Drawing.Font("Calibri", 9F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.lblNumerico.ForeColor = System.Drawing.Color.Black;
            this.lblNumerico.Location = new System.Drawing.Point(28, 6);
            this.lblNumerico.Name = "lblNumerico";
            this.lblNumerico.Size = new System.Drawing.Size(72, 14);
            this.lblNumerico.TabIndex = 6;
            this.lblNumerico.Text = "Texto Decim";
            // 
            // pctColor
            // 
            this.pctColor.BackColor = System.Drawing.Color.Orange;
            this.pctColor.Location = new System.Drawing.Point(12, 8);
            this.pctColor.Name = "pctColor";
            this.pctColor.Size = new System.Drawing.Size(10, 10);
            this.pctColor.TabIndex = 5;
            this.pctColor.TabStop = false;
            // 
            // txtNumerico
            // 
            this.txtNumerico.BackColor = System.Drawing.Color.White;
            this.txtNumerico.Font = new System.Drawing.Font("Calibri", 9F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.txtNumerico.ForeColor = System.Drawing.Color.Black;
            this.txtNumerico.Location = new System.Drawing.Point(164, 2);
            this.txtNumerico.Name = "txtNumerico";
            this.txtNumerico.Size = new System.Drawing.Size(124, 22);
            this.txtNumerico.TabIndex = 4;
            this.txtNumerico.EnabledChanged += new System.EventHandler(this.txtNumerico_EnabledChanged);
            this.txtNumerico.KeyPress += new System.Windows.Forms.KeyPressEventHandler(this.txtNumerico_KeyPress);
            // 
            // TextoDecimal
            // 
            this.AutoScaleDimensions = new System.Drawing.SizeF(6F, 13F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.BackColor = System.Drawing.Color.White;
            this.Controls.Add(this.lblNumerico);
            this.Controls.Add(this.pctColor);
            this.Controls.Add(this.txtNumerico);
            this.Name = "TextoDecimal";
            this.Size = new System.Drawing.Size(301, 25);
            ((System.ComponentModel.ISupportInitialize)(this.pctColor)).EndInit();
            this.ResumeLayout(false);
            this.PerformLayout();

        }

        #endregion

        private System.Windows.Forms.Label lblNumerico;
        private System.Windows.Forms.PictureBox pctColor;
        private System.Windows.Forms.TextBox txtNumerico;
    }
}
