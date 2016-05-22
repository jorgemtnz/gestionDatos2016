using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Text;
using System.Windows.Forms;
using System.Data.SqlClient;
using System.Security.Cryptography;
using System.Threading;

namespace MercadoEnvioDesktop
{
    public partial class FrmLogIn : Form
    {
        Form formTransparente;

        public FrmLogIn(Form formTransparente)
        {
            this.formTransparente = formTransparente;
            InitializeComponent();
            txtUsuario.inicializar("Usuario", 255);
            txtContraseña.inicializar("Contraseña", 255);
        }

        Usuario user;
        public string UsuCod { get; set; }
        public string UsuRol { get; set; }

        private void mostrarError(String msj, Label label)
        {
            errorProvider1.SetError(label, msj);
            label.Text = msj;
        }

        private void btnLogIn_Click(object sender, EventArgs e)
        {
            /*VALIDACIONES*/
            try
            {
                validateCamposObligatorios();
                validarUsername();
                validarPassword();
                mostrarFormMaster();
                cerrarLogin();
            }
            catch (CamposObligatoriosNulosException camposObligatoriosExp)
            {
                mostrarError(camposObligatoriosExp.Message);
            }
            catch (LoginException loginExp)
            {
                mostrarError(loginExp.Message);
            }
            catch (PasswordException passExp) {
                DaoUsuario.updatePorPasswordErroneo(user);
                mostrarError(passExp.Message);
            }
            catch (Exception defaultExp)
            {
                mostrarError(defaultExp.Message);
            }

            return;

            this.DialogResult = DialogResult.OK;
            return;
            try
            {
                string passEnc = Encriptador.EncriptarPassword(txtCon.Text);
                string comando = "SELECT U.Username, R.Descripcion"
                                 + "FROM USUARIOS U, ROLES R"
                                 + "WHERE U.Id_Rol = R.Id_Rol"
                                 + "AND U.Username = '" + txtUsu.Text + "'"
                                 + "AND U.Password = '" + passEnc + "'";
                DataTable dta = SQL.SQLQuery(comando);

                if (dta.Rows.Count == 1)
                {
                    this.DialogResult = DialogResult.OK;
                    UsuCod = Convert.ToString(dta.Rows[0][0]);
                    UsuRol = Convert.ToString(dta.Rows[0][1]);
                    this.Close();
                }
                else
                {
                    lblRta.Text = "Usuario/Contraseña incorrectos.";
                    txtUsu.Clear();
                    txtCon.Clear();
                }
            }
            catch(Exception)
            {
                lblRta.Text = "Error al intentar conectarse a la base de datos.";
            }
        }

        private void validarPassword()
        {
            if (!user.isValidPassword(txtCon.Text)) {
                user.penalizarPorIntentoFallido();
                throw new PasswordException("Password incorrecto." + ((!user.habilitado) ? "Se ha inhabilitado." : "Le quedan intentos: " + user.intentosRestantes()));
            }
            DaoUsuario.updateLimpiarIntentosFallidos(user);
            
        }

        private static void mostrarError(String msg)
        {
            MessageBox.Show(msg);
        }

        private void validateCamposObligatorios()
        {
            if (txtUsu.Text == "" || txtCon.Text == "")
            {
                throw new CamposObligatoriosNulosException();
            }
        }

        private void validarUsername()
        {
            user = DaoUsuario.getUserbyUsername(txtUsu.Text);
            if (user == null) { throw new LoginException("Usuario inexistente"); }
            if (user.deshabilitado()) { throw new LoginException("Usuario inhabilitado"); }
            
        }

        private void cerrarLogin()
        {
            
            this.Hide();
            this.Close();
            formTransparente.Close(); 
            
        }

        private void mostrarFormMaster()
        {
            var th = new Thread(() => Application.Run(new FrmMaster(this.UsuCod, this.UsuRol)));
            th.Start();

            //FrmMaster frmMaster = new FrmMaster(this.UsuCod, this.UsuRol);
            //frmMaster.ShowDialog();
        }

        private static bool isNull(Usuario user)
        {
            return user == null;
        }

        private void button1_Click(object sender, EventArgs e) //hacer esto bien que es solo de prueba
        {
            UsuCod = "Guadalupe";
            UsuRol = "Admin";
            mostrarFormMaster();
            cerrarLogin();
        }
    }
}

