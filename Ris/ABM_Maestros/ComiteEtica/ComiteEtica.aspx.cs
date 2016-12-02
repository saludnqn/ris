using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using DalRis;

namespace SIPS.RIS.ABM_Maestros.ComiteEtica
{
    public partial class ComiteEtica : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (IsPostBack) return;

            if (hdfIdComiteEtica.Value != "0")
                editarComiteEtica(int.Parse(hdfIdComiteEtica.Value));

            cargaComiteEtica();
        }

        private void editarComiteEtica(int idComiteEtica)
        {
            RisComiteEtica comiteEtica = new RisComiteEtica(idComiteEtica);

            hdfIdComiteEtica.Value = comiteEtica.IdComiteEtica.ToString();

            txtComiteEtica.Text = comiteEtica.Descripcion;
        }

        private void cargaComiteEtica()
        {
            SubSonic.Select b = new SubSonic.Select();
            b.From(RisComiteEtica.Schema);

            var listaComiteEtica = b.ExecuteTypedList<RisComiteEtica>();

            gdvComiteEtica.DataSource = listaComiteEtica;
            gdvComiteEtica.DataBind();
        }

        protected void btnGuardar_Click(object sender, EventArgs e)
        {
            try
            {
                guardarComiteEtica();

                ClientScript.RegisterStartupScript(this.GetType(), "alert", "alert('El Comité de Etica se guardó correctamente')", true);

                cargaComiteEtica();

                hdfIdComiteEtica.Value = "0";

                Utilidades.Utils.limpiarControles(this.Controls);
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }

        private void guardarComiteEtica()
        {
            RisComiteEtica comiteEtica;

            if (hdfIdComiteEtica.Value != "0")
                comiteEtica = new RisComiteEtica(int.Parse(hdfIdComiteEtica.Value));
            else
                comiteEtica = new RisComiteEtica();

            comiteEtica.Descripcion = txtComiteEtica.Text;

            comiteEtica.Save();
        }

        protected void gdvComiteEtica_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            int idComiteEtica = Int32.Parse(e.CommandArgument.ToString());

            editarComiteEtica(idComiteEtica);            
        }
    }
}