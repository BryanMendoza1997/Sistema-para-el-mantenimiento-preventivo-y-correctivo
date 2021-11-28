using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.Sql;
using System.Data.SqlClient;
using System.Data.SqlTypes;

namespace PI5
{
    public partial class Proveedores : System.Web.UI.Page
    {
        
        ConexionBD con = new ConexionBD();
        protected void Page_Load(object sender, EventArgs e)
        {
            MultiView1.SetActiveView(View2);
        }

        protected void ImageButton2_Click(object sender, ImageClickEventArgs e)
        {
            MultiView1.SetActiveView(View1);
        }

        protected void ImageButton3_Click(object sender, ImageClickEventArgs e)
        {
            ImageButton b = (ImageButton)sender;
            int id = int.Parse(b.CommandArgument);
            SqlCommand cmd = new SqlCommand("exec EliminarProveedor @id", con.Conectar());
            cmd.Parameters.AddWithValue("@id", id);
            cmd.ExecuteNonQuery();
            con.cerrar();
            GridView1.DataBind();
        }

        protected void GridView1_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            if (e.CommandName == "cargar")
            {
                int index = int.Parse(e.CommandArgument.ToString());
                GridViewRow row = GridView1.Rows[index];
                string valor1 = row.Cells[1].Text.Trim();
                string valor2 = row.Cells[2].Text.Trim();
                string valor3 = row.Cells[3].Text.Trim();
                string valor4 = row.Cells[4].Text.Trim();
                TextBox6.Text = valor1;
                TextBox7.Text = valor2;
                TextBox8.Text = valor3;
                TextBox9.Text = valor4;
                string valor = GridView1.DataKeys[index].Value.ToString();
                txtid.Text = valor;
                MultiView1.SetActiveView(View3);
            }
        }

        protected void ImageButton4_Click(object sender, ImageClickEventArgs e)
        {
            
            
            SqlCommand cmd = new SqlCommand("exec ModificarProveedor @nombre,@telefono,@direccion,@correo,@id", con.Conectar());
            cmd.Parameters.AddWithValue("@nombre", TextBox6.Text);
            cmd.Parameters.AddWithValue("@telefono", TextBox7.Text);
            cmd.Parameters.AddWithValue("@direccion", TextBox8.Text);
            cmd.Parameters.AddWithValue("@correo", TextBox9.Text);
            cmd.Parameters.AddWithValue("@id", txtid.Text);
            cmd.ExecuteNonQuery();
            con.cerrar();
            GridView1.DataBind();
            TextBox1.Text = "";
            TextBox2.Text = "";
            TextBox5.Text = "";
            TextBox4.Text = "";
            MultiView1.SetActiveView(View2);
        }

        protected void ImageButton5_Click(object sender, ImageClickEventArgs e)
        {
            MultiView1.SetActiveView(View2);
        }

        protected void btnCancelar_Click(object sender, EventArgs e)
        {
            MultiView1.SetActiveView(View2);
        }

        protected void btnGuardar_Click(object sender, EventArgs e)
        {
            SqlCommand cmd = new SqlCommand("exec InsertarProveedor @nombre,@telefono,@direccion,@correo", con.Conectar());
            cmd.Parameters.AddWithValue("@nombre", TextBox1.Text);
            cmd.Parameters.AddWithValue("@telefono", TextBox2.Text);
            cmd.Parameters.AddWithValue("@direccion", TextBox5.Text);
            cmd.Parameters.AddWithValue("@correo", TextBox4.Text);
            cmd.ExecuteNonQuery();
            con.cerrar();
            GridView1.DataBind();
            TextBox1.Text = "";
            TextBox2.Text = "";
            TextBox5.Text = "";
            TextBox4.Text = "";
            MultiView1.SetActiveView(View2);
        }
    }
}