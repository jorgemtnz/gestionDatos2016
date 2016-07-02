namespace MercadoEnvioDesktop.UserControls
{
    partial class TextoEspecial
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
            this.lblAlfanumerico = new System.Windows.Forms.Label();
            this.pctColor = new System.Windows.Forms.PictureBox();
            this.txtAlfanumerico = new System.Windows.Forms.TextBox();
            ((System.ComponentModel.ISupportInitialize)(this.pctColor)).BeginInit();
            this.SuspendLayout();
            // 
            // lblAlfanumerico
            // 
            this.lblAlfanumerico.AutoSize = true;
            this.lblAlfanumerico.Font = new System.Drawing.Font("Calibri", 9F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.lblAlfanumerico.ForeColor = System.Drawing.SystemColors.ActiveCaptionText;
            this.lblAlfanumerico.Location = new System.Drawing.Point(28, 6);
            this.lblAlfanumerico.Name = "lblAlfanumerico";
            this.lblAlfanumerico.Size = new System.Drawing.Size(60, 14);
            this.lblAlfanumerico.TabIndex = 9;
            this.lblAlfanumerico.Text = "Texto alfa";
            // 
            // pctColor
            // 
            this.pctColor.BackColor = System.Drawing.Color.Orange;
            this.pctColor.Location = new System.Drawing.Point(12, 8);
            this.pctColor.Name = "pctColor";
            this.pctColor.Size = new System.Drawing.Size(10, 10);
            this.pctColor.TabIndex = 8;
            this.pctColor.TabStop = false;
            // 
            // txtAlfanumerico
            // 
            this.txtAlfanumerico.BackColor = System.Drawing.Color.White;
            this.txtAlfanumerico.Font = new System.Drawing.Font("Calibri", 9F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.txtAlfanumerico.ForeColor = System.Drawing.Color.Black;
            this.txtAlfanumerico.Location = new System.Drawing.Point(164, 2);
            this.txtAlfanumerico.Name = "txtAlfanumerico";
            this.txtAlfanumerico.Size = new System.Drawing.Size(124, 22);
            this.txtAlfanumerico.TabIndex = 7;
            this.txtAlfanumerico.EnabledChanged += new System.EventHandler(this.txtAlfanumerico_EnabledChanged);
            this.txtAlfanumerico.KeyPress += new System.Windows.Forms.KeyPressEventHandler(this.txtAlfanumerico_KeyPress);
            // 
            // TextoEspecial
            // 
            this.AutoScaleDimensions = new System.Drawing.SizeF(6F, 13F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.BackColor = System.Drawing.Color.White;
            this.Controls.Add(this.lblAlfanumerico);
            this.Controls.Add(this.pctColor);
            this.Controls.Add(this.txtAlfanumerico);
            this.Name = "TextoEspecial";
            this.Size = new System.Drawing.Size(301, 25);
            ((System.ComponentModel.ISupportInitialize)(this.pctColor)).EndInit();
            this.ResumeLayout(false);
            this.PerformLayout();

        }

        #endregion

        private System.Windows.Forms.Label lblAlfanumerico;
        private System.Windows.Forms.PictureBox pctColor;
        private System.Windows.Forms.TextBox txtAlfanumerico;
    }
}
