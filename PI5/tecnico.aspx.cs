using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;

namespace PI5
{
    public partial class Formulario_web13 : System.Web.UI.Page
    {
        ConexionBD con = new ConexionBD();
        protected void Page_Load(object sender, EventArgs e)
        {
            MultiView1.SetActiveView(View2);
        }

        protected void ImageButton2_Click(object sender, ImageClickEventArgs e)
        {
          
        }
        public void limpiartxt()
        {
            txtid.Text = "";
            txtnombre.Text = "";
            txtapellido.Text = "";
            txtfecha.Text = "";
            ddlcargo.SelectedValue = "-1";
            ddlsexo.SelectedValue = "-1";
            txtcedula.Text = "";
        }
        protected void guardar_Click(object sender, EventArgs e)
        {
            if (txtid.Text.Trim() == "" && ddlcargo.SelectedValue.ToString().Trim()!="-1" && ddlsexo.SelectedValue.ToString().Trim() != "-1")
            {
                con.Conectar();
                SqlCommand cmd = new SqlCommand("Execute InsertarTecnico @Nombre ,@apellido ,@fechanacimiento,@sexo,@cargo ,@cedula",con.Conectar());
                cmd.Parameters.AddWithValue("@Nombre",txtnombre.Text.Trim());
                cmd.Parameters.AddWithValue("@apellido", txtapellido.Text.Trim());
                cmd.Parameters.AddWithValue("@fechanacimiento", txtfecha.Text.Trim());
                cmd.Parameters.AddWithValue("@sexo", ddlsexo.SelectedValue.Trim().ToString());
                cmd.Parameters.AddWithValue("@cargo", ddlcargo.Text.Trim());
                cmd.Parameters.AddWithValue("@cedula", txtcedula.Text.ToString());
                cmd.ExecuteNonQuery();
                con.cerrar();
                GridView1.DataBind();
                limpiartxt();
            }
            if (txtid.Text.Trim() != "")
            {
                SqlCommand cmd = new SqlCommand("Execute EditarTecnico @Nombre ,@apellido ,@sexo,@cargo ,@cedula,@idtecnico",con.Conectar());
                
                cmd.Parameters.AddWithValue("@Nombre", txtnombre.Text.Trim());
                cmd.Parameters.AddWithValue("@apellido", txtapellido.Text.Trim());
                cmd.Parameters.AddWithValue("@sexo", ddlsexo.SelectedValue.Trim().ToString());
                cmd.Parameters.AddWithValue("@cargo", ddlcargo.Text.Trim());
                cmd.Parameters.AddWithValue("@cedula", txtcedula.Text.ToString());
                cmd.Parameters.AddWithValue("@idtecnico", int.Parse(txtid.Text.Trim()));
                cmd.ExecuteNonQuery();
                con.cerrar();
                GridView1.DataBind();
                limpiartxt();
                txtfecha.Visible = true;
                lblfechadenacimiento.Visible = true;
            }
            MultiView1.SetActiveView(View2);
        }

        protected void GridView1_SelectedIndexChanged(object sender, EventArgs e)
        {
            GridViewRow row = GridView1.SelectedRow;
            int a = row.RowIndex;
            ddlcargo.SelectedValue = GridView1.SelectedRow.Cells[6].Text.Trim();
            txtcedula.Text = GridView1.SelectedRow.Cells[7].Text.Trim();
            String genero = GridView1.SelectedRow.Cells[5].Text.Trim();
            if (genero.Trim() == "Masculino")
            {
                ddlsexo.SelectedValue = "1";
            }
            else
            {
                ddlsexo.SelectedValue = "0";
            }
            DateTime fecha = Convert.ToDateTime(GridView1.SelectedRow.Cells[4].Text.Trim());
            txtfecha.Text = String.Format("{0:dd/MM/yyyy}",fecha.ToString("dd/MM/yyyy").Trim());
            txtfecha.Visible = false;
            lblfechadenacimiento.Visible = false;
            txtapellido.Text = GridView1.SelectedRow.Cells[3].Text.Trim();
            txtnombre.Text = GridView1.SelectedRow.Cells[2].Text.Trim();
            txtid.Text = GridView1.DataKeys[a].Values[0].ToString().Trim();
            MultiView1.SetActiveView(View1);

        }

        protected void ImageButton1_Click1(object sender, ImageClickEventArgs e)
        {

            ImageButton b = (ImageButton)sender;
            int idservicio = int.Parse(b.CommandArgument);
            
            SqlCommand cmd = new SqlCommand("Execute eliminartecnico @Contacto",con.Conectar());
            cmd.Parameters.AddWithValue("@Contacto", idservicio);
            cmd.ExecuteNonQuery();
            con.cerrar();
            GridView1.DataBind();
        }

        protected void cancelar_Click(object sender, EventArgs e)
        {
            limpiartxt();
            txtfecha.Visible = true;
            lblfechadenacimiento.Visible = true;
            MultiView1.SetActiveView(View2);
        }

        protected void ImageButton2_Click1(object sender, ImageClickEventArgs e)
        {
            MultiView1.SetActiveView(View1);
        }
    }
}