using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Text;
using System.Windows.Forms;

namespace MercadoEnvioDesktop
{
    public partial class FrmMaster : Form
    {
        public FrmMaster(string UsuCod, string UsuRol)
        {
            InitializeComponent();
            this.lblUsuCod.Text = "Usuario: " + UsuCod;
            this.lblUsuRol.Text = "Rol: "     + UsuRol;
        }
    }
}
