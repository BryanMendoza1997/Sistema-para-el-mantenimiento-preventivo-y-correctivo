<%@ Page Title="" Language="C#" EnableEventValidation="false" MasterPageFile="~/inicio.Master" AutoEventWireup="true" CodeBehind="tecnico.aspx.cs" Inherits="PI5.Formulario_web13" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link href="css/tecnico.css" rel="stylesheet">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
     <div class="box box-info ">
        <!-- titulo -->
        <div class="box-header with-border">
            <h3 class="box-title">Datos de Usuario</h3>
        </div>
        <!--titulo fin-->
        <!--- formulario --->
        <form class="form-horizontal">
            <asp:MultiView ID="MultiView1" runat="server">
                <asp:View ID="View1" runat="server">
                <div class="box-body">
                <div class="form-group">
                    <asp:Label Width=65 ID="lblnombre" runat="server"  Text="Nombres:"></asp:Label>&nbsp&nbsp&nbsp&nbsp&nbsp
                    <asp:TextBox Enabled="true" Width=250  ID="txtnombre" runat="server" ></asp:TextBox>
                </div>
                <div class="form-group">
                    <asp:Label Width=65 ID="lblapllidos" runat="server" Text="Apellidos:"></asp:Label>&nbsp&nbsp&nbsp&nbsp&nbsp
                    <asp:TextBox  Width=250 ID="txtapellido" runat="server"></asp:TextBox>
                </div>
                <div class="form-group">
                    <asp:Label Width=65 ID="lblCargo" runat="server" Text="Especialidad:"></asp:Label>&nbsp&nbsp&nbsp&nbsp&nbsp
                    <asp:DropDownList ID="ddlcargo" Width=250 runat="server">
                        <asp:ListItem Selected="True" Value="-1">-</asp:ListItem>
                        <asp:ListItem>Electricista</asp:ListItem>
                        <asp:ListItem>Computacional</asp:ListItem>
                    </asp:DropDownList>
                </div>
                <div class="form-group">
                    <asp:Label Width=65 ID="lblsexo" runat="server" Text="Sexo:"></asp:Label>&nbsp&nbsp&nbsp&nbsp&nbsp
                    <asp:DropDownList ID="ddlsexo" Width=250 runat="server">
                        <asp:ListItem Value="-1">-</asp:ListItem>
                        <asp:ListItem Value="1">Masculino</asp:ListItem>
                        <asp:ListItem Value="0">Femenino</asp:ListItem>
                    </asp:DropDownList>
                </div>
                <div class="form-group">
                    <asp:Label Width=65 ID="lblcedula" runat="server" Text="Cedula:"></asp:Label>&nbsp&nbsp&nbsp&nbsp&nbsp
                    <asp:TextBox  Width=250 ID="txtcedula" runat="server"></asp:TextBox>
                </div>
                <div class="form-group">
                    <asp:Label Width=65 ID="lblfechadenacimiento" runat="server" Text="Fecha de Nacimiento:" style="margin-left: 0px"></asp:Label>&nbsp&nbsp&nbsp&nbsp&nbsp
                     <asp:TextBox Enabled="true" Width=250  ID="txtfecha" runat="server" TextMode="Date" ></asp:TextBox>          
                </div>
            </div>
            <!--- botones --->
            <div class="box-footer">
                <asp:Button class="btn btn-default" ID="cancelar" runat="server" Text="Cancelar" OnClick="cancelar_Click" />
                <asp:Button class="btn btn-info pull-right" ID="guardar" runat="server" Text="Guardar" OnClick="guardar_Click"/>
            </div>
            <!--botones fin-->
            </asp:View>
                <asp:View ID="View2" runat="server">
            <div class="table">
                <asp:ImageButton ID="ImageButton2" runat="server" ImageUrl="~/img/iconos/Plus_40px.png" OnClick="ImageButton2_Click1" />
                <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataKeyNames="ID_TECNICO" DataSourceID="SqlDataSource2" Width="704px" AllowPaging="True" CellPadding="4" ForeColor="#333333" GridLines="None" OnSelectedIndexChanged="GridView1_SelectedIndexChanged" Height="20px">
                    <AlternatingRowStyle BackColor="White" />
                    <Columns  >
                        <asp:BoundField DataField="ID_TECNICO" HeaderText="ID_TECNICO" SortExpression="ID_TECNICO" InsertVisible="False" ReadOnly="True" Visible="False"  />
                        <asp:BoundField DataField="NOMBRE" HeaderText="NOMBRE" SortExpression="NOMBRE" />
                        <asp:BoundField DataField="APELLIDO" HeaderText="APELLIDO" SortExpression="APELLIDO" />
                        <asp:BoundField DataField="FECHA" HeaderText="FECHA DE NACIMIENTO" SortExpression="FECHA" />
                        <asp:BoundField DataField="GÉNERO" HeaderText="GÉNERO" SortExpression="GÉNERO" ReadOnly="True" />
                        <asp:BoundField DataField="CARGO" HeaderText="CARGO" SortExpression="CARGO" />
                        <asp:BoundField DataField="CEDULA" HeaderText="CEDULA" SortExpression="CEDULA" />
                        <asp:TemplateField ShowHeader="False">
                            <ItemTemplate>
                                <asp:ImageButton ID="ImageButton1" runat="server" CausesValidation="False" CommandArgument='<%# Eval("ID_TECNICO") %>' Height="31px" ImageUrl="~/img/eliminar.png" OnClick="ImageButton1_Click1" Text="eliminar" Width="27px" />
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:CommandField ShowSelectButton="True" />
                    </Columns>
                    <EditRowStyle BackColor="#2461BF" />
                    <FooterStyle BackColor="#00c0ef" Font-Bold="True" ForeColor="White" />
                    <HeaderStyle BackColor="#00c0ef" Font-Bold="True" ForeColor="White" />
                    <PagerStyle BackColor="#00c0ef" ForeColor="White" HorizontalAlign="Center" />
                    <RowStyle BackColor="#EFF3FB" />
                    <SelectedRowStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
                    <SortedAscendingCellStyle BackColor="#F5F7FB" />
                    <SortedAscendingHeaderStyle BackColor="#6D95E1" />
                    <SortedDescendingCellStyle BackColor="#E9EBEF" />
                    <SortedDescendingHeaderStyle BackColor="#4870BE" />
                </asp:GridView>
                <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:PI5ConnectionString %>" DeleteCommand="ActualizarPlanMantenimiento" DeleteCommandType="StoredProcedure" SelectCommand="selecttecnico" SelectCommandType="StoredProcedure">
                    <DeleteParameters>
                        <asp:Parameter Name="TIEMPO" Type="Int16" />
                        <asp:Parameter DbType="Date" Name="FECHA" />
                        <asp:Parameter Name="DIASANTICIPACION" Type="Int16" />
                        <asp:Parameter Name="ESTADO" Type="String" />
                    </DeleteParameters>
                </asp:SqlDataSource>
            
            </div>
                    </asp:View>
            </asp:MultiView>
            <div>
                <br/>
                <asp:TextBox ID="txtid" runat="server" Visible="False" Width="21px"></asp:TextBox>
                <br/>
                <br/>
                
            </div>
        </form>
        <!--fin formulario-->
    </div>
</asp:Content>
