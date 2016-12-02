using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using DalRis;

namespace SIPS.RIS.ABM_Maestros.Area_Tematica
{
    public partial class AltaAreaTematica : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (IsPostBack) return;

            if (hdfIdAreaTematica.Value != "0")
                editarAreaTematica(int.Parse(hdfIdAreaTematica.Value));

            cargaAreasTematicas();
        }

        private void editarAreaTematica(int idAreaTematica)
        {
            RisAreaTematica areaTematica = new RisAreaTematica(idAreaTematica);

            hdfIdAreaTematica.Value = areaTematica.IdAreaTematica.ToString();

            txtAreaTematica.Text = areaTematica.Descripcion;
        }

        private void cargaAreasTematicas()
        {
            SubSonic.Select b = new SubSonic.Select();
            b.From(RisAreaTematica.Schema);

            var listaAreasTematicas = b.ExecuteTypedList<RisAreaTematica>();

            gdvAreaTematica.DataSource = listaAreasTematicas;
            gdvAreaTematica.DataBind();
        }

        protected void btnGuardar_Click(object sender, EventArgs e)
        {
            try
            {
                guardarAreaTematica();

                ClientScript.RegisterStartupScript(this.GetType(), "alert", "alert('El Area Temática se guardó correctamente')", true);

                cargaAreasTematicas();

                hdfIdAreaTematica.Value = "0";

                Utilidades.Utils.limpiarControles(this.Controls);
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }

        private void guardarAreaTematica()
        {
            RisAreaTematica areaTematica;

            if (hdfIdAreaTematica.Value != "0")
                areaTematica = new RisAreaTematica(int.Parse(hdfIdAreaTematica.Value));
            else
                areaTematica = new RisAreaTematica();

            areaTematica.Descripcion = txtAreaTematica.Text;

            areaTematica.Save();

        }

        protected void gdvAreaTematica_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            int idAreaTematica = Int32.Parse(e.CommandArgument.ToString());

            editarAreaTematica(idAreaTematica);
        }
    }
}