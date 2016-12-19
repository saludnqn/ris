<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="EnmiendaEdit.aspx.cs"
    Inherits="SIPS.RIS.EnmiendaEdit" MasterPageFile="~/Site1.Master" %>

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

        .style23 {
            width: 13%;
        }

        .auto-style3 {
            width: 13%;
            height: 18px;
        }

        .auto-style4 {
            width: 100%;
            height: 18px;
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
                                Text="Enmienda"></asp:Label>
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
                                    <td class="auto-style3">
                                        <asp:Label ID="Label22" runat="server" Text="Modificación"></asp:Label>
                                    </td>
                                    <td class="style1">
                                        <asp:DropDownList ID="ddlModificacion" runat="server" TabIndex="1">
                                            <asp:ListItem>--Seleccione--</asp:ListItem>
                                            <asp:ListItem>Sustantiva</asp:ListItem>
                                            <asp:ListItem>No Sustantiva</asp:ListItem>
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
                                        <asp:DropDownList ID="ddlDictamen" runat="server" TabIndex="2" AutoPostBack="true"
                                            OnSelectedIndexChanged="ddlDictamen_SelectedIndexChanged">
                                            <asp:ListItem Value="1">Aprobado</asp:ListItem>
                                            <asp:ListItem Value="2">Rechazado</asp:ListItem>
                                        </asp:DropDownList>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="style23">&nbsp;</td>
                                    <td class="style1">&nbsp;</td>
                                </tr>
                                <tr>
                                    <td class="style23">
                                        <asp:Label ID="Label83" runat="server" Text="Fecha"></asp:Label>
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
                                    <td class="style23">
                                        <asp:Label ID="Label81" runat="server" Text="Observaciones"></asp:Label>
                                    </td>
                                    <td class="style1">
                                        <asp:TextBox ID="txtObservaciones" runat="server" Width="80%"
                                            Height="91px" TextMode="MultiLine" TabIndex="4"></asp:TextBox>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="style23">&nbsp;</td>
                                    <td class="style1">&nbsp;</td>
                                </tr>
                                <tr runat="server" id="panelMotivos" visible="false">
                                    <td class="style23">
                                        <asp:Label ID="Label84" runat="server" Text="Motivos"></asp:Label>
                                    </td>
                                    <td class="style1">
                                        <asp:Panel ID="pnlMotivos" runat="server" Visible="false">
                                            <table style="width: 100%;">
                                                <tr>
                                                    <td>
                                                        <table class="style23">
                                                            <tr>
                                                                <td>
                                                                    <asp:DropDownList ID="ddlItemsDesaprobados" runat="server" DataTextField="descripcion" DataValueField="idItemDesaprobado" TabIndex="5">
                                                                    </asp:DropDownList>
                                                                </td>
                                                                <td>
                                                                    <asp:Button ID="btnAgregarItemDesaprobado" runat="server" BackColor="#333333" BorderStyle="None" CssClass="botonFormulario" Font-Bold="True" Font-Size="Medium" ForeColor="White" OnClick="btnAgregarItemDesaprobado_Click" Text="Agregar" TabIndex="6" />
                                                                </td>
                                                            </tr>
                                                            <tr>
                                                                <td>&nbsp;</td>
                                                                <td>&nbsp;</td>
                                                            </tr>
                                                        </table>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td>
                                                        <asp:GridView ID="gvListaItemsDesaprobado" runat="server" AutoGenerateColumns="False" CellPadding="5" DataKeyNames="idEnmiendaItemDesaprobado" EmptyDataText="Lista vacía" EnableTheming="True" Font-Bold="False" Font-Names="Arial" Font-Size="10pt" ForeColor="#333333" OnPageIndexChanging="gvListaItemsDesaprobado_PageIndexChanging" OnRowCommand="gvListaItemsDesaprobado_RowCommand" OnRowDataBound="gvListaItemsDesaprobado_RowDataBound" Width="100%">
                                                            <RowStyle BackColor="#F7F6F3" Font-Names="Arial" Font-Size="10pt" ForeColor="#333333" />
                                                            <Columns>
                                                                <asp:TemplateField>
                                                                    <ItemTemplate>
                                                                        <asp:ImageButton ID="borrarItemDesaprobado" runat="server" CommandName="borrarItemDesaprobado" ImageUrl="~/img/delete.png" />
                                                                    </ItemTemplate>
                                                                    <ItemStyle Height="20px" HorizontalAlign="Center" Width="20px" />
                                                                </asp:TemplateField>
                                                                <asp:BoundField DataField="idEnmiendaItemDesaprobado" HeaderText="idEnmiendaItemDesaprobado" Visible="False" />
                                                                <asp:BoundField DataField="idEnmienda" HeaderText="idEnmienda" Visible="False" />
                                                                <asp:BoundField DataField="idItemDesaprobado" HeaderText="idItemDesaprobado" Visible="False" />
                                                                <asp:BoundField DataField="descripcion" HeaderText="Motivo" />
                                                            </Columns>
                                                            <FooterStyle BackColor="#008A8C" Font-Bold="True" ForeColor="White" />
                                                            <PagerStyle BackColor="#990000" ForeColor="White" HorizontalAlign="Right" />
                                                            <SelectedRowStyle BackColor="#E2DED6" Font-Bold="True" ForeColor="#333333" />
                                                            <HeaderStyle BackColor="#333333" Font-Bold="False" Font-Italic="False" Font-Names="Arial" Font-Size="10pt" ForeColor="White" />
                                                            <EditRowStyle BackColor="#999999" />
                                                            <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
                                                        </asp:GridView>
                                                    </td>
                                                </tr>
                                            </table>
                                        </asp:Panel>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="style23">&nbsp;</td>
                                    <td class="style1">&nbsp;</td>
                                </tr>
                                <tr>
                                    <td class="style23">&nbsp;</td>
                                    <td class="style1">&nbsp;</td>
                                </tr>
                                <tr>
                                    <td class="style23">&nbsp;</td>
                                    <td class="style1">
                                        <asp:Button ID="btnGuardarEnmienda" runat="server"
                                            BorderStyle="None" CssClass="botonFormulario" Font-Bold="True" Font-Size="Medium"
                                            ForeColor="White" Text="Guardar" BackColor="#333333" OnClick="btnGuardarEnmienda_Click" TabIndex="7" />
                                        &nbsp;
                                        <asp:Button ID="btnCerrar" runat="server"
                                            BorderStyle="None" CssClass="botonFormulario" Font-Bold="True" Font-Size="Medium"
                                            ForeColor="White" Text="Cerrar" BackColor="#999966"
                                            OnClick="btnCerrar_Click" TabIndex="8" />
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






