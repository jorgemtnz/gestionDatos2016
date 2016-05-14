using System;
using System.Windows.Forms;

namespace MercadoEnvioDesktop
{
    static class Program
    {
        /// <summary>
        /// Punto de entrada principal para la aplicación.
        /// </summary>
        [STAThread]
        static void Main()
        {
            Application.EnableVisualStyles();
            Application.SetCompatibleTextRenderingDefault(false);

            // Logueo de la aplicación:
            FrmLogIn login = new FrmLogIn();
            login.ShowDialog();

            if (login.DialogResult == DialogResult.OK)
                Application.Run(new FrmMaster(login.UsuCod, login.UsuRol));
        }
    }
}