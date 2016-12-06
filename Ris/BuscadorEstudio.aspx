<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="BuscadorEstudio.aspx.cs"
    Inherits="SIPS.RIS.BuscadorEstudio" MasterPageFile="~/Site1.Master" %>

<asp:Content ID="ContentHead" ContentPlaceHolderID="Superior" runat="server">

    <style type="text/css">
        .style1 {
            width: 100%;
            text-align: center;
        }

        .botonFormulario {
            width: 85px;
            height: 40px;
        }

        .style2 {
            width: 151px;
        }

        .auto-style1 {
            width: 334px;
        }

        .auto-style2 {
            height: 14px;
        }

        .auto-style3 {
            height: 40px;
        }

        .auto-style6 {
            height: 50px;
        }

        .auto-style7 {
            height: 13px;
        }

        .auto-style8 {
            width: 827px;
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
                            <table id="tablaBuscador" style="margin: 15px; border-spacing: 10px 10px; width: 80%;">
                                <tr>
                                    <td class="auto-style6" style="border-style: 2;">
                                        <table border="2">
                                            <tr>
                                                <td class="auto-style8">
                                                    <asp:Label ID="Label82" runat="server" Font-Bold="True" Font-Size="Large" Text="Comisión Asesora de Investigaciones Biomédicas en Seres Humanos (CAIBSH)"></asp:Label>
                                                </td>
                                            </tr>
                                        </table>
                                        <table border="2">
                                            <tr>
                                                <td class="auto-style8">
                                                    <asp:Label ID="Label83" runat="server" Font-Size="Small" Text="Subsecretaría de Salud de la Provincia de Neuquén"></asp:Label>
                                                </td>
                                            </tr>
                                        </table>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="auto-style7">
                                        <table style="width: 100%;">
                                            <tr>
                                                <td>
                                                    <table style="width: 100%;">
                                                        <tr>
                                                            <td class="auto-style1">
                                                                <asp:Label ID="Label3" runat="server" Font-Bold="True"
                                                                    Text="Crear un nuevo registro"></asp:Label>
                                                            </td>
                                                        </tr>
                                                        <tr>
                                                            <td class="auto-style1">
                                                                <asp:Button ID="btnNuevoRegistro" runat="server"
                                                                    BorderStyle="None" CssClass="botonFormulario" Font-Bold="True" Font-Size="Medium"
                                                                    ForeColor="White" Text="Nuevo !" BackColor="#333333"
                                                                    OnClick="btnNuevoRegistro_Click" TabIndex="1" />
                                                            </td>
                                                        </tr>
                                                    </table>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td>&nbsp;</td>
                                            </tr>
                                        </table>
                                    </td>
                                </tr>

                                <tr>
                                    <td>&nbsp;</td>
                                </tr>
                                <tr>
                                    <td class="auto-style2"></td>
                                </tr>
                                <tr>
                                    <td>
                                        <asp:Label ID="Label78" runat="server" Font-Bold="True"
                                            Text="Buscar un registro existente por Investigador, Título de la Investigación, Tipo de Estudio,
                                            Nombre de Institución, Año, Palabras Clave, Drogas, Nro Reg. Nacional o Nro Expediente"></asp:Label>
                                    </td>
                                </tr>
                                <tr>
                                    <td>&nbsp;</td>
                                </tr>
                                <tr>
                                    <td class="style1">
                                        <table style="width: 100%;">
                                            <tr>
                                                <td>
                                                    <table style="width: 100%;">
                                                        <tr>
                                                            <td class="auto-style1">
                                                                <asp:TextBox ID="txtCriterioBusqueda" runat="server" Font-Size="Small" Height="19px" Width="98%" TabIndex="2"></asp:TextBox>
                                                            </td>
                                                            <td>
                                                                <asp:Button ID="btnBuscar" runat="server"
                                                                    BorderStyle="None" CssClass="botonFormulario" Font-Bold="True" Font-Size="Medium"
                                                                    ForeColor="White" Text="Buscar" BackColor="#333333" OnClick="btnBuscar_Click" TabIndex="3" />
                                                            </td>
                                                        </tr>
                                                    </table>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td>
                                                    <asp:Label ID="Label81" runat="server"
                                                        Text="No se consideran mayúsculas y/o minúsculas"></asp:Label>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td>&nbsp;</td>
                                            </tr>
                                        </table>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="style1">&nbsp;</td>
                                </tr>
                                <tr>
                                    <td class="style1">
                                        <asp:GridView ID="gvListaEstudiosEncontrados" runat="server" AutoGenerateColumns="False"
                                            CellPadding="5" DataKeyNames="idEstudio" EmptyDataText="No hay Estudios que correspondan con los criterios de búsqueda utilizados. Verifique los datos ingresados e intente nuevamente."
                                            EnableTheming="True" Font-Bold="False" Font-Names="Arial" Font-Size="10pt"
                                            ForeColor="#333333" Width="100%"
                                            OnPageIndexChanging="gvListaEstudiosEncontrados_PageIndexChanging"
                                            OnRowCommand="gvListaEstudiosEncontrados_RowCommand"
                                            OnRowDataBound="gvListaEstudiosEncontrados_RowDataBound">
                                            <RowStyle BackColor="#F7F6F3" Font-Names="Arial" Font-Size="10pt"
                                                ForeColor="#333333" />
                                            <Columns>
                                                <asp:TemplateField>
                                                    <ItemTemplate>
                                                        <asp:ImageButton ID="detalleEstudio" runat="server" CommandName="detalleEstudio"
                                                            ImageUrl="~/img/detalleEstudio.png" Height="20px" Width="20px" />
                                                    </ItemTemplate>
                                                    <ItemStyle Height="20px" HorizontalAlign="Center" Width="20px" />
                                                </asp:TemplateField>

                                                <asp:BoundField DataField="idEstudio" HeaderText="idEstudio" Visible="False" />
                                                <asp:BoundField DataField="investigador" HeaderText="Investigador" />
                                                <asp:BoundField DataField="tituloInvestigacion" HeaderText="Título" />
                                                <asp:BoundField DataField="nombreInstitucionAfiliacion" HeaderText="Institución de referencia" />
                                                <asp:BoundField DataField="tipoEstudio" HeaderText="Categorización" />
                                            </Columns>
                                            <FooterStyle BackColor="#008A8C" Font-Bold="True" ForeColor="White" />
                                            <PagerStyle BackColor="#990000" ForeColor="White" HorizontalAlign="Right" />
                                            <SelectedRowStyle BackColor="#E2DED6" Font-Bold="True" ForeColor="#333333" />
                                            <HeaderStyle BackColor="#333333" Font-Bold="False" Font-Italic="False"
                                                Font-Names="Arial" Font-Size="10pt" ForeColor="White" />
                                            <EditRowStyle BackColor="#999999" />
                                            <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
                                        </asp:GridView>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="style1">&nbsp;</td>
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




