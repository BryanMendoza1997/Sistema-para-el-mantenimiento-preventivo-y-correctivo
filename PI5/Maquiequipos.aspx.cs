using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.IO;
using System.Drawing;
using MessagingToolkit.QRCode.Codec;
using MessagingToolkit.QRCode.Codec.Data;
using System.Drawing.Imaging;
using System.Data.Sql;
using System.Data.SqlClient;


namespace PI5
{
    public partial class Maquiequipos : System.Web.UI.Page
    {
        static int codpro = 0, i = 0, estad = 0;
        static string Rutamanual = "", Rutaimagen = "", textocodigo = "", Rutacodigo = "";
        static bool banmanual = true, banfoto = true;
        ConexionBD con = new ConexionBD();
        static SqlCommand cmd;
        protected void Page_Load(object sender, EventArgs e)
        {
            MultiView1.SetActiveView(View2);
            if (REGEXFileUploadImagen.Enabled == true) {
                Imagen.ImageUrl = "~/img/im.png";
            }
        }
        protected void GridView2_SelectedIndexChanged(object sender, EventArgs e)
        {
            GridViewRow row = dgvProveedores.SelectedRow;
            int a = row.RowIndex;
            txtProveedor.Text= dgvProveedores.SelectedRow.Cells[2].Text.Trim();
            codpro =int.Parse(dgvProveedores.DataKeys[a].Values[0].ToString().Trim());
            MultiView1.SetActiveView(View1);
        }
        protected void btnAgregar_Click(object sender, ImageClickEventArgs e)
        {
            MultiView1.SetActiveView(View1);
        }
        protected void btnProveedor_Click(object sender, EventArgs e)
        {
            MultiView1.SetActiveView(View3);
        }

        protected void CVtamanio_ServerValidate(object source, ServerValidateEventArgs args)
        {
        
        }

        protected void CustomValidator1_ServerValidate(object source, ServerValidateEventArgs args)
        {
            if (FileManual.FileBytes.Length > 1024) // 1024 * KB del tamaño del archivo

            {
                args.IsValid = true;


            }
            else

            {
                args.IsValid = false;
            }
        }

        protected void btnCancelar2_Click(object sender, EventArgs e)
        {
            MultiView1.SetActiveView(View1);
        }

        public void LimpiarTxt()
        {
            txtNombre.Text = "";
            txtMarca.Text = "";
            txtModelo.Text = "";
            txtProveedor.Text = "";
            txtFabricante.Text = "";
            txtAccesorios.Text = "";
            txtFechaAdquisicion.Text = "";
            txtValorCompra.Text = "";
            txtFechFunc.Text = "";
            txtxUsoAnt.Text = "";
            cbbEstado.SelectedIndex = 0;
            cbbTipoActivo.SelectedIndex = 0;
            txtDescripcion.InnerText = "";
        }

        protected void btnCancelar_Click(object sender, EventArgs e)
        {
            LimpiarTxt();
            MultiView1.SetActiveView(View2);
        }

        protected void ObtenerRuta()
        {           
            if (FileManual.HasFile)
            {
                String ext = System.IO.Path.GetExtension(FileManual.FileName);
                ext = ext.ToLower();
                int tamanio = FileManual.PostedFile.ContentLength;
                if (ext == ".pdf" || ext == ".docx")
                {
                    FileManual.SaveAs(Server.MapPath("~/Manual/" + FileManual.FileName));
                    Rutamanual = "~/Manual/" + FileManual.FileName;
                }
            }
            else
            {
                banmanual = false;
            }
            if (FileImagen.HasFile)
            {
                String ext = System.IO.Path.GetExtension(FileImagen.FileName);
                ext = ext.ToLower();
                if (ext == ".jpg" || ext == ".png" || ext == ".jpeg")
                {
                    FileImagen.SaveAs(Server.MapPath("~/Fotos/" + FileImagen.FileName));
                    Rutaimagen = "~/Fotos/" + FileImagen.FileName;
                }
            }
            else
            {
                banfoto = false;
            }
        }
        private string GenerarCadena()
        {
            string cadena = "";
            int longitud = 10;
            char[] contra = new char[longitud];
            Random rand = new Random();
            int aletorio;
            for (int i = 0; i < longitud; i++)
            {
                aletorio = rand.Next(48, 57); //numeros
                contra[i] = (char)aletorio;
            }
            for (int i = 0; i < longitud; i++)
            {
                cadena = cadena + contra[i];
            }
            return cadena;
        }

