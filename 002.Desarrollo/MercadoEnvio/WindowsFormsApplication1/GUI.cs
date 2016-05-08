using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;

namespace MercadoEnvioDesktop
{
    public class GUI
    {
        public List<IControlDeUsuario> controles;
        public ErrorProvider errorProvider1;

        #region inicializacion

            public void inicializar()
            {
                controles = new List<IControlDeUsuario>();
                errorProvider1 = new ErrorProvider();
            }

            public void setControles(List<IControlDeUsuario> unosControles)
            {
                controles.FindAll(unControl => unControl.esValido());
                controles.AddRange(unosControles);
            }
            
        #endregion

        #region metodos

            public void buscar()
            {

            }

            public void errorProviderClear()
            {
                errorProvider1.Clear();
            }

            public void guardar()
            {

            }

            public void marcarErrores()
            {
                errorProvider1.Clear();
                foreach (IControlDeUsuario unControl in controles)
                {
                    if (!unControl.esValido())
                    {
                        errorProvider1.SetError((Control)unControl, unControl.errorEnErrorProvider());
                    }
                }
            }

            public Boolean validar()
            {
                return controles.TrueForAll(unControl => unControl.esValido());
            }

        #endregion
    }
}
