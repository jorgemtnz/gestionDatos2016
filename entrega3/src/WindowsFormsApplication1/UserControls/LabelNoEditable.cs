﻿using System;
using System.Windows.Forms;

namespace MercadoEnvioDesktop.UserControls
{
    public partial class LabelNoEditable : UserControl, IControlDeUsuario 
    {
        public LabelNoEditable()
        {
            InitializeComponent();
        }

        #region inicializar
        public void inicializar(string labelTitulo, string labelDetalle)
        {
            lblTitulo.Text = labelTitulo;
            lblDetalle.Text = labelDetalle; 
        }
        public void inicializar(string labelTitulo, string labelDetalle, int width)
        {
            lblTitulo.Text = labelTitulo;
            lblDetalle.Text = labelDetalle;
            lblDetalle.Size = new System.Drawing.Size(width, 25);
        }
        public void inicializar(string labelTitulo, string labelDetalle, int width, Boolean esMultiline)
        {
            lblTitulo.Text = labelTitulo;
            lblDetalle.Text = labelDetalle;
            lblDetalle.Size = new System.Drawing.Size(width, 116);
            lblDetalle.Multiline = esMultiline;
            lblDetalle.ScrollBars = ScrollBars.Vertical;  
        }
        #endregion
        
        #region metodos
        public void setText(string text)
        {
            lblDetalle.Text = text; 
        }
        #endregion
        
        #region metodosDeInterfase

        public String errorEnErrorProvider()
            {
                return "";
            }

            public Boolean esRequerido()
            {
                return false;
            }

            public Boolean esValido()
            {
                return true;
            }

            public void limpiar()
            {
                lblDetalle.Text = "";  
            }

        #endregion
}
}