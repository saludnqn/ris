<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="EstudioEdit.aspx.cs"
    Inherits="SIPS.RIS.EstudioEdit" MasterPageFile="~/Site1.Master" %>

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
            $("#<%=inputFechaPrimerParticipante.ClientID %>").datepicker({
                showOn: 'button',
                buttonImage: '~/../img/calend1.jpg',
                buttonImageOnly: true
            });
        });

        $(function () {
            $("#<%=inputFechaCierreParticipantes.ClientID %>").datepicker({
                 showOn: 'button',
                 buttonImage: '~/../img/calend1.jpg',
                 buttonImageOnly: true
             });
         });

         $(function () {
             $("#<%=inputFechaInicio.ClientID %>").datepicker({
                showOn: 'button',
                buttonImage: '~/../img/calend1.jpg',
                buttonImageOnly: true
            });
        });

        $(function () {
            $("#<%=inputFechaFinalizacion.ClientID %>").datepicker({
                showOn: 'button',
                buttonImage: '~/../img/calend1.jpg',
                buttonImageOnly: true
            });
        });

        $(function () {
            $("#<%=inputFechaAprobadoCAIBSH.ClientID %>").datepicker({
                showOn: 'button',
                buttonImage: '~/../img/calend1.jpg',
                buttonImageOnly: true
            });
        });

        $(function () {
            $("#<%=inputFechaRechazadoCAIBSH.ClientID %>").datepicker({
                showOn: 'button',
                buttonImage: '~/../img/calend1.jpg',
                buttonImageOnly: true
            });
        });

        $(function () {
            $("#<%=inputFechaVencimientoPlazoCAIBSH.ClientID %>").datepicker({
                showOn: 'button',
                buttonImage: '~/../img/calend1.jpg',
                buttonImageOnly: true
            });
        });


        $(function () {
            $("#<%=inputFechaRetiroEvaluacionCAIBSH.ClientID %>").datepicker({
                showOn: 'button',
                buttonImage: '~/../img/calend1.jpg',
                buttonImageOnly: true
            });
        });

    </script>

    <style type="text/css">
        .estiloInputFecha {
            width: 71px;
        }

        .style1 {
            width: 95%;
        }

        .style2 {
            height: 23px;
        }

        .style7 {
            width: 170px;
        }

        .style8 {
        }

        .style9 {
            height: 23px;
            width: 160px;
        }

        .style12 {
            width: 168px;
        }

        .style13 {
            width: 47px;
        }

        .style14 {
            width: 169px;
        }

        .style15 {
            width: 167px;
        }

        .style16 {
            width: 265px;
        }

        .style17 {
            width: 586px;
        }

        .style19 {
            width: 49px;
        }

        .style20 {
            width: 160px;
            height: 26px;
        }

        .style21 {
            height: 26px;
        }

        .style22 {
        }

        .style23 {
            width: 13%;
        }

        .botonFormulario {
            width: 85px;
            height: 40px;
        }

        .botonFormularioGrande {
            width: 120px;
            height: 40px;
        }

        .botonFormularioLargo {
            width: 170px;
            height: 40px;
        }

        .auto-style5 {
            height: 141px;
        }

        .auto-style11 {
            width: 205px;
        }

        .auto-style15 {
            height: 14px;
        }

        .auto-style16 {
            width: 180px;
            height: 14px;
        }

        .auto-style17 {
            width: 914px;
        }

        .auto-style22 {
            width: 173px;
            height: 26px;
        }

        .auto-style23 {
            height: 23px;
            width: 173px;
        }

        .auto-style24 {
            width: 173px;
        }

        .auto-style25 {
            width: 173px;
            height: 14px;
        }

        .auto-style26 {
            width: 173px;
            height: 28px;
        }

        .auto-style27 {
            height: 28px;
        }

        .auto-style28 {
            width: 168px;
            height: 28px;
        }

        .auto-style31 {
            width: 265px;
            height: 14px;
        }

        .auto-style32 {
            width: 1198px;
        }

        .auto-style34 {
            width: 98px;
        }

        .auto-style35 {
            width: 98px;
            height: 18px;
        }

        .auto-style36 {
            height: 18px;
        }

        .auto-style37 {
            width: 75px;
        }

        .auto-style38 {
            width: 446px;
        }

        .auto-style39 {
            width: 199px;
        }

        .auto-style40 {
            width: 446px;
            height: 14px;
        }

        .auto-style41 {
            width: 199px;
            height: 14px;
        }

        .auto-style43 {
            height: 13px;
            width: 1256px;
        }

        .auto-style44 {
            height: 15px;
            width: 1256px;
        }

        .auto-style45 {
            width: 1256px;
        }

        .auto-style46 {
            width: 98px;
            height: 14px;
        }

        .auto-style47 {
            width: 1362px;
        }
    </style>

</asp:Content>

