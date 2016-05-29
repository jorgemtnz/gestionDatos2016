using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Drawing;
using System.Data;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;
using MercadoEnvioDesktop;

namespace ApplicationGdd1
{
    public partial class Grilla : UserControl
    {
        TextBox txtResultado;
        string cadena = "";
        int unTipo;

        public Grilla()
        {
            InitializeComponent();
            SetFontAndColors();
        }

        #region eventos

            private void grdResultados_CellContentClick(object sender, DataGridViewCellEventArgs e)
            {
                if (grdResultados.Columns[e.ColumnIndex].Name == "Accion")
                {
                    grdResultados.Rows[e.RowIndex].DefaultCellStyle.BackColor = Color.PaleGoldenrod;
                    txtResultado.Text = grdResultados.Rows[e.RowIndex].Cells[1].Value.ToString();
                    cadena = e.RowIndex.ToString();   
                    this.btn_Click(sender, (EventArgs)e); 
                   // MessageBox.Show(grdResultados.Rows[e.RowIndex].Cells[1].Value.ToString()); 
                }
            }

            private void grdResultados_CellLeave(object sender, DataGridViewCellEventArgs e)
            {
                grdResultados.Rows[e.RowIndex].DefaultCellStyle.BackColor = Color.White;
            }

            private void btn_Click(object sender, EventArgs e)
            {
                try
                {
                    if (validar())
                    {
                        FactoryFormularios.crearForm(unTipo,true).Show();
                    }
                    else
                    {
                        marcarErrores();
                    }
                }
                catch (Exception ex)//mejorar
                {
                    Console.WriteLine("Ha ocurrido un error: '{0}'", ex);
                }
            }
        #endregion

        #region inicializacion

            public void inicializar(TextBox txt, DataTable dt, Boolean usaBotones, int tipoFormulario)
            {
                this.txtResultado = txt;
                this.unTipo = tipoFormulario;
                // this.grdResultados.DataSource = dt;
                cargarGrilla();
                if (usaBotones)
                {
                    crearBotones();
                }
            }

            private void SetFontAndColors()
            {
                this.grdResultados.DefaultCellStyle.Font = new Font("Calibri", 12);
                this.grdResultados.DefaultCellStyle.ForeColor = Color.Black;
                this.grdResultados.DefaultCellStyle.BackColor = Color.White;
                this.grdResultados.DefaultCellStyle.SelectionForeColor = Color.Black;
                this.grdResultados.DefaultCellStyle.SelectionBackColor = Color.PaleGoldenrod;
                this.grdResultados.ColumnHeadersDefaultCellStyle.BackColor = Color.Orange;
            }

            public void cargarGrilla()//cargar con algo util
            {
                List<String> lista = new List<string>();
                lista.Add("campo1");
                lista.Add("campo2");
                lista.Add("campo3");
                lista.Add("campo4");
                lista.Add("campo5");
                lista.Add("campo6");
                this.grdResultados.DataSource = lista;
            }

        #endregion

        #region metodos 

            private void crearBotones()
            {
                DataGridViewButtonColumn col = new DataGridViewButtonColumn();
                col.UseColumnTextForButtonValue = true;
                col.Name = "Accion";
                grdResultados.Columns.Add(col);
                Button btn = new Button();
                btn.Click += new System.EventHandler(this.btn_Click);
                foreach (DataGridViewRow row in grdResultados.Rows)
                {
                    row.Cells["Accion"].Value = btn;
                }
            }

            private void marcarErrores()
            {
                //?
            }

            private Boolean validar()
            {
                return true;//poner algo utilvalidar
            }

        #endregion
    }
}
