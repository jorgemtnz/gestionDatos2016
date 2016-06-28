using MercadoEnvioDesktop.Interfaces;
using System;
using System.Collections.Generic;
using System.Windows.Forms;

namespace MercadoEnvioDesktop
{
    public class GUI
    {
        public List<IControlDeUsuario> controles;
        public ErrorProvider errorProvider1;
        private IForm miFormulario;

        #region inicializacion

        public void inicializar(IForm unForm)
            {
                controles = new List<IControlDeUsuario>();
                errorProvider1 = new ErrorProvider();
                miFormulario = unForm;
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
                miFormulario.ejecutarSQL(); 
            }

            public void errorProviderClear()
            {
                errorProvider1.Clear();
            }
         
            public void guardar()
            {
                miFormulario.ejecutarSQL(); 
            }

            public void manejarEvento(int numeroEvento)
            {
                miFormulario.manejarEvento(numeroEvento);
                //si numero de evento es 1 es un combo SelectedIndexChanged
                //si numero de evento es 2 es un check CheckedChanged
                //si numero de evento es 3 es un text TextChanged
            }

            public void manejarEventoGrilla(long idSeleccionado)
            {
                miFormulario.manejarEventoGrilla(5, idSeleccionado);
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

            public void modificar()
            {
                miFormulario.ejecutarSQL(); 
            }

            public void refrescar()
            {
                miFormulario.ejecutarSQL();
            }

            public Boolean validar()
            {
                return controles.TrueForAll(unControl => unControl.esValido());
            }

        #endregion
    }
}
