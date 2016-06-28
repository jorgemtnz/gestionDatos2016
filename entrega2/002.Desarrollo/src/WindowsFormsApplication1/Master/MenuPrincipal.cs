using System;
using System.Collections.Generic;
using System.Data;
using System.Windows.Forms;

namespace MercadoEnvioDesktop.Master
{
    class MenuPrincipal
    {
        public const int NRO_FUNCIONALIDADES = 29;
        public const int NRO_ROLES = 4;
        Boolean[,] arrayMenu = new Boolean[NRO_FUNCIONALIDADES, 3];
        List<ToolStripMenuItem> listaMenuItems = new List<ToolStripMenuItem>();

        public MenuPrincipal()
        {
            inicializarArray();
        }

        #region metodos
        public void inicializarArray()
        {
            for (int i = 0; i < NRO_FUNCIONALIDADES; i++)
            {
                arrayMenu[i, 0] = false;//admin
                arrayMenu[i, 1] = false;//cliente
                arrayMenu[i, 2] = false;//empresa
            }
        }

        public void crearMenu(MenuStrip unMenu)
        {
            foreach (ToolStripMenuItem item in unMenu.Items)
            {
                listaMenuItems.Add(item);
                listaMenuItems.AddRange(GetItems(item));
            }
            try
            {
                DataTable dt = SQL.cargarDataTable("SELECT idRol, idFuncionalidad FROM TPGDD.VW_ROLES_OK order by idRol");
                int i;
                int j;
                foreach (DataRow row in dt.Rows)
                {
                    i = Convert.ToInt32(row[0]) - 1;
                    j = Convert.ToInt32(row[1]) - 1;
                    arrayMenu[j, i] = true;
                }
            }
            catch { }
        }

        public void desHabilitarMenu()
        {
            listaMenuItems.ForEach(unItem => unItem.Visible = false);
        }

        private IEnumerable<ToolStripMenuItem> GetItems(ToolStripMenuItem item)
        {
            foreach (ToolStripMenuItem dropDownItem in item.DropDownItems)
            {
                if (dropDownItem.HasDropDownItems)
                {
                    foreach (ToolStripMenuItem subItem in GetItems(dropDownItem))
                        yield return subItem;
                }
                yield return dropDownItem;
            }
        }

        public void habilitarMenu(int unRol)
        {
           
            int i = 0;

                listaMenuItems.ForEach(unItem => unItem.Visible = arrayMenu[i++, unRol]);

            
            //foreach (ToolStripMenuItem unItem in listaMenuItems)
            //{
            //    unItem.Visible = arrayMenu[i, unRol];
            //    i++;
            //}
        }
        #endregion

        // items del menu actual:
            //0 "Login";
            //1 "Cambiar contraseña";
            //2 "Cerrar sesión";
            //3 "Roles";
                //6 "ABM";
                    //4 "Alta";
                    //5 "Modificaion baja";
                //7 "Consulta";
            //8 "Usuarios";   
                //11 "ABM";
                    //9 "Alta";
                    //10 "Modificaion baja";
                //12 "Consulta";
            //13 "Comprar ofertar";
            //14 "Calificaciones";
            //15 "Listado estadistico";
            //16 "Consulta facturas";
            //17 "Visibilidades";
                //20 "ABM";
                    //18 "Alta";
                    //19 "Modificaion baja";
                //21 "Consulta";
            //22 "Publicaciones";
                //25 "ABM";
                    //23 "Alta";
                    //24 "Modificaion baja";
                //26 "Consulta";
            //27 "Rubros";
            //28 "Historial clientes"

    }
}
