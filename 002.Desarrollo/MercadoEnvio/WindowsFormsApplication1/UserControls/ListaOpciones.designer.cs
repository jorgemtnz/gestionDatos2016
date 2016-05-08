namespace ApplicationGdd1
{
    partial class ListaOpciones
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
            this.lstOpciones = new System.Windows.Forms.ListBox();
            this.lblOpciones = new System.Windows.Forms.Label();
            this.pctColor = new System.Windows.Forms.PictureBox();
            this.grpLabel = new System.Windows.Forms.GroupBox();
            ((System.ComponentModel.ISupportInitialize)(this.pctColor)).BeginInit();
            this.grpLabel.SuspendLayout();
            this.SuspendLayout();
            // 
            // lstOpciones
            // 
            this.lstOpciones.Dock = System.Windows.Forms.DockStyle.Fill;
            this.lstOpciones.Font = new System.Drawing.Font("Calibri", 9F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.lstOpciones.FormattingEnabled = true;
            this.lstOpciones.ItemHeight = 14;
            this.lstOpciones.Location = new System.Drawing.Point(0, 44);
            this.lstOpciones.Name = "lstOpciones";
            this.lstOpciones.SelectionMode = System.Windows.Forms.SelectionMode.MultiExtended;
            this.lstOpciones.Size = new System.Drawing.Size(218, 107);
            this.lstOpciones.TabIndex = 0;
            this.lstOpciones.SelectedIndexChanged += new System.EventHandler(this.lstOpciones_SelectedIndexChanged);
            // 
            // lblOpciones
            // 
            this.lblOpciones.AutoSize = true;
            this.lblOpciones.Font = new System.Drawing.Font("Calibri", 9F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.lblOpciones.Location = new System.Drawing.Point(28, 16);
            this.lblOpciones.Name = "lblOpciones";
            this.lblOpciones.Size = new System.Drawing.Size(33, 14);
            this.lblOpciones.TabIndex = 1;
            this.lblOpciones.Text = "Lista";
            this.lblOpciones.TextAlign = System.Drawing.ContentAlignment.TopCenter;
            // 
            // pctColor
            // 
            this.pctColor.BackColor = System.Drawing.Color.Orange;
            this.pctColor.Location = new System.Drawing.Point(12, 18);
            this.pctColor.Name = "pctColor";
            this.pctColor.Size = new System.Drawing.Size(10, 10);
            this.pctColor.TabIndex = 11;
            this.pctColor.TabStop = false;
            // 
            // grpLabel
            // 
            this.grpLabel.BackColor = System.Drawing.Color.White;
            this.grpLabel.Controls.Add(this.lblOpciones);
            this.grpLabel.Controls.Add(this.pctColor);
            this.grpLabel.Dock = System.Windows.Forms.DockStyle.Top;
            this.grpLabel.FlatStyle = System.Windows.Forms.FlatStyle.Flat;
            this.grpLabel.Location = new System.Drawing.Point(0, 0);
            this.grpLabel.Name = "grpLabel";
            this.grpLabel.Size = new System.Drawing.Size(218, 44);
            this.grpLabel.TabIndex = 12;
            this.grpLabel.TabStop = false;
            // 
            // ListaOpciones
            // 
            this.AutoScaleDimensions = new System.Drawing.SizeF(6F, 13F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.Controls.Add(this.lstOpciones);
            this.Controls.Add(this.grpLabel);
            this.Name = "ListaOpciones";
            this.Size = new System.Drawing.Size(218, 151);
            ((System.ComponentModel.ISupportInitialize)(this.pctColor)).EndInit();
            this.grpLabel.ResumeLayout(false);
            this.grpLabel.PerformLayout();
            this.ResumeLayout(false);

        }

        #endregion

        private System.Windows.Forms.ListBox lstOpciones;
        private System.Windows.Forms.Label lblOpciones;
        private System.Windows.Forms.PictureBox pctColor;
        private System.Windows.Forms.GroupBox grpLabel;
    }
}
