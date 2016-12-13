using System;
using System.Web.UI;
using System.Web.UI.WebControls;
using DalRis;
using System.Data;

namespace SIPS.RIS
{
    public partial class ConcentimientoEdit : System.Web.UI.Page
    {
        // -----------------------------------------------------------------------------------------------------------

        protected void Page_Load(object sender, EventArgs e)
        {
            if (IsPostBack) return;

            Session["RIS_nuevo_registro"] = "NO";

            if (Request["idConcentimiento"].ToString().Trim() != "0") // Existe el registro
            {
                RisConcentimiento oConcentimiento = new RisConcentimiento(int.Parse(Request["idConcentimiento"].ToString().Trim()));

                txtVersion.Text = oConcentimiento.Version;
                inputFechaConcentimiento.Value = oConcentimiento.Fecha.ToString().Trim();
            }
        }

        // -----------------------------------------------------------------------------------------------------------

        protected void btnGuardar_Click(object sender, EventArgs e)
        {
            Session["hayErrorEnConcentimiento"] = "NO";

            if ((txtVersion.Text == "") || (inputFechaConcentimiento.Value == ""))
            {
                Session["hayErrorEnConcentimiento"] = "SI";
                Response.Write("<script language=javascript>alert('Debe completar todos los campos');</script>");
            }
            else
            {
                int idConcentimiento = SubSonic.Sugar.Web.QueryString<int>("idConcentimiento");

                RisConcentimiento oConcentimiento = new RisConcentimiento(int.Parse(Request["idConcentimiento"].ToString().Trim()));

                oConcentimiento.IdEstudio = int.Parse(Request["idEstudio"].ToString());
                oConcentimiento.Version = txtVersion.Text.Trim();
                oConcentimiento.Fecha = DateTime.Parse(inputFechaConcentimiento.Value);

                oConcentimiento.Save();

                RisEstudio oEstudio = new RisEstudio(int.Parse(Request["idEstudio"].ToString()));                
                string url = "EstudioEdit.aspx?idEstudio=" + Request["idEstudio"].ToString().Trim() + "&TipoDeEstudio=" + oEstudio.TipoEstudio.ToString().Trim() + "#marcaConcentimiento";

                Response.Redirect(url, false);            
            }
        }

        // -----------------------------------------------------------------------------------------------------------

        protected void btnCerrar_Click(object sender, EventArgs e)
        {
            RisEstudio oEstudio = new RisEstudio(int.Parse(Request["idEstudio"].ToString()));
            string url = "EstudioEdit.aspx?idEstudio=" + Request["idEstudio"].ToString().Trim() + "&TipoDeEstudio=" + oEstudio.TipoEstudio.ToString().Trim() + "#marcaConcentimiento";
            Response.Redirect(url, false);            
        }

        // -----------------------------------------------------------------------------------------------------------
    }
}
