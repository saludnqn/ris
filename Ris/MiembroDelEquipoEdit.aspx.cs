using System;
using System.Web.UI;
using System.Web.UI.WebControls;
using DalRis;
using System.Data;
using System.Text.RegularExpressions;

namespace SIPS.RIS
{
    public partial class MiembroDelEquipoEdit : System.Web.UI.Page
    {
        // -----------------------------------------------------------------------------------------------------------

        //// Declaraciones globales
        //string hayError = "NO";

        protected void Page_Load(object sender, EventArgs e)
        {
            if (IsPostBack) return;

            //hayError = "NO";

            Session["RIS_nuevo_registro"] = "NO";

            cargarCombos();

            if (Request["idInvestigador"].ToString().Trim() != "0") // Existe el registro
            {
                RisInvestigadore oInvestigador = new RisInvestigadore(int.Parse(Request["idInvestigador"].ToString()));

                txtApellidoInvestigador.Text = oInvestigador.Apellido.Trim();
                txtNombreInvestigador.Text = oInvestigador.Nombre.Trim();

                DataTable dtFuncionEnElEquipo = new DataTable();
                dtFuncionEnElEquipo = SPs.RisObtenerFuncionEnElEquipo(int.Parse(Request["idEstudio"].ToString().Trim()), int.Parse(Request["idInvestigador"].ToString())).GetDataSet().Tables[0];
                ddlFuncionEnElEquipo.SelectedValue = dtFuncionEnElEquipo.Rows[0][3].ToString().Trim();

                RisProfesion oProfesion = new RisProfesion(oInvestigador.IdProfesion);
                ddlProfesionInvestigador.SelectedValue = oInvestigador.IdProfesion.ToString();

                txtNumeroMatricula.Text = oInvestigador.NumeroMatricula.Trim();

                DataTable dtEntidad = new DataTable();
                dtEntidad = SPs.RisObtenerEntidadInvestigador(int.Parse(Request["idInvestigador"].ToString())).GetDataSet().Tables[0];

                if (dtEntidad.Rows.Count != 0)
                {
                    ddlEntidad.SelectedValue = dtEntidad.Rows[0][1].ToString().Trim();
                }
                else
                {
                    ddlEntidad.SelectedValue = "<no asignada>";
                }
            }
        }

        // -----------------------------------------------------------------------------------------------------------

        private void cargarCombos()
        {
            ddlFuncionEnElEquipo.DataSource = RisFuncionEnElEquipo.FetchAll();
            ddlFuncionEnElEquipo.DataBind();
            ddlFuncionEnElEquipo.Items.Insert(0, new ListItem("Seleccionar", "0"));

            ddlProfesionInvestigador.DataSource = RisProfesion.FetchAll();
            ddlProfesionInvestigador.DataBind();
            ddlProfesionInvestigador.Items.Insert(0, new ListItem("Seleccionar", "0"));

            ddlEntidad.DataSource = RisEntidad.FetchAll();
            ddlEntidad.DataBind();
            ddlEntidad.Items.Insert(0, new ListItem("Seleccionar", "0"));
        }

        // -----------------------------------------------------------------------------------------------------------        

        protected void btnGuardar_Click(object sender, EventArgs e)
        {
            int idInvestigador = SubSonic.Sugar.Web.QueryString<int>("idInvestigador");

            RisInvestigadore oInvestigador = new RisInvestigadore(int.Parse(Request["idInvestigador"].ToString()));

            oInvestigador.Apellido = txtApellidoInvestigador.Text.Trim();
            oInvestigador.Nombre = txtNombreInvestigador.Text.Trim();

            oInvestigador.IdProfesion = int.Parse(ddlProfesionInvestigador.SelectedValue.ToString());

            oInvestigador.NumeroMatricula = txtNumeroMatricula.Text.Trim();

            oInvestigador.IdEntidad = int.Parse(ddlEntidad.SelectedValue.ToString());

            oInvestigador.Save();

            // -----------------------------------------------------
            // Cargo los datos en la tabla "RIS_EstudioInvestigador"
            // -----------------------------------------------------

            DataTable dtEstudioInvestigador = new DataTable();
            dtEstudioInvestigador = SPs.RisVerificarSiExisteEstudioInvestigador(int.Parse(Request["idEstudio"].ToString()),
                                                                                int.Parse(Request["idInvestigador"].ToString())).GetDataSet().Tables[0];

            if (dtEstudioInvestigador.Rows.Count == 0) // No existe !
            {
                RisEstudioInvestigador oEstudioInvestigador = new RisEstudioInvestigador();
                oEstudioInvestigador.IdEstudio = int.Parse(Request["idEstudio"].ToString().Trim());
                oEstudioInvestigador.IdInvestigador = oInvestigador.IdInvestigador;
                oEstudioInvestigador.IdFuncionEnElEquipo = int.Parse(ddlFuncionEnElEquipo.SelectedValue.ToString());

                oEstudioInvestigador.Save();
            }
            else 
            {
                // ,nota: Forma de ejecutar un sp que no devuelve valores, solo modifica registros en la base
                SPs.RisModificarFuncionEnElEquipo(int.Parse(Request["idEstudio"].ToString().Trim()),
                                                  int.Parse(Request["idInvestigador"].ToString()),
                                                  int.Parse(ddlFuncionEnElEquipo.SelectedValue)).Execute();
            }

            RisEstudio oEstudio = new RisEstudio(int.Parse(Request["idEstudio"].ToString()));
            string url = "EstudioEdit.aspx?idEstudio=" + Request["idEstudio"].ToString().Trim() + "&TipoDeEstudio=" + oEstudio.TipoEstudio.ToString().Trim() + "#marcaInvestigadoresMiembros";
            Response.Redirect(url, false);
        }

        // -----------------------------------------------------------------------------------------------------------

        protected void btnCerrar_Click(object sender, EventArgs e)
        {
            RisEstudio oEstudio = new RisEstudio(int.Parse(Request["idEstudio"].ToString()));
            string url = "EstudioEdit.aspx?idEstudio=" + Request["idEstudio"].ToString().Trim() + "&TipoDeEstudio=" + oEstudio.TipoEstudio.ToString().Trim() + "#marcaInvestigadoresMiembros";
            Response.Redirect(url, false);
        }

        // -----------------------------------------------------------------------------------------------------------
    }
}
