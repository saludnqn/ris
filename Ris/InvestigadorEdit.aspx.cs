using System;
using System.Web.UI;
using System.Web.UI.WebControls;
using DalRis;
using System.Data;
using System.Text.RegularExpressions;

namespace SIPS.RIS
{
    public partial class InvestigadorEdit : System.Web.UI.Page
    {
        // -----------------------------------------------------------------------------------------------------------

        // Declaraciones globales
        string hayError;

        protected void Page_Load(object sender, EventArgs e)
        {
            if (IsPostBack) return;

            hayError = "NO";

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

                ddlSexoInvestigador.SelectedValue = oInvestigador.Sexo;
                inputFechaNacimiento.Value = oInvestigador.FechaNacimiento.ToString();
                ddlTipoDocumentoInvestigador.SelectedValue = oInvestigador.IdTipoDocumento.ToString();
                txtNumeroDocumento.Text = oInvestigador.NumeroDocumento.Trim();

                RisProfesion oProfesion = new RisProfesion(oInvestigador.IdProfesion);
                ddlProfesionInvestigador.SelectedValue = oInvestigador.IdProfesion.ToString();

                txtNumeroMatricula.Text = oInvestigador.NumeroMatricula.Trim();

                txtDomicilioLaboral.Text = oInvestigador.DomicilioLaboral.Trim();
                txtCPDomicilioLaboral.Text = oInvestigador.CpDomicilioLaboral.Trim();

                txtDomicilioParticular.Text = oInvestigador.DomicilioParticular.Trim();
                txtCPDomicilioParticular.Text = oInvestigador.CpDomicilioParticular.Trim();

                ddlTipoTelefonoLaboralInvestigador.SelectedValue = oInvestigador.IdTipoTelLaboral.ToString();
                txtNumeroTelefonoInvestigadorLaboral.Text = oInvestigador.TelefonoLaboral;

                ddlTipoTelefonoParticularInvestigador.SelectedValue = oInvestigador.IdTipoTelParticular.ToString();
                txtNumeroTelefonoInvestigadorParticular.Text = oInvestigador.TelefonoParticular;               

                txtMailInvestigadorLaboral.Text = oInvestigador.EmailLaboral;
                txtMailInvestigadorParticular.Text = oInvestigador.EmailParticular;

                DataTable dtEntidad = new DataTable();
                dtEntidad = SPs.RisObtenerEntidadInvestigador(int.Parse(Request["idInvestigador"].ToString())).GetDataSet().Tables[0];
                if (dtEntidad.Rows.Count != 0)
                {
                    ddlEntidad.SelectedValue = dtEntidad.Rows[0][1].ToString().Trim();                
                }
            }
        }

        // -----------------------------------------------------------------------------------------------------------                

        public Boolean verificarExpresionRegular(string tipoExpresion, string cadena)
        {
            Boolean resultado = false;

            if (cadena != "")
            {
                switch (tipoExpresion)
                {
                    case "Numerica":
                        Regex rex = new Regex("^[0-9]*$");
                        if (rex.IsMatch(cadena))
                            resultado = true;
                        break;
                }
            }

            return resultado;
        }

        // -----------------------------------------------------------------------------------------------------------

