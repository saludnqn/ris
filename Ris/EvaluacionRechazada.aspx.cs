using System;
using System.Web.UI;
using System.Web.UI.WebControls;
using DalRis;
using System.Data;
using System.Text.RegularExpressions;

namespace SIPS.RIS
{
    public partial class EvaluacionRechazada : System.Web.UI.Page
    {

        // -----------------------------------------------------------------------------------------------------------
        protected void Page_Load(object sender, EventArgs e)
        {
            if (IsPostBack) return;

            //hayError = "NO";

            Session["RIS_nuevo_registro"] = "NO";

            if (Request["idEvaluacionRechazada"].ToString().Trim() != "0") // Existe el registro
            {
                RisEvaluacionRechazada evaluacionRechazada = new RisEvaluacionRechazada(int.Parse(Request["idEvaluacionRechazada"].ToString()));

                txtNroRegistro.Text = evaluacionRechazada.NumeroRegistro.Trim();
                inputFecha.Value = evaluacionRechazada.Fecha.ToString();
                txtInstitucion.Text = evaluacionRechazada.InstitucionPertenece.Trim();
                txtResponsableComite.Text = evaluacionRechazada.ResponsableComite.Trim();
                txtDomicilio.Text = evaluacionRechazada.Domicilio.Trim();
                txtTelefono.Text = evaluacionRechazada.Telefono.Trim();
                txtMail.Text = evaluacionRechazada.Mail.Trim();
            }
        }

        // -----------------------------------------------------------------------------------------------------------

        protected void btnGuardar_Click(object sender, EventArgs e)
        {
            int idEvaluacionRechazada = SubSonic.Sugar.Web.QueryString<int>("idEvaluacionRechazada");

            RisEvaluacionRechazada evaluacionRechazada = new RisEvaluacionRechazada(int.Parse(Request["idEvaluacionRechazada"].ToString()));

            evaluacionRechazada.NumeroRegistro = txtNroRegistro.Text.Trim();
            evaluacionRechazada.IdEstudio = int.Parse(Request["idEstudio"].ToString().Trim());
            evaluacionRechazada.Fecha = DateTime.Parse(inputFecha.Value.ToString());
            evaluacionRechazada.InstitucionPertenece = txtInstitucion.Text.Trim();
            evaluacionRechazada.ResponsableComite = txtResponsableComite.Text.Trim();
            evaluacionRechazada.Domicilio = txtDomicilio.Text.Trim();
            evaluacionRechazada.Telefono = txtTelefono.Text.Trim();
            evaluacionRechazada.Mail = txtMail.Text.Trim();

            evaluacionRechazada.Save();

            RisEstudio oEstudio = new RisEstudio(int.Parse(Request["idEstudio"].ToString()));
            string url = "EstudioEdit.aspx?idEstudio=" + Request["idEstudio"].ToString().Trim() + "&TipoDeEstudio=" + oEstudio.TipoEstudio.ToString().Trim() + "#marcaEvaluacionesRechazadas";
            Response.Redirect(url, false);
        }

        // -----------------------------------------------------------------------------------------------------------

        protected void btnCerrar_Click(object sender, EventArgs e)
        {
            RisEstudio oEstudio = new RisEstudio(int.Parse(Request["idEstudio"].ToString()));
            string url = "EstudioEdit.aspx?idEstudio=" + Request["idEstudio"].ToString().Trim() + "&TipoDeEstudio=" + oEstudio.TipoEstudio.ToString().Trim() + "#marcaEvaluacionesRechazadas";
            Response.Redirect(url, false);
        }

        // -----------------------------------------------------------------------------------------------------------
    }
}
