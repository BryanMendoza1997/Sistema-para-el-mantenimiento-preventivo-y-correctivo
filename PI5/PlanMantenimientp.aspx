<%@ Page Title="" Language="C#" MasterPageFile="~/inicio.Master" AutoEventWireup="true" CodeBehind="PlanMantenimientp.aspx.cs" Inherits="PI5.PlanMantenimientp" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
     <link href="css/tecnico.css" rel="stylesheet">
    <link href="css/maquiequipos.css" rel="stylesheet">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <br />
    <div class="box box-info">
<asp:MultiView ID="MultiView1" runat="server">
    <asp:View ID="View2" runat="server">
        <div class="modificarpro">
        <asp:GridView ID="GridView2" runat="server" AllowPaging="True" AutoGenerateColumns="False" CellPadding="4" DataKeyNames="ID_MAQUIEQUIPO" DataSourceID="SqlDataSource1" ForeColor="#333333" GridLines="None" OnSelectedIndexChanged="GridView2_SelectedIndexChanged">
            <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
            <Columns>
                <asp:CommandField ButtonType="Image" HeaderText="Seleccion" SelectImageUrl="~/img/iconos/listo.png" ShowSelectButton="True" />
                <asp:BoundField DataField="ID_MAQUIEQUIPO" HeaderText="  ID  " ReadOnly="True" SortExpression="ID_MAQUIEQUIPO" />
                <asp:BoundField DataField="NOMBRE" HeaderText="     NOMBRE" SortExpression="NOMBRE" />
                <asp:BoundField DataField="MARCA" HeaderText="MARCA" SortExpression="MARCA" />
                <asp:BoundField DataField="MODELO" HeaderText="MODELO" SortExpression="MODELO" />
                <asp:BoundField DataField="DESCRIPCION" HeaderText="DESCRIPCION" SortExpression="DESCRIPCION" />
            </Columns>
            <EditRowStyle BackColor="#999999" />
            <FooterStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
            <HeaderStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
            <PagerStyle BackColor="#284775" ForeColor="White" HorizontalAlign="Center" />
            <RowStyle BackColor="#F7F6F3" ForeColor="#333333" />
            <SelectedRowStyle BackColor="#E2DED6" Font-Bold="True" ForeColor="#333333" />
            <SortedAscendingCellStyle BackColor="#E9E7E2" />
            <SortedAscendingHeaderStyle BackColor="#506C8C" />
            <SortedDescendingCellStyle BackColor="#FFFDF8" />
            <SortedDescendingHeaderStyle BackColor="#6F8DAE" />
        </asp:GridView>
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:PI5ConnectionString %>" DeleteCommand="DELETE FROM [MAQUIEQUIPO] WHERE [ID_MAQUIEQUIPO] = @ID_MAQUIEQUIPO" InsertCommand="INSERT INTO [MAQUIEQUIPO] ([NOMBRE], [MARCA], [MODELO], [DESCRIPCION]) VALUES (@NOMBRE, @MARCA, @MODELO, @DESCRIPCION)" SelectCommand="SELECT [ID_MAQUIEQUIPO], [NOMBRE], [MARCA], [MODELO], [DESCRIPCION] FROM [MAQUIEQUIPO] ORDER BY [NOMBRE]" UpdateCommand="UPDATE [MAQUIEQUIPO] SET [NOMBRE] = @NOMBRE, [MARCA] = @MARCA, [MODELO] = @MODELO, [DESCRIPCION] = @DESCRIPCION WHERE [ID_MAQUIEQUIPO] = @ID_MAQUIEQUIPO">
            <DeleteParameters>
                <asp:Parameter Name="ID_MAQUIEQUIPO" Type="Int32" />
            </DeleteParameters>
            <InsertParameters>
                <asp:Parameter Name="NOMBRE" Type="String" />
                <asp:Parameter Name="MARCA" Type="String" />
                <asp:Parameter Name="MODELO" Type="String" />
                <asp:Parameter Name="DESCRIPCION" Type="String" />
            </InsertParameters>
            <UpdateParameters>
                <asp:Parameter Name="NOMBRE" Type="String" />
                <asp:Parameter Name="MARCA" Type="String" />
                <asp:Parameter Name="MODELO" Type="String" />
                <asp:Parameter Name="DESCRIPCION" Type="String" />
                <asp:Parameter Name="ID_MAQUIEQUIPO" Type="Int32" />
            </UpdateParameters>
        </asp:SqlDataSource>
            </div>
    </asp:View>
    <asp:View ID="View1" runat="server">
        <h3 class="box-title">Registro de Plan de Mantenimiento</h3>
         <div class="modificarpro">
        <asp:Label ID="Label1" runat="server" Text="Usuario: " Visible="False"></asp:Label>
        &nbsp;<asp:Label ID="lbUsuario" runat="server" Visible="False"></asp:Label>
        <asp:Label ID="lbid" runat="server" Visible="False"></asp:Label>
             <br />
             <asp:Label ID="Label7" runat="server" Text="Maquinaria o Equipo:"></asp:Label>
             <asp:ImageButton ID="ImageButton2" runat="server" ImageUrl="~/img/iconos/Search_16px.png" OnClick="ImageButton2_Click" CausesValidation="False" />
             <br />
             <asp:TextBox ID="txtMaquiequipo" runat="server" class="form-control" Enabled="False" Width="136px"></asp:TextBox>
             <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" ControlToValidate="txtMaquiequipo" ErrorMessage="*" ForeColor="Red"></asp:RequiredFieldValidator>
        <br />
        <asp:Label ID="Label2" runat="server" Text="Tiempo: "></asp:Label>
             <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="txtTiempo" ErrorMessage="*" ForeColor="Red"></asp:RequiredFieldValidator>
        <br />
        <asp:TextBox ID="txtTiempo" runat="server" class="form-control" TextMode="Number" Width="136px" MaxLength="8"></asp:TextBox>
        <br />
             <br />
        <asp:Label ID="Label3" runat="server" Text="Fecha: "></asp:Label>
             <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="txtFecha" ErrorMessage="*" ForeColor="Red"></asp:RequiredFieldValidator>
        <br />
        <asp:TextBox ID="txtFecha" runat="server" class="form-control" TextMode="Date" Width="183px"></asp:TextBox>
        <br />
             <br />
        <asp:Label ID="Label4" runat="server" Text="Dias de Anticipacion: "></asp:Label>
             <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="txtDias" ErrorMessage="*" ForeColor="Red"></asp:RequiredFieldValidator>
        <br />
        <asp:TextBox ID="txtDias" runat="server" class="form-control" TextMode="Number" Width="136px" MaxLength="8"></asp:TextBox>
        <br />
             <br />
        <asp:Label ID="Label5" runat="server" Text="Tareas: "></asp:Label>
             <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ControlToValidate="txtTareas" ErrorMessage="*" ForeColor="Red"></asp:RequiredFieldValidator>
        <br />
        <asp:TextBox ID="txtTareas" runat="server" class="form-control" Width="478px" MaxLength="300"></asp:TextBox>
             <br />
             <br />
             <asp:Label ID="Label6" runat="server" Text="Periocidad: "></asp:Label>
             <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ControlToValidate="txtPeriocidad" ErrorMessage="*" ForeColor="Red"></asp:RequiredFieldValidator>
             <br />
             <asp:TextBox ID="txtPeriocidad" runat="server" class="form-control" TextMode="Number" Width="136px" MaxLength="8"></asp:TextBox>
        <br />
             <br />
        <asp:Button ID="txtAnadir" runat="server" class="btn btn-theme btn-block" Height="31px" OnClick="txtAnadir_Click" Text="Añadir tarea" Width="106px" />
             <asp:GridView ID="GridView1" runat="server" CellPadding="4" ForeColor="#333333" GridLines="None" Width="318px">
                 <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
                 <EditRowStyle BackColor="#999999" />
                 <FooterStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
                 <HeaderStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
                 <PagerStyle BackColor="#284775" ForeColor="White" HorizontalAlign="Center" />
                 <RowStyle BackColor="#F7F6F3" ForeColor="#333333" />
                 <SelectedRowStyle BackColor="#E2DED6" Font-Bold="True" ForeColor="#333333" />
                 <SortedAscendingCellStyle BackColor="#E9E7E2" />
                 <SortedAscendingHeaderStyle BackColor="#506C8C" />
                 <SortedDescendingCellStyle BackColor="#FFFDF8" />
                 <SortedDescendingHeaderStyle BackColor="#6F8DAE" />
             </asp:GridView>
        <br />
             <br />
             <asp:Button ID="txtGuardar" runat="server" class="btn btn-theme btn-block" Height="31px" OnClick="txtGuardar_Click" Text="Guardar" Width="78px" CausesValidation="False" />
        <br />
             </div>
    </asp:View>
</asp:MultiView>
        </div>
</asp:Content>
