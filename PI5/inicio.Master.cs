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

namespace PI5
{
    public partial class Inicio : System.Web.UI.MasterPage
    {
        public static string usuario = "";
        protected void Page_Load(object sender, EventArgs e)
        {
            usuario = Loguin.usuario;
        }
    }
}