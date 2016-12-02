using System;
using System.Web.UI;
using System.Web.UI.WebControls;
using DalRis;
using System.Data;

namespace SIPS.RIS
{
    public partial class HistorialAprobacionesDelEstudio : System.Web.UI.Page
    {
        // -----------------------------------------------------------------------------------------------------------

        protected void Page_Load(object sender, EventArgs e)
        {
            if (IsPostBack) return;

            Session["RIS_nuevo_registro"] = "NO";

            cargarCombos();

            if (Request["idEstudioItemAprobado"].ToString().Trim() != "0") // Existe el registro
            {
                RisEstudioItemAprobado oEstudioItemAprobado = new RisEstudioItemAprobado(int.Parse(Request["idEstudioItemAprobado"].ToString()));

                ddlItemAprobado.SelectedValue = oEstudioItemAprobado.IdItemAprobado.ToString();
                inputFechaAprobacion.Value = oEstudioItemAprobado.Fecha.ToString();
                txtNumeroDisposicion.Text = oEstudioItemAprobado.NumeroDisposicion.Trim();
            }
        }

        // -----------------------------------------------------------------------------------------------------------

        private void cargarCombos()
        {
            ddlItemAprobado.DataSource = RisItemAprobado.FetchAll();
            ddlItemAprobado.DataBind();
            ddlItemAprobado.Items.Insert(0, new ListItem("Seleccionar", "0"));
        }

        // -----------------------------------------------------------------------------------------------------------

        protected void btnGuardar_Click(object sender, EventArgs e)
        {            
            int idEstudioItemAprobado = SubSonic.Sugar.Web.QueryString<int>("idEstudioItemAprobado");

            RisEstudioItemAprobado oEstudioItemAprobado = new RisEstudioItemAprobado(int.Parse(Request["idEstudioItemAprobado"].ToString()));

            oEstudioItemAprobado.IdEstudio = int.Parse(Request["idEstudio"].ToString().Trim());
            oEstudioItemAprobado.IdItemAprobado = int.Parse(ddlItemAprobado.SelectedValue.ToString());
            oEstudioItemAprobado.Fecha = DateTime.Parse(inputFechaAprobacion.Value);
            oEstudioItemAprobado.NumeroDisposicion = txtNumeroDisposicion.Text.Trim();

            oEstudioItemAprobado.Save();

            RisEstudio oEstudio = new RisEstudio(int.Parse(Request["idEstudio"].ToString()));
            string url = "EstudioEdit.aspx?idEstudio=" + Request["idEstudio"].ToString().Trim() + "&TipoDeEstudio=" + oEstudio.TipoEstudio.ToString().Trim() + "#marcaInformeCAIBSH";
            Response.Redirect(url, false);
        }

        // -----------------------------------------------------------------------------------------------------------

        protected void btnCerrar_Click(object sender, EventArgs e)
        {
            RisEstudio oEstudio = new RisEstudio(int.Parse(Request["idEstudio"].ToString()));
            string url = "EstudioEdit.aspx?idEstudio=" + Request["idEstudio"].ToString().Trim() + "&TipoDeEstudio=" + oEstudio.TipoEstudio.ToString().Trim() + "#marcaInformeCAIBSH";
            Response.Redirect(url, false);
        }

        // -----------------------------------------------------------------------------------------------------------
    }
}
