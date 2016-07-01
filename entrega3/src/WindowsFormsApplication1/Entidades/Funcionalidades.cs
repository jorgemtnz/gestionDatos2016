using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace FrbaHotel.Entidades
{
    class Funcionalidades
    {

        private static readonly object lockObject = new object();
        private static Funcionalidades instance = null;

        public int altaUsuario { get; set; }
        public int bajaUsuario { get; set; }
        public int modificacionUsuario { get; set; }
        public int altaHotel { get; set; }
        public int bajaHotel { get; set; }
        public int modificarHotel { get; set; }
        public int altaHabitacion { get; set; }
        public int bajaHabitacion { get; set; }
        public int modificarHabitacion { get; set; }
        public int altaCliente { get; set; }
        public int bajaCliente { get; set; }
        public int modificarCliente { get; set; }
        public int altaRol { get; set; }
        public int bajaRol { get; set; }
        public int modificarRol { get; set; }
        public int registrarCheckIn { get; set; }
        public int registrarCheckOut { get; set; }
        public int reservar { get; set;}
        public int bajaReserva { get; set; }
        public int facturar { get; set; }
        public int listados { get; set; }

        public Funcionalidades() { }

        public static Funcionalidades Instance
        {
            get
            {
                if (instance == null)
                {
                    lock (lockObject)
                    {
                        if (instance == null)
                        {
                            instance = new Funcionalidades();
                        }

                    }

                }

                return instance;
            }
        }


    }
}
