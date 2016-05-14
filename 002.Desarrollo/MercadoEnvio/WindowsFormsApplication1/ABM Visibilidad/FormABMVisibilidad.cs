﻿using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;

namespace MercadoEnvioDesktop.ABM_Visibilidad
{
    public partial class FormABMVisibilidad : Form
    {
        public FormABMVisibilidad()
        {
            InitializeComponent();

            #region inicializarUserControls
            grpComisiones.inicializar("Comisiones");
            txtComisionEnvio.inicializar("Por envio", 6, 300, true);
            txtComisionPorcentaje.inicializar("Porcentaje venta", 6, 300, true);
            txtComisionPrecio.inicializar("Por tipo publicacion", 6, 300, true);
            txtNombreVisibilidad.inicializar("Nombre", 50, 600, true); 
            #endregion
            #region inicializarGUI
            GUI gui = new GUI();
            gui.inicializar();
            gui.controles.AddRange(grpVisibilidad.Controls.Cast<IControlDeUsuario>());

            foreach (IBoton unBoton in grpBotonera.Controls)
            {
                unBoton.setGUI(gui);
            }
            #endregion
        }

    }
}
