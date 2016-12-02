using System;
using System.Web.UI;
using System.Web.UI.WebControls;
using DalRis;
using System.Data;

namespace SIPS.RIS
{
    public partial class FechaPresentacionInformeEdit : System.Web.UI.Page
    {
        // -----------------------------------------------------------------------------------------------------------

        protected void Page_Load(object sender, EventArgs e)
        {
            if (IsPostBack) return;

            Session["RIS_nuevo_registro"] = "NO";

            if (Request["idPresentacionInforme"].ToString().Trim() != "0") // Existe el registro
            {
                RisPresentacionInforme oPresentacionInforme = new RisPresentacionInforme(int.Parse(Request["idPresentacionInforme"].ToString()));

                inputFechaPresentacion.Value = oPresentacionInforme.Fecha.ToString();
            }
        }

        // -----------------------------------------------------------------------------------------------------------

        protected void btnGuardar_Click(object sender, EventArgs e)
        {
            int idPresentacionInforme = SubSonic.Sugar.Web.QueryString<int>("idPresentacionInforme");

            RisPresentacionInforme oPresentacionInforme = new RisPresentacionInforme(int.Parse(Request["idPresentacionInforme"].ToString()));

            oPresentacionInforme.IdEstudio = int.Parse(Request["idEstudio"].ToString().Trim());
            oPresentacionInforme.Fecha = DateTime.Parse(inputFechaPresentacion.Value);

            oPresentacionInforme.Save();

            RisEstudio oEstudio = new RisEstudio(int.Parse(Request["idEstudio"].ToString()));
            string url = "EstudioEdit.aspx?idEstudio=" + Request["idEstudio"].ToString().Trim() + "&TipoDeEstudio=" + oEstudio.TipoEstudio.ToString().Trim() + "#marcaPresentacionInformeAvances";
            Response.Redirect(url, false);
        }

        // -----------------------------------------------------------------------------------------------------------

        protected void btnCerrar_Click(object sender, EventArgs e)
        {
            RisEstudio oEstudio = new RisEstudio(int.Parse(Request["idEstudio"].ToString()));
            string url = "EstudioEdit.aspx?idEstudio=" + Request["idEstudio"].ToString().Trim() + "&TipoDeEstudio=" + oEstudio.TipoEstudio.ToString().Trim() + "#marcaPresentacionInformeAvances";
            Response.Redirect(url, false);
        }

        // -----------------------------------------------------------------------------------------------------------

    }
}
