namespace ApplicationGdd1
{
    partial class FormCalendario
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
            this.calendario = new System.Windows.Forms.MonthCalendar();
            this.pictureLogo1 = new ApplicationGdd1.PictureLogo();
            this.SuspendLayout();
            // 
            // calendario
            // 
            this.calendario.BackColor = System.Drawing.SystemColors.MenuText;
            this.calendario.Dock = System.Windows.Forms.DockStyle.Fill;
            this.calendario.Font = new System.Drawing.Font("Calibri", 12F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.calendario.Location = new System.Drawing.Point(0, 26);
            this.calendario.MinDate = new System.DateTime(1960, 1, 1, 0, 0, 0, 0);
            this.calendario.Name = "calendario";
            this.calendario.TabIndex = 1;
            this.calendario.TitleBackColor = System.Drawing.Color.OrangeRed;
            this.calendario.TrailingForeColor = System.Drawing.Color.DarkSalmon;
            this.calendario.DateSelected += new System.Windows.Forms.DateRangeEventHandler(this.calendario_DateSelected);
            // 
            // pictureLogo1
            // 
            this.pictureLogo1.BackColor = System.Drawing.Color.Orange;
            this.pictureLogo1.Dock = System.Windows.Forms.DockStyle.Top;
            this.pictureLogo1.Location = new System.Drawing.Point(0, 0);
            this.pictureLogo1.Name = "pictureLogo1";
            this.pictureLogo1.Size = new System.Drawing.Size(227, 26);
            this.pictureLogo1.TabIndex = 2;
            // 
            // FormCalendario
            // 
            this.AutoScaleDimensions = new System.Drawing.SizeF(6F, 13F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.BackColor = System.Drawing.SystemColors.ActiveCaptionText;
            this.ClientSize = new System.Drawing.Size(227, 187);
            this.Controls.Add(this.calendario);
            this.Controls.Add(this.pictureLogo1);
            this.Name = "FormCalendario";
            this.StartPosition = System.Windows.Forms.FormStartPosition.CenterScreen;
            this.Text = "Calendario";
            this.ResumeLayout(false);

        }

        #endregion

        private System.Windows.Forms.MonthCalendar calendario;
        private PictureLogo pictureLogo1;
    }
}