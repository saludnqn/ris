using System;
using System.Web.UI;
using System.Web.UI.WebControls;
using DalRis;
using System.Data;

namespace SIPS.RIS
{
    public partial class LugarDeRealizacionEdit : System.Web.UI.Page
    {
        // -----------------------------------------------------------------------------------------------------------

        protected void Page_Load(object sender, EventArgs e)
        {
            if (IsPostBack) return;

            Session["RIS_nuevo_registro"] = "NO";

            if (Request["idLugarDeRealizacion"].ToString().Trim() != "0") // Existe el registro
            {
                RisLugarRealizacion oLugarDeRealizacion = new RisLugarRealizacion(int.Parse(Request["idLugarDeRealizacion"].ToString()));

                txtDescripcion.Text = oLugarDeRealizacion.Descripcion.Trim();
                ddlAmbito.SelectedValue = oLugarDeRealizacion.Ambito;
                txtDomicilio.Text = oLugarDeRealizacion.Domicilio.Trim();
                txtCP.Text = oLugarDeRealizacion.Cp.Trim();
                txtCiudad.Text = oLugarDeRealizacion.Ciudad.Trim();
                txtEmail.Text = oLugarDeRealizacion.Email.Trim();
                txtResponsable.Text = oLugarDeRealizacion.Responsable.Trim();
                txtCargo.Text = oLugarDeRealizacion.Cargo.Trim();
            }
        }

        // -----------------------------------------------------------------------------------------------------------        

        protected void btnGuardar_Click(object sender, EventArgs e)
        {
            int idLugarDeRealizacion = SubSonic.Sugar.Web.QueryString<int>("idLugarDeRealizacion");

            RisLugarRealizacion oLugardeRealizacion = new RisLugarRealizacion(int.Parse(Request["idLugarDeRealizacion"].ToString()));

            oLugardeRealizacion.IdEstudio = int.Parse(Request["idEstudio"].ToString().Trim());
            oLugardeRealizacion.Descripcion = txtDescripcion.Text.Trim();
            oLugardeRealizacion.Ambito = ddlAmbito.SelectedValue.ToString();
            oLugardeRealizacion.Domicilio = txtDomicilio.Text.Trim();
            oLugardeRealizacion.Cp = txtCP.Text.Trim();
            oLugardeRealizacion.Ciudad = txtCiudad.Text.Trim();
            oLugardeRealizacion.Email = txtEmail.Text.Trim();
            oLugardeRealizacion.Responsable = txtResponsable.Text.Trim();
            oLugardeRealizacion.Cargo = txtCargo.Text.Trim();

            oLugardeRealizacion.Save();

            RisEstudio oEstudio = new RisEstudio(int.Parse(Request["idEstudio"].ToString()));
            string url = "EstudioEdit.aspx?idEstudio=" + Request["idEstudio"].ToString().Trim() + "&TipoDeEstudio=" + oEstudio.TipoEstudio.ToString().Trim() + "#marcaLugaresRealizacion";
            Response.Redirect(url, false);
        }

        // -----------------------------------------------------------------------------------------------------------

        protected void btnCerrar_Click(object sender, EventArgs e)
        {
            RisEstudio oEstudio = new RisEstudio(int.Parse(Request["idEstudio"].ToString()));
            string url = "EstudioEdit.aspx?idEstudio=" + Request["idEstudio"].ToString().Trim() + "&TipoDeEstudio=" + oEstudio.TipoEstudio.ToString().Trim() + "#marcaLugaresRealizacion";
            Response.Redirect(url, false);            
        }

        // -----------------------------------------------------------------------------------------------------------
    }
}
