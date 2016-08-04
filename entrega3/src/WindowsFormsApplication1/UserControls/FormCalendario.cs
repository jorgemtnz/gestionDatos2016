using MercadoEnvioDesktop;
using System.Windows.Forms;

namespace ApplicationGdd1
{
    public partial class FormCalendario : Form
    {
        TextBox txtFecha;

        public FormCalendario(TextBox txtFecha)
        {
            InitializeComponent();

            #region inicializarVariables
            this.txtFecha = txtFecha;
            calendario.TodayDate = Fecha.fechaDeHoy();
            calendario.SetDate(Fecha.fechaDeHoy());
            #endregion
        }

        #region eventos
        private void calendario_DateSelected(object sender, DateRangeEventArgs e)
        {
            txtFecha.Text = e.Start.ToShortDateString();
        }
        #endregion
    }
}
