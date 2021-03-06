﻿<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ComiteEticaInvestigacionEdit.aspx.cs"
    Inherits="SIPS.RIS.ComiteEticaInvestigacionEdit" MasterPageFile="~/Site1.Master" %>

<asp:Content ID="ContentHead" ContentPlaceHolderID="Superior" runat="server">

    <script type="text/javascript" src='<%= ResolveUrl("js/jquery-1.5.1.min.js") %>'></script>
    <script type="text/javascript" src='<%= ResolveUrl("js/jquery-ui-1.8.9.custom.min.js") %>'></script>
    <script type="text/javascript" src='<%= ResolveUrl("js/json2.js") %>'></script>
    <link href='<%= ResolveUrl("css/jquery.ui.all.css") %>' rel="stylesheet" type="text/css" />
    <link rel="stylesheet" type="text/css" href="css/ical.css" />
    <script type="text/javascript" src="js/jquery.ui.datepicker-es.js"></script>
    <script type="text/javascript" src="js/Mascara.js"></script>
    <script type="text/javascript" src="js/ValidaFecha.js"></script>

    <script type="text/javascript">

        $(function () {
            $("#<%=inputFechaDictamen.ClientID %>").datepicker({
                showOn: 'button',
                buttonImage: 'img/calend1.jpg',
                buttonImageOnly: true
            });
        });

    </script>

    <style type="text/css">
        .estiloInputFecha {
            width: 71px;
        }

        .style1 {
            width: 100%;
        }

        .botonFormulario {
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
                                Text="Comités de ética de investigación"></asp:Label>
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
                                        <asp:DropDownList ID="ddlComiteEtica" runat="server" DataTextField="descripcion" DataValueField="idComiteEtica" TabIndex="1">
                                        </asp:DropDownList>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="style23">&nbsp;</td>
                                    <td class="style1">&nbsp;</td>
                                </tr>                               
                                <tr>
                                    <td class="auto-style3">
                                        <asp:Label ID="Label82" runat="server" Text="Dictamen"></asp:Label>
                                    </td>
                                    <td class="auto-style4">
                                        <asp:DropDownList ID="ddlDictamen" runat="server" TabIndex="2">
                                            <asp:ListItem>Aprobado</asp:ListItem>
                                            <asp:ListItem>Rechazado</asp:ListItem>
                                            <asp:ListItem>Plazo Vencido</asp:ListItem>
                                        </asp:DropDownList>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="style23">&nbsp;</td>
                                    <td class="style1">&nbsp;</td>
                                </tr>
                                <tr>
                                    <td class="style23">
                                        <asp:Label ID="Label33" runat="server" Text="Fecha"></asp:Label>
                                    </td>
                                    <td class="style1">
                                        <input class="estiloInputFecha" id="inputFechaDictamen" runat="server" maxlength="10"
                                            onblur="valFecha(this)"
                                            onkeyup="mascara(this,'/',patron,true)" tabindex="3" type="text"
                                            __designer:mapid="45" /><asp:Label ID="Label88" runat="server" Text="(dd/mm/aaaa)"></asp:Label>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="style23">&nbsp;</td>
                                    <td class="style1">&nbsp;</td>
                                </tr>
                                <tr>
                                    <td class="style23">&nbsp;</td>
                                    <td class="style1">
                                        <asp:Button ID="btnGuardar" runat="server"
                                            BorderStyle="None" CssClass="botonFormulario" Font-Bold="True" Font-Size="Medium"
                                            ForeColor="White" Text="Guardar" BackColor="#333333" OnClick="btnGuardar_Click" />
                                        &nbsp;
                                        <asp:Button ID="btnCerrar" runat="server"
                                            BorderStyle="None" CssClass="botonFormulario" Font-Bold="True" Font-Size="Medium"
                                            ForeColor="White" Text="Cerrar" BackColor="#999966" OnClick="btnCerrar_Click" />
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
            <td>&nbsp;</td>
        </tr>
    </table>
</asp:Content>




