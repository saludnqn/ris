<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="LugarDeRealizacionEdit.aspx.cs"
Inherits="SIPS.RIS.LugarDeRealizacionEdit" MasterPageFile="~/Site1.Master" %>

<asp:Content ID="ContentHead" ContentPlaceHolderID="Superior" runat="server">

    <style type="text/css">
        .style1
        {
            width: 100%;
        }
        .botonFormulario
        {
            width: 85px;
            height: 40px;
        }
        .style2
        {
            height: 19px;
        }
        .style3
        {
            width: 100%;
            height: 19px;
        }
    </style>

</asp:Content>

<asp:Content ID="ContentBody" ContentPlaceHolderID="Cuerpo" runat="server">
    <table id="tablaPrincipal" class="style1" width="100%" 
        style="text-align: left; font-size: small;">
        <tr>
            <td>
                <table id="tablaInformeCAIBSH" class="style1" width="100%" align="left" 
                    style="margin: 15px; border-spacing: 10px 10px;">
                    <tr>
                        <td>
                                        <hr class="hrTitulo" />
                                    </td>
                    </tr>
                    <tr>
                        <td>
                            <asp:Label ID="Label75" runat="server" Font-Bold="True" 
                                Text="Lugar de realización"></asp:Label>
                        </td>
                    </tr>
                    <tr>
                        <td>
                                        <hr class="hrTitulo" />
                                    </td>
                    </tr>
                    <tr>
                        <td>
                            <table id="tablaAprobado" 
                                style="margin: 15px; border-spacing: 10px 10px;">
                                <tr>
                                    <td class="style23">
                            <asp:Label ID="Label22" runat="server" Text="Lugar"></asp:Label>
                                    </td>
                                    <td class="style1">
                            <asp:TextBox ID="txtDescripcion" runat="server" Width="700px" 
                                Font-Size="Small" Height="20px" TabIndex="1"></asp:TextBox>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="style23">
                                        &nbsp;</td>
                                    <td class="style1">
                                        &nbsp;</td>
                                </tr>
                                <tr>
                                    <td class="style23">
                            <asp:Label ID="Label81" runat="server" Text="Ámbito"></asp:Label>
                                    </td>
                                    <td class="style1">
                                        <asp:DropDownList ID="ddlAmbito" runat="server" TabIndex="2">
                                            <asp:ListItem Value="Publico">Público</asp:ListItem>
                                            <asp:ListItem>Privado</asp:ListItem>
                                        </asp:DropDownList>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="style23">
                                        &nbsp;</td>
                                    <td class="style1">
                                        &nbsp;</td>
                                </tr>
                                <tr>
                                    <td class="style23">
                            <asp:Label ID="Label82" runat="server" Text="Domicilio"></asp:Label>
                                    </td>
                                    <td class="style1">
                            <asp:TextBox ID="txtDomicilio" runat="server" Width="700px" 
                                Font-Size="Small" Height="20px" TabIndex="3"></asp:TextBox>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="style23">
                                        &nbsp;</td>
                                    <td class="style1">
                                        &nbsp;</td>
                                </tr>
                                <tr>
                                    <td class="style2">
                            <asp:Label ID="Label83" runat="server" Text="CP"></asp:Label>
                                    </td>
                                    <td class="style3">
                            <asp:TextBox ID="txtCP" runat="server" Width="200px" 
                                Font-Size="Small" Height="20px" AutoCompleteType="Disabled" TabIndex="4"></asp:TextBox>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="style2">
                                        &nbsp;</td>
                                    <td class="style3">
                                        &nbsp;</td>
                                </tr>
                                <tr>
                                    <td class="style23">
                            <asp:Label ID="Label84" runat="server" Text="Ciudad"></asp:Label>
                                    </td>
                                    <td class="style1">
                            <asp:TextBox ID="txtCiudad" runat="server" Width="700px" 
                                Font-Size="Small" Height="20px" TabIndex="5"></asp:TextBox>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="style23">
                                        &nbsp;</td>
                                    <td class="style1">
                                        &nbsp;</td>
                                </tr>
                                <tr>
                                    <td class="style23">
                            <asp:Label ID="Label87" runat="server" Text="E-mail"></asp:Label>
                                    </td>
                                    <td class="style1">
                            <asp:TextBox ID="txtEmail" runat="server" Width="700px" 
                                Font-Size="Small" Height="20px" TabIndex="7"></asp:TextBox>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="style23">
                                        &nbsp;</td>
                                    <td class="style1">
                                        &nbsp;</td>
                                </tr>
                                <tr>
                                    <td class="style23">
                            <asp:Label ID="Label86" runat="server" Text="Responsable"></asp:Label>
                                    </td>
                                    <td class="style1">
                            <asp:TextBox ID="txtResponsable" runat="server" Width="700px" 
                                Font-Size="Small" Height="20px" TabIndex="8"></asp:TextBox>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="style23">
                                        &nbsp;</td>
                                    <td class="style1">
                                        &nbsp;</td>
                                </tr>
                                <tr>
                                    <td class="style23">
                            <asp:Label ID="Label88" runat="server" Text="Cargo"></asp:Label>
                                    </td>
                                    <td class="style1">
                            <asp:TextBox ID="txtCargo" runat="server" Width="700px" 
                                Font-Size="Small" Height="20px" TabIndex="9"></asp:TextBox>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="style23">
                                        &nbsp;</td>
                                    <td class="style1">
                                        &nbsp;</td>
                                </tr>
                                <tr>
                                    <td class="style23">
                                        &nbsp;</td>
                                    <td class="style1">
                                        <asp:Button ID="btnGuardar" runat="server" 
                                            BorderStyle="None" CssClass="botonFormulario" Font-Bold="True" Font-Size="Medium" 
                                            ForeColor="White" Text="Guardar" BackColor="#333333" OnClick="btnGuardar_Click" TabIndex="10" />
                                            &nbsp;
                                        <asp:Button ID="btnCerrar" runat="server" 
                                            BorderStyle="None" CssClass="botonFormulario" Font-Bold="True" Font-Size="Medium" 
                                            ForeColor="White" Text="Cerrar" BackColor="#999966" OnClick="btnCerrar_Click" TabIndex="11" />
                                    </td>
                                </tr>
                            </table>
                        </td>
                    </tr>
                    <tr>
                        <td>
                                        <hr class="hrTitulo" />
                                    </td>
                    </tr>
                    </table>
            </td>
        </tr>
        <tr>
            <td>
                &nbsp;</td>
        </tr>
    </table>
</asp:Content>