        protected void GenerarCodigoQR()
        {
            textocodigo = GenerarCadena();
            QRCodeEncoder encoder = new QRCodeEncoder();
            Bitmap imagenQR = encoder.Encode(textocodigo);
            imagenQR.Save(Server.MapPath("~/CodigoQR/" + textocodigo + ".jpeg"), System.Drawing.Imaging.ImageFormat.Jpeg);
            //QR.ImageUrl= "~/CodigoQR/"+textocodigo +".jpeg";
            Rutacodigo = "~/CodigoQR/" + textocodigo + ".jpeg";
        }
        protected void btnGuardar_Click(object sender, EventArgs e)
        {           
            if (cbbEstado.SelectedIndex == 0)
                estad = 1;
            else
                estad = 0;
            try
            {
                ObtenerRuta();
                GenerarCodigoQR();
                if (banmanual && banfoto)
                { }
                else
                {
                    Rutamanual = null;
                    Rutaimagen = null;
                }  
                cmd = new SqlCommand("exec InsertarMaquiequipo @proveedor,@ubicacion,@manual,@nombre,@modelo,@marca,@descripcion," +
                "@valorcompra,@accesorios,@fechaadquisicion,@fabricante,@estado,@foto,@fechapuestaenfuncionamiento,@codigo," +
                "@tiempodeusoenmeses,@tipoactivo",con.Conectar());
                cmd.Parameters.AddWithValue("@proveedor", codpro);
                cmd.Parameters.AddWithValue("@ubicacion", int.Parse(cbbUbicacion.SelectedValue));
                cmd.Parameters.AddWithValue("@manual", Rutamanual);
                cmd.Parameters.AddWithValue("@nombre", txtNombre.Text.Trim());
                cmd.Parameters.AddWithValue("@modelo", txtModelo.Text.Trim());
                cmd.Parameters.AddWithValue("@marca", txtMarca.Text.Trim());
                cmd.Parameters.AddWithValue("@descripcion", txtDescripcion.InnerText.Trim());
                cmd.Parameters.AddWithValue("@valorcompra", txtValorCompra.Text.Trim());
                cmd.Parameters.AddWithValue("@accesorios", txtAccesorios.Text.Trim());
                cmd.Parameters.AddWithValue("@fechaadquisicion", txtFechaAdquisicion.Text.Trim());
                cmd.Parameters.AddWithValue("@fabricante", txtFabricante.Text.Trim());
                cmd.Parameters.AddWithValue("@estado", estad);
                cmd.Parameters.AddWithValue("@foto", Rutaimagen);
                cmd.Parameters.AddWithValue("@fechapuestaenfuncionamiento", txtFechFunc.Text.Trim());
                cmd.Parameters.AddWithValue("@codigo", Rutacodigo);
                cmd.Parameters.AddWithValue("@tiempodeusoenmeses", int.Parse(txtxUsoAnt.Text.Trim()));
                cmd.Parameters.AddWithValue("@tipoactivo", int.Parse(cbbTipoActivo.SelectedValue));
                i = int.Parse(cmd.ExecuteScalar().ToString());
                con.cerrar();
                if (i == 1)
                {
                    Response.Write("<script language=javascript>alert('Datos guardados correctamente');</script>");
                    LimpiarTxt();
                    dgvMaquiequipos.DataBind();
                    MultiView1.SetActiveView(View2);
                }
                else
                    Response.Write("<script language=javascript>alert('Error al guardar los datos');</script>");                            
            }
            catch(Exception ex)
            {
                MultiView1.SetActiveView(View1);
            }
        }     
    }
}