using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.Sql;
using System.Data.SqlClient;
using System.Data.SqlTypes;
using System.Data;
using System.Text;

namespace PI5
{
    public partial class Formulario_web12 : System.Web.UI.Page
    {
        ConexionBD con = new ConexionBD();
        static SqlCommand cmd;
        protected void Page_Load(object sender, EventArgs e)
        {
            txtUsuario.Text = Inicio.usuario;
        }
        private void LimpiarTXT()
        {
            txtCActual.Text = "";
            txtCNueva.Text = "";
            txtConfirmar.Text = "";
        }
        protected void cancelar_Click(object sender, EventArgs e)
        {
            LimpiarTXT();
        }

        protected void guardar_Click(object sender, EventArgs e)
        {
            try
            {
                int i = 0;
                if (txtUsuario.Text.Trim() != "" && txtCActual.Text.Trim() != "" && txtCNueva.Text.Trim() != "" && txtConfirmar.Text.Trim() != "")
                {
                    if (txtCNueva.Text.Trim().Equals(txtConfirmar.Text.Trim()))
                    {
                        cmd = new SqlCommand("exec CambiarContrasenia @Password,@Usuario,@NuevaPassword",con.Conectar());
                        cmd.Parameters.AddWithValue("@Password", txtCActual.Text.Trim());
                        cmd.Parameters.AddWithValue("@Usuario", txtUsuario.Text.Trim());
                        cmd.Parameters.AddWithValue("@NuevaPassword", txtCNueva.Text.Trim());
                        i = int.Parse(cmd.ExecuteScalar().ToString());
                        con.cerrar();
                        if (i == 1)
                        {
                            LimpiarTXT();
                            Response.Write("<script language=javascript>alert('Clave modificada correctamente');</script>");
                            Response.Redirect("Loguin.aspx");                            
                        }
                        else
                            Response.Write("<script language=javascript>alert('Error... Digite nuevamente su clave actual');</script>");
                    }
                    else
                        Response.Write("<script language=javascript>alert('Las claves no coinciden');</script>");
                }
                else
                    Response.Write("<script language=javascript>alert('Faltan datos');</script>");
            }
            catch(Exception ex)
            { }
        }
    }
}
