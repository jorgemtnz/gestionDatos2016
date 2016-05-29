using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;

namespace ApplicationGdd1
{
    public partial class FormCalendario : Form
    {
        TextBox txtFecha;

        public FormCalendario(TextBox txtFecha)
        {
            this.txtFecha = txtFecha;
            InitializeComponent();
        }

        private void calendario_DateSelected(object sender, DateRangeEventArgs e)
        {
            txtFecha.Text = e.Start.ToShortDateString();
        }

    }
}
