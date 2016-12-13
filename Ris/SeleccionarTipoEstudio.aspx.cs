using System;
using System.Web.UI;
using System.Web.UI.WebControls;
using DalRis;
using System.Data;

namespace SIPS.RIS
{
    public partial class SeleccionarTipoEstudio : System.Web.UI.Page
    {
        // -----------------------------------------------------------------------------------------------------------

        protected void Page_Load(object sender, EventArgs e)
        {
            if (IsPostBack) return;

            Session["RIS_nuevo_registro"] = "NO";
        }        

        // -----------------------------------------------------------------------------------------------------------

        protected void btnAceptar_Click(object sender, EventArgs e)
        {
            if (ddlTipoEstudio.SelectedValue.ToString() == "Seleccionar")
            {         
                Response.Write("<script language=javascript>alert('Debe seleccionar un tipo de estudio');</script>");
            }
            else
            {
                // ,nota: Creo un estudio vacío para el caso en en que el usuario carga alguna de las grillas antes de hacer click
                //        en el botón Guardar (general) (al final de la pantalla).
                RisEstudio oEstudio = new RisEstudio();

                oEstudio.TipoEstudio = ddlTipoEstudio.SelectedValue;

                oEstudio.Save();

                int idEstudio = oEstudio.IdEstudio;

                Session["RIS_nuevo_registro"] = "SI";

                string url = "EstudioEdit.aspx?idEstudio=" + idEstudio.ToString().Trim() + "&tipoDeEstudio=" + ddlTipoEstudio.SelectedValue.ToString().Trim();
                Response.Redirect(url, false);    
            }
        }

        // -----------------------------------------------------------------------------------------------------------

        protected void btnCerrar_Click(object sender, EventArgs e)
        {
            string url = "BuscadorEstudio.aspx";
            Response.Redirect(url, false);        
        }

        // -----------------------------------------------------------------------------------------------------------
    }
}