<asp:Content ID="ContentBody" ContentPlaceHolderID="Cuerpo" runat="server">

    <%--Hay que declarar la línea: 
        <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager> (que esta debajo de este comentario) solo una vez.
        Luego podemos utilizarla en le resto de la página usando codigo de la forma:

        <asp:UpdatePanel ID="UpdatePanelTipoDeEstudio" runat="server" UpdateMode="Conditional">
            <ContentTemplate>
                ...
                ...
            </ContentTemplate>
        </asp:UpdatePanel>--%>

    <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>

    <table id="tablaPrincipal" class="style1" width="60%"
        style="text-align: left; font-size: small;">
        <tr>
            <td style="text-align: center">
                <asp:Button ID="btnGuardarEstudioSuperior" runat="server"
                    BorderStyle="None" CssClass="botonFormulario" Font-Bold="True" Font-Size="Medium"
                    ForeColor="White" Text="Guardar" BackColor="#333333"
                    OnClick="btnGuardarEstudio_Click" TabIndex="59" />

                &nbsp;
                
                <asp:Button ID="btnCerrarEstudioSuperior" runat="server"
                    BorderStyle="None" CssClass="botonFormulario" Font-Bold="True" Font-Size="Medium"
                    ForeColor="White" Text="Cerrar" BackColor="#999966"
                    OnClick="btnCerrarEstudio_Click" TabIndex="60" />
            </td>
        </tr>
        <tr>
            <td>

                <a name="marcaInvestigadoresMiembros"></a>

                <table id="tablaInvestigadoresMiembros" class="style1" width="100%"
                    style="margin: 15px; border-spacing: 10px 10px;">
                    <tr>
                        <td colspan="2">
                            <hr class="hrTitulo" />
                        </td>
                    </tr>
                    <tr>
                        <td colspan="2">
                            <asp:Label ID="Label85" runat="server" Font-Bold="True" Text="Investigador/a y miembros del equipo"></asp:Label>
                            &nbsp;</td>
                    </tr>
                    <tr>
                        <td colspan="2">
                            <hr class="hrTitulo" />
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <table style="width: 100%;">
                                <tr>
                                    <td style="text-align: right">&nbsp;</td>
                                </tr>
                                <tr>
                                    <td style="text-align: left" class="auto-style12">
                                        <table style="width: 45%;">
                                            <tr>

                                                <td class="auto-style38">
                                                    <asp:Label ID="Label86" runat="server" Text="Ingrese el nro. de documento del investigador. Si existe en nuestra base de datos se cargará automáticamente. Caso contrario usted deberá ingresar los datos."></asp:Label>
                                                </td>

                                                <td>
                                                    <asp:TextBox ID="txtDocumentoInvestigador" runat="server" TabIndex="1" Width="150px"></asp:TextBox>
                                                </td>

                                                <td class="auto-style39">
                                                    <asp:Button ID="btnAgregarInvestigador" runat="server"
                                                        BorderStyle="None" CssClass="botonFormularioLargo" Font-Bold="True" Font-Size="Medium"
                                                        ForeColor="White" Text="Agregar investigador" BackColor="#333333" OnClick="btnAgregarInvestigador_Click" TabIndex="2" Width="193px" />
                                                </td>

                                            </tr>
                                            <tr>

                                                <td class="auto-style40"></td>

                                                <td class="auto-style15"></td>

                                                <td class="auto-style41"></td>

                                            </tr>
                                            <tr>

                                                <td class="auto-style40">
                                                    <asp:Label ID="Label98" runat="server" Text="Ingrese miembros del equipo de investigación"></asp:Label>
                                                </td>

                                                <td class="auto-style15">
                                                    <asp:Button ID="btnAgregarMiembroEquipo" runat="server"
                                                        BorderStyle="None" CssClass="botonFormularioLargo" Font-Bold="True" Font-Size="Medium"
                                                        ForeColor="White" Text="Agregar miembros" BackColor="#333333" TabIndex="3" Width="170px" OnClick="btnAgregarMiembroEquipo_Click" />
                                                </td>

                                                <td class="auto-style41">&nbsp;</td>

                                            </tr>
                                            <tr>

                                                <td class="auto-style40">&nbsp;</td>

                                                <td class="auto-style15">&nbsp;</td>

                                                <td class="auto-style41">&nbsp;</td>

                                            </tr>
                                        </table>
                                    </td>
                                </tr>
                                <tr>
                                    <td style="text-align: left">
                                        <asp:GridView ID="gvListaInvestigadores" runat="server" AutoGenerateColumns="False"
                                            CellPadding="5" DataKeyNames="idInvestigador"
                                            EnableTheming="True" Font-Bold="False" Font-Names="Arial" Font-Size="10pt"
                                            ForeColor="#333333" Width="100%" OnRowCommand="gvListaInvestigador_RowCommand" OnRowDataBound="gvListaInvestigador_RowDataBound">
                                            <RowStyle BackColor="#F7F6F3" Font-Names="Arial" Font-Size="10pt"
                                                ForeColor="#333333" />
                                            <Columns>

                                                <asp:TemplateField>
                                                    <ItemTemplate>
                                                        <asp:ImageButton ID="borrarInvestigador" runat="server" CommandName="borrarInvestigador"
                                                            ImageUrl="~/img/delete.png" />
                                                    </ItemTemplate>
                                                    <ItemStyle Height="20px" HorizontalAlign="Center" Width="20px" />
                                                </asp:TemplateField>

                                                <asp:TemplateField>
                                                    <ItemTemplate>
                                                        <asp:ImageButton ID="editarInvestigador" runat="server" CommandName="editarInvestigador"
                                                            ImageUrl="~/img/edit.png" />
                                                    </ItemTemplate>
                                                    <ItemStyle Height="20px" HorizontalAlign="Center" Width="20px" />
                                                </asp:TemplateField>

                                                <asp:BoundField DataField="idInvestigador" HeaderText="idInvestigador" Visible="False" />
                                                <asp:BoundField DataField="idEstudio" HeaderText="idEstudio" Visible="False" />
                                                <asp:BoundField DataField="idEstudioInvestigador" HeaderText="idEstudioInvestigador" Visible="False" />
                                                <asp:BoundField DataField="Apellido" HeaderText="Apellido" />
                                                <asp:BoundField DataField="nombre" HeaderText="Nombre" />
                                                <asp:BoundField DataField="numeroDocumento" HeaderText="Documento" />
                                                <asp:BoundField DataField="numeroMatricula" HeaderText="Matrícula" />
                                                <asp:BoundField DataField="emailLaboral" HeaderText="e-Mail" />
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
                            </table>
                        </td>
                        <td>&nbsp;</td>
                    </tr>
                </table>

            </td>
        </tr>
        <tr>
            <td>
                <table id="TableNumeroDeIncripcion" class="style1"
                    width="100%" style="margin: 15px; border-spacing: 10px 10px;">
                    <tr>
                        <td colspan="2">
                            <hr class="hrTitulo" />
                        </td>
                    </tr>
                    <tr>
                        <td colspan="2">
                            <asp:Label ID="Label27" runat="server" Font-Bold="True"
                                Text="Fecha de inicio"></asp:Label>
                        </td>
                    </tr>
                    <tr>
                        <td colspan="2">
                            <hr class="hrTitulo" />
                        </td>
                    </tr>
                    <tr>
                        <td class="auto-style16">
                            <input class="estiloInputFecha" id="inputFechaInicio" runat="server" maxlength="10"
                                onblur="valFecha(this)"
                                onkeyup="mascara(this,'/',patron,true)" tabindex="4" type="text"
                                __designer:mapid="45" width="100px" /><asp:Label ID="Label28" runat="server" Text="(dd/mm/aaaa)"></asp:Label>
                        </td>
                        <td class="auto-style15">&nbsp;</td>
                    </tr>
                </table>

            </td>
        </tr>
        <tr>
            <td>
                <table id="TableNumeroDeIncripcion" class="style1"
                    width="100%" style="margin: 15px; border-spacing: 10px 10px;">
                    <tr>
                        <td colspan="2">
                            <hr class="hrTitulo" />
                        </td>
                    </tr>
                    <tr>
                        <td colspan="2">
                            <asp:Label ID="Label26" runat="server" Font-Bold="True"
                                Text="Fecha de finalización (estimada)"></asp:Label>
                        </td>
                    </tr>
                    <tr>
                        <td colspan="2">
                            <hr class="hrTitulo" />
                        </td>
                    </tr>
                    <tr>
                        <td class="auto-style16">
                            <input class="estiloInputFecha" id="inputFechaFinalizacion" runat="server" maxlength="10"
                                onblur="valFecha(this)"
                                onkeyup="mascara(this,'/',patron,true)" tabindex="5" type="text"
                                __designer:mapid="45" /><asp:Label ID="Label95" runat="server" Text="(dd/mm/aaaa)"></asp:Label>
                        </td>
                        <td class="auto-style15"></td>
                    </tr>
                </table>
            </td>
        </tr>
        <tr>
            <td>
                <table id="TableNumeroDeIncripcion" class="style1"
                    width="100%" style="margin: 15px; border-spacing: 10px 10px;">
                    <tr>
                        <td colspan="2">
                            <hr class="hrTitulo" />
                        </td>
                    </tr>
                    <tr>
                        <td colspan="2">
                            <asp:Label ID="Label11" runat="server" Font-Bold="True"
                                Text="Datos de identificación"></asp:Label>
                        </td>
                    </tr>
                    <tr>
                        <td colspan="2">
                            <hr class="hrTitulo" />
                        </td>
                    </tr>
                    <tr>
                        <td class="auto-style16"></td>
                        <td class="auto-style15"></td>
                    </tr>
                    <tr>
                        <td class="style15">
                            <asp:Label ID="Label15" runat="server" Text="Nro. de orden"></asp:Label>
                        </td>
                        <td>
                            <asp:TextBox ID="txtNumeroDeOrden" runat="server" Width="25%"
                                Font-Size="Small" Height="20px" TabIndex="6"></asp:TextBox>
                        </td>
                    </tr>
                    <tr>
                        <td class="auto-style16"></td>
                        <td class="auto-style15"></td>
                    </tr>
                    <tr>
                        <td class="auto-style16">
                            <asp:Label ID="Label87" runat="server" Text="Enmienda (Si Corresponde)"></asp:Label>
                        </td>
                        <td class="auto-style15">
                            <asp:TextBox ID="txtNumeroEnmienda" runat="server" Width="25%"
                                Font-Size="Small" Height="20px" TabIndex="7"></asp:TextBox>
                        </td>
                    </tr>
                    <tr>
                        <td class="auto-style16"></td>
                        <td class="auto-style15"></td>
                    </tr>
                    <tr>
                        <td class="style15">
                            <asp:Label ID="Label22" runat="server" Text="Año"></asp:Label>
                        </td>
                        <td>
                            <asp:TextBox ID="txtNumeroAnio" runat="server" Width="25%"
                                Font-Size="Small" Height="20px" TabIndex="8"></asp:TextBox>
                        </td>
                    </tr>
                </table>
            </td>
        </tr>

        <tr>
            <td>
                <asp:UpdatePanel ID="UpdatePanelInstitucionRespaldatoria" runat="server" UpdateMode="Conditional">
                    <ContentTemplate>
                        <table id="tablaPatrocinante" runat="server" class="style1" width="100%"
                            style="margin: 15px; border-spacing: 10px 10px;">
                            <tr>
                                <td class="auto-style17">
                                    <hr class="hrTitulo" />
                                </td>
                            </tr>
                            <tr>
                                <td class="auto-style17">
                                    <asp:Label ID="Label1" runat="server" Font-Bold="True"
                                        Text="Institución de Dependencia"></asp:Label>
                                </td>
                            </tr>
                            <tr>
                                <td class="auto-style17">
                                    <hr class="hrTitulo" />
                                </td>
                            </tr>
                            <tr>
                                <td class="auto-style17">&nbsp;</td>
                            </tr>
                            <tr>
                                <td style="text-align: left" class="auto-style17">
                                    <asp:DropDownList ID="ddlInstitucionRespaldatoria" runat="server" DataTextField="nombre"
                                        DataValueField="idEntidad" TabIndex="9">
                                    </asp:DropDownList>
                                    <asp:Button ID="btnAgregarInstitucionRespaldatoria" runat="server"
                                        BorderStyle="None" CssClass="botonFormulario" Font-Bold="True" Font-Size="Medium"
                                        ForeColor="White" Text="Agregar" BackColor="#333333"
                                        OnClick="btnAgregarInstitucionRespaldatoria_Click" TabIndex="10" />
                                </td>
                            </tr>
                            <tr>
                                <td style="text-align: left" class="auto-style17">&nbsp;</td>
                            </tr>
                            <tr>
                                <td class="auto-style17">
                                    <asp:GridView ID="gvListaInstitucionRespaldatoria" runat="server" AutoGenerateColumns="False"
                                        CellPadding="5" DataKeyNames="idEstudioEntidad"
                                        EnableTheming="True" Font-Bold="False" Font-Names="Arial" Font-Size="10pt"
                                        ForeColor="#333333" OnRowCommand="gvListaInstitucionRespaldatoria_RowCommand"
                                        OnRowDataBound="gvListaInstitucionRespaldatoria_RowDataBound" Width="100%"
                                        OnPageIndexChanging="gvListaInstitucionRespaldatoria_PageIndexChanging">
                                        <RowStyle BackColor="#F7F6F3" Font-Names="Arial" Font-Size="10pt"
                                            ForeColor="#333333" />

                                        <Columns>
                                            <asp:TemplateField>
                                                <ItemTemplate>
                                                    <asp:ImageButton ID="borrarInstitucionRespaldatoria" runat="server" CommandName="borrarInstitucionRespaldatoria"
                                                        ImageUrl="~/img/delete.png" />
                                                </ItemTemplate>
                                                <ItemStyle Height="20px" HorizontalAlign="Center" Width="20px" />
                                            </asp:TemplateField>

                                            <asp:BoundField DataField="idEstudioEntidad" HeaderText="idEstudioEntidad" Visible="False" />
                                            <asp:BoundField DataField="nombre" HeaderText="Entidad" />
                                            <asp:BoundField DataField="caracter" HeaderText="Carácter" />
                                            <asp:BoundField DataField="domicilio" HeaderText="Domicilio" />
                                            <asp:BoundField DataField="email" HeaderText="Email" />
                                            <asp:BoundField DataField="caracteristicas" HeaderText="Características" />
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
                        </table>
                    </ContentTemplate>
                </asp:UpdatePanel>
            </td>
        </tr>

        <tr>
            <td>
                <asp:UpdatePanel ID="UpdatePanelEnteFinanciador" runat="server" UpdateMode="Conditional">
                    <ContentTemplate>
                        <table id="tablaENteFinanciador" runat="server" class="style1" width="100%"
                            style="margin: 15px; border-spacing: 10px 10px;">
                            <tr>
                                <td class="auto-style17">
                                    <hr class="hrTitulo" />
                                </td>
                            </tr>
                            <tr>
                                <td class="auto-style17">
                                    <asp:Label ID="Label30" runat="server" Font-Bold="True"
                                        Text="Ente Financiador"></asp:Label>
                                </td>
                            </tr>
                            <tr>
                                <td class="auto-style17">
                                    <hr class="hrTitulo" />
                                </td>
                            </tr>
                            <tr>
                                <td class="auto-style17">&nbsp;</td>
                            </tr>
                            <tr>
                                <td style="text-align: left" class="auto-style17">
                                    <asp:DropDownList ID="ddlEnteFinanciador" runat="server" DataTextField="nombre"
                                        DataValueField="idEntidad" TabIndex="11">
                                    </asp:DropDownList>
                                    <asp:Button ID="btnAgregarEnteFinanciador" runat="server"
                                        BorderStyle="None" CssClass="botonFormulario" Font-Bold="True" Font-Size="Medium"
                                        ForeColor="White" Text="Agregar" BackColor="#333333"
                                        OnClick="btnAgregarEnteFinanciador_Click" TabIndex="12" />
                                </td>
                            </tr>
                            <tr>
                                <td style="text-align: left" class="auto-style17">&nbsp;</td>
                            </tr>
                            <tr>
                                <td class="auto-style17">
                                    <asp:GridView ID="gvListaEnteFinanciador" runat="server" AutoGenerateColumns="False"
                                        CellPadding="5" DataKeyNames="idEstudioEntidad"
                                        EnableTheming="True" Font-Bold="False" Font-Names="Arial" Font-Size="10pt"
                                        ForeColor="#333333" OnRowCommand="gvListaEnteFinanciador_RowCommand"
                                        OnRowDataBound="gvListaEnteFinanciador_RowDataBound" Width="100%"
                                        OnPageIndexChanging="gvListaEnteFinanciador_PageIndexChanging">
                                        <RowStyle BackColor="#F7F6F3" Font-Names="Arial" Font-Size="10pt"
                                            ForeColor="#333333" />

                                        <Columns>
                                            <asp:TemplateField>
                                                <ItemTemplate>
                                                    <asp:ImageButton ID="borrarEnteFinanciador" runat="server" CommandName="borrarEnteFinanciador"
                                                        ImageUrl="~/img/delete.png" />
                                                </ItemTemplate>
                                                <ItemStyle Height="20px" HorizontalAlign="Center" Width="20px" />
                                            </asp:TemplateField>

                                            <asp:BoundField DataField="idEstudioEntidad" HeaderText="idEstudioEntidad" Visible="False" />
                                            <asp:BoundField DataField="nombre" HeaderText="Entidad" />
                                            <asp:BoundField DataField="caracter" HeaderText="Carácter" />
                                            <asp:BoundField DataField="domicilio" HeaderText="Domicilio" />
                                            <asp:BoundField DataField="email" HeaderText="Email" />
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
                        </table>
                    </ContentTemplate>
                </asp:UpdatePanel>
            </td>
        </tr>

        <tr>
            <td>
                <table id="tablaDatosGenerales" runat="server" class="style1" width="100%"
                    style="margin: 15px; border-spacing: 10px 10px;">
                    <tr>
                        <td colspan="2">
                            <hr class="hrTitulo" />
                        </td>
                    </tr>
                    <tr>
                        <td colspan="2">
                            <asp:Label ID="Label2" runat="server" Font-Bold="True" Text="Datos generales"></asp:Label>
                        </td>
                    </tr>
                    <tr>
                        <td colspan="2">
                            <hr class="hrTitulo" />
                        </td>
                    </tr>
                    <tr>
                        <td class="auto-style24">&nbsp;</td>
                        <td>&nbsp;</td>
                    </tr>
                    <tr>
                        <td class="auto-style24">
                            <asp:Label ID="Label3" runat="server" Text="Título de la investigación"></asp:Label>
                        </td>
                        <td>
                            <asp:TextBox ID="txtTituloInvestigacion" runat="server" Width="98%"
                                Font-Size="Small" Height="20px" TabIndex="13"></asp:TextBox>
                        </td>
                    </tr>
                    <tr>
                        <td class="auto-style24">&nbsp;</td>
                        <td>&nbsp;</td>
                    </tr>
                    <tr>
                        <td class="auto-style26">
                            <asp:Label ID="Label4" runat="server"
                                Text="Nro. de registro nacional"></asp:Label>
                        </td>
                        <td class="auto-style27">
                            <asp:TextBox ID="txtNumeroRegistroNacional" runat="server" Width="25%"
                                Font-Size="Small" Height="20px" TabIndex="14"></asp:TextBox>
                        </td>
                    </tr>
                    <tr>
                        <td class="auto-style25"></td>
                        <td class="auto-style15"></td>
                    </tr>
                    <tr>
                        <td class="auto-style24">
                            <asp:Label ID="Label82" runat="server"
                                Text="Tipo de estudio"></asp:Label>
                        </td>
                        <td>
                            <asp:Label ID="lblTipoEstudio" runat="server"></asp:Label>
                        </td>
                    </tr>
                    <tr>
                        <td class="auto-style22">&nbsp;</td>
                        <td class="style21">&nbsp;</td>
                    </tr>
                    <tr>
                        <td class="auto-style22">
                            <asp:Label ID="Label5" runat="server" Text="Número de expediente"></asp:Label>
                        </td>
                        <td class="style21">
                            <asp:TextBox ID="txtNumeroExpediente" runat="server" Width="25%"
                                Font-Size="Small" Height="20px" TabIndex="15"></asp:TextBox>
                        </td>
                    </tr>
                    <tr>
                        <td class="auto-style23">&nbsp;</td>
                        <td class="style2">&nbsp;</td>
                    </tr>
                    <tr>
                        <td class="auto-style23">
                            <asp:Label ID="Label6" runat="server" Text="Nombre abreviado"></asp:Label>
                        </td>
                        <td class="style2">
                            <asp:TextBox ID="txtNombreAbreviado" runat="server" Width="50%"
                                Font-Size="Small" Height="20px" TabIndex="16"></asp:TextBox>
                        </td>
                    </tr>
                    <tr>
                        <td class="auto-style24">&nbsp;</td>
                        <td>&nbsp;</td>
                    </tr>
                    <tr>
                        <td class="auto-style24">
                            <asp:Label ID="Label7" runat="server" Text="Drogas en estudio"></asp:Label>
                        </td>
                        <td>
                            <asp:TextBox ID="txtDrogasEnEstudio" runat="server" Width="80%"
                                Font-Size="Small" Height="20px" TabIndex="17"></asp:TextBox>
                        </td>
                    </tr>
                    <tr>
                        <td class="auto-style24">&nbsp;</td>
                        <td>&nbsp;</td>
                    </tr>
                    <tr>
                        <td class="auto-style24">
                            <asp:Label ID="Label9" runat="server" Text="Palabras claves"></asp:Label>
                        </td>
                        <td>
                            <asp:TextBox ID="txtPalabrasClaves" runat="server" Width="80%"
                                Font-Size="Small" Height="20px" TabIndex="18"></asp:TextBox>
                        </td>
                    </tr>
                    <tr>
                        <td class="auto-style24">&nbsp;</td>
                        <td>
                            <asp:Label ID="Label93" runat="server" Text="(separar las palabras con espacios en blanco)"></asp:Label>
                        </td>
                    </tr>
                </table>
            </td>
        </tr>

        <tr>
            <td>
                <table id="tablaAfiliacion" runat="server" class="style1" width="100%"
                    style="margin: 15px; border-spacing: 10px 10px;">
                    <tr>
                        <td colspan="2">
                            <hr class="hrTitulo" />
                        </td>
                    </tr>
                    <tr>
                        <td colspan="2">
                            <asp:Label ID="Label12" runat="server" Font-Bold="True"
                                Text="Institución de referencia (del investigador provincial principal)"></asp:Label>
                        </td>
                    </tr>
                    <tr>
                        <td colspan="2">
                            <hr class="hrTitulo" />
                        </td>
                    </tr>
                    <tr>
                        <td class="style12">&nbsp;</td>
                        <td>&nbsp;</td>
                    </tr>
                    <tr>
                        <td class="style12">
                            <asp:Label ID="Label34" runat="server" Text="Institución"></asp:Label>
                        </td>
                        <td>
                            <%--<asp:TextBox ID="txtInstitucion" runat="server" Width="80%" Font-Size="Small"
                                Height="20px" TabIndex="19"></asp:TextBox>--%>
                            <asp:DropDownList ID="ddlInstitucionDeReferencia" runat="server" DataTextField="nombre"
                                DataValueField="idEntidad" TabIndex="19">
                            </asp:DropDownList>
                        </td>
                    </tr>
                    <tr>
                        <td class="style12">&nbsp;</td>
                        <td>&nbsp;</td>
                    </tr>
                    <tr>
                        <td class="style12">
                            <asp:Label ID="Label35" runat="server" Text="Referente"></asp:Label>
                        </td>
                        <td>
                            <asp:TextBox ID="txtReferenteInstitucionAfiliacion" runat="server" Width="50%"
                                Font-Size="Small" Height="20px" TabIndex="20"></asp:TextBox>
                        </td>
                    </tr>
                    <tr>
                        <td class="style12">&nbsp;</td>
                        <td>&nbsp;</td>
                    </tr>
                    <tr>
                        <td class="auto-style28">
                            <asp:Label ID="Label37" runat="server" Text="Teléfono"></asp:Label>
                        </td>
                        <td class="auto-style27">
                            <asp:TextBox ID="txtNumeroTelefonoInstitucion" runat="server" Width="10%"
                                Font-Size="Small" Height="20px" TabIndex="21"></asp:TextBox>
                        </td>
                    </tr>
                    <tr>
                        <td class="style12">&nbsp;</td>
                        <td>&nbsp;</td>
                    </tr>
                    <tr>
                        <td class="style12">
                            <asp:Label ID="Label38" runat="server" Text="Domicilio"></asp:Label>
                        </td>
                        <td>
                            <asp:TextBox ID="txtDomicilioInstitucion" runat="server" Width="30%" Font-Size="Small"
                                Height="20px" TabIndex="22"></asp:TextBox>
                        </td>
                    </tr>
                    <tr>
                        <td class="style12">&nbsp;</td>
                        <td>&nbsp;</td>
                    </tr>
                    <tr>
                        <td class="style12">
                            <asp:Label ID="Label39" runat="server" Text="E-mail"></asp:Label>
                        </td>
                        <td>
                            <asp:TextBox ID="txtMailInstitucion" runat="server" Width="50%"
                                Font-Size="Small" Height="20px" TabIndex="23"></asp:TextBox>
                        </td>
                    </tr>
                    <tr>
                        <td class="style12">&nbsp;</td>
                        <td>&nbsp;</td>
                    </tr>
                    <tr>
                        <td class="style12">&nbsp;</td>
                        <td>&nbsp;</td>
                    </tr>
                </table>
            </td>
        </tr>

        <tr>
            <td style="text-align: center">
                <asp:Button ID="btnGuardarEstudioMedio" runat="server"
                    BorderStyle="None" CssClass="botonFormulario" Font-Bold="True" Font-Size="Medium"
                    ForeColor="White" Text="Guardar" BackColor="#333333"
                    OnClick="btnGuardarEstudioMedio_Click" TabIndex="59" Visible="False" />
                &nbsp;
                                        <asp:Button ID="btnCerrarEstudioMedio" runat="server"
                                            BorderStyle="None" CssClass="botonFormulario" Font-Bold="True" Font-Size="Medium"
                                            ForeColor="White" Text="Cerrar" BackColor="#999966"
                                            OnClick="btnCerrarEstudio_Click" TabIndex="60" Visible="False" />
            </td>
        </tr>

        <tr>
            <td>

                <asp:UpdatePanel ID="UpdatePanelConcentimientos" runat="server" UpdateMode="Conditional">

                    <ContentTemplate>

                        <a name="marcaConcentimiento"></a>

                        <table id="tablaConcentimientos" runat="server" class="style1" width="100%"
                            style="margin: 15px; border-spacing: 10px 10px;">
                            <tr>
                                <td colspan="2">
                                    <hr class="hrTitulo" />
                                </td>
                            </tr>
                            <tr>
                                <td colspan="2">
                                    <asp:Label ID="Label108" runat="server" Font-Bold="True" Text="Consentimientos"></asp:Label>
                                </td>
                            </tr>
                            <tr>
                                <td colspan="2">
                                    <hr class="hrTitulo" />
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <table style="width: 100%;">
                                        <tr>
                                            <td style="text-align: right">&nbsp;</td>
                                        </tr>
                                        <tr>
                                            <td style="text-align: left">
                                                <asp:Button ID="btnAgregarConcentimiento" runat="server"
                                                    BorderStyle="None" CssClass="botonFormulario" Font-Bold="True" Font-Size="Medium"
                                                    ForeColor="White" Text="Agregar" BackColor="#333333"
                                                    OnClick="btnAgregarConcentimiento_Click" TabIndex="24" />
                                            </td>
                                        </tr>
                                        <tr>
                                            <td style="text-align: left">&nbsp;</td>
                                        </tr>
                                        <tr>
                                            <td>
                                                <asp:GridView ID="gvListaConcentimiento" runat="server" AutoGenerateColumns="False"
                                                    CellPadding="5" DataKeyNames="idConcentimiento"
                                                    EnableTheming="True" Font-Bold="False" Font-Names="Arial" Font-Size="10pt"
                                                    ForeColor="#333333" Width="100%"
                                                    OnPageIndexChanging="gvListaConcentimiento_PageIndexChanging"
                                                    OnRowCommand="gvListaConcentimiento_RowCommand"
                                                    OnRowDataBound="gvListaConcentimiento_RowDataBound">
                                                    <RowStyle BackColor="#F7F6F3" Font-Names="Arial" Font-Size="10pt"
                                                        ForeColor="#333333" />
                                                    <Columns>

                                                        <asp:TemplateField>
                                                            <ItemTemplate>
                                                                <asp:ImageButton ID="borrarConcentimiento" runat="server" CommandName="borrarConcentimiento"
                                                                    ImageUrl="~/img/delete.png" />
                                                            </ItemTemplate>
                                                            <ItemStyle Height="20px" HorizontalAlign="Center" Width="20px" />
                                                        </asp:TemplateField>

                                                        <asp:TemplateField>
                                                            <ItemTemplate>
                                                                <asp:ImageButton ID="editarConcentimiento" runat="server" CommandName="editarConcentimiento"
                                                                    ImageUrl="~/img/edit.png" />
                                                            </ItemTemplate>
                                                            <ItemStyle Height="20px" HorizontalAlign="Center" Width="20px" />
                                                        </asp:TemplateField>

                                                        <asp:BoundField DataField="idConcentimiento" HeaderText="idConcentimiento" Visible="False" />
                                                        <asp:BoundField DataField="idEstudio" HeaderText="idEstudio" Visible="False" />
                                                        <asp:BoundField DataField="version" HeaderText="Versión" />
                                                        <asp:BoundField DataField="fecha" HeaderText="Fecha" />
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
                                    </table>
                                </td>
                                <td>&nbsp;</td>
                            </tr>
                        </table>

                    </ContentTemplate>

                </asp:UpdatePanel>

            </td>
        </tr>

        <tr>
            <td>
                <asp:UpdatePanel ID="UpdatePanelEnmiendas" runat="server" UpdateMode="Conditional">
                    <ContentTemplate>
                        <a name="marcaEnmiendas"></a>
                        <table id="tablaEnmiendas" runat="server" class="style1" width="100%"
                            style="margin: 15px; border-spacing: 10px 10px;">
                            <tr>
                                <td colspan="2">
                                    <hr class="hrTitulo" />
                                </td>
                            </tr>
                            <tr>
                                <td colspan="2">
                                    <asp:Label ID="Label10" runat="server" Font-Bold="True" Text="Enmiendas"></asp:Label>
                                </td>
                            </tr>
                            <tr>
                                <td colspan="2">
                                    <hr class="hrTitulo" />
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <table style="width: 100%;">
                                        <tr>
                                            <td style="text-align: right">&nbsp;</td>
                                        </tr>
                                        <tr>
                                            <td style="text-align: left">
                                                <asp:Button ID="btnAgregarEnmienda" runat="server"
                                                    BorderStyle="None" CssClass="botonFormulario" Font-Bold="True" Font-Size="Medium"
                                                    ForeColor="White" Text="Agregar" BackColor="#333333"
                                                    OnClick="btnAgregarEnmienda_Click" TabIndex="25" />
                                            </td>
                                        </tr>
                                        <tr>
                                            <td style="text-align: left">&nbsp;</td>
                                        </tr>
                                        <tr>
                                            <td>
                                                <asp:GridView ID="gvListaEnmiendas" runat="server" AutoGenerateColumns="False"
                                                    CellPadding="5" DataKeyNames="idEnmienda"
                                                    EnableTheming="True" Font-Bold="False" Font-Names="Arial" Font-Size="10pt"
                                                    ForeColor="#333333" Width="100%"
                                                    OnPageIndexChanging="gvListaEnmiendas_PageIndexChanging"
                                                    OnRowCommand="gvListaEnmiendas_RowCommand"
                                                    OnRowDataBound="gvListaEnmiendas_RowDataBound">
                                                    <RowStyle BackColor="#F7F6F3" Font-Names="Arial" Font-Size="10pt"
                                                        ForeColor="#333333" />
                                                    <Columns>

                                                        <asp:TemplateField>
                                                            <ItemTemplate>
                                                                <asp:ImageButton ID="borrarEnmienda" runat="server" CommandName="borrarEnmienda"
                                                                    ImageUrl="~/img/delete.png" />
                                                            </ItemTemplate>
                                                            <ItemStyle Height="20px" HorizontalAlign="Center" Width="20px" />
                                                        </asp:TemplateField>

                                                        <asp:TemplateField>
                                                            <ItemTemplate>
                                                                <asp:ImageButton ID="editarEnmienda" runat="server" CommandName="editarEnmienda"
                                                                    ImageUrl="~/img/edit.png" />
                                                            </ItemTemplate>
                                                            <ItemStyle Height="20px" HorizontalAlign="Center" Width="20px" />
                                                        </asp:TemplateField>

                                                        <asp:BoundField DataField="idEnmienda" HeaderText="idEnmienda" Visible="False" />
                                                        <asp:BoundField DataField="idEstudio" HeaderText="idEstudio" Visible="False" />
                                                        <asp:BoundField DataField="modificacion" HeaderText="Modificación" />
                                                        <asp:BoundField DataField="dictamen" HeaderText="Dictámen" />
                                                        <asp:BoundField DataField="fechaDictamen" HeaderText="Fecha del dictámen" />
                                                        <asp:BoundField DataField="observaciones" HeaderText="Observaciones" />
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
                                    </table>
                                </td>
                                <td>&nbsp;</td>
                            </tr>
                        </table>
                    </ContentTemplate>
                </asp:UpdatePanel>
            </td>
        </tr>

        <tr>
            <td>
                <asp:UpdatePanel ID="UpdatePanelTipoInvestigacion" runat="server" UpdateMode="Conditional">
                    <ContentTemplate>
                        <asp:Panel ID="pnlTipoInvestigacion" runat="server">
                            <table id="Table7" class="style1" width="100%"
                                style="margin: 15px; border-spacing: 10px 10px;" runat="server">
                                <tr>
                                    <td class="auto-style17">
                                        <hr class="hrTitulo" />
                                    </td>
                                </tr>
                                <tr>
                                    <td class="auto-style17">
                                        <asp:Label ID="Label104" runat="server" Font-Bold="True"
                                            Text="Características del estudio"></asp:Label>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="auto-style17">
                                        <hr class="hrTitulo" />
                                    </td>
                                </tr>
                                <tr>
                                    <td class="auto-style17">&nbsp;</td>
                                </tr>
                                <tr>
                                    <td class="auto-style17" style="text-align: left">
                                        <asp:DropDownList ID="ddlCaracteristicasEstudio" runat="server" DataTextField="descripcion" DataValueField="idCaracteristica" TabIndex="26">
                                        </asp:DropDownList>
                                        <asp:Button ID="btnAgregarCaracteristicaEstudio" runat="server" BackColor="#333333" BorderStyle="None" CssClass="botonFormulario" Font-Bold="True" Font-Size="Medium" ForeColor="White" OnClick="btnAgregarCaracteristicaEstudio_Click" TabIndex="27" Text="Agregar" />
                                    </td>
                                </tr>
                                <tr>
                                    <td class="auto-style17" style="text-align: left">&nbsp;</td>
                                </tr>
                                <tr>
                                    <td class="auto-style17">
                                        <asp:GridView ID="gvListaCaracteristicasEstudio" runat="server" AutoGenerateColumns="False" CellPadding="5" DataKeyNames="idEstudioCaracteristica" EnableTheming="True" Font-Bold="False" Font-Names="Arial" Font-Size="10pt" ForeColor="#333333" OnPageIndexChanging="gvListaCaracteristicasEstudio_PageIndexChanging" OnRowCommand="gvListaCaracteristicasEstudio_RowCommand" OnRowDataBound="gvListaCaracteristicasEstudio_RowDataBound" Width="100%">
                                            <RowStyle BackColor="#F7F6F3" Font-Names="Arial" Font-Size="10pt" ForeColor="#333333" />
                                            <Columns>
                                                <asp:TemplateField>
                                                    <ItemTemplate>
                                                        <asp:ImageButton ID="borrarCaracteristicasEstudio" runat="server" CommandName="borrarCaracteristicasEstudio" ImageUrl="~/img/delete.png" />
                                                    </ItemTemplate>
                                                    <ItemStyle Height="20px" HorizontalAlign="Center" Width="20px" />
                                                </asp:TemplateField>
                                                <asp:BoundField DataField="idEstudioCaracteristica" HeaderText="idEstudioCaracteristica" Visible="False" />
                                                <asp:BoundField DataField="idCaracteristica" HeaderText="idCaracteristica" Visible="False" />
                                                <asp:BoundField DataField="idEstudio" HeaderText="idEstudio" Visible="False" />
                                                <asp:BoundField DataField="descripcion" HeaderText="Caracteristica" />
                                                <asp:BoundField DataField="tipoEstudio" HeaderText="tipoEstudio" Visible="False" />
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
                    </ContentTemplate>
                </asp:UpdatePanel>
            </td>
        </tr>

        <tr>
            <td>
                <asp:UpdatePanel ID="UpdatePanelPresentacionInformeAvances" runat="server" UpdateMode="Conditional">
                    <ContentTemplate>
                        <a name="marcaPresentacionInformeAvances"></a>
                        <table id="tablaFechaPresentacionInformeAvances" runat="server" class="style1" width="100%"
                            style="margin: 15px; border-spacing: 10px 10px;">
                            <tr>
                                <td colspan="2">
                                    <hr class="hrTitulo" />
                                </td>
                            </tr>
                            <tr>
                                <td colspan="2">
                                    <asp:Label ID="Label29" runat="server" Font-Bold="True"
                                        Text="Fechas de presentación de informe de avances"></asp:Label>
                                </td>
                            </tr>
                            <tr>
                                <td colspan="2">
                                    <hr class="hrTitulo" />
                                </td>
                            </tr>
                            <tr>
                                <td style="text-align: right" class="auto-style37">&nbsp;</td>
                                <td>&nbsp;</td>
                            </tr>
                            <tr>
                                <td style="text-align: left" class="auto-style37">
                                    <asp:Button ID="btnAgregarFechasPresentacionInformes" runat="server"
                                        BorderStyle="None" CssClass="botonFormulario" Font-Bold="True" Font-Size="Medium"
                                        ForeColor="White" Text="Agregar" BackColor="#333333"
                                        OnClick="btnAgregarFechasPresentacionInformes_Click" TabIndex="28" />
                                </td>
                                <td>&nbsp;</td>
                            </tr>
                            <tr>
                                <td style="text-align: left" class="auto-style37">&nbsp;</td>
                                <td>&nbsp;</td>
                            </tr>
                            <tr>
                                <td class="auto-style37">
                                    <asp:GridView ID="gvListaFechasPresentacionInformeAvances" runat="server" AutoGenerateColumns="False"
                                        CellPadding="5" DataKeyNames="idPresentacionInforme"
                                        EnableTheming="True" Font-Bold="False" Font-Names="Arial" Font-Size="10pt"
                                        ForeColor="#333333" OnRowCommand="gvListaFechasPresentacionInformeAvances_RowCommand"
                                        OnRowDataBound="gvListaFechasPresentacionInformeAvances_RowDataBound" Width="15%">
                                        <RowStyle BackColor="#F7F6F3" Font-Names="Arial" Font-Size="10pt"
                                            ForeColor="#333333" />

                                        <Columns>
                                            <asp:TemplateField>
                                                <ItemTemplate>
                                                    <asp:ImageButton ID="borrarFechaPresentacionAvance" runat="server" CommandName="borrarFechaPresentacionAvance"
                                                        ImageUrl="~/img/delete.png" />
                                                </ItemTemplate>
                                                <ItemStyle Height="20px" HorizontalAlign="Center" Width="20px" />
                                            </asp:TemplateField>

                                            <asp:TemplateField>
                                                <ItemTemplate>
                                                    <asp:ImageButton ID="editarFechaPresentacionAvance" runat="server" CommandName="editarFechaPresentacionAvance"
                                                        ImageUrl="~/img/edit.png" />
                                                </ItemTemplate>
                                                <ItemStyle Height="20px" HorizontalAlign="Center" Width="20px" />
                                            </asp:TemplateField>

                                            <asp:BoundField DataField="idPresentacionInforme" HeaderText="idPresentacionInforme" Visible="False" />
                                            <asp:BoundField DataField="idEstudio" HeaderText="idEstudio" Visible="False" />
                                            <asp:BoundField DataField="fecha" HeaderText="Fecha" />
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
                                <td>&nbsp;</td>
                            </tr>
                            <tr>
                                <td class="auto-style37">&nbsp;</td>
                                <td>&nbsp;</td>
                            </tr>
                            <tr>
                                <td class="auto-style37">
                                    <asp:Label ID="Label96" runat="server" Text="Fecha de presentación de informe final"></asp:Label>
                                </td>
                                <td>
                                    <input class="estiloInputFecha" id="inputFechaPresentacionInformeFinal" runat="server" maxlength="10"
                                        onblur="valFecha(this)"
                                        onkeyup="mascara(this,'/',patron,true)" tabindex="29" type="text" /><asp:Label ID="Label97" runat="server" Text="(dd/mm/aaaa)"></asp:Label>
                                </td>
                            </tr>
                        </table>
                    </ContentTemplate>
                </asp:UpdatePanel>
            </td>
        </tr>

        <tr>
            <td>
                <table id="tablaAreaTematica" runat="server" class="style1" width="100%"
                    style="margin: 15px; border-spacing: 10px 10px;">
                    <tr>
                        <td colspan="2">
                            <hr class="hrTitulo" />
                        </td>
                    </tr>
                    <tr>
                        <td colspan="2">
                            <asp:Label ID="Label16" runat="server" Font-Bold="True" Text="Area temática"></asp:Label>
                        </td>
                    </tr>
                    <tr>
                        <td colspan="2">
                            <hr class="hrTitulo" />
                        </td>
                    </tr>
                    <tr>
                        <td class="style16">&nbsp;</td>
                        <td>&nbsp;</td>
                    </tr>
                    <tr>
                        <td class="style16">
                            <asp:DropDownList ID="ddlAreaTematica" runat="server" DataTextField="descripcion" DataValueField="idAreaTematica" TabIndex="30">
                            </asp:DropDownList>
                        </td>
                        <td>&nbsp;</td>
                    </tr>
                </table>
            </td>
        </tr>
        <tr>
            <td>

                <asp:UpdatePanel ID="UpdatePanelPoblacionVulnerable" runat="server" UpdateMode="Conditional">
                    <ContentTemplate>
                        <table id="Table1" runat="server" class="style1" width="100%"
                            style="margin: 15px; border-spacing: 10px 10px;">
                            <tr>
                                <td colspan="2">
                                    <hr class="hrTitulo" />
                                </td>
                            </tr>
                            <tr>
                                <td colspan="2">
                                    <asp:Label ID="Label23" runat="server" Font-Bold="True" Text="Participación de población vulnerable"></asp:Label>
                                </td>
                            </tr>
                            <tr>
                                <td colspan="2">
                                    <hr class="hrTitulo" />
                                </td>
                            </tr>
                            <tr>
                                <td class="auto-style31"></td>
                                <td class="auto-style15"></td>
                            </tr>
                            <tr>
                                <td class="style16">
                                    <asp:DropDownList ID="ddlPoblacionVulnerable" runat="server" TabIndex="31" AutoPostBack="True" OnSelectedIndexChanged="ddlPoblacionVulnerable_SelectedIndexChanged">
                                        <asp:ListItem>NO</asp:ListItem>
                                        <asp:ListItem>SI</asp:ListItem>
                                    </asp:DropDownList>
                                </td>
                                <td>&nbsp;</td>
                            </tr>
                            <tr>
                                <td class="auto-style31"></td>
                                <td class="auto-style15"></td>
                            </tr>
                            <tr>
                                <td class="style16">
                                    <asp:Panel ID="pnlItemsPoblacionVulnerable" runat="server">
                                        <asp:CheckBoxList ID="chkItemsPoblacionVulnerable" runat="server" DataTextField="descripcion" DataValueField="idPoblacionVulnerable" TabIndex="53" OnSelectedIndexChanged="chkItemsPoblacionVulnerable_SelectedIndexChanged">
                                        </asp:CheckBoxList>
                                    </asp:Panel>
                                </td>
                                <td>&nbsp;</td>
                            </tr>
                        </table>
                    </ContentTemplate>
                </asp:UpdatePanel>

            </td>
        </tr>
        <tr>
            <td>
                <table id="tablaTamanioMuestra" runat="server" class="style1" width="100%"
                    style="margin: 15px; border-spacing: 10px 10px;">
                    <tr>
                        <td colspan="2">
                            <hr class="hrTitulo" />
                        </td>
                    </tr>
                    <tr>
                        <td colspan="2">
                            <asp:Label ID="Label17" runat="server" Font-Bold="True"
                                Text="Tamaño de la muestra"></asp:Label>
                        </td>
                    </tr>
                    <tr>
                        <td colspan="2">
                            <hr class="hrTitulo" />
                        </td>
                    </tr>
                    <tr>
                        <td class="style17">&nbsp;</td>
                        <td>&nbsp;</td>
                    </tr>
                    <tr>
                        <td class="style17">
                            <asp:Label ID="Label67" runat="server"
                                Text="Nro. total de participantes que se estima que serán incorporados al centro de investigación local"></asp:Label>
                        </td>
                        <td>
                            <asp:TextBox ID="txtTamanioMuestra" runat="server" Width="20%"
                                Font-Size="Small" Height="20px" TabIndex="33"></asp:TextBox>
                        </td>
                    </tr>
                </table>
            </td>
        </tr>
        <tr>
            <td>
                <table id="tablaFuenteRecoleccionDatos" runat="server" class="style1" width="100%"
                    style="margin: 15px; border-spacing: 10px 10px;">
                    <tr>
                        <td colspan="2">
                            <hr class="hrTitulo" />
                        </td>
                    </tr>
                    <tr>
                        <td colspan="2">
                            <asp:Label ID="Label24" runat="server" Font-Bold="True"
                                Text="Fuente de recolección de datos"></asp:Label>
                        </td>
                    </tr>
                    <tr>
                        <td colspan="2">
                            <hr class="hrTitulo" />
                        </td>
                    </tr>
                    <tr>
                        <td class="style17">&nbsp;</td>
                        <td>&nbsp;</td>
                    </tr>
                    <tr>
                        <td class="style17">
                            <asp:CheckBoxList ID="chkItemsFuenteRecoleccionDatos" runat="server" DataTextField="descripcion" DataValueField="idFuenteRecoleccionDatos" TabIndex="34">
                            </asp:CheckBoxList>
                        </td>
                        <td>&nbsp;</td>
                    </tr>
                </table>
            </td>
        </tr>
        <tr>
            <td>


                <table id="tablaDuracion" runat="server" class="style1" width="100%"
                    style="margin: 15px; border-spacing: 10px 10px;">
                    <tr>
                        <td colspan="2">
                            <hr class="hrTitulo" />
                        </td>
                    </tr>
                    <tr>
                        <td colspan="2">
                            <asp:Label ID="Label18" runat="server" Font-Bold="True" Text="Duración"></asp:Label>
                        </td>
                    </tr>
                    <tr>
                        <td colspan="2">
                            <hr class="hrTitulo" />
                        </td>
                    </tr>
                    <tr>
                        <td class="auto-style11">&nbsp;</td>
                        <td class="auto-style32">&nbsp;</td>
                    </tr>
                    <tr>
                        <td class="auto-style11">
                            <asp:Label ID="Label68" runat="server" Text="Tiempo estimado desde el inicio"></asp:Label>
                        </td>
                        <td class="auto-style32">
                            <table class="style1">
                                <tr>
                                    <td class="style19">Año</td>
                                    <td>
                                        <asp:TextBox ID="txtTiempoEstimadoAnios" runat="server" Width="10%"
                                            Font-Size="Small" Height="20px" TabIndex="35"></asp:TextBox>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="style19">&nbsp;</td>
                                    <td>&nbsp;</td>
                                </tr>
                                <tr>
                                    <td class="style19">Meses</td>
                                    <td>
                                        <asp:TextBox ID="txtTiempoEstimadoMeses" runat="server" Width="10%"
                                            Font-Size="Small" Height="20px" TabIndex="36"></asp:TextBox>
                                    </td>
                                </tr>
                            </table>
                        </td>
                    </tr>
                    <tr>
                        <td class="auto-style11">&nbsp;</td>
                        <td class="auto-style32">&nbsp;</td>
                    </tr>
                    <tr>
                        <td class="auto-style11">
                            <asp:Label ID="Label69" runat="server"
                                Text="Fecha de incorporación del 1er.  paciente"></asp:Label>
                        </td>
                        <td class="auto-style32">
                            <input class="estiloInputFecha" id="inputFechaPrimerParticipante" runat="server" maxlength="10"
                                onblur="valFecha(this)"
                                onkeyup="mascara(this,'/',patron,true)" tabindex="37" type="text"
                                __designer:mapid="45" /><asp:Label ID="Label91" runat="server" Text="(dd/mm/aaaa)"></asp:Label>
                        </td>
                    </tr>
                    <tr>
                        <td class="auto-style11">&nbsp;</td>
                        <td class="auto-style32">&nbsp;</td>
                    </tr>
                    <tr>
                        <td class="auto-style11">
                            <asp:Label ID="Label70" runat="server" Text="Fecha de cierre de incorporación de pacientes"></asp:Label>
                        </td>
                        <td class="auto-style32">
                            <input class="estiloInputFecha" id="inputFechaCierreParticipantes" runat="server" maxlength="10"
                                onblur="valFecha(this)"
                                onkeyup="mascara(this,'/',patron,true)" tabindex="38" type="text"
                                __designer:mapid="45" /><asp:Label ID="Label92" runat="server" Text="(dd/mm/aaaa)"></asp:Label>
                        </td>
                    </tr>
                </table>
            </td>
        </tr>
        <tr>
            <td>

                <asp:UpdatePanel ID="UpdatePanelTipoDeEstudio" runat="server" UpdateMode="Conditional">

                    <ContentTemplate>

                        <table id="Table3" runat="server" class="style1"
                            style="margin: 15px; border-spacing: 10px 10px;">
                            <tr>
                                <td colspan="2">
                                    <hr class="hrTitulo" />
                                </td>
                            </tr>
                            <tr>
                                <td colspan="2">
                                    <asp:Label ID="Label25" runat="server" Font-Bold="True"
                                        Text="Tipo de estudio"></asp:Label>
                                </td>
                            </tr>
                            <tr>
                                <td colspan="2">
                                    <hr class="hrTitulo" />
                                </td>
                            </tr>
                            <tr>
                                <td class="auto-style46"></td>
                                <td class="auto-style15"></td>
                            </tr>
                            <tr>
                                <td class="auto-style35">
                                    <asp:Label ID="Label94" runat="server" Text="¿ Multicéntrico ?"></asp:Label>
                                </td>
                                <td class="auto-style36">
                                    <asp:DropDownList ID="ddlEstudioMulticentrico" runat="server" TabIndex="39" OnSelectedIndexChanged="ddlEstudioMulticentrico_SelectedIndexChanged" AutoPostBack="True">
                                        <asp:ListItem>NO</asp:ListItem>
                                        <asp:ListItem>SI</asp:ListItem>
                                    </asp:DropDownList>
                                </td>
                            </tr>
                            <tr>
                                <td class="auto-style46"></td>
                                <td class="auto-style15"></td>
                            </tr>
                            <tr>
                                <td class="auto-style46">&nbsp;</td>
                                <td class="auto-style15">
                                    <asp:Panel ID="pnlMulticentrico" runat="server">
                                        <table style="width: 100%;">
                                            <tr>
                                                <td class="auto-style44">
                                                    <asp:Label ID="Label105" runat="server" Text="Efectores (Prov. de Neuquén)"></asp:Label>
                                                    &nbsp;<asp:DropDownList ID="ddlMulticentricoEfectores" runat="server" AutoPostBack="True" DataTextField="nombre" DataValueField="idEfector" TabIndex="40">
                                                    </asp:DropDownList>
                                                    &nbsp;<asp:Button ID="btnAgregarMulticentricoEfector0" runat="server" BackColor="#333333" BorderStyle="None" CssClass="botonFormulario" Font-Bold="True" Font-Size="Medium" ForeColor="White" TabIndex="41" Text="Agregar" OnClick="btnAgregarMulticentricoEfector_Click" />
                                                </td>
                                            </tr>
                                            <tr>
                                                <td class="auto-style44">&nbsp;</td>
                                            </tr>
                                            <tr>
                                                <td class="auto-style45">
                                                    <asp:GridView ID="gvListaEfectoresMulticentrico" runat="server" AutoGenerateColumns="False" CellPadding="5" DataKeyNames="id" EnableTheming="True" Font-Bold="False" Font-Names="Arial" Font-Size="10pt" ForeColor="#333333" OnRowCommand="gvListaEfectoresMulticentrico_RowCommand" OnRowDataBound="gvListaEfectoresMulticentrico_RowDataBound" Width="50%">
                                                        <RowStyle BackColor="#F7F6F3" Font-Names="Arial" Font-Size="10pt" ForeColor="#333333" />
                                                        <Columns>

                                                            <asp:TemplateField>
                                                                <ItemTemplate>
                                                                    <asp:ImageButton ID="borrarEfectorMulticentrico" runat="server" CommandName="borrarEfectorMulticentrico" ImageUrl="~/img/delete.png" />
                                                                </ItemTemplate>
                                                                <ItemStyle Height="20px" HorizontalAlign="Center" Width="20px" />
                                                            </asp:TemplateField>

                                                            <asp:BoundField DataField="id" HeaderText="id" Visible="False" />
                                                            <asp:BoundField DataField="idEstudio" HeaderText="idEstudio" Visible="False" />
                                                            <asp:BoundField DataField="idEfector" HeaderText="idEfector" Visible="False" />
                                                            <asp:BoundField DataField="nombre" HeaderText="Efector" />
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
                                            <tr>
                                                <td class="auto-style43"></td>
                                            </tr>
                                            <tr>
                                                <td class="auto-style45">
                                                    <asp:Label ID="Label106" runat="server" Text="Provincias "></asp:Label>
                                                    &nbsp;<asp:DropDownList ID="ddlMulticentricoProvincias" runat="server" AutoPostBack="True" DataTextField="nombre" DataValueField="idProvincia" TabIndex="42">
                                                    </asp:DropDownList>
                                                    &nbsp;<asp:Button ID="btnAgregarMulticentricoProvincia0" runat="server" BackColor="#333333" BorderStyle="None" CssClass="botonFormulario" Font-Bold="True" Font-Size="Medium" ForeColor="White" TabIndex="43" Text="Agregar" OnClick="btnAgregarMulticentricoProvincia_Click" />
                                                </td>
                                            </tr>
                                            <tr>
                                                <td class="auto-style45">&nbsp;</td>
                                            </tr>
                                            <tr>
                                                <td class="auto-style45">
                                                    <asp:GridView ID="gvListaProvinciasMulticentrico" runat="server" AutoGenerateColumns="False" CellPadding="5" DataKeyNames="id" EnableTheming="True" Font-Bold="False" Font-Names="Arial" Font-Size="10pt" ForeColor="#333333" OnRowCommand="gvListaProvinciasMulticentrico_RowCommand" OnRowDataBound="gvListaProvinciasMulticentrico_RowDataBound" Width="50%">
                                                        <RowStyle BackColor="#F7F6F3" Font-Names="Arial" Font-Size="10pt" ForeColor="#333333" />
                                                        <Columns>

                                                            <asp:TemplateField>
                                                                <ItemTemplate>
                                                                    <asp:ImageButton ID="borrarProvinciaMulticentrico" runat="server" CommandName="borrarProvinciaMulticentrico" ImageUrl="~/img/delete.png" />
                                                                </ItemTemplate>
                                                                <ItemStyle Height="20px" HorizontalAlign="Center" Width="20px" />
                                                            </asp:TemplateField>

                                                            <asp:BoundField DataField="id" HeaderText="id" Visible="False" />
                                                            <asp:BoundField DataField="idEstudio" HeaderText="idEstudio" Visible="False" />
                                                            <asp:BoundField DataField="idProvincia" HeaderText="idProvincia" Visible="False" />
                                                            <asp:BoundField DataField="nombre" HeaderText="Provincia" />
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
                                            <tr>
                                                <td class="auto-style45">&nbsp;</td>
                                            </tr>
                                            <tr>
                                                <td class="auto-style45">
                                                    <asp:Label ID="Label107" runat="server" Text="Paises "></asp:Label>
                                                    &nbsp;<asp:DropDownList ID="ddlMulticentricoPaises" runat="server" AutoPostBack="True" DataTextField="nombre" DataValueField="idPais" TabIndex="44">
                                                    </asp:DropDownList>
                                                    &nbsp;<asp:Button ID="btnAgregarMulticentricoPaise0" runat="server" BackColor="#333333" BorderStyle="None" CssClass="botonFormulario" Font-Bold="True" Font-Size="Medium" ForeColor="White" TabIndex="45" Text="Agregar" OnClick="btnAgregarMulticentricoPaise_Click" />
                                                </td>
                                            </tr>
                                            <tr>
                                                <td class="auto-style45">&nbsp;</td>
                                            </tr>
                                            <tr>
                                                <td class="auto-style45">
                                                    <asp:GridView ID="gvListaPaisesMulticentrico" runat="server" AutoGenerateColumns="False" CellPadding="5" DataKeyNames="id" EnableTheming="True" Font-Bold="False" Font-Names="Arial" Font-Size="10pt" ForeColor="#333333" OnRowCommand="gvListaPaisesMulticentrico_RowCommand" OnRowDataBound="gvListaPaisesMulticentrico_RowDataBound" Width="50%">
                                                        <RowStyle BackColor="#F7F6F3" Font-Names="Arial" Font-Size="10pt" ForeColor="#333333" />
                                                        <Columns>

                                                            <asp:TemplateField>
                                                                <ItemTemplate>
                                                                    <asp:ImageButton ID="borrarPaisMulticentrico" runat="server" CommandName="borrarPaisMulticentrico" ImageUrl="~/img/delete.png" />
                                                                </ItemTemplate>
                                                                <ItemStyle Height="20px" HorizontalAlign="Center" Width="20px" />
                                                            </asp:TemplateField>

                                                            <asp:BoundField DataField="id" HeaderText="id" Visible="False" />
                                                            <asp:BoundField DataField="idEstudio" HeaderText="idEstudio" Visible="False" />
                                                            <asp:BoundField DataField="idPais" HeaderText="idPais" Visible="False" />
                                                            <asp:BoundField DataField="nombre" HeaderText="País" />
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
                                <td class="auto-style34">&nbsp;</td>
                                <td>&nbsp;</td>
                            </tr>
                        </table>


                        <a name="marcaLugaresRealizacion"></a>

                        <table id="tablaLugaresDeRealizacion" runat="server" class="style1" width="100%"
                            style="margin: 15px; border-spacing: 10px 10px;">
                            <tr>
                                <td colspan="2">
                                    <hr class="hrTitulo" />
                                </td>
                            </tr>
                            <tr>
                                <td colspan="2">
                                    <asp:Label ID="Label19" runat="server" Font-Bold="True"
                                        Text="Lugares de realización"></asp:Label>
                                </td>
                            </tr>
                            <tr>
                                <td colspan="2">
                                    <hr class="hrTitulo" />
                                </td>
                            </tr>
                            <tr>
                                <td style="text-align: right">&nbsp;</td>
                                <td>&nbsp;</td>
                            </tr>
                            <tr>
                                <td style="text-align: left">
                                    <asp:Button ID="btnAgregarLugarDeRealizacion" runat="server"
                                        BorderStyle="None" CssClass="botonFormulario" Font-Bold="True" Font-Size="Medium"
                                        ForeColor="White" Text="Agregar" BackColor="#333333"
                                        OnClick="btnAgregarLugaresDeRealizacion_Click" TabIndex="46" />
                                </td>
                                <td>&nbsp;</td>
                            </tr>
                            <tr>
                                <td style="text-align: left">&nbsp;</td>
                                <td>&nbsp;</td>
                            </tr>
                            <tr>
                                <td>
                                    <asp:GridView ID="gvListaLugaresDeRealizacion" runat="server" AutoGenerateColumns="False"
                                        CellPadding="5" DataKeyNames="idLugarRealizacion"
                                        EnableTheming="True" Font-Bold="False" Font-Names="Arial" Font-Size="10pt"
                                        ForeColor="#333333" OnRowCommand="gvListaLugaresDeRealizacion_RowCommand"
                                        OnRowDataBound="gvListaLugaresDeRealizacion_RowDataBound" Width="100%">
                                        <RowStyle BackColor="#F7F6F3" Font-Names="Arial" Font-Size="10pt"
                                            ForeColor="#333333" />

                                        <Columns>
                                            <asp:TemplateField>
                                                <ItemTemplate>
                                                    <asp:ImageButton ID="borrarLugarRealizacion" runat="server" CommandName="borrarLugarRealizacion"
                                                        ImageUrl="~/img/delete.png" />
                                                </ItemTemplate>
                                                <ItemStyle Height="20px" HorizontalAlign="Center" Width="20px" />
                                            </asp:TemplateField>

                                            <asp:TemplateField>
                                                <ItemTemplate>
                                                    <asp:ImageButton ID="editarLugarRealizacion" runat="server" CommandName="editarLugarRealizacion"
                                                        ImageUrl="~/img/edit.png" />
                                                </ItemTemplate>
                                                <ItemStyle Height="20px" HorizontalAlign="Center" Width="20px" />
                                            </asp:TemplateField>

                                            <asp:BoundField DataField="idLugarRealizacion" HeaderText="idLugarRealizacion" Visible="False" />
                                            <asp:BoundField DataField="idEstudio" HeaderText="idEstudio" Visible="False" />
                                            <asp:BoundField DataField="descripcion" HeaderText="Lugar" />
                                            <asp:BoundField DataField="ambito" HeaderText="Ambito" />
                                            <asp:BoundField DataField="domicilio" HeaderText="Domicilio" />
                                            <asp:BoundField DataField="cp" HeaderText="CP" />
                                            <asp:BoundField DataField="ciudad" HeaderText="Ciudad" />
                                            <asp:BoundField DataField="email" HeaderText="Mail" />
                                            <asp:BoundField DataField="responsable" HeaderText="Responsable" />
                                            <asp:BoundField DataField="cargo" HeaderText="Cargo" />
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
                                <td>&nbsp;</td>
                            </tr>
                        </table>

                    </ContentTemplate>

                </asp:UpdatePanel>

            </td>
        </tr>

        <tr>
            <td>
                <asp:UpdatePanel ID="UpdatePanelSeguroDanios" runat="server" UpdateMode="Conditional">
                    <ContentTemplate>
                        <asp:Panel ID="pnlSeguroDeDanios" runat="server">
                            <a name="marcaSeguroDanios"></a>
                            <table id="tablaSeguroDeDanios" class="style1" width="100%"
                                style="margin: 15px; border-spacing: 10px 10px;">
                                <tr>
                                    <td colspan="2">
                                        <hr class="hrTitulo" />
                                    </td>
                                </tr>
                                <tr>
                                    <td colspan="2">
                                        <asp:Label ID="Label20" runat="server" Font-Bold="True" Text="Seguros de daños"></asp:Label>
                                    </td>
                                </tr>
                                <tr>
                                    <td colspan="2">
                                        <hr class="hrTitulo" />
                                    </td>
                                </tr>
                                <tr>
                                    <td style="text-align: right">&nbsp;</td>
                                    <td>&nbsp;</td>
                                </tr>
                                <tr>
                                    <td style="text-align: left">
                                        <asp:Button ID="btnAgregarAseguradora" runat="server"
                                            BorderStyle="None" CssClass="botonFormulario" Font-Bold="True" Font-Size="Medium"
                                            ForeColor="White" Text="Agregar" BackColor="#333333"
                                            OnClick="btnAgregarAseguradora_Click" TabIndex="47" />
                                    </td>
                                    <td>&nbsp;</td>
                                </tr>
                                <tr>
                                    <td style="text-align: left">&nbsp;</td>
                                    <td>&nbsp;</td>
                                </tr>
                                <tr>
                                    <td>
                                        <asp:GridView ID="gvListaAseguradora" runat="server" AutoGenerateColumns="False"
                                            CellPadding="5" DataKeyNames="idEstudioAseguradora"
                                            EnableTheming="True" Font-Bold="False" Font-Names="Arial" Font-Size="10pt"
                                            ForeColor="#333333" OnRowCommand="gvListaAseguradora_RowCommand"
                                            OnRowDataBound="gvListaAseguradora_RowDataBound" Width="100%">
                                            <RowStyle BackColor="#F7F6F3" Font-Names="Arial" Font-Size="10pt"
                                                ForeColor="#333333" />

                                            <Columns>
                                                <asp:TemplateField>
                                                    <ItemTemplate>
                                                        <asp:ImageButton ID="borrarAseguradora" runat="server" CommandName="borrarAseguradora"
                                                            ImageUrl="~/img/delete.png" />
                                                    </ItemTemplate>
                                                    <ItemStyle Height="20px" HorizontalAlign="Center" Width="20px" />
                                                </asp:TemplateField>

                                                <asp:TemplateField>
                                                    <ItemTemplate>
                                                        <asp:ImageButton ID="editarAseguradora" runat="server" CommandName="editarAseguradora"
                                                            ImageUrl="~/img/edit.png" />
                                                    </ItemTemplate>
                                                    <ItemStyle Height="20px" HorizontalAlign="Center" Width="20px" />
                                                </asp:TemplateField>

                                                <asp:BoundField DataField="idEstudioAseguradora" HeaderText="idEstudioAseguradora" Visible="False" />
                                                <asp:BoundField DataField="idEstudio" HeaderText="idEstudio" Visible="False" />
                                                <asp:BoundField DataField="idAseguradora" HeaderText="idAseguradora" Visible="False" />
                                                <asp:BoundField DataField="descripcion" HeaderText="Aseguradora" />
                                                <asp:BoundField DataField="numeroPoliza" HeaderText="Número de póliza" />
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
                                    <td>&nbsp;</td>
                                </tr>
                                <tr>
                                    <td>&nbsp;</td>
                                    <td>&nbsp;</td>
                                </tr>
                            </table>
                        </asp:Panel>
                    </ContentTemplate>
                </asp:UpdatePanel>
            </td>
        </tr>


        <tr>
            <td>
                <asp:UpdatePanel ID="UpdatePanelComiteEticaInvestigacion" runat="server" UpdateMode="Conditional">
                    <ContentTemplate>
                        <a name="marcaComiteEticaInvestigacion"></a>
                        <table id="tablaComiteDeEticaInvestigacion" runat="server" class="style1" width="100%"
                            style="margin: 15px; border-spacing: 10px 10px;">
                            <tr>
                                <td colspan="2">
                                    <hr class="hrTitulo" />
                                </td>
                            </tr>
                            <tr>
                                <td colspan="2">
                                    <asp:Label ID="Label21" runat="server" Font-Bold="True"
                                        Text="Comité/s de ética de Investigación"></asp:Label>
                                </td>
                            </tr>
                            <tr>
                                <td colspan="2">
                                    <hr class="hrTitulo" />
                                </td>
                            </tr>
                            <tr>
                                <td style="text-align: right">&nbsp;</td>
                                <td>&nbsp;</td>
                            </tr>
                            <tr>
                                <td style="text-align: left">
                                    <asp:Button ID="btnAgregarComiteEtica" runat="server"
                                        BorderStyle="None" CssClass="botonFormulario" Font-Bold="True" Font-Size="Medium"
                                        ForeColor="White" Text="Agregar" BackColor="#333333"
                                        OnClick="btnAgregarComiteEtica_Click" TabIndex="48" />
                                </td>
                                <td>&nbsp;</td>
                            </tr>
                            <tr>
                                <td style="text-align: left">&nbsp;</td>
                                <td>&nbsp;</td>
                            </tr>
                            <tr>
                                <td>
                                    <asp:GridView ID="gvListaComiteEtica" runat="server" AutoGenerateColumns="False"
                                        CellPadding="5" DataKeyNames="idEstudioComiteEtica"
                                        EnableTheming="True" Font-Bold="False" Font-Names="Arial" Font-Size="10pt"
                                        ForeColor="#333333" OnRowCommand="gvListaComiteEtica_RowCommand"
                                        OnRowDataBound="gvListaComiteEtica_RowDataBound" Width="100%">
                                        <RowStyle BackColor="#F7F6F3" Font-Names="Arial" Font-Size="10pt"
                                            ForeColor="#333333" />

                                        <Columns>
                                            <asp:TemplateField>
                                                <ItemTemplate>
                                                    <asp:ImageButton ID="borrarComiteEtica" runat="server" CommandName="borrarComiteEtica"
                                                        ImageUrl="~/img/delete.png" />
                                                </ItemTemplate>
                                                <ItemStyle Height="20px" HorizontalAlign="Center" Width="20px" />
                                            </asp:TemplateField>

                                            <asp:TemplateField>
                                                <ItemTemplate>
                                                    <asp:ImageButton ID="editarComiteEtica" runat="server" CommandName="editarComiteEtica"
                                                        ImageUrl="~/img/edit.png" />
                                                </ItemTemplate>
                                                <ItemStyle Height="20px" HorizontalAlign="Center" Width="20px" />
                                            </asp:TemplateField>

                                            <asp:BoundField DataField="idEstudioComiteEtica" HeaderText="idEstudioComiteEtica" Visible="False" />
                                            <asp:BoundField DataField="idEstudio" HeaderText="idEstudio" Visible="False" />
                                            <asp:BoundField DataField="idComiteEtica" HeaderText="idComiteEtica" Visible="False" />
                                            <asp:BoundField DataField="descripcion" HeaderText="Comité" />
                                            <asp:BoundField DataField="dictamen" HeaderText="Dictamen" />
                                            <asp:BoundField DataField="fechaDictamen" HeaderText="Fch. del dictamen" />
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
                                <td>&nbsp;</td>
                            </tr>
                        </table>
                    </ContentTemplate>
                </asp:UpdatePanel>
            </td>
        </tr>


        <tr>
            <td>
                <asp:UpdatePanel ID="UpdatePanelEvaluacionesRechazadas" runat="server" UpdateMode="Conditional">
                    <ContentTemplate>
                        <a name="marcaEvaluacionesRechazadas"></a>
                        <table id="tablaEvaluacionesRechazadas" runat="server" class="style1" width="100%"
                            style="margin: 15px; border-spacing: 10px 10px;">
                            <tr>
                                <td colspan="2">
                                    <hr class="hrTitulo" />
                                </td>
                            </tr>
                            <tr>
                                <td colspan="2">
                                    <asp:Label ID="Label31" runat="server" Font-Bold="True"
                                        Text="Evaluaciones rechazadas por otros comités de ética de investigación"></asp:Label>
                                </td>
                            </tr>
                            <tr>
                                <td colspan="2">
                                    <hr class="hrTitulo" />
                                </td>
                            </tr>
                            <tr>
                                <td style="text-align: right">&nbsp;</td>
                                <td>&nbsp;</td>
                            </tr>
                            <tr>
                                <td style="text-align: left">
                                    <asp:Button ID="btnAgregarEvaluacionRechazada" runat="server"
                                        BorderStyle="None" CssClass="botonFormulario" Font-Bold="True" Font-Size="Medium"
                                        ForeColor="White" Text="Agregar" BackColor="#333333"
                                        OnClick="btnAgregarEvaluacionRechazada_Click" TabIndex="49" />
                                </td>
                                <td>&nbsp;</td>
                            </tr>
                            <tr>
                                <td style="text-align: left">&nbsp;</td>
                                <td>&nbsp;</td>
                            </tr>
                            <tr>
                                <td>
                                    <asp:GridView ID="gvListaEvaluacionesRechazadas" runat="server" AutoGenerateColumns="False"
                                        CellPadding="5" DataKeyNames="idEvaluacionRechazada"
                                        EnableTheming="True" Font-Bold="False" Font-Names="Arial" Font-Size="10pt"
                                        ForeColor="#333333" OnRowCommand="gvListaEvaluacionesRechazadas_RowCommand"
                                        OnRowDataBound="gvListaEvaluacionesRechazadas_RowDataBound" Width="100%">
                                        <RowStyle BackColor="#F7F6F3" Font-Names="Arial" Font-Size="10pt"
                                            ForeColor="#333333" />

                                        <Columns>
                                            <asp:TemplateField>
                                                <ItemTemplate>
                                                    <asp:ImageButton ID="borrarEvaluacionRechazada" runat="server" CommandName="borrarEvaluacionRechazada"
                                                        ImageUrl="~/img/delete.png" />
                                                </ItemTemplate>
                                                <ItemStyle Height="20px" HorizontalAlign="Center" Width="20px" />
                                            </asp:TemplateField>

                                            <asp:TemplateField>
                                                <ItemTemplate>
                                                    <asp:ImageButton ID="editarEvaluacionRechazada" runat="server" CommandName="editarEvaluacionRechazada"
                                                        ImageUrl="~/img/edit.png" />
                                                </ItemTemplate>
                                                <ItemStyle Height="20px" HorizontalAlign="Center" Width="20px" />
                                            </asp:TemplateField>

                                            <asp:BoundField DataField="idEvaluacionRechazada" HeaderText="idEvaluacionRechazada" Visible="False" />
                                            <asp:BoundField DataField="idEstudio" HeaderText="idEstudio" Visible="False" />
                                            <asp:BoundField DataField="numeroRegistro" HeaderText="Nro. registro" Visible="False" />
                                            <asp:BoundField DataField="fecha" HeaderText="Fecha" />
                                            <asp:BoundField DataField="institucionPertenece" HeaderText="Institución" />
                                            <asp:BoundField DataField="responsableComite" HeaderText="Reponsable" />
                                            <asp:BoundField DataField="domicilio" HeaderText="Domicilio" />
                                            <asp:BoundField DataField="telefono" HeaderText="Teléfono" />
                                            <asp:BoundField DataField="mail" HeaderText="Mail" />
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
                                <td>&nbsp;</td>
                            </tr>
                        </table>
                    </ContentTemplate>
                </asp:UpdatePanel>
            </td>
        </tr>


        <tr>
            <td>
                <asp:UpdatePanel ID="UpdatePanelInformeCAIBSH" runat="server" UpdateMode="Conditional">
                    <ContentTemplate>
                        <a name="marcaInformeCAIBSH"></a>
                        <table id="tablaInformeCAIBSH" runat="server" class="style1" width="100%" align="left"
                            style="margin: 15px; border-spacing: 10px 10px;">
                            <tr>
                                <td>
                                    <hr class="hrTitulo" />
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <asp:Label ID="Label75" runat="server" Font-Bold="True"
                                        Text="Dictamen de la comisión asesora de investigaciones biomédicas en seres humanos (CAIBSH)"></asp:Label>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <hr class="hrTitulo" />
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <table id="tablaAprobado" class="style1"
                                        style="margin: 15px; border-spacing: 10px 10px;">
                                        <tr>
                                            <td>
                                                <asp:Label ID="Label77" runat="server" Font-Bold="True" Text="APROBADO"></asp:Label>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td>&nbsp;</td>
                                        </tr>
                                        <tr>
                                            <td>
                                                <input class="estiloInputFecha" id="inputFechaAprobadoCAIBSH" runat="server" maxlength="10"
                                                    onblur="valFecha(this)"
                                                    onkeyup="mascara(this,'/',patron,true)" tabindex="50" type="text" /><asp:Label ID="Label88" runat="server" Text="(dd/mm/aaaa)"></asp:Label>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td style="text-align: right">&nbsp;</td>
                                        </tr>
                                        <tr>
                                            <td style="text-align: left">
                                                <asp:Button ID="btnAgregarInformeAprobado" runat="server"
                                                    BorderStyle="None" CssClass="botonFormulario" Font-Bold="True" Font-Size="Medium"
                                                    ForeColor="White" Text="Agregar" BackColor="#333333"
                                                    OnClick="btnAgregarInformeAprobado_Click" TabIndex="51" />
                                            </td>
                                        </tr>
                                        <tr>
                                            <td style="text-align: left">&nbsp;</td>
                                        </tr>
                                        <tr>
                                            <td>
                                                <asp:GridView ID="gvListaInformeAprobado" runat="server" AutoGenerateColumns="False"
                                                    CellPadding="5" DataKeyNames="idEstudioItemAprobado"
                                                    EnableTheming="True" Font-Bold="False" Font-Names="Arial" Font-Size="10pt"
                                                    ForeColor="#333333" OnRowCommand="gvListaInformeAprobado_RowCommand"
                                                    OnRowDataBound="gvListaInformeAprobado_RowDataBound" Width="100%">
                                                    <RowStyle BackColor="#F7F6F3" Font-Names="Arial" Font-Size="10pt"
                                                        ForeColor="#333333" />

                                                    <Columns>
                                                        <asp:TemplateField>
                                                            <ItemTemplate>
                                                                <asp:ImageButton ID="borrarInformeAprobado" runat="server" CommandName="borrarInformeAprobado"
                                                                    ImageUrl="~/img/delete.png" />
                                                            </ItemTemplate>
                                                            <ItemStyle Height="20px" HorizontalAlign="Center" Width="20px" />
                                                        </asp:TemplateField>

                                                        <asp:TemplateField>
                                                            <ItemTemplate>
                                                                <asp:ImageButton ID="editarInformeAprobado" runat="server" CommandName="editarInformeAprobado"
                                                                    ImageUrl="~/img/edit.png" />
                                                            </ItemTemplate>
                                                            <ItemStyle Height="20px" HorizontalAlign="Center" Width="20px" />
                                                        </asp:TemplateField>

                                                        <asp:BoundField DataField="idEstudioItemAprobado" HeaderText="idEstudioItemAprobado" Visible="False" />
                                                        <asp:BoundField DataField="idEstudio" HeaderText="idEstudio" Visible="False" />
                                                        <asp:BoundField DataField="idItemAprobado" HeaderText="idItemAprobado" Visible="False" />
                                                        <asp:BoundField DataField="descripcion" HeaderText="Descripción" />
                                                        <asp:BoundField DataField="fecha" HeaderText="Fecha" />
                                                        <asp:BoundField DataField="numeroDisposicion" HeaderText="Nro. disposición" />
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
                                    </table>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <table id="tablaRechazado" runat="server" class="style1"
                                        style="margin: 15px; border-spacing: 10px 10px;">
                                        <tr>
                                            <td>
                                                <asp:Label ID="Label79" runat="server" Font-Bold="True" Text="RECHAZADO"></asp:Label>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td>&nbsp;</td>
                                        </tr>
                                        <tr>
                                            <td>
                                                <input class="estiloInputFecha" id="inputFechaRechazadoCAIBSH" runat="server" maxlength="10"
                                                    onblur="valFecha(this)"
                                                    onkeyup="mascara(this,'/',patron,true)" tabindex="52" type="text" /><asp:Label ID="Label90" runat="server" Text="(dd/mm/aaaa)"></asp:Label>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td>&nbsp;</td>
                                        </tr>
                                        <tr>
                                            <td>
                                                <asp:CheckBoxList ID="chkItemsDesaprobadosCAIBSH" runat="server" DataTextField="descripcion" DataValueField="idItemDesaprobado" TabIndex="53">
                                                </asp:CheckBoxList>
                                            </td>
                                        </tr>
                                    </table>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <table id="tablaRechazado0" runat="server" class="style1"
                                        style="margin: 15px; border-spacing: 10px 10px;">
                                        <tr>
                                            <td>
                                                <asp:Label ID="Label99" runat="server" Font-Bold="True" Text="VENCIMIENTO DE PLAZO"></asp:Label>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td>&nbsp;</td>
                                        </tr>
                                        <tr>
                                            <td>
                                                <input class="estiloInputFecha" id="inputFechaVencimientoPlazoCAIBSH" runat="server" maxlength="10"
                                                    onblur="valFecha(this)"
                                                    onkeyup="mascara(this,'/',patron,true)" tabindex="54" type="text" /><asp:Label ID="Label100" runat="server" Text="(dd/mm/aaaa)"></asp:Label>
                                            </td>
                                        </tr>
                                    </table>
                                </td>
                            </tr>
                            <tr>
                                <td class="style22">
                                    <table id="tablaRechazado1" runat="server" class="style1"
                                        style="margin: 15px; border-spacing: 10px 10px;">
                                        <tr>
                                            <td>
                                                <asp:Label ID="Label101" runat="server" Font-Bold="True" Text="RETIRO DE EVALUACIÓN"></asp:Label>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td>&nbsp;</td>
                                        </tr>
                                        <tr>
                                            <td>
                                                <input class="estiloInputFecha" id="inputFechaRetiroEvaluacionCAIBSH" runat="server" maxlength="10"
                                                    onblur="valFecha(this)"
                                                    onkeyup="mascara(this,'/',patron,true)" tabindex="55" type="text" /><asp:Label ID="Label102" runat="server" Text="(dd/mm/aaaa)"></asp:Label>
                                            </td>
                                        </tr>
                                    </table>
                                </td>
                            </tr>
                            <tr>
                                <td class="style22">
                                    <table id="tablaRechazado2" runat="server" class="style1"
                                        style="margin: 15px; border-spacing: 10px 10px;">
                                        <tr>
                                            <td>
                                                <asp:Label ID="Label103" runat="server" Font-Bold="True" Text="OTROS"></asp:Label>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td>&nbsp;</td>
                                        </tr>
                                        <tr>
                                            <td>
                                                <asp:TextBox ID="txtOtroMotivoDictamenCAIBSH" runat="server" Width="80%"
                                                    Height="91px" TextMode="MultiLine" TabIndex="56"></asp:TextBox>
                                            </td>
                                        </tr>
                                    </table>
                                </td>
                            </tr>
                            <tr>
                                <td class="style22">&nbsp;</td>
                            </tr>
                        </table>
                    </ContentTemplate>
                </asp:UpdatePanel>
            </td>
        </tr>

        <tr>
            <td>
                <table id="tablaNormaLegal" runat="server" class="style1" style="margin: 15px; border-spacing: 10px 10px;" width="100%">
                    <tr>
                        <td colspan="2">
                            <hr class="hrTitulo" />
                        </td>
                    </tr>
                    <tr>
                        <td colspan="2">
                            <asp:Label ID="Label81" runat="server" Font-Bold="True" Text="Norma legal"></asp:Label>
                        </td>
                    </tr>
                    <tr>
                        <td colspan="2">
                            <hr class="hrTitulo" />
                        </td>
                    </tr>
                    <tr>
                        <td style="text-align: right">&nbsp;</td>
                        <td>&nbsp;</td>
                    </tr>
                    <tr>
                        <td>
                            <asp:Button ID="btnNormaLegal" runat="server"
                                BorderStyle="None" CssClass="botonFormularioGrande" Font-Bold="True" Font-Size="Medium"
                                ForeColor="White" Text="Norma legal" BackColor="#333333"
                                OnClick="btnNormaLegal_Click" TabIndex="57" />
                        </td>
                        <td>&nbsp;</td>
                    </tr>
                </table>
            </td>
        </tr>
        <tr>
            <td class="auto-style5">
                <table id="tablaObservaciones" runat="server" class="style1" style="margin: 15px; border-spacing: 10px 10px;" width="100%">
                    <tr>
                        <td class="auto-style47">
                            <hr class="hrTitulo" />
                        </td>
                    </tr>
                    <tr>
                        <td class="auto-style47">
                            <asp:Label ID="Label13" runat="server" Font-Bold="True" Text="Observaciones"></asp:Label>
                        </td>
                    </tr>
                    <tr>
                        <td class="auto-style47">
                            <hr class="hrTitulo" />
                        </td>
                    </tr>
                    <tr>
                        <td class="auto-style47">&nbsp;</td>
                    </tr>
                    <tr>
                        <td class="auto-style47">
                            <asp:TextBox ID="txtObservacionesCAIBSH" runat="server" Width="100%"
                                Height="91px" TextMode="MultiLine" TabIndex="58"></asp:TextBox>
                        </td>
                    </tr>
                </table>
            </td>
        </tr>
        <tr>
            <td>&nbsp;</td>
        </tr>
        <tr>
            <td>&nbsp;</td>
        </tr>
        <tr>
            <td style="text-align: center">
                <asp:Button ID="btnGuardarEstudio" runat="server"
                    BorderStyle="None" CssClass="botonFormulario" Font-Bold="True" Font-Size="Medium"
                    ForeColor="White" Text="Guardar" BackColor="#333333"
                    OnClick="btnGuardarEstudio_Click" TabIndex="59" />
                &nbsp;
                                        <asp:Button ID="btnCerrarEstudio" runat="server"
                                            BorderStyle="None" CssClass="botonFormulario" Font-Bold="True" Font-Size="Medium"
                                            ForeColor="White" Text="Cerrar" BackColor="#999966"
                                            OnClick="btnCerrarEstudio_Click" TabIndex="60" />
            </td>
        </tr>
    </table>
</asp:Content>
