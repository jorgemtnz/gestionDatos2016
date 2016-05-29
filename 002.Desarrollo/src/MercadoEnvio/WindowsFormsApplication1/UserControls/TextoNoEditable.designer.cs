namespace ApplicationGdd1
{
    partial class TextoNoEditable
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
            this.lblNoEditable = new System.Windows.Forms.Label();
            this.pctColor = new System.Windows.Forms.PictureBox();
            this.txtNoEditable = new System.Windows.Forms.TextBox();
            this.btnSeleccionar = new System.Windows.Forms.Button();
            ((System.ComponentModel.ISupportInitialize)(this.pctColor)).BeginInit();
            this.SuspendLayout();
            // 
            // lblNoEditable
            // 
            this.lblNoEditable.AutoSize = true;
            this.lblNoEditable.BackColor = System.Drawing.Color.White;
            this.lblNoEditable.Font = new System.Drawing.Font("Calibri", 9F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.lblNoEditable.ForeColor = System.Drawing.Color.Black;
            this.lblNoEditable.Location = new System.Drawing.Point(28, 6);
            this.lblNoEditable.Name = "lblNoEditable";
            this.lblNoEditable.Size = new System.Drawing.Size(73, 14);
            this.lblNoEditable.TabIndex = 9;
            this.lblNoEditable.Text = "Texto noEdit";
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
            // txtNoEditable
            // 
            this.txtNoEditable.BackColor = System.Drawing.Color.PaleGoldenrod;
            this.txtNoEditable.Font = new System.Drawing.Font("Calibri", 9F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.txtNoEditable.ForeColor = System.Drawing.Color.Black;
            this.txtNoEditable.Location = new System.Drawing.Point(164, 2);
            this.txtNoEditable.Name = "txtNoEditable";
            this.txtNoEditable.ReadOnly = true;
            this.txtNoEditable.Size = new System.Drawing.Size(124, 22);
            this.txtNoEditable.TabIndex = 7;
            // 
            // btnSeleccionar
            // 
            this.btnSeleccionar.BackColor = System.Drawing.SystemColors.HotTrack;
            this.btnSeleccionar.FlatAppearance.BorderColor = System.Drawing.Color.White;
            this.btnSeleccionar.FlatAppearance.MouseDownBackColor = System.Drawing.SystemColors.MenuHighlight;
            this.btnSeleccionar.FlatAppearance.MouseOverBackColor = System.Drawing.Color.DeepSkyBlue;
            this.btnSeleccionar.FlatStyle = System.Windows.Forms.FlatStyle.Flat;
            this.btnSeleccionar.Font = new System.Drawing.Font("Calibri", 9F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.btnSeleccionar.ForeColor = System.Drawing.SystemColors.ControlLightLight;
            this.btnSeleccionar.Location = new System.Drawing.Point(297, 1);
            this.btnSeleccionar.Name = "btnSeleccionar";
            this.btnSeleccionar.Size = new System.Drawing.Size(97, 23);
            this.btnSeleccionar.TabIndex = 10;
            this.btnSeleccionar.Text = "Seleccionar";
            this.btnSeleccionar.UseVisualStyleBackColor = false;
            this.btnSeleccionar.Click += new System.EventHandler(this.btnSeleccionar_Click);
            // 
            // TextoNoEditable
            // 
            this.AutoScaleDimensions = new System.Drawing.SizeF(6F, 13F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.BackColor = System.Drawing.Color.White;
            this.Controls.Add(this.btnSeleccionar);
            this.Controls.Add(this.lblNoEditable);
            this.Controls.Add(this.pctColor);
            this.Controls.Add(this.txtNoEditable);
            this.Name = "TextoNoEditable";
            this.Size = new System.Drawing.Size(402, 25);
            ((System.ComponentModel.ISupportInitialize)(this.pctColor)).EndInit();
            this.ResumeLayout(false);
            this.PerformLayout();

        }

        #endregion

        private System.Windows.Forms.Label lblNoEditable;
        private System.Windows.Forms.PictureBox pctColor;
        private System.Windows.Forms.TextBox txtNoEditable;
        private System.Windows.Forms.Button btnSeleccionar;
    }
}
