<%@ Page Title="" Language="C#" MasterPageFile="~/inicio.Master" AutoEventWireup="true" CodeBehind="Proveedores.aspx.cs" Inherits="PI5.Proveedores" %>
<%@ Register assembly="Microsoft.ReportViewer.WebForms, Version=12.0.0.0, Culture=neutral, PublicKeyToken=89845dcd8080cc91" namespace="Microsoft.Reporting.WebForms" tagprefix="rsweb" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
     <link href="css/tecnico.css" rel="stylesheet">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="box box-info ">
        <!-- titulo -->
&nbsp;&nbsp;&nbsp; <asp:MultiView ID="MultiView1" runat="server">
            &nbsp;<asp:View ID="View4" runat="server">
            </asp:View>
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        <asp:View ID="View3" runat="server">
            <br />
            <div class="modificarpro">
            Nombre:<asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ControlToValidate="TextBox6" ErrorMessage="*" ForeColor="Red"></asp:RequiredFieldValidator>
                <asp:TextBox ID="TextBox6" runat="server" class="form-control" Width="318px" MaxLength="50"></asp:TextBox>
            <br />
                Telefono:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            <asp:TextBox ID="TextBox7" runat="server" class="form-control" Width="182px" MaxLength="15"></asp:TextBox>
            &nbsp;<br /> Direccion:<asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" ControlToValidate="TextBox8" ErrorMessage="*" ForeColor="Red"></asp:RequiredFieldValidator>
                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            <asp:TextBox ID="TextBox8" runat="server" class="form-control" Width="321px" MaxLength="200"></asp:TextBox>
            <br />
            Correo electronico:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            <asp:TextBox ID="TextBox9" runat="server" class="form-control" Width="320px" MaxLength="150" TextMode="Email"></asp:TextBox>
            <br />
            <br />
            <br />
                <asp:ImageButton ID="ImageButton5" runat="server" ImageUrl="~/img/iconos/Cancel_40px.png" OnClick="ImageButton5_Click" CausesValidation="False" />
                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;<asp:ImageButton ID="ImageButton4" runat="server" Height="39px" ImageUrl="~/img/iconos/Ok_40px.png" OnClick="ImageButton4_Click" Width="40px" />
            <br />
            <asp:TextBox ID="txtid" runat="server" Visible="False"></asp:TextBox>
                </div>
        </asp:View>
        <asp:View ID="View2" runat="server">
            &nbsp;&nbsp;&nbsp;&nbsp;
            <br />
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            <br />
            <br />
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            <div class="imgpro">
            <asp:ImageButton ID="ImageButton2" runat="server" ImageUrl="~/img/iconos/Plus_40px.png" OnClick="ImageButton2_Click" Width="40px" Height="40px" />
            </div>
            <br />
              <div class="table">
            <asp:GridView ID="GridView1" runat="server" AllowPaging="True" AutoGenerateColumns="False" CellPadding="4" DataKeyNames="ID_PROVEEDOR" DataSourceID="SqlDataSource1" ForeColor="#333333" GridLines="None" Height="20px" OnRowCommand="GridView1_RowCommand" Width="704px">
                <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
                <Columns>
                    <asp:BoundField DataField="ID_PROVEEDOR" HeaderText="ID_PROVEEDOR" InsertVisible="False" ReadOnly="True" SortExpression="ID_PROVEEDOR" Visible="False" />
                    <asp:BoundField DataField="NOMBRE" HeaderText="NOMBRE" SortExpression="NOMBRE" />
                    <asp:BoundField DataField="TELEFONO" HeaderText="TELEFONO" SortExpression="TELEFONO" />
                    <asp:BoundField DataField="DIRECCION" HeaderText="DIRECCION" SortExpression="DIRECCION" />
                    <asp:BoundField DataField="CORREO" HeaderText="CORREO" SortExpression="CORREO" />
                    <asp:TemplateField AccessibleHeaderText="eliminar" ShowHeader="False" HeaderText="ELIMINAR"><ItemTemplate><asp:ImageButton ID="ImageButton3" runat="server" CommandArgument='<%# Eval("ID_PROVEEDOR") %>' ImageUrl="~/img/iconos/Minus_16px.png" OnClick="ImageButton3_Click" /></ItemTemplate></asp:TemplateField>
                    <asp:ButtonField ButtonType="Image" CommandName="cargar" Text="Botón" ImageUrl="~/img/iconos/Edit_16px.png" HeaderText="MODIFICAR" />
                </Columns>
                <EditRowStyle BackColor="#999999" />
                <FooterStyle BackColor="#00C0EF" Font-Bold="True" ForeColor="White" />
                <HeaderStyle BackColor="#00C0EF" Font-Bold="True" ForeColor="White" />
                <PagerStyle BackColor="#00C0EF" ForeColor="White" HorizontalAlign="Center" />
                <RowStyle BackColor="#F7F6F3" ForeColor="#333333" />
                <SelectedRowStyle BackColor="#E2DED6" Font-Bold="True" ForeColor="#333333" />
                <SortedAscendingCellStyle BackColor="#E9E7E2" />
                <SortedAscendingHeaderStyle BackColor="#506C8C" />
                <SortedDescendingCellStyle BackColor="#FFFDF8" />
                <SortedDescendingHeaderStyle BackColor="#6F8DAE" />
            </asp:GridView>
            <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:PI5ConnectionString %>" DeleteCommand="DELETE FROM [PROVEEDOR] WHERE [ID_PROVEEDOR] = @ID_PROVEEDOR" InsertCommand="INSERT INTO [PROVEEDOR] ([NOMBRE], [TELEFONO], [DIRECCION], [CORREO]) VALUES (@NOMBRE, @TELEFONO, @DIRECCION, @CORREO)" SelectCommand="SELECT [ID_PROVEEDOR], [NOMBRE], [TELEFONO], [DIRECCION], [CORREO] FROM [PROVEEDOR] ORDER BY [NOMBRE]" UpdateCommand="UPDATE [PROVEEDOR] SET [NOMBRE] = @NOMBRE, [TELEFONO] = @TELEFONO, [DIRECCION] = @DIRECCION, [CORREO] = @CORREO WHERE [ID_PROVEEDOR] = @ID_PROVEEDOR">
                <DeleteParameters>
                    <asp:Parameter Name="ID_PROVEEDOR" Type="Int32" />
                </DeleteParameters>
                <InsertParameters>
                    <asp:Parameter Name="NOMBRE" Type="String" />
                    <asp:Parameter Name="TELEFONO" Type="String" />
                    <asp:Parameter Name="DIRECCION" Type="String" />
                    <asp:Parameter Name="CORREO" Type="String" />
                </InsertParameters>
                <UpdateParameters>
                    <asp:Parameter Name="NOMBRE" Type="String" />
                    <asp:Parameter Name="TELEFONO" Type="String" />
                    <asp:Parameter Name="DIRECCION" Type="String" />
                    <asp:Parameter Name="CORREO" Type="String" />
                    <asp:Parameter Name="ID_PROVEEDOR" Type="Int32" />
                </UpdateParameters>
            </asp:SqlDataSource>
        </asp:View>
        <asp:View ID="View1" runat="server">
            <div class="box-header with-border">
                <br />
                <h3 class="box-title">Ingreso de Proveedores</h3>
                <br />
            </div>        
            <div style="padding-left:15%;">
                <div class="bodybox">
                    <div class="form-group">
                        Nombre:
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="TextBox1" ErrorMessage="*" ForeColor="Red"></asp:RequiredFieldValidator>
                        <asp:TextBox ID="TextBox1" runat="server" class="form-control" placeholder="Nombre del proveedor" Width="318px" MaxLength="50"></asp:TextBox>
                    </div>
                    <div class="form-group">
                        Telefono:&nbsp;<asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="TextBox2" ErrorMessage="*" ForeColor="Red"></asp:RequiredFieldValidator>
                        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<asp:TextBox ID="TextBox2" runat="server" class="form-control" placeholder="0999999999" Width="182px" MaxLength="15"></asp:TextBox>
                        &nbsp;<br /> Direccion:&nbsp;<asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="TextBox5" ErrorMessage="*" ForeColor="Red"></asp:RequiredFieldValidator>
                        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                        <asp:TextBox ID="TextBox5" runat="server" class="form-control" placeholder="------------" Width="321px" MaxLength="200"></asp:TextBox>
                    </div>
                    <div class="form-group">
                        Correo electronico:&nbsp;<asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ControlToValidate="TextBox4" ErrorMessage="*" ForeColor="Red"></asp:RequiredFieldValidator>
                        &nbsp;<asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ControlToValidate="TextBox4" ErrorMessage="*" ForeColor="Yellow" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*"></asp:RegularExpressionValidator>
                        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                        <asp:TextBox ID="TextBox4" type="email" runat="server" class="form-control" placeholder="proveedor@example.com" Width="317px" MaxLength="150" TextMode="Email"></asp:TextBox>
                    </div>
                </div>
                <div class="box-footer" style="padding-left: 25%;padding-right: 15%;">
                    <asp:Button class="btn btn-default" ID="btnCancelar" runat="server" Text="Cancelar" OnClick="btnCancelar_Click" CausesValidation="False"/>
                    <asp:Button class="btn btn-info pull-right" ID="btnGuardar" runat="server" Text="Guardar" OnClick="btnGuardar_Click"/>
                </div>     
            </div>
        </asp:View>
    </asp:MultiView>
    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
    <br />
    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
     </div>
</asp:Content>
