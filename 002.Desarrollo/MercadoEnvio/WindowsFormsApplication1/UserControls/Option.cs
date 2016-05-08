using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Drawing;
using System.Data;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;

namespace MercadoEnvioDesktop.UserControls
{
    public partial class Option : UserControl, IControlDeUsuario 
    {
        public Option()
        {
            InitializeComponent();
        }

        #region metodos

        public string getValor()
        {
            if (rad1.Checked) return "1";
            if (rad2.Checked) return "2";
            if (rad5.Checked) return "5";
            if (rad4.Checked) return "4";
            return "3";
        }

        #endregion

        #region metodosDeInterfase

        public String errorEnErrorProvider()
        {
            return "";
        }

        public Boolean esRequerido()
        {
            return true;
        }

        public Boolean esValido()
        {
            return true;
        }

        public void limpiar()
        {
            rad1.Checked = false;
            rad2.Checked = false;
            rad3.Checked = true;
            rad4.Checked = false;
            rad5.Checked = false;
        }

        #endregion
    }
}
