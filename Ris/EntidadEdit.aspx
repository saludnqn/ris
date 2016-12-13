<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="EntidadEdit.aspx.cs" 
Inherits="SIPS.RIS.EntidadEdit" MasterPageFile="~/Site1.Master" %>

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
                                Text="Patrocinante / ente financiador / institución respaldatoria"></asp:Label>
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
                            <asp:Label ID="Label22" runat="server" Text="Nombre"></asp:Label>
                                    </td>
                                    <td class="style1">
                            <asp:TextBox ID="txtNombre" runat="server" Width="50%" 
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
                            <asp:Label ID="Label80" runat="server" Text="Carácter"></asp:Label>
                                    </td>
                                    <td class="style1">
                                        <asp:DropDownList ID="ddlCaracter" runat="server" TabIndex="2">
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
                            <asp:Label ID="Label81" runat="server" Text="Domicilio"></asp:Label>
                                    </td>
                                    <td class="style1">
                            <asp:TextBox ID="txtDomicilio" runat="server" Width="50%" 
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
                                    <td class="style23">
                            <asp:Label ID="Label33" runat="server" Text="E-mail"></asp:Label>
                                    </td>
                                    <td class="style1">
                            <asp:TextBox ID="txtEmail" runat="server" Width="50%" 
                                Font-Size="Small" Height="20px" TabIndex="4"></asp:TextBox>
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
                                            ForeColor="White" Text="Guardar" BackColor="#333333" TabIndex="5" />
                                            &nbsp;
                                        <asp:Button ID="btnCerrar" runat="server" 
                                            BorderStyle="None" CssClass="botonFormulario" Font-Bold="True" Font-Size="Medium" 
                                            ForeColor="White" Text="Cerrar" BackColor="#999966" TabIndex="6" />
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



