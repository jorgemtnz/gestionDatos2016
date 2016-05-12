using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Text;
using System.Windows.Forms;
using System.Data.SqlClient;
using System.Security.Cryptography;
using System.Linq;

namespace MercadoEnvioDesktop
{
    public partial class FrmLogIn : Form
    {
        private dbmanager db;
        private String username;
        private String password;
        private String hashPass;
        public static Decimal rolSeleccionado;

        public FrmLogIn(dbmanager db)
        {
            this.db = db;
            InitializeComponent();
        }

        public FrmLogIn()
        {
            InitializeComponent();
        }

        public string hash(string input)
        {
            SHA256 hash = SHA256.Create();

            // Convertir la cadena en un array de bytes y calcular hash
            byte[] data = hash.ComputeHash(Encoding.UTF8.GetBytes(input));

            // Copiar cada elemento del array a un StringBuilder en formato hexadecimal
            StringBuilder sBuilder = new StringBuilder();
            for (int i = 0; i < data.Length; i++)
            {
                sBuilder.Append(data[i].ToString("x2"));
            }
            return sBuilder.ToString();
        }

        private void Loguearse_Click(object sender, EventArgs e)
        {
            if (txtUsu.Text == "")
            {
                MessageBox.Show("Ingrese un usuario.");
            }
            else
            {
                username = txtUsu.Text;
                Boolean existeU = false;
                
                /************Modficar****************/
                existeU = this.db.Consultar("SELECT Username, Password, Usu_Cant_Login_Fallidos FROM BENDECIDOS.USUARIO WHERE Username = '" + username + "' AND Usu_Cant_Login_Fallidos < 3 AND Usu_Activo = 'S'");
                if (!existeU)
                {
                    MessageBox.Show("El usuario no existe en la base de datos.");
                    txtCon.Text = "";
                    txtUsu.Text = "";
                    txtUsu.Focus();
                }
                else // SI EXISTE EL USUARIO SE LE PIDE QUE INGRESE LA PASSWORD
                {
                    if (txtCon.Text == "")
                    {
                        MessageBox.Show("Ingrese el password.");
                    }
                    else
                    {
                        Boolean existeP = this.db.Consultar("SELECT Username, Password, Usu_Cant_Login_Fallidos FROM BENDECIDOS.USUARIO WHERE Username = '" + username + "' AND Usu_Cant_Login_Fallidos < 3 AND Usu_Activo = 'S'");
                        this.db.Leer();

                        hashPass = this.hash(txtCon.Text.Trim());
                        password = txtCon.Text.Trim();
                        Boolean existe = false;
                        existe = this.db.Consultar("SELECT Username, Password, Usu_Cant_Login_Fallidos FROM BENDECIDOS.USUARIO WHERE Username = '" + username + "' AND Usu_Cant_Login_Fallidos < 3 AND Usu_Activo = 'S'");
                        if (!existe)
                        {
                            // SI EL USUARIO NO EXISTE SE PREGUNTA SI SE LO QUIERE DAR DE ALTA?
                        }
                        else
                        {
                            this.db.Leer();
                            String dbUsername = this.db.ObtenerValor("Username");
                            String dbPassword = this.db.ObtenerValor("Password");
                            int dbIntentos_Fallidos = Int32.Parse(this.db.ObtenerValor("Usu_Cant_Login_Fallidos"));

                            if ((password == dbPassword) || (hashPass == dbPassword)) // Pregunta por el password (para usuarios migrados) o por el hash (nuevos usuarios)
                            {
                                if (dbIntentos_Fallidos > 0) // Si ingresó correctamente su password, y si tenía intentos fallidos, los resetea
                                {
                                    this.db.Ejecutar("UPDATE BENDECIDOS.USUARIO SET Usu_Cant_Login_Fallidos = 0 WHERE Username = '" + username + "'");
                                }

                                // Revisa si el usuario tiene más de un Rol
                                Boolean existeCr = this.db.Consultar("SELECT COUNT(*) 'Cantidad' FROM BENDECIDOS.USUARIO_ROL WHERE Username = '" + username + "'");
                                if (existeCr)
                                {
                                    this.db.Leer();
                                    Int32 cantidadRoles = Int32.Parse(this.db.ObtenerValor("Cantidad"));

                                    if (cantidadRoles > 1)
                                    {
                                        MessageBox.Show("El usuario tiene más de un rol asignado, por favor seleccione uno.");
                                        MercadoEnvioDesktop.FrmLogIn.SelRol f = new PagoElectronico.Login.SelRol(this.db, this.username);
                                        f.pasarRol += new SelRol.delegar(guardarRolAsignado); // Asignar evento guardarRolAsignado al tipo SelRol.delegar para obtener el valor del otro form
                                        DialogResult res = f.ShowDialog(); // Comunicación entre formularios
                                        if (res == DialogResult.OK) // Cuando vuelve del otro Form
                                        {
                                            guardarRolAsignado(rolSeleccionado);
                                        }
                                    }
                                    else
                                    {
                                        Boolean existeR = this.db.Consultar("SELECT Rol_Id FROM BENDECIDOS.USUARIO_ROL WHERE Username = '" + username + "'");
                                        if (existeR)
                                        {
                                            this.db.Leer();
                                            guardarRolAsignado(Decimal.Parse(this.db.ObtenerValor("Rol_Id")));
                                        }
                                    }
                                }

                                this.db.Ejecutar("INSERT BENDECIDOS.LOG_LOGIN (Log_User, Log_Fecha_Hora, Log_Login_Correcto, Log_Nro_Login_Fallido) VALUES ('" + username + "', GETDATE(), 'S', 0)");

                                // MENU
                                Menu menu = new Menu(db, username);
                                menu.FormClosed += new FormClosedEventHandler(menu.CierraMenu);
                                menu.Ingreso(username, rolSeleccionado); // Ingresa al menu principal
                                menu.Show(); //Se despliega el menu principal
                                this.Hide(); //Ocultar login
                            }
                            else
                            {
                                MessageBox.Show("El password ingresado es incorrecto.");
                                this.db.Ejecutar("UPDATE BENDECIDOS.USUARIO SET Usu_Cant_Login_Fallidos = Usu_Cant_Login_Fallidos + 1 WHERE Username = '" + username + "'");
                                if (dbIntentos_Fallidos == 2)
                                {
                                    this.db.Ejecutar("UPDATE BENDECIDOS.USUARIO SET Usu_Activo = 'N' WHERE Username = '" + username + "'");
                                    MessageBox.Show("El usuario se ha inhabilitado debido a que se superó la cantidad de intentos fallidos.");
                                }
                                dbIntentos_Fallidos = dbIntentos_Fallidos + 1;
                                this.db.Ejecutar("INSERT BENDECIDOS.LOG_LOGIN (Log_User, Log_Fecha_Hora, Log_Login_Correcto, Log_Nro_Login_Fallido) VALUES ('" + username + "', GETDATE(), 'N', " + dbIntentos_Fallidos + ")");
                            }
                        }
                    }
                }
            }
        } // Loguearse_Click

        private void Salir_Click(object sender, EventArgs e)
        {
            db.Desconectar();
            Environment.Exit(0);
        }

        private void Login_Load(object sender, EventArgs e)
        {

        }

        void guardarRolAsignado(Decimal rol) // Evento basado en SelRol.delegar para obtener el Rol seleccionado en el otro Form
        {
            rolSeleccionado = rol;
        }

    }
}

