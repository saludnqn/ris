<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="ComiteEtica.aspx.cs" Inherits="SIPS.RIS.ABM_Maestros.ComiteEtica.ComiteEtica" %>
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

        .comite_etica {
            border-collapse: separate;
            border-spacing: 30px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="Cuerpo" runat="server">
    <asp:Label ID="lblTitulo" runat="server" Font-Bold="True" Font-Size="Large" Text="Alta Comité de Etica de Investigación"></asp:Label>
    <br />

    <asp:HiddenField ID="hdfIdComiteEtica" runat="server" Value="0" />

    <table id="tblComiteEtica" class="comite_etica">

        <tr>
            <td>&nbsp</td>
        </tr>
        <tr>
            <td>
                <asp:Label ID="lblNombreComiteEtica" runat="server" Text="Nombre Comite Etica"></asp:Label>
            </td>
            <td>
                <asp:TextBox ID="txtComiteEtica" runat="server"></asp:TextBox>
            </td>            
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
        <asp:GridView ID="gdvComiteEtica" runat="server" CssClass="style1" CellSpacing="2" BorderColor="Black" BorderStyle="Double" AutoGenerateColumns="false" Font-Bold="False"
            Font-Names="Arial" Font-Size="10pt" ForeColor="#333333" DataKeyNames="idComiteEtica" OnRowCommand="gdvComiteEtica_RowCommand">
            <RowStyle BackColor="#F7F6F3" Font-Names="Arial" Font-Size="10pt"
                ForeColor="#333333" />
            <Columns>
                <asp:BoundField DataField="descripcion" HeaderText="Descripción" ItemStyle-HorizontalAlign="Left" />               
                <asp:TemplateField>
                    <ItemTemplate>
                        <asp:ImageButton ID="btnEditar" runat="server" ImageUrl="~/img/edit.png"
                            ToolTip="Editar" CommandArgument='<%#Bind("idComiteEtica")%>' />
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
