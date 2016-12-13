<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="Ris.Default" %>

<script runat="server">
    protected override void OnLoad(EventArgs e)
    {
        Response.RedirectPermanent("BuscadorEstudio.aspx");
        base.OnLoad(e);
    }
</script>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="Superior" runat="server">
</asp:Content>