        private void cargarCombos()
        {

            ddlFuncionEnElEquipo.DataSource = RisFuncionEnElEquipo.FetchAll();
            ddlFuncionEnElEquipo.DataBind();
            ddlFuncionEnElEquipo.Items.Insert(0, new ListItem("Seleccionar", "0"));

            ddlTipoDocumentoInvestigador.DataSource = RisTipoDocumento.FetchAll();
            ddlTipoDocumentoInvestigador.DataBind();
            ddlTipoDocumentoInvestigador.Items.Insert(0, new ListItem("Seleccionar", "0"));

            ddlProfesionInvestigador.DataSource = RisProfesion.FetchAll();
            ddlProfesionInvestigador.DataBind();
            ddlProfesionInvestigador.Items.Insert(0, new ListItem("Seleccionar", "0"));

            ddlTipoTelefonoLaboralInvestigador.DataSource = RisTipoTelefono.FetchAll();
            ddlTipoTelefonoLaboralInvestigador.DataBind();
            ddlTipoTelefonoLaboralInvestigador.Items.Insert(0, new ListItem("Seleccionar", "0"));

            ddlTipoTelefonoParticularInvestigador.DataSource = RisTipoTelefono.FetchAll();
            ddlTipoTelefonoParticularInvestigador.DataBind();
            ddlTipoTelefonoParticularInvestigador.Items.Insert(0, new ListItem("Seleccionar", "0"));

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
            oInvestigador.Sexo = ddlSexoInvestigador.SelectedValue;

            if (inputFechaNacimiento.Value.ToString() != "")
            {
                oInvestigador.FechaNacimiento = DateTime.Parse(inputFechaNacimiento.Value.ToString());
            }

            oInvestigador.IdTipoDocumento = int.Parse(ddlTipoDocumentoInvestigador.SelectedValue.ToString());

            string cadena = txtNumeroDocumento.Text.Trim();
            if (verificarExpresionRegular("Numerica", cadena) && (cadena.Length <= 8))
            {
                oInvestigador.NumeroDocumento = txtNumeroDocumento.Text.Trim();
                hayError = "NO";
            }
            else
            {
                hayError = "SI";
                Response.Write("<script language=javascript>alert('El campo Documento solo permite números (máximo 8 caracteres, sin puntos)');</script>");
            }

            oInvestigador.IdProfesion = int.Parse(ddlProfesionInvestigador.SelectedValue.ToString());

            oInvestigador.NumeroMatricula = txtNumeroMatricula.Text.Trim();

            oInvestigador.DomicilioLaboral = txtDomicilioLaboral.Text.Trim();
            oInvestigador.CpDomicilioLaboral = txtCPDomicilioLaboral.Text.Trim();

            oInvestigador.DomicilioParticular = txtDomicilioParticular.Text.Trim();
            oInvestigador.CpDomicilioParticular = txtCPDomicilioParticular.Text.Trim();

            oInvestigador.IdTipoTelLaboral = int.Parse(ddlTipoTelefonoLaboralInvestigador.SelectedValue.ToString());
            oInvestigador.TelefonoLaboral = txtNumeroTelefonoInvestigadorLaboral.Text.Trim();

            oInvestigador.IdTipoTelParticular = int.Parse(ddlTipoTelefonoParticularInvestigador.SelectedValue.ToString());
            oInvestigador.TelefonoParticular = txtNumeroTelefonoInvestigadorParticular.Text.Trim();

            oInvestigador.EmailLaboral = txtMailInvestigadorLaboral.Text.Trim();
            oInvestigador.EmailParticular = txtMailInvestigadorParticular.Text.Trim();

            oInvestigador.IdEntidad = int.Parse(ddlEntidad.SelectedValue.ToString());

            if (hayError == "NO")
            {
                oInvestigador.Save();

                // -----------------------------------------------------
                // Cargo los datos en la tabla "RIS_EstudioInvestigador"
                // -----------------------------------------------------

                if (Request["numeroDocumentoInvestigador"].ToString() != "0")
                {
                    DataTable dtInvestigador = new DataTable();
                    dtInvestigador = SPs.RisVerificarSiExisteInvestigador(int.Parse(Request["numeroDocumentoInvestigador"].ToString().Trim())).GetDataSet().Tables[0];

                    // Cargo los datos en la tabla "RIS_EstudioInvestigador"
                    RisEstudioInvestigador oEstudioInvestigador = new RisEstudioInvestigador();
                    oEstudioInvestigador.IdEstudio = int.Parse(Request["idEstudio"].ToString().Trim());

                    if (dtInvestigador.Rows.Count != 0)
                    {
                        oEstudioInvestigador.IdInvestigador = int.Parse(dtInvestigador.Rows[0][0].ToString().Trim());
                    }
                    else
                    {
                        oEstudioInvestigador.IdInvestigador = oInvestigador.IdInvestigador;
                    }

                    oEstudioInvestigador.Save();
                }

                // ,nota: Forma de ejecutar un sp que no devuelve valores, solo modifica registros en la base
                SPs.RisModificarFuncionEnElEquipo(int.Parse(Request["idEstudio"].ToString().Trim()),
                                                  oInvestigador.IdInvestigador,
                                                  int.Parse(ddlFuncionEnElEquipo.SelectedValue)).Execute();

                RisEstudio oEstudio = new RisEstudio(int.Parse(Request["idEstudio"].ToString()));
                string url = "EstudioEdit.aspx?idEstudio=" + Request["idEstudio"].ToString().Trim() + "&TipoDeEstudio=" + oEstudio.TipoEstudio.ToString().Trim() + "#marcaInvestigadoresMiembros";
                Response.Redirect(url, false);
            }
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
