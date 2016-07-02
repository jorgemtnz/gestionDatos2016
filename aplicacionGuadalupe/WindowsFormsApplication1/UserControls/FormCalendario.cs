using MercadoEnvioDesktop;
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
            calendario.TodayDate = Fecha.fechaDeHoy();
            calendario.SetDate(Fecha.fechaDeHoy());
        }

        #region eventos
        private void calendario_DateSelected(object sender, DateRangeEventArgs e)
        {
            txtFecha.Text = e.Start.ToShortDateString();
        }
        #endregion
    }
}
