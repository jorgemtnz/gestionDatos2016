namespace MercadoEnvioDesktop.UserControls.Grilla
{
    partial class Paginador
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
            this.txtDisplayPageNo = new System.Windows.Forms.TextBox();
            this.txtPageSize = new System.Windows.Forms.TextBox();
            this.btnFillGrid = new System.Windows.Forms.Button();
            this.btnNextPage = new System.Windows.Forms.Button();
            this.btnLastPage = new System.Windows.Forms.Button();
            this.btnPreviousPage = new System.Windows.Forms.Button();
            this.btnFirstPage = new System.Windows.Forms.Button();
            this.lblNumerico = new System.Windows.Forms.Label();
            this.pctColor = new System.Windows.Forms.PictureBox();
            ((System.ComponentModel.ISupportInitialize)(this.pctColor)).BeginInit();
            this.SuspendLayout();
            // 
            // txtDisplayPageNo
            // 
            this.txtDisplayPageNo.BackColor = System.Drawing.Color.PaleGoldenrod;
            this.txtDisplayPageNo.Font = new System.Drawing.Font("Calibri", 9F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.txtDisplayPageNo.ForeColor = System.Drawing.Color.Black;
            this.txtDisplayPageNo.Location = new System.Drawing.Point(502, 3);
            this.txtDisplayPageNo.Name = "txtDisplayPageNo";
            this.txtDisplayPageNo.ReadOnly = true;
            this.txtDisplayPageNo.Size = new System.Drawing.Size(100, 22);
            this.txtDisplayPageNo.TabIndex = 19;
            // 
            // txtPageSize
            // 
            this.txtPageSize.Font = new System.Drawing.Font("Calibri", 9F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.txtPageSize.Location = new System.Drawing.Point(217, 3);
            this.txtPageSize.MaxLength = 4;
            this.txtPageSize.Name = "txtPageSize";
            this.txtPageSize.Size = new System.Drawing.Size(36, 22);
            this.txtPageSize.TabIndex = 18;
            this.txtPageSize.Text = "20";
            this.txtPageSize.KeyPress += new System.Windows.Forms.KeyPressEventHandler(this.txtPageSize_KeyPress);
            // 
            // btnFillGrid
            // 
            this.btnFillGrid.BackColor = System.Drawing.SystemColors.HotTrack;
            this.btnFillGrid.FlatAppearance.BorderColor = System.Drawing.Color.White;
            this.btnFillGrid.FlatAppearance.MouseDownBackColor = System.Drawing.SystemColors.MenuHighlight;
            this.btnFillGrid.FlatAppearance.MouseOverBackColor = System.Drawing.Color.DeepSkyBlue;
            this.btnFillGrid.FlatStyle = System.Windows.Forms.FlatStyle.Flat;
            this.btnFillGrid.Font = new System.Drawing.Font("Calibri", 9F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.btnFillGrid.ForeColor = System.Drawing.Color.White;
            this.btnFillGrid.Location = new System.Drawing.Point(258, 2);
            this.btnFillGrid.Name = "btnFillGrid";
            this.btnFillGrid.Size = new System.Drawing.Size(75, 23);
            this.btnFillGrid.TabIndex = 17;
            this.btnFillGrid.Text = "Recargar";
            this.btnFillGrid.UseVisualStyleBackColor = false;
            this.btnFillGrid.Click += new System.EventHandler(this.btnFillGrid_Click);
            // 
            // btnNextPage
            // 
            this.btnNextPage.BackColor = System.Drawing.SystemColors.HotTrack;
            this.btnNextPage.FlatAppearance.BorderColor = System.Drawing.Color.White;
            this.btnNextPage.FlatAppearance.CheckedBackColor = System.Drawing.Color.DeepSkyBlue;
            this.btnNextPage.FlatAppearance.MouseDownBackColor = System.Drawing.SystemColors.MenuHighlight;
            this.btnNextPage.FlatAppearance.MouseOverBackColor = System.Drawing.Color.DeepSkyBlue;
            this.btnNextPage.FlatStyle = System.Windows.Forms.FlatStyle.Flat;
            this.btnNextPage.Font = new System.Drawing.Font("Calibri", 9F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.btnNextPage.ForeColor = System.Drawing.Color.White;
            this.btnNextPage.Location = new System.Drawing.Point(602, 2);
            this.btnNextPage.Name = "btnNextPage";
            this.btnNextPage.Size = new System.Drawing.Size(31, 23);
            this.btnNextPage.TabIndex = 16;
            this.btnNextPage.Text = ">";
            this.btnNextPage.UseVisualStyleBackColor = false;
            this.btnNextPage.Click += new System.EventHandler(this.btnNextPage_Click_1);
            // 
            // btnLastPage
            // 
            this.btnLastPage.BackColor = System.Drawing.SystemColors.HotTrack;
            this.btnLastPage.FlatAppearance.BorderColor = System.Drawing.Color.White;
            this.btnLastPage.FlatAppearance.CheckedBackColor = System.Drawing.Color.DeepSkyBlue;
            this.btnLastPage.FlatAppearance.MouseDownBackColor = System.Drawing.SystemColors.MenuHighlight;
            this.btnLastPage.FlatAppearance.MouseOverBackColor = System.Drawing.Color.DeepSkyBlue;
            this.btnLastPage.FlatStyle = System.Windows.Forms.FlatStyle.Flat;
            this.btnLastPage.Font = new System.Drawing.Font("Calibri", 9F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.btnLastPage.ForeColor = System.Drawing.Color.White;
            this.btnLastPage.Location = new System.Drawing.Point(633, 2);
            this.btnLastPage.Name = "btnLastPage";
            this.btnLastPage.Size = new System.Drawing.Size(31, 23);
            this.btnLastPage.TabIndex = 15;
            this.btnLastPage.Text = ">l";
            this.btnLastPage.UseVisualStyleBackColor = false;
            this.btnLastPage.Click += new System.EventHandler(this.btnLastPage_Click_1);
            // 
            // btnPreviousPage
            // 
            this.btnPreviousPage.BackColor = System.Drawing.SystemColors.HotTrack;
            this.btnPreviousPage.FlatAppearance.BorderColor = System.Drawing.Color.White;
            this.btnPreviousPage.FlatAppearance.CheckedBackColor = System.Drawing.Color.DeepSkyBlue;
            this.btnPreviousPage.FlatAppearance.MouseDownBackColor = System.Drawing.SystemColors.MenuHighlight;
            this.btnPreviousPage.FlatAppearance.MouseOverBackColor = System.Drawing.Color.DeepSkyBlue;
            this.btnPreviousPage.FlatStyle = System.Windows.Forms.FlatStyle.Flat;
            this.btnPreviousPage.Font = new System.Drawing.Font("Calibri", 9F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.btnPreviousPage.ForeColor = System.Drawing.Color.White;
            this.btnPreviousPage.Location = new System.Drawing.Point(471, 2);
            this.btnPreviousPage.Name = "btnPreviousPage";
            this.btnPreviousPage.Size = new System.Drawing.Size(31, 23);
            this.btnPreviousPage.TabIndex = 14;
            this.btnPreviousPage.Text = "<";
            this.btnPreviousPage.UseVisualStyleBackColor = false;
            this.btnPreviousPage.Click += new System.EventHandler(this.btnPreviousPage_Click_1);
            // 
            // btnFirstPage
            // 
            this.btnFirstPage.BackColor = System.Drawing.SystemColors.HotTrack;
            this.btnFirstPage.FlatAppearance.BorderColor = System.Drawing.Color.White;
            this.btnFirstPage.FlatAppearance.CheckedBackColor = System.Drawing.SystemColors.Highlight;
            this.btnFirstPage.FlatAppearance.MouseDownBackColor = System.Drawing.SystemColors.MenuHighlight;
            this.btnFirstPage.FlatAppearance.MouseOverBackColor = System.Drawing.Color.DeepSkyBlue;
            this.btnFirstPage.FlatStyle = System.Windows.Forms.FlatStyle.Flat;
            this.btnFirstPage.Font = new System.Drawing.Font("Calibri", 9F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.btnFirstPage.ForeColor = System.Drawing.Color.White;
            this.btnFirstPage.Location = new System.Drawing.Point(440, 2);
            this.btnFirstPage.Name = "btnFirstPage";
            this.btnFirstPage.Size = new System.Drawing.Size(31, 23);
            this.btnFirstPage.TabIndex = 13;
            this.btnFirstPage.Text = "l<";
            this.btnFirstPage.UseVisualStyleBackColor = false;
            this.btnFirstPage.Click += new System.EventHandler(this.btnFirstPage_Click_1);
            // 
            // lblNumerico
            // 
            this.lblNumerico.AutoSize = true;
            this.lblNumerico.BackColor = System.Drawing.Color.Transparent;
            this.lblNumerico.Font = new System.Drawing.Font("Calibri", 9F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.lblNumerico.ForeColor = System.Drawing.Color.Black;
            this.lblNumerico.Location = new System.Drawing.Point(26, 6);
            this.lblNumerico.Name = "lblNumerico";
            this.lblNumerico.Size = new System.Drawing.Size(185, 14);
            this.lblNumerico.TabIndex = 21;
            this.lblNumerico.Text = "Cantidad de registros por pagina";
            // 
            // pctColor
            // 
            this.pctColor.BackColor = System.Drawing.Color.Orange;
            this.pctColor.Location = new System.Drawing.Point(10, 8);
            this.pctColor.Name = "pctColor";
            this.pctColor.Size = new System.Drawing.Size(10, 10);
            this.pctColor.TabIndex = 20;
            this.pctColor.TabStop = false;
            // 
            // Paginador
            // 
            this.AutoScaleDimensions = new System.Drawing.SizeF(6F, 13F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.BackColor = System.Drawing.Color.GhostWhite;
            this.Controls.Add(this.lblNumerico);
            this.Controls.Add(this.pctColor);
            this.Controls.Add(this.txtDisplayPageNo);
            this.Controls.Add(this.txtPageSize);
            this.Controls.Add(this.btnFillGrid);
            this.Controls.Add(this.btnNextPage);
            this.Controls.Add(this.btnLastPage);
            this.Controls.Add(this.btnPreviousPage);
            this.Controls.Add(this.btnFirstPage);
            this.Name = "Paginador";
            this.Size = new System.Drawing.Size(891, 27);
            ((System.ComponentModel.ISupportInitialize)(this.pctColor)).EndInit();
            this.ResumeLayout(false);
            this.PerformLayout();

        }

        #endregion

        private System.Windows.Forms.TextBox txtDisplayPageNo;
        private System.Windows.Forms.TextBox txtPageSize;
        private System.Windows.Forms.Button btnFillGrid;
        private System.Windows.Forms.Button btnNextPage;
        private System.Windows.Forms.Button btnLastPage;
        private System.Windows.Forms.Button btnPreviousPage;
        private System.Windows.Forms.Button btnFirstPage;
        private System.Windows.Forms.Label lblNumerico;
        private System.Windows.Forms.PictureBox pctColor;
    }
}
