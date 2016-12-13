﻿<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="AltaEntidad.aspx.cs" Inherits="SIPS.RIS.ABM_Maestros.ABM_Entidad.AltaEntidad" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="Superior" runat="server">
    <style type="text/css">
        .style1 {
            width: 90%;
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

        .grilla {
            display: flex;
            flex-wrap: wrap; /* optional. only if you want the items to wrap */
            justify-content: center; /* for horizontal alignment */
            align-items: center;
            border-collapse: separate;
            border-spacing: 35px;
        }

        .entidades {
            border-collapse: separate;
            border-spacing: 30px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="Cuerpo" runat="server">
    <asp:Label ID="lblTitulo" runat="server" Font-Bold="True" Font-Size="Large" Text="Alta Entidades"></asp:Label>
    <br />

    <asp:HiddenField ID="hdfIdEntidad" runat="server" Value="0" />

    <table id="tblEntidad" class="entidades">

        <tr>
            <td>&nbsp</td>
        </tr>
        <tr>
            <td>
                <asp:CheckBox ID="chkEntidad" OnCheckedChanged="chkEntidad_CheckedChanged" runat="server" AutoPostBack="true" Text="  Cargar Centro de Investigación SIS" />
            </td>
        </tr>
        <tr>
            <td>
                <asp:Label ID="lblNombreEntidadCombo" runat="server" Text="Centro de Investigación SISA" Visible="false"></asp:Label>
                <asp:Label ID="lblNombreEntidadTextbox" runat="server" Text="Nombre Entidad"></asp:Label>
            </td>
            <td>
                <asp:TextBox ID="txtEntidad" runat="server"></asp:TextBox>
                <asp:DropDownList ID="ddlCentroDeInvestigacion" DataValueField="idCentroDeInvestigacion"
                    DataTextField="nombre" runat="server" Visible="false">
                </asp:DropDownList>
            </td>

            <td>
                <asp:Label ID="lblDomicilioEntidad" runat="server" Text="Domicilio Entidad"></asp:Label>
            </td>
            <td>
                <asp:TextBox ID="txtDomicilio" runat="server"></asp:TextBox>
            </td>
        </tr>

        <tr>
            <td>
                <asp:Label ID="lblCaracterEntidad" runat="server" Text="Caracter Entidad"></asp:Label>
            </td>
            <td>
                <asp:DropDownList ID="ddlCaracterEntidad" runat="server" AppendDataBoundItems="false">
                    <asp:ListItem Value="-1" Text="--Seleccione--"></asp:ListItem>
                    <asp:ListItem Value="0" Text="Publica"></asp:ListItem>
                    <asp:ListItem Value="1" Text="Privada"></asp:ListItem>
                </asp:DropDownList>
            </td>

            <td>
                <asp:Label ID="lblTipo" runat="server" Text="Tipo"></asp:Label>
            </td>
            <td>
                <asp:DropDownList ID="ddlTipo" runat="server">
                    <asp:ListItem Value="-1" Text="--Seleccione--"></asp:ListItem>
                    <asp:ListItem Value="0" Text="Publica"></asp:ListItem>
                    <asp:ListItem Value="1" Text="Privada"></asp:ListItem>
                    <asp:ListItem Value="2" Text="Otro"></asp:ListItem>
                </asp:DropDownList>
            </td>
        </tr>

        <tr>
            <td>
                <asp:Label ID="lblEmail" runat="server" Text="Email Entidad"></asp:Label>
            </td>
            <td>
                <asp:TextBox ID="txtEmailEntidad" runat="server"></asp:TextBox>
            </td>

            <td>
                <asp:Label ID="lblTipoEntidad" runat="server" Text="Tipo Entidad"></asp:Label>
            </td>
            <td>
                <asp:DropDownList ID="ddlTipoEntidad" runat="server">
                    <asp:ListItem Value="-1" Text="--Seleccione--"></asp:ListItem>
                    <asp:ListItem Value="0" Text="Ente Financiador"></asp:ListItem>
                    <asp:ListItem Value="1" Text="Institucion Respaldatoria"></asp:ListItem>
                </asp:DropDownList>
            </td>
        </tr>

        <tr>
            <td>
                <asp:Label ID="lblCaracteristicas" runat="server" Text="Características"></asp:Label>
            </td>
            <td>
                <asp:TextBox ID="txtCaracteristicas" runat="server"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td>&nbsp</td>
        </tr>
        <tr>
            <td>
                <asp:Button ID="btnGuardar" runat="server"
                    BorderStyle="None" CssClass="botonFormulario" Font-Bold="True" Font-Size="Medium"
                    ForeColor="White" Text="Guardar" BackColor="#333333"
                    OnClick="btnGuardar_Click" TabIndex="1" />
            </td>
        </tr>

    </table>

    <div>
        <asp:GridView ID="gdvEntidades" runat="server" CssClass="style1" CellSpacing="2" BorderColor="Black" BorderStyle="Double" AutoGenerateColumns="false" Font-Bold="False"
            Font-Names="Arial" Font-Size="10pt" ForeColor="#333333" DataKeyNames="idEntidad" OnRowCommand="gdvEntidades_RowCommand">
            <RowStyle BackColor="#F7F6F3" Font-Names="Arial" Font-Size="10pt"
                ForeColor="#333333" />

            <Columns>
                <asp:BoundField DataField="nombre" HeaderText="Nombre" ItemStyle-HorizontalAlign="Left" />
                <asp:BoundField DataField="caracter" HeaderText="Caracter" />
                <asp:BoundField DataField="domicilio" HeaderText="Domicilio" />
                <asp:BoundField DataField="email" HeaderText="Email" />
                <asp:BoundField DataField="tipo" HeaderText="Tipo" />
                <asp:BoundField DataField="tipoentidad" HeaderText="Tipo Entidad" ItemStyle-HorizontalAlign="Left" />
                <asp:BoundField DataField="caracteristicas" HeaderText="Características" ItemStyle-HorizontalAlign="Left" />
                <asp:TemplateField>
                    <ItemTemplate>
                        <asp:ImageButton ID="btnEditar" runat="server" ImageUrl="~/img/edit.png"
                            ToolTip="Editar" CommandArgument='<%#Bind("idEntidad")%>' />
                    </ItemTemplate>

                </asp:TemplateField>
            </Columns>
            <HeaderStyle BackColor="#333333" Font-Bold="False" Font-Italic="False"
                Font-Names="Arial" Font-Size="10pt" ForeColor="White" />
            <EditRowStyle BackColor="#999999" />
            <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
        </asp:GridView>
    </div>
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="Botones" runat="server">
</asp:Content>
