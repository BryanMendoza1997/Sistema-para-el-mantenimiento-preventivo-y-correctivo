using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.Sql;
using System.Data.SqlClient;
using System.Data.SqlTypes;
using System.Windows.Forms;
using System.Data;

namespace PI5
{
    public partial class PlanMantenimientp : System.Web.UI.Page
    {
        public static int codmaqui=0;
        ConexionBD con = new ConexionBD();
        protected void Page_Load(object sender, EventArgs e)
        {
            lbUsuario.Text=Inicio.usuario;
            SqlCommand cmd = new SqlCommand("select ID_USUARIO from USUARIO where NOMBRE='"+lbUsuario.Text+"'",con.Conectar());
            int id = (int)cmd.ExecuteScalar();
            con.cerrar();
            lbid.Text = id.ToString();
            MultiView1.SetActiveView(View1);
        }

        protected void txtAnadir_Click(object sender, EventArgs e)
        {
            if (Session["dt"] == null)
            {
                DataTable dt = filldata();
                DataRow Row1;
                Row1 = dt.NewRow();
                Row1["Tareas"] = this.txtTareas.Text;
                Row1["Periocidad"] = this.txtPeriocidad.Text;
                dt.Rows.Add(Row1);
                GridView1.DataSource = dt;
                GridView1.DataBind();
                Session["dt"] = dt;
            }
            else
            {
                DataTable dt = (Session["dt"]) as DataTable;
                DataRow Row1;
                Row1 = dt.NewRow();
                Row1["Tareas"] = this.txtTareas.Text;
                Row1["Periocidad"] = this.txtPeriocidad.Text;
                dt.Rows.Add(Row1);
                GridView1.DataSource = dt;
                GridView1.DataBind();
                Session["dt"] = dt;
            }
            txtTareas.Text = "";
            txtPeriocidad.Text = "";
        }
        public DataTable filldata()
        {
            DataTable dt = new DataTable();
            dt.Columns.Add("Tareas", typeof(string));
            dt.Columns.Add("Periocidad", typeof(string));
            return dt;
        }


        protected void txtGuardar_Click(object sender, EventArgs e)
        {
            if (GridView1.Rows.Count > 0)
            {
                string Xml = "'<xml>" +
             "<PlanMante>" +
                "<ID_USUARIO>" + lbid.Text + "</ID_USUARIO>," +
                "<TIEMPO>" + txtTiempo.Text + "</TIEMPO>," +
                "<FECHA>" + txtFecha.Text + "</FECHA>," +
                "<DIASANTICIPACION>" + txtDias.Text + "</DIASANTICIPACION>," +
                "<ESTADO>1</ESTADO>," +
                "<ID_MAQUIEQUIPO>" + txtMaquiequipo.Text + "</ID_MAQUIEQUIPO>" +
             "</PlanMante>" +
                 "<Detalle>";
                foreach (GridViewRow row in GridView1.Rows)
                {
                    string tareas = row.Cells[0].Text;
                    string dias = row.Cells[1].Text;
                    Xml = Xml + "<Plan>" +
                                    "<TAREAS>" + tareas + "</TAREAS>" +
                                    "<PERIODICIDADENMESES>" + dias + "</PERIODICIDADENMESES>" +
                                "</Plan>";
                }
                Xml = Xml + "</Detalle>" +
                    "</xml>'";
                SqlCommand cmd = new SqlCommand();
                cmd.Connection = con.Conectar();
                cmd.CommandText = ("InsertarPlanMante");
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.Add(new SqlParameter("@XmlIn", Xml));
                cmd.ExecuteNonQuery();
                con.cerrar();
                Page.ClientScript.RegisterStartupScript(this.GetType(), "Scripts", "<script>alert('Se ha guardado correctamente');</script>");
                limpiarControles();
            }else
            {
                Page.ClientScript.RegisterStartupScript(this.GetType(), "Scripts", "<script>alert('No se ha ingresado tareas');</script>");
            }
        }
        public void limpiarControles()
        {
            txtTiempo.Text = "";
            txtFecha.Text = "";
            txtDias.Text = "";
            txtTareas.Text = "";
            txtPeriocidad.Text = "";
            GridView1.DataBind();
        }

    

        protected void GridView2_SelectedIndexChanged(object sender, EventArgs e)
        {
            GridViewRow row = GridView2.SelectedRow;
            int a = row.RowIndex;
            SqlCommand cmd = new SqlCommand("exec validarPlanMante @id", con.Conectar());
            cmd.Parameters.AddWithValue("@id", int.Parse(GridView2.DataKeys[a].Values[0].ToString().Trim()));
            int id = (int)cmd.ExecuteScalar();
            con.cerrar();
            if(id==0)
            {
                txtMaquiequipo.Text = GridView2.SelectedRow.Cells[1].Text.Trim();
                codmaqui = int.Parse(GridView2.DataKeys[a].Values[0].ToString().Trim());
                MultiView1.SetActiveView(View1);
            }
            else if(id==1)
            {
                Page.ClientScript.RegisterStartupScript(this.GetType(), "Scripts", "<script>alert('La mquinaria o equipo ya tiene un plan de mantenimiento');</script>");
                MultiView1.SetActiveView(View2);
            }
            
        }

        protected void ImageButton2_Click(object sender, ImageClickEventArgs e)
        {
            MultiView1.SetActiveView(View2);
        }
        
    }
}