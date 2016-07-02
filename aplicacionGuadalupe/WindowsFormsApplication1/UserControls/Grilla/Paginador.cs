using System;
using System.Data;
using System.Windows.Forms;

namespace MercadoEnvioDesktop.UserControls.Grilla
{
    public partial class Paginador : UserControl
    {
        DataTable dtSource;
        string sql;
        int PageCount;
        int maxRec;
        int pageSize=20;
        int currentPage;
        int recNo;
        DataGridView grilla;
        
        public Paginador()
        {
            InitializeComponent();
        }

        #region eventos


        private void btnFillGrid_Click(object sender, EventArgs e)
        {
            cargarPaginas();
        }

        private void btnFirstPage_Click_1(object sender, EventArgs e)
        {
            if (CheckFillButton() == false)
            {
                return;
            }

            //Check if you are already at the first page.
            if (currentPage == 1)
            {
                MessageBox.Show("primera pagina");
                return;
            }

            currentPage = 1;
            recNo = 0;
            LoadPage();
        }

        private void btnPreviousPage_Click_1(object sender, EventArgs e)
        {
            if (CheckFillButton() == false)
            {
                return;
            }

            if (currentPage == PageCount)
            {
                recNo = pageSize * (currentPage - 2);
            }

            currentPage -= 1;
            //Check if you are already at the first page.
            if (currentPage < 1)
            {
                MessageBox.Show("Primera pagina");
                currentPage = 1;
                return;
            }
            else
            {
                recNo = pageSize * (currentPage - 1);
            }
            LoadPage();
        }

        private void btnNextPage_Click_1(object sender, EventArgs e)
        {
            //If the user did not click the "Fill Grid" button, then return.
            if (CheckFillButton() == false)
            {
                return;
            }

            //Check if the user clicks the "Fill Grid" button.
            if (pageSize == 0)
            {
                pageSize = 20;// MessageBox.Show("Set the Page Size, and then click the Fill Grid button!");
                return;
            }

            currentPage += 1;
            if (currentPage > PageCount)
            {
                currentPage = PageCount;
                //Check if you are already at the last page.
                if (recNo == maxRec)
                {
                    MessageBox.Show("Ultima pagina");
                    return;
                }
            }
            LoadPage();
        }

        private void btnLastPage_Click_1(object sender, EventArgs e)
        {
            if (CheckFillButton() == false)
            {
                return;
            }

            //Check if you are already at the last page.
            if (recNo == maxRec)
            {
                MessageBox.Show("Ultima pagina");
                return;
            }
            currentPage = PageCount;
            recNo = pageSize * (currentPage - 1);
            LoadPage();
        }

        private void txtPageSize_KeyPress(object sender, KeyPressEventArgs e)
        {
            e.Handled = !char.IsDigit(e.KeyChar) && !char.IsControl(e.KeyChar);
        }
        #endregion

        #region inicializar
        public void inicializar(DataGridView unaGrilla)
        {
            grilla = unaGrilla;
        }
        #endregion

        #region metodos

        private void LoadPage()
        {
            int i;
            int startRec;
            int endRec;
            DataTable dtTemp;

            if (dtSource.Rows.Count > 0)
            {
                //Clone the source table to create a temporary table.
                dtTemp = dtSource.Clone();

                if (currentPage == PageCount)
                {
                    endRec = maxRec;
                }
                else
                {
                    endRec = pageSize * currentPage;
                }
                startRec = recNo;

                //Copy rows from the source table to fill the temporary table.
                for (i = startRec; i < endRec; i++)
                {
                    dtTemp.ImportRow(dtSource.Rows[i]);
                    recNo += 1;
                }
                grilla.DataSource = dtTemp;
                autoSizeColumnas();
                DisplayPageInfo();
            }
            else
            {

                grilla.DataSource = SQL.cargarDataTable(sql);
                PageCount = 1;
                pageSize = 20;
                currentPage = 1;
                DisplayPageInfo();
            }
        }

        private void DisplayPageInfo()
        {
            txtDisplayPageNo.Text = "Pag. " + currentPage.ToString() + "/ " + PageCount.ToString();
        }

        private bool CheckFillButton()
        {
            // Check if the user clicks the "Fill Grid" button.
            if (pageSize == 0)
            {
                MessageBox.Show("Set the Page Size, and then click the Fill Grid button!");
                return false;
            }
            else
            {
                return true;
            }
        }

        public void cargarPaginas()//esto explota arreglar cuando no hay nada cargado en la grilla, ver ejemplo en historial
        {
            // Set the start and max records. 
            try
            {
                pageSize = Convert.ToInt32(txtPageSize.Text);
            }
            catch
            {
                pageSize = 20;
            }
            try
            {
                maxRec = dtSource.Rows.Count;
                PageCount = maxRec / pageSize;
                //Adjust the page number if the last page contains a partial page.
                if ((maxRec % pageSize) > 0)
                {
                    PageCount += 1;
                }
                currentPage = 1;
                recNo = 0;
                LoadPage();
            }
            catch { }

        }

        public void cargarGrilla(string consulta)
        {
            sql = consulta;
            dtSource = SQL.cargarDataTable(consulta);
        }

        private void autoSizeColumnas()
        {
            grilla.AutoResizeColumns();
            grilla.AutoSizeColumnsMode = DataGridViewAutoSizeColumnsMode.AllCells;
        }
        #endregion
    }
}
