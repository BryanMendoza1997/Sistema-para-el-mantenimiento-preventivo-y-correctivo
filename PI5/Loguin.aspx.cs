
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Windows.Forms;
using System.Data.Sql;
using System.Data.SqlClient;
using System.Data.SqlTypes;
using System.Data;
using System.Net.Mail;
using System.Text;
using System.Net;

namespace PI5
{
    public partial class Loguin : System.Web.UI.Page
    {
        public static string usuario = "", clave = "";
        public static int i = 0;
        public static bool estado = true;
        ConexionBD con = new ConexionBD();
        static SqlCommand cmd;
        protected void Page_Load(object sender, EventArgs e)
        {
            con.Conectar();
            lblError.Visible = false;
        }
        
        protected void btniniciar_Click1(object sender, EventArgs e)
        {
            if (txtUsuario.Text !="" && txtPassword.Text!="")
            {
                lblError.Text = "Contraseña incorrecta.";
                cmd = new SqlCommand("exec ValidarUsuario @password,@Usuario", con.Conectar());
                cmd.Parameters.AddWithValue("@Usuario", txtUsuario.Text);
                cmd.Parameters.AddWithValue("@password", txtPassword.Text);
                int i = int.Parse(cmd.ExecuteScalar().ToString());
                if (i == 1)
                {
                    usuario = txtUsuario.Text;
                    lblError.Visible = false;
                    Response.Redirect("principall.aspx");                   
                }
                else
                {
                    lblError.Visible = true;
                }
                txtUsuario.Text = "";
                txtPassword.Text = "";
            }
            else
            {
                lblError.Visible = true;
                lblError.Text = "No se ha ingresado datos.";
            }
        }
        private string GenerarClave()
        {
            string nuevaClave = "";
            int longitud = 10;
            char[] contra = new char[longitud];
            Random rand = new Random();
            int aletorio; int d;
            for (int i = 0; i < longitud; i++)
            {
                d = rand.Next(1, 4);
                switch (d)
                {
                    case 1:
                        aletorio = rand.Next(48, 57);
                        contra[i] = (char)aletorio;
                        break;
                    case 2:
                        aletorio = rand.Next(65, 90);
                        contra[i] = (char)aletorio;
                        break;
                    case 3:
                        aletorio = rand.Next(97, 122);
                        contra[i] = (char)aletorio;
                        break;
                }
            }
            for (int i = 0; i < longitud; i++)
            {
                nuevaClave = nuevaClave + contra[i];
            }
            return nuevaClave;
        }
        private bool EnviarCorreo(string destinatario, string asunto, string mensaje)
        {
            MailMessage correo = new MailMessage();
            SmtpClient protocolo = new SmtpClient();
            correo.To.Add(destinatario);
            correo.From = new MailAddress("mishellmoreira97@gmail.com", "Sistema de Gestión de Mantenimiento de Equipos y Maquinarias", Encoding.UTF8);
            correo.Subject = asunto;
            correo.SubjectEncoding = Encoding.UTF8;
            correo.Body = mensaje;
            correo.BodyEncoding = Encoding.UTF8;
            correo.IsBodyHtml = true;
            protocolo.Credentials = new NetworkCredential("mishellmoreira97@gmail.com", "dmmtybamr");
            protocolo.Port = 587;
            protocolo.Host = "smtp.gmail.com";
            protocolo.EnableSsl = true;
            try
            {
                protocolo.Send(correo);
                return estado = true;
            }
            catch (SmtpException ex)
            {
                return estado = false;
            }

        }
        protected void enviar_Click(object sender, EventArgs e)
        {
            try
            {
                clave = GenerarClave();
                if (!(txtEmail.Text.Trim().Equals("")))
                {
                    cmd = new SqlCommand("exec CambiarCLavePorCorreo @email,@NuevaPassword", con.Conectar());
                    cmd.Parameters.AddWithValue("@email", txtEmail.Text.Trim());
                    cmd.Parameters.AddWithValue("@NuevaPassword", clave);
                    string user = cmd.ExecuteScalar().ToString().Trim();
                    if (!user.Equals(""))
                    {
                        EnviarCorreo(txtEmail.Text.Trim(), "CAMBIO DE CLAVE DE USUARIO SGM", "Usuario: " + user + "<br/>" + "Clave: " + clave);
                        Response.Write("<script language=javascript>alert('Revise su correo para volver a iniciar sesión');</script>");
                    }
                    else
                        Response.Write("<script language=javascript>alert('Error... Verifique su correo para continuar');</script>");
                }
                else
                    Response.Write("<script language=javascript>alert('Debe llenar todos los datos');</script>");
            }
            catch (Exception ex)
            { }
        }
    }
}