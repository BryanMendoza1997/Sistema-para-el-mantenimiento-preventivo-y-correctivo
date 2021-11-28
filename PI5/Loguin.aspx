<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="z.aspx.cs" Inherits="PI5.Loguin" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
  <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
  <meta name="description" content=""/>
  <meta name="author" content="Dashboard"/>
  <meta name="keyword" content="Dashboard, Bootstrap, Admin, Template, Theme, Responsive, Fluid, Retina"/>
  <title>Sistema de Gestión Mantenimiento de Equipos</title>

  <!-- Favicons -->
  <link href="img/favicon.png" rel="icon"/>
  <link href="img/apple-touch-icon.png" rel="apple-touch-icon"/>

  <!-- Bootstrap core CSS -->
  <link href="lib/bootstrap/css/bootstrap.min.css" rel="stylesheet"/>
  <!--external css-->
  <link href="lib/font-awesome/css/font-awesome.css" rel="stylesheet" />
  <!-- Custom styles for this template -->
  <link href="css/style.css" rel="stylesheet"/>
  <link href="css/style-responsive.css" rel="stylesheet"/>
  
  <!-- =======================================================
    Template Name: Dashio
    Template URL: https://templatemag.com/dashio-bootstrap-admin-template/
    Author: TemplateMag.com
    License: https://templatemag.com/license/
  ======================================================= -->
</head>
<body>
     <!-- **********************************************************************************************************************************************************
      MAIN CONTENT
      *********************************************************************************************************************************************************** -->
  <div id="login-page">
    <div class="container">
      <form id="form1" runat="server" class="form-login">
        <h2 class="form-login-heading">SGM</h2>
        <div class="login-wrap">
            <asp:TextBox ID="txtUsuario" runat="server" class="form-control" placeholder="User ID" autofocus="true"></asp:TextBox>
          <br/>
            <asp:TextBox ID="txtPassword" runat="server" class="form-control" placeholder="Password" TextMode="Password"></asp:TextBox>
            <br/>
            <asp:Label ID="lblError" runat="server" Text="Contraseña incorrecta" ForeColor="#ff0000"></asp:Label>
            <label class="checkbox">
            <span class="pull-right">
            <a data-toggle="modal" href="Loguin.aspx#myModal"> Olvidé mi contraseña</a>
            </span>
            </label>
            <br/>
            <br/>
            <asp:Button ID="btniniciar" runat="server" Text="INICIAR" class="btn btn-theme btn-block" CausesValidation="False" OnClick="btniniciar_Click1"  />
            
          <hr/>
        </div>

        <!-- Modal -->
        <div aria-hidden="true" aria-labelledby="myModalLabel" role="dialog" tabindex="-1" id="myModal" class="modal fade">
          <div class="modal-dialog">
            <div class="modal-content">
              <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                <h4 class="modal-title">Olvidó su contaseña?</h4>
              </div>
              <div class="modal-body">
                <p>Ingrese su dirección de correo electrónico a continuación para restablecer su contraseña.</p>
                  <asp:TextBox Type="Email" ID="txtEmail" class="form-control placeholder-no-fix" placeholder="EMAIL" runat="server"></asp:TextBox>
              </div>
              <div class="modal-footer">
                  <asp:Button ID="cancelar" data-dismiss="modal" class="btn btn-default" runat="server" Text="Cancelar" />
                  <asp:Button ID="enviar" runat="server" class="btn btn-theme" Text="Enviar" OnClick="enviar_Click"/>
              </div>
            </div>
          </div>
        </div>
        <!-- modal -->
      </form>
    </div>
  </div>
  <!-- js placed at the end of the document so the pages load faster -->
  <script src="lib/jquery/jquery.min.js"></script>
  <script src="lib/bootstrap/js/bootstrap.min.js"></script>
  <!--BACKSTRETCH-->
  <!-- You can use an image of whatever size. This script will stretch to fit in any screen size.-->
  <script type="text/javascript" src="lib/jquery.backstretch.min.js"></script>
  <script>
    $.backstretch("img/login-bg.jpg", {
      speed: 500
    });
  </script>
</body>
</html>
