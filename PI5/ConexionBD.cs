using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data.Sql;
using System.Data.SqlTypes;
using System.Data.SqlClient;
using System.Data;

namespace PI5
{
    public class ConexionBD
    {
        SqlConnection conectar;
        public SqlConnection Conectar()
        {
            conectar = new SqlConnection("Data Source=.;Initial Catalog=PI5;User ID=sa;Password=123456789");
            conectar.Open();
            return conectar;
        }
        public void cerrar()
        {
            if (conectar.State == ConnectionState.Open)
                conectar.Close();
        }
        }
}