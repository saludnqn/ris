using System;
using System.Web.UI;
using System.Web.UI.WebControls;
using DalRis;
using System.Data;

namespace SIPS.RIS
{
    public partial class SeguroDeDaniosEdit : System.Web.UI.Page
    {
        // -----------------------------------------------------------------------------------------------------------

        protected void Page_Load(object sender, EventArgs e)
        {        
            if (IsPostBack) return;

            Session["RIS_nuevo_registro"] = "NO";

            if (Request["idEstudioAseguradora"].ToString() != "0")
            {
                pnlVigencias.Visible = true;
                cargarListaVigencias();
            }
            else
            {
                pnlVigencias.Visible = false;
            }

            cargarCombos();            

            if (Request["idEstudioAseguradora"].ToString().Trim() != "0") // Existe el registro
            {
                RisEstudioAseguradora oEstudioAseguradora = new RisEstudioAseguradora(int.Parse(Request["idEstudioAseguradora"].ToString()));

                ddlAseguradora.SelectedValue = oEstudioAseguradora.IdAseguradora.ToString();
                txtNroPoliza.Text = oEstudioAseguradora.NumeroPoliza;
            }
        }

        // -----------------------------------------------------------------------------------------------------------

        private void cargarCombos()
        {
            ddlAseguradora.DataSource = RisAseguradora.FetchAll();
            ddlAseguradora.DataBind();
            ddlAseguradora.Items.Insert(0, new ListItem("Seleccionar", "0"));
        }

        // -----------------------------------------------------------------------------------------------------------

        private void cargarListaVigencias()
        {
            gvListaVigencias.DataSource = SPs.RisCargarListaVigenciasPolizas(int.Parse(Request["idEstudioAseguradora"].ToString())).GetDataSet().Tables[0];
            gvListaVigencias.DataBind();
        }

        // -----------------------------------------------------------------------------------------------------------

        protected void btnAgregarVigencia_Click(object sender, EventArgs e)
        {
            string url = "VigenciaPolizaEdit.aspx?idEstudio=" + int.Parse(Request["idEstudio"].ToString().Trim()) + "&idEstudioAseguradora=" + Session["RIS_idEstudioAseguradora"].ToString() + "&idVigencia=0";
            Response.Redirect(url, false);
        }

        // -----------------------------------------------------------------------------------------------------------

        protected void gvListaVigencias_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            switch (e.CommandName)
            {
                case "borrarVigencia":
                    RisVigenciaPoliza.Delete(e.CommandArgument);                    
                    break;
            }

            cargarListaVigencias();
        }

        // -----------------------------------------------------------------------------------------------------------

        protected void gvListaVigencias_RowDataBound(object sender, GridViewRowEventArgs e)
        {
            if (e.Row.RowType == DataControlRowType.DataRow)
            {
                ImageButton CmdBorrarVigencia = (ImageButton)e.Row.Cells[0].Controls[1];
                CmdBorrarVigencia.CommandArgument = this.gvListaVigencias.DataKeys[e.Row.RowIndex].Value.ToString();
                CmdBorrarVigencia.CommandName = "borrarVigencia";
                CmdBorrarVigencia.ToolTip = "Borrar";
            }
        }

        // -----------------------------------------------------------------------------------------------------------

        protected void gvListaVigencias_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            this.gvListaVigencias.PageIndex = e.NewPageIndex;
            cargarListaVigencias();
        }

        // -----------------------------------------------------------------------------------------------------------

        protected void btnGuardar_Click(object sender, EventArgs e)
        {
            int idEstudioAseguradora = SubSonic.Sugar.Web.QueryString<int>("idEstudioAseguradora");
            
            RisEstudioAseguradora oEstudioAseguradora = new RisEstudioAseguradora(int.Parse(Request["idEstudioAseguradora"].ToString()));

            oEstudioAseguradora.IdEstudio = int.Parse(Request["idEstudio"].ToString().Trim());
            oEstudioAseguradora.IdAseguradora = int.Parse(ddlAseguradora.SelectedValue.ToString());
            oEstudioAseguradora.NumeroPoliza = txtNroPoliza.Text.Trim();

            oEstudioAseguradora.Save();

            // Refresco la lista de vigencias
            cargarListaVigencias();

            // Salvo este ID, ya que lo necesito para hacer una posible llamada a "VigenciaPOlizaEdit.aspx".
            Session["RIS_idEstudioAseguradora"] = int.Parse(oEstudioAseguradora.IdEstudioAseguradora.ToString().Trim());

            // Muetro el panel
            pnlVigencias.Visible = true;
        }

        // -----------------------------------------------------------------------------------------------------------

        protected void btnCerrar_Click(object sender, EventArgs e)
        {
            RisEstudio oEstudio = new RisEstudio(int.Parse(Request["idEstudio"].ToString()));
            string url = "EstudioEdit.aspx?idEstudio=" + Request["idEstudio"].ToString().Trim() + "&TipoDeEstudio=" + oEstudio.TipoEstudio.ToString().Trim() + "#marcaSeguroDanios";
            Response.Redirect(url, false);
        }

        // -----------------------------------------------------------------------------------------------------------

    }
}
