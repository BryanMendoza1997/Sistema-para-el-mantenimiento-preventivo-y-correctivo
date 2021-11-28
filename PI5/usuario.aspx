<%@ Page Title="" EnableEventValidation="false" Language="C#" MasterPageFile="~/inicio.Master" AutoEventWireup="true" CodeBehind="usuario.aspx.cs" Inherits="PI5.Formulario_web12" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link href="css/usuario.css" rel="stylesheet">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server"> 
    <asp:ScriptManager runat="server"></asp:ScriptManager>
    <div class="box box-info">
        <!-- titulo -->
        <div class="box-header with-border">
            <h3 class="box-title">Datos de Usuario</h3>
        </div>
        <!--titulo fin-->
        <!--- formulario --->
        <div class="moverusuario">
        <form class="form-horizontal">
            <div class="box-body">
                <div class="form-group">
                    <asp:Label Width=65 ID="lblusuario" runat="server" Text="Usuario:"></asp:Label>
                    <asp:TextBox Enabled="false" Width=250 class="btn btn-default" ID="txtUsuario" runat="server" Text= <%usuario%>></asp:TextBox>
                </div>
                <div class="form-group">
                    <asp:Label Width=65 ID="lblca" runat="server" Text="Clave Actual:"></asp:Label>
                    <asp:TextBox type="Password" Width=250 ID="txtCActual" runat="server"></asp:TextBox>
                </div>
                <div class="form-group">
                    <asp:Label Width=65 ID="lblcn" runat="server" Text="Nueva Clave:"></asp:Label>
                    <asp:TextBox type="Password" Width=250 ID="txtCNueva" runat="server"></asp:TextBox>
                </div>
                <div class="form-group">
                    <asp:Label Width=65 ID="lblcc" runat="server" Text="Confirmar Clave:"></asp:Label>
                    <asp:TextBox type="Password" Width=250 ID="txtConfirmar" runat="server"></asp:TextBox>
                </div>
            </div>
            <!--- botones --->
            <div class="box-footer">
                <asp:Button class="btn btn-default" ID="cancelar" runat="server" Text="Cancelar" OnClick="cancelar_Click"/>
                <asp:Button class="btn btn-info pull-right" ID="guardar" runat="server" Text="Guardar" OnClick="guardar_Click"/>
            </div>
            <!--botones fin-->
        </form>
            </div>
        <!--fin formulario-->
    </div>
    <br /><br /><br /><br /><br /><br />
</asp:Content>
