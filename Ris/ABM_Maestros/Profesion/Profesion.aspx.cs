using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using DalRis;

namespace SIPS.RIS.ABM_Maestros.Profesion
{
    public partial class Profesion : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (IsPostBack) return;

            if (hdfIdProfesion.Value != "0")
                editarProfesion(int.Parse(hdfIdProfesion.Value));

            cargaProfesion();
        }

        private void editarProfesion(int idProfesion)
        {
            RisProfesion profesion = new RisProfesion(idProfesion);

            hdfIdProfesion.Value = profesion.IdProfesion.ToString();

            txtProfesion.Text = profesion.Descripcion;
        }

        private void cargaProfesion()
        {
            SubSonic.Select b = new SubSonic.Select();
            b.From(RisProfesion.Schema);

            var listaProfesion = b.ExecuteTypedList<RisProfesion>();

            gdvProfesion.DataSource = listaProfesion;
            gdvProfesion.DataBind();
        }

        protected void btnGuardar_Click(object sender, EventArgs e)
        {
            try
            {
                guardarProfesion();

                ClientScript.RegisterStartupScript(this.GetType(), "alert", "alert('La Profesión se guardó correctamente')", true);

                cargaProfesion();

                hdfIdProfesion.Value = "0";

                Utilidades.Utils.limpiarControles(this.Controls);
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }

        private void guardarProfesion()
        {
            RisProfesion profesion;

            if (hdfIdProfesion.Value != "0")
                profesion = new RisProfesion(int.Parse(hdfIdProfesion.Value));
            else
                profesion = new RisProfesion();

            profesion.Descripcion = txtProfesion.Text;

            profesion.Save();
        }

        protected void gdvProfesion_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            int idProfesion = Int32.Parse(e.CommandArgument.ToString());

            editarProfesion(idProfesion);
        }
    }
}