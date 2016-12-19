<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="EvaluacionRechazada.aspx.cs"
    Inherits="SIPS.RIS.EvaluacionRechazada" MasterPageFile="~/Site1.Master" %>

<asp:Content ID="ContentHead" ContentPlaceHolderID="Superior" runat="server">

    <script type="text/javascript" src='<%= ResolveUrl("js/jquery-1.5.1.min.js") %>'></script>

    <script type="text/javascript" src='<%= ResolveUrl("js/jquery-ui-1.8.9.custom.min.js") %>'></script>

    <link href='<%= ResolveUrl("css/jquery.ui.all.css") %>' rel="stylesheet" type="text/css" />

    <link rel="stylesheet" type="text/css" href="css/ical.css" />

    <script type="text/javascript" src="js/jquery.ui.datepicker-es.js"></script>

    <script type="text/javascript" src="js/Mascara.js"></script>

    <script type="text/javascript" src="js/ValidaFecha.js"></script>

    <script type="text/javascript">

        $(function () {
            $("#<%=inputFecha.ClientID %>").datepicker({
                showOn: 'button',
                buttonImage: 'img/calend1.jpg',
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
        .auto-style4 {
            width: 140px;
            height: 26px;
        }
        .auto-style5 {
            height: 26px;
        }
        .auto-style6 {
            width: 140px;
            height: 15px;
        }
        .auto-style7 {
            height: 15px;
        }
        .auto-style8 {
            width: 140px;
            height: 28px;
        }
        .auto-style9 {
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
                                Text="Evaluaciones rechazadas"></asp:Label>
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
                            <asp:Label ID="Label22" runat="server" Text="Nro. de registro"></asp:Label>
                        </td>
                        <td>
                            <asp:TextBox ID="txtNroRegistro" runat="server" Width="25%" 
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
                        <td class="auto-style4">
                            <asp:Label ID="Label23" runat="server" Text="Fecha"></asp:Label>
                        </td>
                        <td class="auto-style5">
                            <input class="estiloInputFecha" id="inputFecha" runat="server"  maxlength="10"
                                onblur="valFecha(this)"
                                onkeyup="mascara(this,'/',patron,true)" tabindex="2" type="text"
                                __designer:mapid="45" width="100px" /><asp:Label ID="Label88" runat="server" Text="(dd/mm/aaaa)"></asp:Label>

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
                            <asp:Label ID="Label89" runat="server" Text="Institución"></asp:Label>
                        </td>
                        <td>
                            <asp:TextBox ID="txtInstitucion" runat="server" Width="25%" 
                                Font-Size="Small" Height="20px" TabIndex="3"></asp:TextBox>
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
                            <asp:Label ID="Label27" runat="server" Text="Responsable (comité)"></asp:Label>
                        </td>
                        <td>
                            <asp:TextBox ID="txtResponsableComite" runat="server" Width="25%" 
                                Font-Size="Small" Height="20px" TabIndex="4"></asp:TextBox>
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
                            <asp:Label ID="Label28" runat="server" Text="Domicilio"></asp:Label>
                        </td>
                        <td>
                            <asp:TextBox ID="txtDomicilio" runat="server" Width="25%" 
                                Font-Size="Small" Height="20px" TabIndex="5"></asp:TextBox>
                        </td>
                    </tr>
                    <tr>
                        <td class="auto-style6">
                            </td>
                        <td class="auto-style7">
                                        </td>
                    </tr>
                    <tr>
                        <td class="auto-style8">
                            <asp:Label ID="Label90" runat="server" Text="Teléfono"></asp:Label>
                        </td>
                        <td class="auto-style9">
                            <asp:TextBox ID="txtTelefono" runat="server" Width="25%" 
                                Font-Size="Small" Height="20px" TabIndex="6"></asp:TextBox>
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
                            <asp:Label ID="Label91" runat="server" Text="Mail"></asp:Label>
                        </td>
                        <td>
                            <asp:TextBox ID="txtMail" runat="server" Width="25%" 
                                Font-Size="Small" Height="20px" TabIndex="7"></asp:TextBox>
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
                            &nbsp;</td>
                        <td>
                                        <asp:Button ID="btnGuardar" runat="server" 
                                            BorderStyle="None" CssClass="botonFormulario" Font-Bold="True" Font-Size="Medium" 
                                            ForeColor="White" Text="Guardar" BackColor="#333333" OnClick="btnGuardar_Click" TabIndex="8" />
                                        &nbsp;
                                        <asp:Button ID="btnCerrar" runat="server" 
                                            BorderStyle="None" CssClass="botonFormulario" Font-Bold="True" Font-Size="Medium" 
                                            ForeColor="White" Text="Cerrar" BackColor="#999966" OnClick="btnCerrar_Click" TabIndex="9" />
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
