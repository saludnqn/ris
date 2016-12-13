using System;
using System.Web.UI;
using System.Web.UI.WebControls;
using DalRis;
using System.Data;

namespace SIPS.RIS
{
    public partial class VigenciaPolizaEdit : System.Web.UI.Page
    {

        // -----------------------------------------------------------------------------------------------------------
        protected void Page_Load(object sender, EventArgs e)
        {
            if (IsPostBack) return;
        }

        // -----------------------------------------------------------------------------------------------------------

        protected void btnGuardar_Click(object sender, EventArgs e)
        {
            RisVigenciaPoliza vigenciaPoliza = new RisVigenciaPoliza();

            vigenciaPoliza.IdEstudioAseguradora = int.Parse(Request["idEstudioAseguradora"].ToString().Trim());
            vigenciaPoliza.FechaInicio = DateTime.Parse(inputFechaInicio.Value.ToString());
            vigenciaPoliza.FechaFin = DateTime.Parse(inputFechaFin.Value.ToString());

            vigenciaPoliza.Save();

            RisEstudio oEstudio = new RisEstudio(int.Parse(Request["idEstudio"].ToString()));
            string url = "SeguroDeDaniosEdit.aspx?idEstudio=" + Request["idEstudio"].ToString().Trim() + "&idEstudioAseguradora=" + vigenciaPoliza.IdEstudioAseguradora.ToString().Trim();
            Response.Redirect(url, false);
        }

        // -----------------------------------------------------------------------------------------------------------

        protected void btnCerrar_Click(object sender, EventArgs e)
        {
            RisEstudio oEstudio = new RisEstudio(int.Parse(Request["idEstudio"].ToString()));
            string url = "SeguroDeDaniosEdit.aspx?idEstudio=" + Request["idEstudio"].ToString().Trim() + "&idEstudioAseguradora=" + Request["idEstudioAseguradora"].ToString().Trim();
            Response.Redirect(url, false);
        }

        // -----------------------------------------------------------------------------------------------------------
    }
}