<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ConcentimientoEdit.aspx.cs"
Inherits="SIPS.RIS.ConcentimientoEdit" MasterPageFile="~/Site1.Master" %>

<asp:Content ID="ContentHead" ContentPlaceHolderID="Superior" runat="server">

    <script type="text/javascript" src='<%= ResolveUrl("~/ControlMenor/js/jquery-1.5.1.min.js") %>'></script>

    <script type="text/javascript" src='<%= ResolveUrl("~/ControlMenor/js/jquery-ui-1.8.9.custom.min.js") %>'></script>

    <script type="text/javascript" src='<%= ResolveUrl("~/ControlMenor/js/json2.js") %>'></script>

    <link href='<%= ResolveUrl("~/ControlMenor/css/redmond/jquery.ui.all.css") %>' rel="stylesheet"
        type="text/css" />

    <link rel="stylesheet" type="text/css" href="../App_Themes/consultorio/ical.css" />

    <script type="text/javascript" src="../js/jquery.ui.datepicker-es.js"></script>

    <script type="text/javascript" src="../js/Mascara.js"></script>

    <script type="text/javascript" src="../js/ValidaFecha.js"></script>

    <script type="text/javascript">

        $(function() {
            $("#<%=inputFechaConcentimiento.ClientID %>").datepicker({
                showOn: 'button',
                buttonImage: '../img/calend1.jpg',
                buttonImageOnly: true
            });
        });
                
    </script>

    <style type="text/css">
        .estiloInputFecha
        {
            width: 71px;
        }
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
            height: 25px;
            width: 73px;
        }
        .style3
        {
            width: 100%;
            height: 25px;
        }
        .style4
        {
            width: 73px;
        }
        .auto-style1 {
            width: 73px;
            height: 40px;
        }
        .auto-style2 {
            width: 100%;
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
                                Text="Concentimientos"></asp:Label>
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
                                    <td class="style4">
                            <asp:Label ID="Label22" runat="server" Text="Versión"></asp:Label>
                                    </td>
                                    <td class="style1">
                            <asp:TextBox ID="txtVersion" runat="server" Width="20%" 
                                Font-Size="Small" Height="20px" TabIndex="1"></asp:TextBox>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="style4">
                                        &nbsp;</td>
                                    <td class="style1">
                                        &nbsp;</td>
                                </tr>
                                <tr>
                                    <td class="style2">
                            <asp:Label ID="Label33" runat="server" Text="Fecha"></asp:Label>
                                    </td>
                                    <td class="style3">
                            <input class="estiloInputFecha" ID="inputFechaConcentimiento" runat="server" maxlength="10" 
                                                            onblur="valFecha(this)" 
                                onkeyup="mascara(this,'/',patron,true)" tabindex="2" type="text" /><asp:Label ID="Label88" runat="server" Text="(dd/mm/aaaa)"></asp:Label>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="style4">
                                        &nbsp;</td>
                                    <td class="style1">
                                        &nbsp;</td>
                                </tr>
                                <tr>
                                    <td class="auto-style1">
                                        </td>
                                    <td class="auto-style2">
                                        <asp:Button ID="btnGuardar" runat="server" 
                                            BorderStyle="None" CssClass="botonFormulario" Font-Bold="True" Font-Size="Medium" 
                                            ForeColor="White" Text="Guardar" BackColor="#333333" 
                                            onclick="btnGuardar_Click" />
                                            &nbsp;
                                        <asp:Button ID="btnCerrar" runat="server" 
                                            BorderStyle="None" CssClass="botonFormulario" Font-Bold="True" Font-Size="Medium" 
                                            ForeColor="White" Text="Cerrar" BackColor="#999966" 
                                            onclick="btnCerrar_Click" />
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

