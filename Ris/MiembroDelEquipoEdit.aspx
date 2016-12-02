<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="MiembroDelEquipoEdit.aspx.cs"
    Inherits="SIPS.RIS.MiembroDelEquipoEdit" MasterPageFile="~/Site1.Master" %>

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
        .style2
        {
            height: 19px;
        }
        .style3
        {
            width: 100%;
            height: 19px;
        }
        .auto-style1 {
            width: 140px;
        }
        .auto-style2 {
            width: 140px;
            height: 14px;
        }
        .auto-style3 {
            height: 14px;
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
                                Text="Miembro del equipo"></asp:Label>
                        </td>
                    </tr>
                    <tr>
                        <td>
                                        <hr class="hrTitulo" />
                                    </td>
                    </tr>
                    <tr>
                        <td>
                <table id="tablaInvestigador" class="style1" width="100%" 
                    style="margin: 15px; border-spacing: 10px 10px;">
                    <tr>
                        <td class="auto-style1">
                            &nbsp;</td>
                        <td>
                            &nbsp;</td>
                    </tr>
                    <tr>
                        <td class="auto-style1">
                            <asp:Label ID="Label22" runat="server" Text="Apellido"></asp:Label>
                        </td>
                        <td>
                            <asp:TextBox ID="txtApellidoInvestigador" runat="server" Width="25%" 
                                Font-Size="Small" Height="20px" TabIndex="1"></asp:TextBox>
                        </td>
                    </tr>
                    <tr>
                        <td class="auto-style2">
                            </td>
                        <td class="auto-style3">
                            </td>
                    </tr>
                    <tr>
                        <td class="auto-style1">
                            <asp:Label ID="Label23" runat="server" Text="Nombre"></asp:Label>
                        </td>
                        <td>
                            <asp:TextBox ID="txtNombreInvestigador" runat="server" Width="25%" 
                                Font-Size="Small" Height="20px" TabIndex="2"></asp:TextBox>
                        </td>
                    </tr>
                    <tr>
                        <td class="auto-style1">
                            &nbsp;</td>
                        <td>
                                        &nbsp;</td>
                    </tr>
                    <tr>
                        <td class="auto-style1">
                            <asp:Label ID="Label89" runat="server" Text="Función en el equipo"></asp:Label>
                        </td>
                        <td>
                                        <asp:DropDownList ID="ddlFuncionEnElEquipo" runat="server" DataTextField="descripcion" 
                                            DataValueField="idFuncionEnElEquipo" TabIndex="3">
                                        </asp:DropDownList>
                        </td>
                    </tr>
                    <tr>
                        <td class="auto-style2">
                            </td>
                        <td class="auto-style3">
                                        </td>
                    </tr>
                    <tr>
                        <td class="auto-style1">
                            <asp:Label ID="Label27" runat="server" Text="Profesión"></asp:Label>
                        </td>
                        <td>
                                        <asp:DropDownList ID="ddlProfesionInvestigador" runat="server" DataTextField="descripcion" 
                                            DataValueField="idProfesion" TabIndex="4">
                                        </asp:DropDownList>
                        </td>
                    </tr>
                    <tr>
                        <td class="auto-style1">
                            &nbsp;</td>
                        <td>
                            &nbsp;</td>
                    </tr>
                    <tr>
                        <td class="auto-style1">
                            <asp:Label ID="Label28" runat="server" Text="Número de matrícula"></asp:Label>
                        </td>
                        <td>
                            <asp:TextBox ID="txtNumeroMatricula" runat="server" Width="10%" 
                                Font-Size="Small" Height="20px" TabIndex="5"></asp:TextBox>
                        </td>
                    </tr>
                    <tr>
                        <td class="auto-style1">
                            &nbsp;</td>
                        <td>
                                        &nbsp;</td>
                    </tr>
                    <tr>
                        <td class="auto-style1">
                            <asp:Label ID="Label90" runat="server" Text="Institucion de referencia"></asp:Label>
                        </td>
                        <td>
                                        <asp:DropDownList ID="ddlEntidad" runat="server" DataTextField="nombre" 
                                            DataValueField="idEntidad" TabIndex="6">
                                        </asp:DropDownList>
                        </td>
                    </tr>
                    <tr>
                        <td class="auto-style2">
                            </td>
                        <td class="auto-style3">
                                        </td>
                    </tr>
                    <tr>
                        <td class="auto-style1">
                            &nbsp;</td>
                        <td>
                                        <asp:Button ID="btnGuardar" runat="server" 
                                            BorderStyle="None" CssClass="botonFormulario" Font-Bold="True" Font-Size="Medium" 
                                            ForeColor="White" Text="Guardar" BackColor="#333333" OnClick="btnGuardar_Click" TabIndex="7" />
                                        &nbsp;
                                        <asp:Button ID="btnCerrar" runat="server" 
                                            BorderStyle="None" CssClass="botonFormulario" Font-Bold="True" Font-Size="Medium" 
                                            ForeColor="White" Text="Cerrar" BackColor="#999966" OnClick="btnCerrar_Click" TabIndex="8" />
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
