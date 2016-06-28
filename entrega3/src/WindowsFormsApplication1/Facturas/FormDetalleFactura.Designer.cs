namespace MercadoEnvioDesktop.Facturas
{
    partial class FormDetalleFactura
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
            this.grpEncabezado = new System.Windows.Forms.GroupBox();
            this.grpDetalle = new System.Windows.Forms.GroupBox();
            this.grdDetalles = new ApplicationGdd1.Grilla();
            this.lblMontoTotal = new MercadoEnvioDesktop.UserControls.LabelNoEditable();
            this.lblVendedor = new MercadoEnvioDesktop.UserControls.LabelNoEditable();
            this.lblFormaPago = new MercadoEnvioDesktop.UserControls.LabelNoEditable();
            this.lblFecha = new MercadoEnvioDesktop.UserControls.LabelNoEditable();
            this.lblNroFactura = new MercadoEnvioDesktop.UserControls.LabelNoEditable();
            this.pictureLogo1 = new ApplicationGdd1.PictureLogo();
            this.grpEncabezado.SuspendLayout();
            this.grpDetalle.SuspendLayout();
            this.SuspendLayout();
            // 
            // grpEncabezado
            // 
            this.grpEncabezado.BackColor = System.Drawing.Color.White;
            this.grpEncabezado.Controls.Add(this.lblMontoTotal);
            this.grpEncabezado.Controls.Add(this.lblVendedor);
            this.grpEncabezado.Controls.Add(this.lblFormaPago);
            this.grpEncabezado.Controls.Add(this.lblFecha);
            this.grpEncabezado.Controls.Add(this.lblNroFactura);
            this.grpEncabezado.Dock = System.Windows.Forms.DockStyle.Top;
            this.grpEncabezado.Location = new System.Drawing.Point(0, 26);
            this.grpEncabezado.Name = "grpEncabezado";
            this.grpEncabezado.Size = new System.Drawing.Size(573, 183);
            this.grpEncabezado.TabIndex = 1;
            this.grpEncabezado.TabStop = false;
            this.grpEncabezado.Text = "Factura";
            // 
            // grpDetalle
            // 
            this.grpDetalle.BackColor = System.Drawing.Color.White;
            this.grpDetalle.Controls.Add(this.grdDetalles);
            this.grpDetalle.Dock = System.Windows.Forms.DockStyle.Fill;
            this.grpDetalle.Location = new System.Drawing.Point(0, 209);
            this.grpDetalle.Name = "grpDetalle";
            this.grpDetalle.Size = new System.Drawing.Size(573, 277);
            this.grpDetalle.TabIndex = 2;
            this.grpDetalle.TabStop = false;
            this.grpDetalle.Text = "Detalles";
            // 
            // grdDetalles
            // 
            this.grdDetalles.BackColor = System.Drawing.SystemColors.ActiveCaptionText;
            this.grdDetalles.Dock = System.Windows.Forms.DockStyle.Fill;
            this.grdDetalles.Location = new System.Drawing.Point(3, 18);
            this.grdDetalles.Name = "grdDetalles";
            this.grdDetalles.Size = new System.Drawing.Size(567, 256);
            this.grdDetalles.TabIndex = 0;
            // 
            // lblMontoTotal
            // 
            this.lblMontoTotal.BackColor = System.Drawing.Color.White;
            this.lblMontoTotal.Font = new System.Drawing.Font("Calibri", 9F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.lblMontoTotal.Location = new System.Drawing.Point(12, 129);
            this.lblMontoTotal.Name = "lblMontoTotal";
            this.lblMontoTotal.Size = new System.Drawing.Size(617, 27);
            this.lblMontoTotal.TabIndex = 4;
            // 
            // lblVendedor
            // 
            this.lblVendedor.BackColor = System.Drawing.Color.White;
            this.lblVendedor.Font = new System.Drawing.Font("Calibri", 9F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.lblVendedor.Location = new System.Drawing.Point(12, 102);
            this.lblVendedor.Name = "lblVendedor";
            this.lblVendedor.Size = new System.Drawing.Size(617, 27);
            this.lblVendedor.TabIndex = 3;
            // 
            // lblFormaPago
            // 
            this.lblFormaPago.BackColor = System.Drawing.Color.White;
            this.lblFormaPago.Font = new System.Drawing.Font("Calibri", 9F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.lblFormaPago.Location = new System.Drawing.Point(12, 75);
            this.lblFormaPago.Name = "lblFormaPago";
            this.lblFormaPago.Size = new System.Drawing.Size(617, 27);
            this.lblFormaPago.TabIndex = 2;
            // 
            // lblFecha
            // 
            this.lblFecha.BackColor = System.Drawing.Color.White;
            this.lblFecha.Font = new System.Drawing.Font("Calibri", 9F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.lblFecha.Location = new System.Drawing.Point(12, 48);
            this.lblFecha.Name = "lblFecha";
            this.lblFecha.Size = new System.Drawing.Size(617, 27);
            this.lblFecha.TabIndex = 1;
            // 
            // lblNroFactura
            // 
            this.lblNroFactura.BackColor = System.Drawing.Color.White;
            this.lblNroFactura.Font = new System.Drawing.Font("Calibri", 9F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.lblNroFactura.Location = new System.Drawing.Point(12, 21);
            this.lblNroFactura.Name = "lblNroFactura";
            this.lblNroFactura.Size = new System.Drawing.Size(617, 27);
            this.lblNroFactura.TabIndex = 0;
            // 
            // pictureLogo1
            // 
            this.pictureLogo1.BackColor = System.Drawing.Color.Orange;
            this.pictureLogo1.Dock = System.Windows.Forms.DockStyle.Top;
            this.pictureLogo1.Location = new System.Drawing.Point(0, 0);
            this.pictureLogo1.Name = "pictureLogo1";
            this.pictureLogo1.Size = new System.Drawing.Size(573, 26);
            this.pictureLogo1.TabIndex = 0;
            // 
            // FormDetalleFactura
            // 
            this.AutoScaleDimensions = new System.Drawing.SizeF(6F, 14F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.ClientSize = new System.Drawing.Size(573, 486);
            this.Controls.Add(this.grpDetalle);
            this.Controls.Add(this.grpEncabezado);
            this.Controls.Add(this.pictureLogo1);
            this.Font = new System.Drawing.Font("Calibri", 9F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.Name = "FormDetalleFactura";
            this.StartPosition = System.Windows.Forms.FormStartPosition.CenterScreen;
            this.Text = "Detalle factura";
            this.Load += new System.EventHandler(this.FormDetalleFactura_Load);
            this.grpEncabezado.ResumeLayout(false);
            this.grpDetalle.ResumeLayout(false);
            this.ResumeLayout(false);

        }

        #endregion

        private ApplicationGdd1.PictureLogo pictureLogo1;
        private System.Windows.Forms.GroupBox grpEncabezado;
        private UserControls.LabelNoEditable lblMontoTotal;
        private UserControls.LabelNoEditable lblVendedor;
        private UserControls.LabelNoEditable lblFormaPago;
        private UserControls.LabelNoEditable lblFecha;
        private UserControls.LabelNoEditable lblNroFactura;
        private System.Windows.Forms.GroupBox grpDetalle;
        private ApplicationGdd1.Grilla grdDetalles;
    }
}