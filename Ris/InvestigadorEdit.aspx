<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="InvestigadorEdit.aspx.cs"
    Inherits="SIPS.RIS.InvestigadorEdit" MasterPageFile="~/Site1.Master" %>

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

        $(function () {
            $("#<%=inputFechaNacimiento.ClientID %>").datepicker({
                showOn: 'button',
                buttonImage: '../img/calend1.jpg',
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

        .style2 {
            height: 19px;
        }

        .style3 {
            width: 100%;
            height: 19px;
        }

        .auto-style1 {
            width: 142px;
        }

        .auto-style2 {
            width: 142px;
            height: 14px;
        }

        .auto-style3 {
            height: 14px;
        }

        .auto-style4 {
            width: 142px;
            height: 28px;
        }

        .auto-style5 {
            height: 28px;
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
                                Text="Investigador/a"></asp:Label>
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
                                    <td class="auto-style1">&nbsp;</td>
                                    <td>&nbsp;</td>
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
                                    <td class="auto-style1">&nbsp;</td>
                                    <td>&nbsp;</td>
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
                                    <td class="auto-style1">&nbsp;</td>
                                    <td>&nbsp;</td>
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
                                    <td class="auto-style1">&nbsp;</td>
                                    <td>&nbsp;</td>
                                </tr>
                                <tr>
                                    <td class="auto-style1">
                                        <asp:Label ID="Label24" runat="server" Text="Sexo"></asp:Label>
                                    </td>
                                    <td>
                                        <asp:DropDownList ID="ddlSexoInvestigador" runat="server" TabIndex="4">
                                            <asp:ListItem>Seleccionar</asp:ListItem>
                                            <asp:ListItem>Masculino</asp:ListItem>
                                            <asp:ListItem>Femenino</asp:ListItem>
                                        </asp:DropDownList>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="auto-style1">&nbsp;</td>
                                    <td>&nbsp;</td>
                                </tr>
                                <tr>
                                    <td class="auto-style1">
                                        <asp:Label ID="Label25" runat="server" Text="Fecha de nacimiento"></asp:Label>
                                    </td>
                                    <td>
                                        <input class="estiloInputFecha" id="inputFechaNacimiento" runat="server" maxlength="10"
                                            onblur="valFecha(this)"
                                            onkeyup="mascara(this,'/',patron,true)" tabindex="5" type="text"
                                            __designer:mapid="45" /><asp:Label ID="Label88" runat="server" Text="(dd/mm/aaaa)"></asp:Label>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="auto-style1">&nbsp;</td>
                                    <td>&nbsp;</td>
                                </tr>
                                <tr>
                                    <td class="auto-style1">
                                        <asp:Label ID="Label26" runat="server" Text="Documento"></asp:Label>
                                    </td>
                                    <td>
                                        <asp:DropDownList ID="ddlTipoDocumentoInvestigador" runat="server" DataTextField="descripcion"
                                            DataValueField="idTipoDocumento" TabIndex="6">
                                        </asp:DropDownList>
                                        <asp:TextBox ID="txtNumeroDocumento" runat="server" Width="10%"
                                            Font-Size="Small" Height="20px" TabIndex="7"></asp:TextBox>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="auto-style1">&nbsp;</td>
                                    <td>&nbsp;</td>
                                </tr>
                                <tr>
                                    <td class="auto-style1">
                                        <asp:Label ID="Label27" runat="server" Text="Profesión"></asp:Label>
                                    </td>
                                    <td class="auto-style9">
                                        <asp:DropDownList ID="ddlProfesionInvestigador" runat="server" DataTextField="descripcion"
                                            DataValueField="idProfesion" TabIndex="8">
                                        </asp:DropDownList>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="auto-style1">&nbsp;</td>
                                    <td>&nbsp;</td>
                                </tr>
                                <tr>
                                    <td class="auto-style1">
                                        <asp:Label ID="Label28" runat="server" Text="Número de matrícula"></asp:Label>
                                    </td>
                                    <td>
                                        <asp:TextBox ID="txtNumeroMatricula" runat="server" Width="10%"
                                            Font-Size="Small" Height="20px" TabIndex="9"></asp:TextBox>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="auto-style1">&nbsp;</td>
                                    <td>&nbsp;</td>
                                </tr>
                                <tr>
                                    <td class="auto-style1">
                                        <asp:Label ID="Label29" runat="server" Text="Domicilio laboral"></asp:Label>
                                    </td>
                                    <td>
                                        <asp:TextBox ID="txtDomicilioLaboral" runat="server" Width="30%"
                                            Font-Size="Small" Height="20px" TabIndex="10"></asp:TextBox>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="auto-style1">&nbsp;</td>
                                    <td>&nbsp;</td>
                                </tr>
                                <tr>
                                    <td class="auto-style1">
                                        <asp:Label ID="Label83" runat="server" Text="C.P."></asp:Label>
                                    </td>
                                    <td>
                                        <asp:TextBox ID="txtCPDomicilioLaboral" runat="server" Width="10%"
                                            Font-Size="Small" Height="20px" TabIndex="11"></asp:TextBox>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="auto-style1">&nbsp;</td>
                                    <td>&nbsp;</td>
                                </tr>
                                <tr>
                                    <td class="auto-style1">
                                        <asp:Label ID="Label30" runat="server" Text="Domicilio particular"></asp:Label>
                                    </td>
                                    <td>
                                        <asp:TextBox ID="txtDomicilioParticular" runat="server" Width="30%"
                                            Font-Size="Small" Height="20px" TabIndex="12"></asp:TextBox>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="auto-style1">&nbsp;</td>
                                    <td>&nbsp;</td>
                                </tr>
                                <tr>
                                    <td class="auto-style1">
                                        <asp:Label ID="Label84" runat="server" Text="C.P."></asp:Label>
                                    </td>
                                    <td>
                                        <asp:TextBox ID="txtCPDomicilioParticular" runat="server" Width="10%"
                                            Font-Size="Small" Height="20px" TabIndex="13"></asp:TextBox>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="auto-style2"></td>
                                    <td class="auto-style3"></td>
                                </tr>
                                <tr>
                                    <td class="auto-style1">
                                        <asp:Label ID="Label32" runat="server" Text="Teléfono laboral"></asp:Label>
                                    </td>
                                    <td>
                                        <asp:DropDownList ID="ddlTipoTelefonoLaboralInvestigador" runat="server" DataTextField="descripcion" DataValueField="idTipoTelefono" TabIndex="14">
                                        </asp:DropDownList>
                                        <asp:TextBox ID="txtNumeroTelefonoInvestigadorLaboral" runat="server"
                                            Width="10%" Font-Size="Small" Height="20px" TabIndex="15"></asp:TextBox>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="auto-style1">&nbsp;</td>
                                    <td>&nbsp;</td>
                                </tr>
                                <tr>
                                    <td class="auto-style4">
                                        <asp:Label ID="Label31" runat="server" Text="Telefóno particular"></asp:Label>
                                    </td>
                                    <td class="auto-style5">
                                        <asp:DropDownList ID="ddlTipoTelefonoParticularInvestigador" runat="server" DataTextField="descripcion" DataValueField="idTipoTelefono" TabIndex="16">
                                        </asp:DropDownList>
                                        <asp:TextBox ID="txtNumeroTelefonoInvestigadorParticular" runat="server"
                                            Width="10%" Font-Size="Small" Height="20px" TabIndex="17"></asp:TextBox>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="auto-style1">&nbsp;</td>
                                    <td>&nbsp;</td>
                                </tr>
                                <tr>
                                    <td class="auto-style1">
                                        <asp:Label ID="Label33" runat="server" Text="E-mail (laboral)"></asp:Label>
                                    </td>
                                    <td>
                                        <asp:TextBox ID="txtMailInvestigadorLaboral" runat="server" Width="50%"
                                            Font-Size="Small" Height="20px" TabIndex="18"></asp:TextBox>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="auto-style1">&nbsp;</td>
                                    <td>&nbsp;</td>
                                </tr>
                                <tr>
                                    <td class="auto-style1">
                                        <asp:Label ID="Label90" runat="server" Text="E-mail (particular)"></asp:Label>
                                    </td>
                                    <td>
                                        <asp:TextBox ID="txtMailInvestigadorParticular" runat="server" Width="50%"
                                            Font-Size="Small" Height="20px" TabIndex="19"></asp:TextBox>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="auto-style2"></td>
                                    <td class="auto-style3"></td>
                                </tr>
                                <tr>
                                    <td class="auto-style1">
                                        <asp:Label ID="Label91" runat="server" Text="Institución de Dependencia"></asp:Label>
                                    </td>
                                    <td>
                                        <asp:DropDownList ID="ddlEntidad" runat="server" DataTextField="nombre" DataValueField="idEntidad" TabIndex="20">
                                        </asp:DropDownList>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="auto-style1">&nbsp;</td>
                                    <td>&nbsp;</td>
                                </tr>
                                <tr>
                                    <td class="auto-style1">&nbsp;</td>
                                    <td>&nbsp;</td>
                                </tr>
                                <tr>
                                    <td class="auto-style1">&nbsp;</td>
                                    <td>
                                        <asp:Button ID="btnGuardar" runat="server"
                                            BorderStyle="None" CssClass="botonFormulario" Font-Bold="True" Font-Size="Medium"
                                            ForeColor="White" Text="Guardar" BackColor="#333333" OnClick="btnGuardar_Click" TabIndex="21" />
                                        &nbsp;
                                        <asp:Button ID="btnCerrar" runat="server"
                                            BorderStyle="None" CssClass="botonFormulario" Font-Bold="True" Font-Size="Medium"
                                            ForeColor="White" Text="Cerrar" BackColor="#999966" OnClick="btnCerrar_Click" TabIndex="22" />
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
