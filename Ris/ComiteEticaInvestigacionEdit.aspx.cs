using System;
using System.Web.UI;
using System.Web.UI.WebControls;
using DalRis;
using System.Data;


namespace SIPS.RIS
{
    public partial class ComiteEticaInvestigacionEdit : System.Web.UI.Page
    {

        // -----------------------------------------------------------------------------------------------------------

        protected void Page_Load(object sender, EventArgs e)
        {
            if (IsPostBack) return;

            Session["RIS_nuevo_registro"] = "NO";

            cargarCombos();

            if (Request["idEstudioComiteEtica"].ToString().Trim() != "0") // Existe el registro
            {
                RisEstudioComiteEtica oEtudioComiteEtica = new RisEstudioComiteEtica(int.Parse(Request["idEstudioComiteEtica"].ToString()));

                ddlComiteEtica.SelectedValue = oEtudioComiteEtica.IdComiteEtica.ToString();

                ddlDictamen.ClearSelection();
                ddlDictamen.Items.FindByText(oEtudioComiteEtica.Dictamen.Trim()).Selected = true;

                inputFechaDictamen.Value = oEtudioComiteEtica.FechaDictamen.ToString();
            }
        }

        // -----------------------------------------------------------------------------------------------------------

        private void cargarCombos()
        {
            ddlComiteEtica.DataSource = RisComiteEtica.FetchAll();
            ddlComiteEtica.DataBind();
            ddlComiteEtica.Items.Insert(0, new ListItem("Seleccionar", "0"));
        }

        // -----------------------------------------------------------------------------------------------------------

        protected void btnGuardar_Click(object sender, EventArgs e)
        {
            int idEstudioComiteEtica = SubSonic.Sugar.Web.QueryString<int>("idEstudioComiteEtica");

            RisEstudioComiteEtica oEstudioComiteEtica = new RisEstudioComiteEtica(int.Parse(Request["idEstudioComiteEtica"].ToString()));

            oEstudioComiteEtica.IdEstudio = int.Parse(Request["idEstudio"].ToString().Trim());
            oEstudioComiteEtica.IdComiteEtica = int.Parse(ddlComiteEtica.SelectedValue.ToString());
            oEstudioComiteEtica.Dictamen = ddlDictamen.SelectedItem.ToString();
            oEstudioComiteEtica.FechaDictamen = DateTime.Parse(inputFechaDictamen.Value);

            oEstudioComiteEtica.Save();

            RisEstudio oEstudio = new RisEstudio(int.Parse(Request["idEstudio"].ToString()));
            string url = "EstudioEdit.aspx?idEstudio=" + Request["idEstudio"].ToString().Trim() + "&TipoDeEstudio=" + oEstudio.TipoEstudio.ToString().Trim() + "#marcaComiteEticaInvestigacion";
            Response.Redirect(url, false);
        }

        // -----------------------------------------------------------------------------------------------------------

        protected void btnCerrar_Click(object sender, EventArgs e)
        {
            RisEstudio oEstudio = new RisEstudio(int.Parse(Request["idEstudio"].ToString()));
            string url = "EstudioEdit.aspx?idEstudio=" + Request["idEstudio"].ToString().Trim() + "&TipoDeEstudio=" + oEstudio.TipoEstudio.ToString().Trim() + "#marcaComiteEticaInvestigacion";
            Response.Redirect(url, false);
        }

        // -----------------------------------------------------------------------------------------------------------

    }
}
