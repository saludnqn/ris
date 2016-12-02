<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="SeguroDeDaniosEdit.aspx.cs"
Inherits="SIPS.RIS.SeguroDeDaniosEdit" MasterPageFile="~/Site1.Master" %>

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
        .botonFormularioLargo
        {
            width: 170px;
            height: 40px;
        }
        .style2
        {
            width: 130px;
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
                                Text="Seguro de daños"></asp:Label>
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
                                    <td>
                            <asp:Label ID="Label22" runat="server" Text="Aseguradora"></asp:Label>
                                    </td>
                                    <td>
                                        <asp:DropDownList ID="ddlAseguradora" runat="server" DataTextField="descripcion" DataValueField="idAseguradora" TabIndex="1">
                                        </asp:DropDownList>
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        &nbsp;</td>
                                    <td>
                                        &nbsp;</td>
                                </tr>
                                <tr>
                                    <td>
                            <asp:Label ID="Label81" runat="server" Text="Nro. póliza"></asp:Label>
                                    </td>
                                    <td>
                            <asp:TextBox ID="txtNroPoliza" runat="server" Width="50%" 
                                Font-Size="Small" Height="20px" TabIndex="2"></asp:TextBox>
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        &nbsp;</td>
                                    <td>
                                        &nbsp;</td>
                                </tr>
                                <tr>
                                    <td>
                            <asp:Label ID="Label82" runat="server" Text="Vigencias"></asp:Label>
                                    </td>
                                    <td>
                                        <table style="width:100%;">
                                            <tr>
                                                <td>
                                                                    <asp:Panel ID="pnlVigencias" runat="server">
                                                                        <table style="width:100%;">
                                                                            <tr>
                                                                                <td>
                                                                                    <asp:Button ID="btnAgregarVigencia" runat="server" BackColor="#333333" BorderStyle="None" CssClass="botonFormularioLargo" Font-Bold="True" Font-Size="Medium" ForeColor="White" onclick="btnAgregarVigencia_Click" TabIndex="6" Text="Agregar vigencias" />
                                                                                </td>
                                                                            </tr>
                                                                            <tr>
                                                                                <td>&nbsp;</td>
                                                                            </tr>
                                                                            <tr>
                                                                                <td>
                                                                                    <asp:GridView ID="gvListaVigencias" runat="server" AutoGenerateColumns="False" CellPadding="5" DataKeyNames="idVigenciaPoliza" EmptyDataText="Lista vacía" EnableTheming="True" Font-Bold="False" Font-Names="Arial" Font-Size="10pt" ForeColor="#333333" onpageindexchanging="gvListaVigencias_PageIndexChanging" onrowcommand="gvListaVigencias_RowCommand" onrowdatabound="gvListaVigencias_RowDataBound" Width="100%">
                                                                                        <RowStyle BackColor="#F7F6F3" Font-Names="Arial" Font-Size="10pt" ForeColor="#333333" />
                                                                                        <Columns>
                                                                                            <asp:TemplateField>
                                                                                                <ItemTemplate>
                                                                                                    <asp:ImageButton ID="borrarVigencia" runat="server" CommandName="borrarVigencia" ImageUrl="~/img/delete.png" />
                                                                                                </ItemTemplate>
                                                                                                <ItemStyle Height="20px" HorizontalAlign="Center" Width="20px" />
                                                                                            </asp:TemplateField>                                                                                            
                                                                                            <asp:BoundField DataField="idEstudioAseguradora" HeaderText="idEstudioAseguradora" />
                                                                                            <asp:BoundField DataField="idEstudio" HeaderText="idEstudio" />
                                                                                            <asp:BoundField DataField="idAseguradora" HeaderText="idAseguradora" />
                                                                                            <asp:BoundField DataField="descripcion" HeaderText="descripcion" />
                                                                                            <asp:BoundField DataField="numeroPoliza" HeaderText="numeroPoliza" />
                                                                                            <asp:BoundField DataField="fechaInicio" HeaderText="Inicio" />
                                                                                            <asp:BoundField DataField="fechaFin" HeaderText="Fin" />
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
                                            </table>
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        &nbsp;</td>
                                    <td>
                                        &nbsp;</td>
                                </tr>
                                <tr>
                                    <td>
                                        &nbsp;</td>
                                    <td>
                                        &nbsp;</td>
                                </tr>
                                <tr>
                                    <td>
                                        &nbsp;</td>
                                    <td>
                                        <asp:Button ID="btnGuardar" runat="server" 
                                            BorderStyle="None" CssClass="botonFormulario" Font-Bold="True" Font-Size="Medium" 
                                            ForeColor="White" Text="Guardar" BackColor="#333333" OnClick="btnGuardar_Click" TabIndex="4" />
                                            &nbsp;
                                        <asp:Button ID="btnCerrar" runat="server" 
                                            BorderStyle="None" CssClass="botonFormulario" Font-Bold="True" Font-Size="Medium" 
                                            ForeColor="White" Text="Cerrar" BackColor="#999966" OnClick="btnCerrar_Click" TabIndex="5" />
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

