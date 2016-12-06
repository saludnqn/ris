using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using DalRis;
using System.Data;

namespace SIPS.RIS.ABM_Maestros.ABM_Entidad
{
    public partial class AltaEntidad : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (IsPostBack) return;

            if (hdfIdEntidad.Value != "0")
                editarEntidades(int.Parse(hdfIdEntidad.Value));

            cargarListas();
            cargaEntidades();
        }

        private void editarEntidades(int idEntidad)
        {
            RisEntidad entidad = new RisEntidad(idEntidad);

            hdfIdEntidad.Value = entidad.IdEntidad.ToString();

            limpiarCombosSeleccionados();

            ddlCentroDeInvestigacion.Items.FindByText(entidad.Nombre).Selected = true;
            txtDomicilio.Text = entidad.Domicilio;
            ddlCaracterEntidad.Items.FindByText(entidad.Caracter).Selected = true;
            ddlTipo.Items.FindByText(entidad.Tipo).Selected = true;
            txtEmailEntidad.Text = entidad.Email;
            ddlTipoEntidad.Items.FindByText(entidad.TipoEntidad).Selected = true;
            txtCaracteristicas.Text = entidad.Caracteristicas;
        }

        private void limpiarCombosSeleccionados()
        {
            ddlCentroDeInvestigacion.ClearSelection();
            ddlCaracterEntidad.ClearSelection();
            ddlTipo.ClearSelection();
            ddlTipoEntidad.ClearSelection();
        }

        private void cargarListas()
        {
            ddlCentroDeInvestigacion.DataSource = RisCentrosDeInvestigacion.FetchAll();
            ddlCentroDeInvestigacion.DataBind();
            ddlCentroDeInvestigacion.Items.Insert(0, new ListItem("--Seleccionar--", "0"));
        }

        private void cargaEntidades()
        {
            SubSonic.Select b = new SubSonic.Select();
            b.From(RisEntidad.Schema);

            var listaEstudios = b.ExecuteTypedList<RisEntidad>();

            gdvEntidades.DataSource = listaEstudios;
            gdvEntidades.DataBind();

        }

        protected void btnGuardar_Click(object sender, EventArgs e)
        {
            try
            {
                guardarEntidad();

                ClientScript.RegisterStartupScript(this.GetType(), "alert", "alert('La entidad se guardó correctamente')", true);

                cargaEntidades();

                hdfIdEntidad.Value = "0";

                Utilidades.Utils.limpiarControles(this.Controls);
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }

        private void guardarEntidad()
        {
            RisEntidad entidad;

            if (hdfIdEntidad.Value != "0")
                entidad = new RisEntidad(int.Parse(hdfIdEntidad.Value));
            else
                entidad = new RisEntidad();

            entidad.Nombre = (txtEntidad.Text == "") ? ddlCentroDeInvestigacion.SelectedItem.ToString() : txtEntidad.Text;
            entidad.Domicilio = txtDomicilio.Text;
            entidad.Caracter = ddlCaracterEntidad.SelectedItem.ToString();
            entidad.Tipo = ddlTipo.SelectedItem.ToString();
            entidad.Email = txtEmailEntidad.Text;
            entidad.TipoEntidad = ddlTipoEntidad.SelectedItem.ToString();
            entidad.Caracteristicas = txtCaracteristicas.Text;

            entidad.Save();

        }

        protected void gdvEntidades_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            int idEntidad = Int32.Parse(e.CommandArgument.ToString());

            editarEntidades(idEntidad);
        }

        protected void chkEntidad_CheckedChanged(object sender, EventArgs e)
        {
            if (chkEntidad.Checked)
            {
                lblNombreEntidadCombo.Visible = true;
                ddlCentroDeInvestigacion.Visible = true;

                lblNombreEntidadTextbox.Visible = false;
                txtEntidad.Visible = false;
            }
            else
            {
                lblNombreEntidadCombo.Visible = false;
                ddlCentroDeInvestigacion.Visible = false;

                lblNombreEntidadTextbox.Visible = true;
                txtEntidad.Visible = true;
            }
        }
    }
}