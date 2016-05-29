namespace ApplicationGdd1
{
    partial class GrillaPaginada
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
            System.Windows.Forms.DataGridViewCellStyle dataGridViewCellStyle1 = new System.Windows.Forms.DataGridViewCellStyle();
            this.grdResultados = new System.Windows.Forms.DataGridView();
            this.grpPaginas = new System.Windows.Forms.GroupBox();
            this.btnUltima = new System.Windows.Forms.Button();
            this.btnSiguiente = new System.Windows.Forms.Button();
            this.btnAnterior = new System.Windows.Forms.Button();
            this.txtPaginas = new System.Windows.Forms.TextBox();
            this.btnPrimera = new System.Windows.Forms.Button();
            ((System.ComponentModel.ISupportInitialize)(this.grdResultados)).BeginInit();
            this.grpPaginas.SuspendLayout();
            this.SuspendLayout();
            // 
            // grdResultados
            // 
            this.grdResultados.BackgroundColor = System.Drawing.Color.Gainsboro;
            this.grdResultados.ColumnHeadersBorderStyle = System.Windows.Forms.DataGridViewHeaderBorderStyle.None;
            dataGridViewCellStyle1.Alignment = System.Windows.Forms.DataGridViewContentAlignment.MiddleLeft;
            dataGridViewCellStyle1.BackColor = System.Drawing.Color.Gold;
            dataGridViewCellStyle1.Font = new System.Drawing.Font("Calibri", 9F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            dataGridViewCellStyle1.ForeColor = System.Drawing.SystemColors.WindowText;
            dataGridViewCellStyle1.SelectionBackColor = System.Drawing.Color.Maroon;
            dataGridViewCellStyle1.SelectionForeColor = System.Drawing.SystemColors.HighlightText;
            dataGridViewCellStyle1.WrapMode = System.Windows.Forms.DataGridViewTriState.True;
            this.grdResultados.ColumnHeadersDefaultCellStyle = dataGridViewCellStyle1;
            this.grdResultados.ColumnHeadersHeightSizeMode = System.Windows.Forms.DataGridViewColumnHeadersHeightSizeMode.AutoSize;
            this.grdResultados.Dock = System.Windows.Forms.DockStyle.Fill;
            this.grdResultados.EnableHeadersVisualStyles = false;
            this.grdResultados.GridColor = System.Drawing.SystemColors.HotTrack;
            this.grdResultados.Location = new System.Drawing.Point(0, 0);
            this.grdResultados.Name = "grdResultados";
            this.grdResultados.ReadOnly = true;
            this.grdResultados.RowHeadersBorderStyle = System.Windows.Forms.DataGridViewHeaderBorderStyle.None;
            this.grdResultados.RowHeadersVisible = false;
            this.grdResultados.Size = new System.Drawing.Size(644, 297);
            this.grdResultados.TabIndex = 7;
            this.grdResultados.CellContentClick += new System.Windows.Forms.DataGridViewCellEventHandler(this.grdResultados_CellContentClick);
            this.grdResultados.CellLeave += new System.Windows.Forms.DataGridViewCellEventHandler(this.grdResultados_CellLeave);
            // 
            // grpPaginas
            // 
            this.grpPaginas.Controls.Add(this.btnUltima);
            this.grpPaginas.Controls.Add(this.btnSiguiente);
            this.grpPaginas.Controls.Add(this.btnAnterior);
            this.grpPaginas.Controls.Add(this.txtPaginas);
            this.grpPaginas.Controls.Add(this.btnPrimera);
            this.grpPaginas.Dock = System.Windows.Forms.DockStyle.Bottom;
            this.grpPaginas.Location = new System.Drawing.Point(0, 297);
            this.grpPaginas.Name = "grpPaginas";
            this.grpPaginas.Size = new System.Drawing.Size(644, 38);
            this.grpPaginas.TabIndex = 8;
            this.grpPaginas.TabStop = false;
            // 
            // btnUltima
            // 
            this.btnUltima.Location = new System.Drawing.Point(364, 10);
            this.btnUltima.Name = "btnUltima";
            this.btnUltima.Size = new System.Drawing.Size(27, 23);
            this.btnUltima.TabIndex = 7;
            this.btnUltima.Text = ">>";
            this.btnUltima.UseVisualStyleBackColor = true;
            // 
            // btnSiguiente
            // 
            this.btnSiguiente.Location = new System.Drawing.Point(337, 10);
            this.btnSiguiente.Name = "btnSiguiente";
            this.btnSiguiente.Size = new System.Drawing.Size(27, 23);
            this.btnSiguiente.TabIndex = 6;
            this.btnSiguiente.Text = ">";
            this.btnSiguiente.UseVisualStyleBackColor = true;
            // 
            // btnAnterior
            // 
            this.btnAnterior.Location = new System.Drawing.Point(243, 10);
            this.btnAnterior.Name = "btnAnterior";
            this.btnAnterior.Size = new System.Drawing.Size(27, 23);
            this.btnAnterior.TabIndex = 5;
            this.btnAnterior.Text = "<";
            this.btnAnterior.UseVisualStyleBackColor = true;
            // 
            // txtPaginas
            // 
            this.txtPaginas.Location = new System.Drawing.Point(270, 10);
            this.txtPaginas.Name = "txtPaginas";
            this.txtPaginas.Size = new System.Drawing.Size(67, 20);
            this.txtPaginas.TabIndex = 4;
            // 
            // btnPrimera
            // 
            this.btnPrimera.Location = new System.Drawing.Point(216, 10);
            this.btnPrimera.Name = "btnPrimera";
            this.btnPrimera.Size = new System.Drawing.Size(27, 23);
            this.btnPrimera.TabIndex = 0;
            this.btnPrimera.Text = "<<";
            this.btnPrimera.UseVisualStyleBackColor = true;
            // 
            // GrillaPaginada
            // 
            this.AutoScaleDimensions = new System.Drawing.SizeF(6F, 13F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.Controls.Add(this.grdResultados);
            this.Controls.Add(this.grpPaginas);
            this.Name = "GrillaPaginada";
            this.Size = new System.Drawing.Size(644, 335);
            ((System.ComponentModel.ISupportInitialize)(this.grdResultados)).EndInit();
            this.grpPaginas.ResumeLayout(false);
            this.grpPaginas.PerformLayout();
            this.ResumeLayout(false);

        }

        #endregion

        private System.Windows.Forms.DataGridView grdResultados;
        private System.Windows.Forms.GroupBox grpPaginas;
        private System.Windows.Forms.Button btnUltima;
        private System.Windows.Forms.Button btnSiguiente;
        private System.Windows.Forms.Button btnAnterior;
        private System.Windows.Forms.TextBox txtPaginas;
        private System.Windows.Forms.Button btnPrimera;
    }
}
