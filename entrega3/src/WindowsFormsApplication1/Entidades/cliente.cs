using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace FrbaHotel.Entidades
{
    public class cliente
    {   private static readonly object lockObject = new object();
        private static cliente instance = null;

        public string mail {set; get;}
        public string tipo_doc {set; get;}
        public decimal nro_docu {set; get;}

         public static cliente Instance
        {
            get
            {
                if (instance == null)
                {
                    lock (lockObject)
                    {
                        if (instance == null)
                        {
                            instance = new cliente();
                        }

                    }

                }

                return instance;
            }
        }
    }
    }

