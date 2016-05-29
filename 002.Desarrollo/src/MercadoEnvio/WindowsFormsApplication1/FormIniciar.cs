using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;

namespace MercadoEnvioDesktop
{
    public partial class FormIniciar : Form
    {
        public FormIniciar()
        {
            InitializeComponent();
        }

        private void FormIniciar_Load(object sender, EventArgs e)
        {
            FrmLogIn form = new FrmLogIn(this);
            form.ShowDialog();
            
        }
    }
}
