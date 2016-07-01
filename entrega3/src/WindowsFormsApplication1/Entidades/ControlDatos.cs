using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace FrbaHotel.Entidades
{
    class ControlDatos
    {

        //Llave de la clase

        internal static int toInteger(System.Windows.Forms.TextBox text)
        {
            if (System.Text.RegularExpressions.Regex.IsMatch("[^0-9]", text.Text))
            {
                throw new Exception();
            }
            else
            {
                return Convert.ToInt32(text.Text);
            }
        }

        //Llave de la clase
    }
}
