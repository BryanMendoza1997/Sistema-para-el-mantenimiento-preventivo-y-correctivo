<%@ Page Title="" Language="C#" MasterPageFile="~/inicio.Master" AutoEventWireup="true" CodeBehind="Maquiequipos.aspx.cs" Inherits="PI5.Maquiequipos" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link href="css/maquiequipos.css" rel="stylesheet">    
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="box box-info">
            <asp:MultiView ID="MultiView1" runat="server">
                <asp:View ID="View3" runat="server">
                    <div class="box-header with-border">
                            <br />
                            <h3 class="box-title">Escoger Proveedor</h3>
                            <br />                           
                    </div>
                    <div>
                        <div class="bodybox">
                            <div class="form-group" style="padding-left:35px;">
                                <div class="izquierda">
                                    <asp:Label ID="lblBuscar" Class="texto" runat="server" Text="Buscar: "></asp:Label>
                                    <asp:TextBox ID="txtBuscar" Class="form-control" runat="server"></asp:TextBox> 
                                </div>
                                <div class="izquierda">
                                    <asp:Label ID="lblVacio" Class="texto" runat="server" Text="" Width="15px"></asp:Label>
                                    <asp:DropDownList ID="cbbBuscar" Class="form-control" runat="server" Width="100" Height="28">
                                        <asp:ListItem>Nombre</asp:ListItem>
                                        <asp:ListItem>Direccion</asp:ListItem>
                                        <asp:ListItem>Correo</asp:ListItem>
                                    </asp:DropDownList>  
                                </div>                                                                          
                            </div>
                            <br />
                            <div style="padding-left:45px;">                                                                     
                            <asp:GridView ID="dgvProveedores" runat="server" AllowPaging="True" AutoGenerateColumns="False" CellPadding="4" DataKeyNames="ID_PROVEEDOR" DataSourceID="SqlDataSource2" ForeColor="#333333" GridLines="None" OnSelectedIndexChanged="GridView2_SelectedIndexChanged" Width="481px">
                            <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
                            <Columns>              
                                <asp:CommandField ButtonType="Image" InsertImageUrl="~/img/im.png" SelectImageUrl="~/img/Checkmark_48px.png" SelectText="" ShowSelectButton="True">
                                <ControlStyle Height="20px" />
                                <FooterStyle Height="5px" />
                                <ItemStyle Height="1px" Width="5px" />
                                </asp:CommandField>
                                <asp:BoundField DataField="ID_PROVEEDOR" HeaderText="ID_PROVEEDOR" SortExpression="ID_PROVEEDOR" InsertVisible="False" ReadOnly="True" Visible="False" />
                                <asp:BoundField DataField="NOMBRE" HeaderText="NOMBRE" SortExpression="NOMBRE" />
                                <asp:BoundField DataField="TELEFONO" HeaderText="TELEFONO" SortExpression="TELEFONO" />
                                <asp:BoundField DataField="DIRECCION" HeaderText="DIRECCION" SortExpression="DIRECCION" />
                                <asp:BoundField DataField="CORREO" HeaderText="CORREO" SortExpression="CORREO" />
                            </Columns>
                            <EditRowStyle BackColor="#999999" />
                            <FooterStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
                            <HeaderStyle BackColor="#00C0EF" Font-Bold="True" ForeColor="White" />
                            <PagerStyle BackColor="#00C0EF" ForeColor="White" HorizontalAlign="Center" />
                            <RowStyle BackColor="#F7F6F3" ForeColor="#333333" />
                            <SelectedRowStyle BackColor="#E2DED6" Font-Bold="True" ForeColor="#333333" />
                            <SortedAscendingCellStyle BackColor="#E9E7E2" />
                            <SortedAscendingHeaderStyle BackColor="#506C8C" />
                            <SortedDescendingCellStyle BackColor="#FFFDF8" />
                            <SortedDescendingHeaderStyle BackColor="#6F8DAE" />
                        </asp:GridView>
                        </div>
                        </div>
                        <br />
                        <div class="box-footer">
                            <asp:Button class="btn btn-default" ID="btnCancelar2" runat="server" Text="Regresar" OnClick="btnCancelar2_Click"/>
                        </div> 
                    </div>
                    <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:PI5ConnectionString %>" SelectCommand="SELECTPROVEEDOR" SelectCommandType="StoredProcedure"></asp:SqlDataSource>
                </asp:View>
                <asp:View ID="View2" runat="server">
                    <div class="box-header with-border">
                        <br />
                        <h3 class="box-title">Maquinarias y/o Equipos</h3>
                        <br />
                    </div>
                    <div>
                        <asp:ImageButton ID="btnAgregar" runat="server" ImageUrl="~/img/iconos/Plus_40px.png" OnClick="btnAgregar_Click" />
                        <asp:GridView ID="dgvMaquiequipos" runat="server" AutoGenerateColumns="False" CellPadding="4" DataKeyNames="ID_MAQUIEQUIPO" DataSourceID="SqlDataSource4" ForeColor="#333333" GridLines="None" Width="1100px">
                            <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
                            <Columns>
                                <asp:CommandField ButtonType="Image" SelectImageUrl="~/img/Checkmark_48px.png" SelectText="" ShowSelectButton="True">
                                <ControlStyle Width="20px" />
                                </asp:CommandField>
                                <asp:BoundField DataField="ID_MAQUIEQUIPO" HeaderText="ID_MAQUIEQUIPO" InsertVisible="False" ReadOnly="True" SortExpression="ID_MAQUIEQUIPO" Visible="False" />
                                <asp:BoundField DataField="NOMBRE" HeaderText="NOMBRE" SortExpression="NOMBRE" />
                                <asp:BoundField DataField="MODELO" HeaderText="MODELO" SortExpression="MODELO" />
                                <asp:BoundField DataField="MARCA" HeaderText="MARCA" SortExpression="MARCA" />
                                <asp:BoundField DataField="FABRICANTE" HeaderText="FABRICANTE" SortExpression="FABRICANTE" />
                                <asp:BoundField DataField="PROVEEDOR" HeaderText="PROVEEDOR" SortExpression="PROVEEDOR" />
                                <asp:BoundField DataField="FECHAPUESTAENFUNCIONAMIENTO" HeaderText="FECHA FUNCIONAMIENTO" SortExpression="FECHAPUESTAENFUNCIONAMIENTO" />
                                <asp:CheckBoxField DataField="ESTADODELEQUIPO" HeaderText="ESTADO" SortExpression="ESTADODELEQUIPO" />
                                <asp:ButtonField ButtonType="Image" ImageUrl="~/img/eliminar.png">
                                <ControlStyle Width="20px" />
                                </asp:ButtonField>
                            </Columns>
                            <EditRowStyle BackColor="#999999" />
                            <FooterStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
                            <HeaderStyle BackColor="#00C0EF" Font-Bold="True" ForeColor="White" />
                            <PagerStyle BackColor="#00C0EF" ForeColor="White" HorizontalAlign="Center" />
                            <RowStyle BackColor="#F7F6F3" ForeColor="#333333" />
                            <SelectedRowStyle BackColor="#E2DED6" Font-Bold="True" ForeColor="#333333" />
                            <SortedAscendingCellStyle BackColor="#E9E7E2" />
                            <SortedAscendingHeaderStyle BackColor="#506C8C" />
                            <SortedDescendingCellStyle BackColor="#FFFDF8" />
                            <SortedDescendingHeaderStyle BackColor="#6F8DAE" />
                        </asp:GridView>
                        <asp:SqlDataSource ID="SqlDataSource4" runat="server" ConnectionString="<%$ ConnectionStrings:PI5ConnectionString %>" SelectCommand="SelectMaquiequipo" SelectCommandType="StoredProcedure"></asp:SqlDataSource>
                        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:PI5ConnectionString %>" DeleteCommand="DELETE FROM [MAQUIEQUIPO] WHERE [ID_MAQUIEQUIPO] = @ID_MAQUIEQUIPO" InsertCommand="INSERT INTO [MAQUIEQUIPO] ([NOMBRE], [MARCA], [MODELO], [TENSION], [DESCRIPCION], [VALORCOMPRA], [SERIE], [ACCESORIOS], [FECHAADQUISICION], [GARANTIA], [FABRICANTE], [ESTADO]) VALUES (@NOMBRE, @MARCA, @MODELO, @TENSION, @DESCRIPCION, @VALORCOMPRA, @SERIE, @ACCESORIOS, @FECHAADQUISICION, @GARANTIA, @FABRICANTE, @ESTADO)" SelectCommand="SelectMaquiequipo" UpdateCommand="UPDATE [MAQUIEQUIPO] SET [NOMBRE] = @NOMBRE, [MARCA] = @MARCA, [MODELO] = @MODELO, [TENSION] = @TENSION, [DESCRIPCION] = @DESCRIPCION, [VALORCOMPRA] = @VALORCOMPRA, [SERIE] = @SERIE, [ACCESORIOS] = @ACCESORIOS, [FECHAADQUISICION] = @FECHAADQUISICION, [GARANTIA] = @GARANTIA, [FABRICANTE] = @FABRICANTE, [ESTADO] = @ESTADO WHERE [ID_MAQUIEQUIPO] = @ID_MAQUIEQUIPO" SelectCommandType="StoredProcedure">
                            <DeleteParameters>
                                <asp:Parameter Name="ID_MAQUIEQUIPO" Type="Int32" />
                            </DeleteParameters>
                            <InsertParameters>
                                <asp:Parameter Name="NOMBRE" Type="String" />
                                <asp:Parameter Name="MARCA" Type="String" />
                                <asp:Parameter Name="MODELO" Type="String" />
                                <asp:Parameter Name="TENSION" Type="Decimal" />
                                <asp:Parameter Name="DESCRIPCION" Type="String" />
                                <asp:Parameter Name="VALORCOMPRA" Type="Decimal" />
                                <asp:Parameter Name="SERIE" Type="Int32" />
                                <asp:Parameter Name="ACCESORIOS" Type="String" />
                                <asp:Parameter DbType="Date" Name="FECHAADQUISICION" />
                                <asp:Parameter Name="GARANTIA" Type="Int16" />
                                <asp:Parameter Name="FABRICANTE" Type="String" />
                                <asp:Parameter Name="ESTADO" Type="Boolean" />
                            </InsertParameters>
                            <UpdateParameters>
                                <asp:Parameter Name="NOMBRE" Type="String" />
                                <asp:Parameter Name="MARCA" Type="String" />
                                <asp:Parameter Name="MODELO" Type="String" />
                                <asp:Parameter Name="TENSION" Type="Decimal" />
                                <asp:Parameter Name="DESCRIPCION" Type="String" />
                                <asp:Parameter Name="VALORCOMPRA" Type="Decimal" />
                                <asp:Parameter Name="SERIE" Type="Int32" />
                                <asp:Parameter Name="ACCESORIOS" Type="String" />
                                <asp:Parameter DbType="Date" Name="FECHAADQUISICION" />
                                <asp:Parameter Name="GARANTIA" Type="Int16" />
                                <asp:Parameter Name="FABRICANTE" Type="String" />
                                <asp:Parameter Name="ESTADO" Type="Boolean" />
                                <asp:Parameter Name="ID_MAQUIEQUIPO" Type="Int32" />
                            </UpdateParameters>
                        </asp:SqlDataSource>
                    </div>
                </asp:View>
                <asp:View ID="View1" runat="server">
                    <div class="box-header with-border">
                        <br />
                        <h3 class="box-title">Datos de Maquinarias y/o Equipos</h3>
                        <br />
                    </div>                    
                    <div>
                        <div class="bodybox">
                            <div class="form-group">
                                <div class="izquierda">
                                    <asp:Label ID="lblNombre" Class="texto" runat="server" Text="Nombre: "></asp:Label>
                                    <asp:TextBox ID="txtNombre" Class="form-control" runat="server"></asp:TextBox>
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="*" ControlToValidate="txtNombre" ForeColor="Red" Font-Size="20px" ToolTip="Campo Obligatorio"></asp:RequiredFieldValidator>                  
                                </div>                   
                                <div class="derecha">
                                    <asp:Label ID="lblFechaAdquisicion" Class="texto2" runat="server" Text="Fecha de Adquisición: "></asp:Label>
                                    <asp:TextBox ID="txtFechaAdquisicion" Class="form-control" runat="server" TextMode="Date"></asp:TextBox>  
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ErrorMessage="*" ControlToValidate="txtFechaAdquisicion" ForeColor="Red" Font-Size="20px" ToolTip="Campo Obligatorio"></asp:RequiredFieldValidator>                     
                                </div>
                            </div>
                            <div class="form-group">
                                <div class="izquierda">
                                    <asp:Label ID="lblMarca" Class="texto" runat="server" Text="Marca: "></asp:Label>                   
                                    <asp:TextBox ID="txtMarca" Class="form-control" runat="server"></asp:TextBox>  
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ErrorMessage="*" ControlToValidate="txtMarca" ForeColor="Red" Font-Size="20px" ToolTip="Campo Obligatorio"></asp:RequiredFieldValidator>                        
                                </div>
                                <div class="derecha">
                                    <asp:Label ID="lblValorCompra" Class="texto2" runat="server" Text="Valor de compra: "></asp:Label>
                                    <asp:TextBox ID="txtValorCompra" Class="form-control" runat="server"></asp:TextBox>  
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ErrorMessage="*" ControlToValidate="txtValorCompra" ForeColor="Red" Font-Size="20px" ToolTip="Campo Obligatorio"></asp:RequiredFieldValidator>                  
                                </div>
                            </div>
                            <div class="form-group">
                                <div class="izquierda">
                                    <asp:Label ID="lblModelo" Class="texto" runat="server" Text="Modelo: "></asp:Label>                  
                                    <asp:TextBox ID="txtModelo" Class="form-control" runat="server"></asp:TextBox>
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ErrorMessage="*" ControlToValidate="txtModelo" ForeColor="Red" Font-Size="20px" ToolTip="Campo Obligatorio"></asp:RequiredFieldValidator>
                                </div>
                                <div class="derecha">    
                                    <asp:Label ID="lblTipoActivo" Class="texto2" runat="server" Text="Tipo de Activo: "></asp:Label>
                                    <asp:DropDownList ID="cbbTipoActivo" Class="form-control" runat="server" DataSourceID="activos" DataTextField="TIPO" DataValueField="IDTIPOACTIVO"></asp:DropDownList>
                                    &nbsp;&nbsp;
                                    <asp:SqlDataSource ID="activos" runat="server" ConnectionString="<%$ ConnectionStrings:PI5ConnectionString %>" SelectCommand="SELECT [IDTIPOACTIVO], [TIPO], [VIDAUTILMESES] FROM [TIPOACTIVO]"></asp:SqlDataSource>
                                </div>
                            </div>
                            <div class="form-group">
                                <div class="izquierda">
                                    <asp:Label ID="lblProveedor" Class="texto" runat="server" Text="Proveedor: "></asp:Label>
                                    <asp:TextBox ID="txtProveedor" Enabled="false" CssClass="form-control" runat="server"></asp:TextBox>
                                    <asp:LinkButton id="btnProveedor" Class="icono" runat="server" Height="20px" Width="28px" OnClick="btnProveedor_Click" CausesValidation="False" ><i class="fa fa-search"></i></asp:LinkButton>
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" ErrorMessage="*" ControlToValidate="txtProveedor" ForeColor="Red" Font-Size="20px" ToolTip="Campo Obligatorio"></asp:RequiredFieldValidator>
                                </div>
                                <div class="derecha">
                                    <asp:Label ID="lblUsoAnt" CssClass="texto2" runat="server" Text="Tiempo de Uso Anteriormente: "></asp:Label>
                                    <asp:TextBox ID="txtxUsoAnt" CssClass="form-control" runat="server"></asp:TextBox>  
                                    &nbsp;&nbsp;         
                                </div>
                            </div>
                            <div class="form-group">
                                <div class="izquierda">
                                    <asp:Label ID="lblFabricante" Class="texto" runat="server" Text="Fabricante: "></asp:Label>
                                    <asp:TextBox ID="txtFabricante" Class="form-control" runat="server"></asp:TextBox>                               
                                </div>
                                <div class="derecha">
                                    <asp:Label ID="lblFechFunc" Class="texto2" runat="server" Text="Fecha Puesta en Funcionamiento: "></asp:Label>
                                    <asp:TextBox ID="txtFechFunc" Class="form-control" runat="server" TextMode="Date"></asp:TextBox>   
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator8" runat="server" ErrorMessage="*" ControlToValidate="txtFechFunc" ForeColor="Red" Font-Size="20px" ToolTip="Campo Obligatorio"></asp:RequiredFieldValidator>                         
                                </div>
                            </div>
                            <div class="form-group">
                                <div class="izquierda">
                                    <asp:Label ID="lblAccesorios" Class="texto" runat="server" Text="Accesorios: "></asp:Label>
                                    <asp:TextBox ID="txtAccesorios" Class="form-control" runat="server"></asp:TextBox>                                   
                                </div>
                                <div class="derecha">
                                    <asp:Label ID="lblEstado" Class="texto2" runat="server" Text="Estado: "></asp:Label>
                                    <asp:DropDownList ID="cbbEstado" Class="form-control" runat="server">
                                        <asp:ListItem>Activo</asp:ListItem>
                                        <asp:ListItem>En Mantenimiento</asp:ListItem>
                                    </asp:DropDownList>                              
                                    &nbsp;&nbsp;        
                                </div>
                            </div>
                            <div class="form-group">
                                <div class="izquierda">
                                    <asp:Label ID="lblManual" Class="texto" runat="server" Text="Manual: "></asp:Label>                   
                                    <asp:FileUpload ID="FileManual" runat="server" Height="34px" Width="230px"  />
                                    <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ErrorMessage="RegularExpressionValidator" ControlToValidate="FileManual" ForeColor="Red" ValidationExpression="(.*).(.docx|.DOCX|.pdf|.PDF)$">Solo formatos de archivos .pdf y docx</asp:RegularExpressionValidator>    
                                    <br />
                                    <asp:CustomValidator ID="CustomValidator1" runat="server" ClientValidationFunction="setUploadButtonState()" ControlToValidate="FileManual" ErrorMessage="CustomValidator" OnServerValidate="CustomValidator1_ServerValidate"></asp:CustomValidator>
                                    <asp:Label ID="lbl_uploadMessage" runat="server" Text="" /> 
                                    </div>
                                <div class="derecha">       
                                    <asp:Label ID="lblUbicacion" Class="texto2" runat="server" Text="Ubicación: "></asp:Label>
                                    <asp:DropDownList ID="cbbUbicacion" Class="form-control" runat="server" DataSourceID="ubicacion" DataTextField="DESCRIPCION" DataValueField="ID_UBICACION"></asp:DropDownList>
                                    <asp:SqlDataSource ID="ubicacion" runat="server" ConnectionString="<%$ ConnectionStrings:PI5ConnectionString %>" SelectCommand="SELECT [ID_UBICACION], [DESCRIPCION] FROM [UBICACION]"></asp:SqlDataSource>
                                    &nbsp;&nbsp;
                                </div>
                            </div>
                            <div class="form-group">
                                <div class="izquierda">
                                    <asp:Label ID="lblDescripcion" Class="texto" runat="server" Text="Descripción: "></asp:Label>
                                    <textarea id="txtDescripcion" Class="form-control" runat="server" cols="20" rows="4"></textarea>
                                </div>
                                <div class="derecha">   
                                    <asp:Image ID="Imagen" runat="server" Width="150px" Height="100px" ImageUrl="~/img/im.png" />
                                    <asp:FileUpload ID="FileImagen" runat="server" Width="278px" onchange="previewFile()"/>
                                    <asp:RegularExpressionValidator ID="REGEXFileUploadImagen" runat="server" ErrorMessage="Solo Imagenes" ControlToValidate="FileImagen" ValidationExpression= "(.*).(.jpg|.JPG|.jpeg|.JPEG|.bmp|.BMP|.png|.PNG)$" ForeColor="Red" />
                                </div>
                            </div>  
                        </div>
                        <div class="box-footer">
                            <asp:Button class="btn btn-default" ID="btnCancelar" runat="server" Text="Cancelar" OnClick="btnCancelar_Click" CausesValidation="False"/>
                            <asp:Button class="btn btn-info pull-right" ID="btnGuardar" runat="server" Text="Guardar" OnClick="btnGuardar_Click"/>
                        </div>                                                   
                    </div>                 
                </asp:View>
            </asp:MultiView> 
    </div>
    <br/> <br/>  <br/> <br/> 
      
      <script type="text/javascript"> 
    function setUploadButtonState() { 

    var maxFileSize = 4096; // 4MB -> 
    var fileUpload = document.getElementById("FileManual");
    var errorLabel = document.getElementById("ErrorLabel");
    if (fileUpload.val() == '') { 
    return false; 
    } 
    else { 
     if (fileUpload[0].files[0].size < maxFileSize) { 
     $('#button_fileUpload').prop('disabled', false); 
     return true; 
     }else{ 
         errorLabel.text('Archivo demasiado grande !')
     return false; 
     } 
    } 
    } 
 </script>
    <script type="text/javascript"> 
     function previewFile() { 
      var preview = document.querySelector('#<%=Imagen.ClientID %>'); 
      var file = document.querySelector('#<%=FileImagen.ClientID %>').files[0]; 
      var reader = new FileReader(); 
      reader.onloadend = function() { 
       preview.src = reader.result; 
      } 

      if (file) { 
       reader.readAsDataURL(file); 
      } else { 
       preview.src = ""; 
      } 
     } 
    </script>
</asp:Content>
