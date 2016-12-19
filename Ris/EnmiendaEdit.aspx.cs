using System;
using System.Web.UI;
using System.Web.UI.WebControls;
using DalRis;
using System.Data;

namespace SIPS.RIS
{
    public partial class EnmiendaEdit : System.Web.UI.Page
    {
        // -----------------------------------------------------------------------------------------------------------

        protected void Page_Load(object sender, EventArgs e)
        {
            if (IsPostBack) return;

            Session["RIS_nuevo_registro"] = "NO";

            if (Request["idEnmienda"] != "0")
            {
                pnlMotivos.Visible = true;
            }
            else
            {
                pnlMotivos.Visible = false;
            }

            cargarCombos();
            cargarListaItemsDesaprobados();

            if (Request["idEnmienda"].ToString().Trim() != "0") // Existe el registro
            {
                RisEnmienda oEnmienda = new RisEnmienda(int.Parse(Request["idEnmienda"].ToString()));

                ddlModificacion.ClearSelection();
                ddlModificacion.Items.FindByText(oEnmienda.Modificacion).Selected = true;
                ddlDictamen.SelectedValue = oEnmienda.Dictamen;
                inputFechaDictamen.Value = oEnmienda.FechaDictamen.ToString();
                txtObservaciones.Text = oEnmienda.Observaciones.Trim();

                cargarListaItemsDesaprobados();
            }
        }

        // -----------------------------------------------------------------------------------------------------------

        private void cargarCombos()
        {
            ddlItemsDesaprobados.DataSource = RisItemDesaprobado.FetchAll();
            ddlItemsDesaprobados.DataBind();
            ddlItemsDesaprobados.Items.Insert(0, new ListItem("Seleccionar", "0"));
        }

        // -----------------------------------------------------------------------------------------------------------

        private void cargarListaItemsDesaprobados()
        {
            gvListaItemsDesaprobado.DataSource = SPs.RisCargarListaItemsDesaprobadosEnmiendas(int.Parse(Request["idEnmienda"].ToString())).GetDataSet().Tables[0];
            gvListaItemsDesaprobado.DataBind();
        }

        // -----------------------------------------------------------------------------------------------------------

        protected void btnAgregarItemDesaprobado_Click(object sender, EventArgs e)
        {
            RisEnmiendaItemDesaprobado oEnmiendaItemDesaprobado = new RisEnmiendaItemDesaprobado();

            if (ddlItemsDesaprobados.SelectedValue != "0") // Para que no de error ...
            {
                oEnmiendaItemDesaprobado.IdEnmienda = int.Parse(Request["idEnmienda"].ToString());
                oEnmiendaItemDesaprobado.IdItemDesaprobado = int.Parse(ddlItemsDesaprobados.SelectedValue.ToString());
                oEnmiendaItemDesaprobado.Save();

                // Refresh de los combos
                cargarCombos();

                // Refresh de la lista                
                cargarListaItemsDesaprobados();
            }
        }

        // -----------------------------------------------------------------------------------------------------------

        protected void gvListaItemsDesaprobado_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            this.gvListaItemsDesaprobado.PageIndex = e.NewPageIndex;
            cargarListaItemsDesaprobados();
        }

        // -----------------------------------------------------------------------------------------------------------

        protected void gvListaItemsDesaprobado_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            switch (e.CommandName)
            {
                case "borrarItemDesaprobado":
                    RisEnmiendaItemDesaprobado.Delete(e.CommandArgument);
                    break;
            }

            cargarListaItemsDesaprobados();
        }

        // -----------------------------------------------------------------------------------------------------------

        protected void gvListaItemsDesaprobado_RowDataBound(object sender, GridViewRowEventArgs e)
        {
            if (e.Row.RowType == DataControlRowType.DataRow)
            {
                ImageButton CmdBorrarItemDesaprobado = (ImageButton)e.Row.Cells[0].Controls[1];
                CmdBorrarItemDesaprobado.CommandArgument = this.gvListaItemsDesaprobado.DataKeys[e.Row.RowIndex].Value.ToString();
                CmdBorrarItemDesaprobado.CommandName = "borrarItemDesaprobado";
                CmdBorrarItemDesaprobado.ToolTip = "Borrar";
            }
        }

        // -----------------------------------------------------------------------------------------------------------

        protected void btnGuardarEnmienda_Click(object sender, EventArgs e)
        {
            Session["hayErrorEnEnmienda"] = "NO";

            if ((ddlModificacion.SelectedItem.Text == "") || (inputFechaDictamen.Value == "") || (txtObservaciones.Text == ""))
            {
                Session["hayErrorEnEnmienda"] = "SI";
                Response.Write("<script language=javascript>alert('Debe completar todos los campos');</script>");
            }
            else
            {
                int idEnmienda = SubSonic.Sugar.Web.QueryString<int>("idEnmienda");

                RisEnmienda oEnmienda = new RisEnmienda(int.Parse(Request["idEnmienda"].ToString().Trim()));

                oEnmienda.IdEstudio = int.Parse(Request["idEstudio"].ToString().Trim());
                oEnmienda.Modificacion = ddlModificacion.SelectedItem.ToString();
                oEnmienda.Dictamen = ddlDictamen.SelectedItem.ToString();
                oEnmienda.FechaDictamen = DateTime.Parse(inputFechaDictamen.Value);
                oEnmienda.Observaciones = txtObservaciones.Text.Trim();

                oEnmienda.Save();

                // Recupero el valor del id de la nueva enmienda para poder relacionarlos con los motivos que ingrese el usuario.
                //string url = "EnmiendaEdit.aspx?idEstudio=" + Request["idEstudio"].ToString().Trim() + "&idEnmienda=" + oEnmienda.IdEnmienda.ToString().Trim();
                //Lo mandamos al estudio por las dudas dejamos la linea anterior por si quieren quedar en la misma pantalla
                RisEstudio oEstudio = new RisEstudio(int.Parse(Request["idEstudio"].ToString()));
                string url = "EstudioEdit.aspx?idEstudio=" + Request["idEstudio"].ToString().Trim() + "&TipoDeEstudio=" + oEstudio.TipoEstudio.ToString().Trim() + "#marcaConcentimiento";
               
                Response.Redirect(url, false);
            }
        }

        // -----------------------------------------------------------------------------------------------------------

        protected void btnGuardarMotivos_Click(object sender, EventArgs e)
        {

        }

        // -----------------------------------------------------------------------------------------------------------

        protected void btnCerrar_Click(object sender, EventArgs e)
        {
            RisEstudio oEstudio = new RisEstudio(int.Parse(Request["idEstudio"].ToString()));
            string url = "EstudioEdit.aspx?idEstudio=" + Request["idEstudio"].ToString().Trim() + "&TipoDeEstudio=" + oEstudio.TipoEstudio.ToString().Trim() + "#marcaEnmiendas";
            Response.Redirect(url, false);
        }

        protected void ddlDictamen_SelectedIndexChanged(object sender, EventArgs e)
        {
            if (ddlDictamen.SelectedValue == "2")
            {
                panelMotivos.Visible = true;
                pnlMotivos.Visible = true;
            }
            else
            {
                panelMotivos.Visible = false;
                pnlMotivos.Visible = false;
            }

        }

        // -----------------------------------------------------------------------------------------------------------
    }
}
