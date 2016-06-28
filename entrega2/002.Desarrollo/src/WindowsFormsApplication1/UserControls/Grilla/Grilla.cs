using System;
using System.Drawing;
using System.Data;
using System.Windows.Forms;
using MercadoEnvioDesktop;
using System.Data.SqlClient;

namespace ApplicationGdd1
{
    public partial class Grilla : UserControl
    {
        DataGridView grilla = new DataGridView();
        GUI gui = new GUI();
        int col;
        long idSeleccionado;
        string retorno;

        public Grilla()
        {
           InitializeComponent();

           #region inicializar
           grilla = crearGrilla();
           grilla.CellClick += this.grilla_CellClick;
           this.Controls.Add(grilla);
           col = 1;
           idSeleccionado = 1;
           retorno = "";
           #endregion
        }

        #region eventos

            private void btn_Click(object sender, EventArgs e)
            {
                try
                {
                    gui.manejarEventoGrilla(idSeleccionado); 
                }
                catch (SqlException ex)
                {
                    ExceptionManager.manejadorExcepcionesSQL(ex);
                }
                catch (Exception ex)
                {
                    ExceptionManager.manejarExcepcion(ex);
                }
            }
            private void grilla_CellClick(object sender, DataGridViewCellEventArgs e)
            {
                String value="";
                try
                {
                    value = grilla.Rows[e.RowIndex].Cells[col].Value.ToString();
                    idSeleccionado = Convert.ToInt64(value);
                }
                catch
                {
                    idSeleccionado = -1;
                    retorno = value;
                }
                try
                {
                    if ((grilla.Columns[e.ColumnIndex].Name == "Seleccionar") && (grilla.Rows[e.RowIndex].Cells[col].Value.ToString().Trim() != ""))
                    {
                        this.btn_Click(sender, (EventArgs)e);
                    }
                }
                catch { }
            }

        #endregion

        #region inicializar

            public void inicializar(GUI unaGui,int columna)
            {
                this.col = columna;
                gui = unaGui;
            }

            public void inicializar(GUI unaGui)
            {
                gui = unaGui;
            }

        #endregion

        #region metodos

            private void autoSizeColumnas()
            {
                grilla.AutoResizeColumns();
                grilla.AutoSizeColumnsMode = DataGridViewAutoSizeColumnsMode.AllCells;
            }

            public void crearBotones()
            {
                DataGridViewButtonColumn col = new DataGridViewButtonColumn();
                col.UseColumnTextForButtonValue = true;
                col.Name = "Seleccionar";
                grilla.Columns.Add(col);
                Button btn = new Button();
                btn.Click += new EventHandler(this.btn_Click);
                foreach (DataGridViewRow row in grilla.Rows)
                {
                    row.Cells["Seleccionar"].Value = btn;
                }
            }

            public void cargarGrillaBotones(DataTable dt)
            {
                try
                {
                    grilla.Columns.Remove("Seleccionar");
                }
                catch { } 
                grilla.DataSource = dt;
                crearBotones();
                autoSizeColumnas();
            }

            private DataGridView crearGrilla()
            {
                formatear(grilla);
                return grilla;
            }             

            private static void formatear(DataGridView grilla)
            {
                DataGridViewCellStyle dataGridViewCellStyle1 = new DataGridViewCellStyle();
                grilla.DefaultCellStyle.Font = new Font("Calibri", 12);
                grilla.DefaultCellStyle.ForeColor = Color.Black;
                grilla.DefaultCellStyle.BackColor = Color.White;
                grilla.DefaultCellStyle.SelectionForeColor = Color.Black;
                grilla.DefaultCellStyle.SelectionBackColor = Color.PaleGoldenrod;
                grilla.ColumnHeadersDefaultCellStyle.BackColor = Color.Orange;
                grilla.BackgroundColor = System.Drawing.Color.Gainsboro;
                grilla.ColumnHeadersBorderStyle = System.Windows.Forms.DataGridViewHeaderBorderStyle.None;
                dataGridViewCellStyle1.Alignment = System.Windows.Forms.DataGridViewContentAlignment.MiddleLeft;
                dataGridViewCellStyle1.BackColor = System.Drawing.Color.Gold;
                dataGridViewCellStyle1.Font = new System.Drawing.Font("Calibri", 9F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
                dataGridViewCellStyle1.ForeColor = System.Drawing.SystemColors.WindowText;
                dataGridViewCellStyle1.SelectionBackColor = System.Drawing.Color.Maroon;
                dataGridViewCellStyle1.SelectionForeColor = System.Drawing.SystemColors.HighlightText;
                grilla.SelectionMode= DataGridViewSelectionMode.FullRowSelect;
                grilla.ColumnHeadersDefaultCellStyle = dataGridViewCellStyle1;
                grilla.ColumnHeadersHeightSizeMode = System.Windows.Forms.DataGridViewColumnHeadersHeightSizeMode.AutoSize;
                grilla.Dock = System.Windows.Forms.DockStyle.Fill;
                grilla.EnableHeadersVisualStyles = false;
                grilla.GridColor = System.Drawing.SystemColors.HotTrack;
                grilla.Name = "grid";
                grilla.ReadOnly = true;
                grilla.RowHeadersBorderStyle = System.Windows.Forms.DataGridViewHeaderBorderStyle.None;
                grilla.RowHeadersVisible = false;
            }

            public void cargarGrilla(DataTable dt)
            {
                grilla.DataSource = dt;
                autoSizeColumnas();
            }

            public DataGridView getGrilla()
            {
                return grilla;
            }
            public string getRetorno()
            {
                return retorno;
            }
            public void setGUI(GUI unaGui)
            {
                gui = unaGui;
            }

          #endregion

    }
}
