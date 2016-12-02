using System;
using System.Web.UI;
using System.Web.UI.WebControls;
using DalRis;
using System.Data;
using System.Text;
using System.Text.RegularExpressions;
using System.Configuration;
using System.Data.SqlClient;

namespace SIPS.RIS
{
    public partial class EstudioEdit : System.Web.UI.Page
    {
        // -----------------------------------------------------------------------------------------------------------

        // Declaraciones globales
        string hayError, camposObligatoriosCompletos;

        // -----------------------------------------------------------------------------------------------------------

        protected void Page_Load(object sender, EventArgs e)
        {
            if (IsPostBack) return;

            // ***********************************
            // ,nota: Por el momento la oculto....
            tablaNormaLegal.Visible = false;
            // ***********************************

            hayError = "NO";

            lblTipoEstudio.Text = Request["TipoDeEstudio"].ToString().Trim();

            // Muestro / oculto algunos datos respecto del tipo de estudio (esperimental / NO experiemnetal)
            if ((Request["TipoDeEstudio"].ToString()) == "Experimental")
            {
                //pnlTipoInvestigacionExperimentales.Visible = true;
                //pnlTipoInvestigacionNOExperimentales.Visible = false;
                pnlSeguroDeDanios.Visible = true;
            }
            else
            {
                //pnlTipoInvestigacionExperimentales.Visible = false;
                //pnlTipoInvestigacionNOExperimentales.Visible = true;
                pnlSeguroDeDanios.Visible = false;
            }

            RisEstudio estudio = new RisEstudio(int.Parse(Request["idEstudio"].ToString().Trim()));

            if (estudio.TienePoblacionVulnerable == "SI")
            {
                pnlItemsPoblacionVulnerable.Visible = true;
            }
            else
            {
                pnlItemsPoblacionVulnerable.Visible = false;
            }

            if (estudio.Multicentrico == "SI")
            {
                pnlMulticentrico.Visible = true;
            }
            else
            {
                pnlMulticentrico.Visible = false;
            }

            cargarCombos();
            cargarItemsDesaprobadosCAIBSH();
            cargarCaracteristicasDelEstudio();
            cargarItemsPoblacionVulnerable();
            cargarItemsFuenteRecoleccionDatos();

            if ((Request["idEstudio"].ToString().Trim() != "0") && (Session["RIS_nuevo_registro"].ToString() == "NO"))
            {
                cargarEstudio();
            }

            // Oculto algunos campos. La idea es hacerlo hasta que se carguen los campos obligatorios.
            if ((camposObligatoriosCompletos != "SI") && (Session["RIS_llamada_desde_Nuevo_Registro"].ToString().Trim() == "SI"))
            {
                ocultarCampos(false);
            }
        }

        // -----------------------------------------------------------------------------------------------------------     
        private void ocultarCampos(Boolean valor)
        {
            UpdatePanelConcentimientos.Visible = valor;
            UpdatePanelEnmiendas.Visible = valor;
            UpdatePanelTipoInvestigacion.Visible = valor;
            UpdatePanelPresentacionInformeAvances.Visible = valor;
            tablaAreaTematica.Visible = valor;
            UpdatePanelPoblacionVulnerable.Visible = valor;
            tablaTamanioMuestra.Visible = valor;
            tablaFuenteRecoleccionDatos.Visible = valor;
            tablaDuracion.Visible = valor;
            UpdatePanelTipoDeEstudio.Visible = valor;
            tablaLugaresDeRealizacion.Visible = valor;
            UpdatePanelSeguroDanios.Visible = valor;
            UpdatePanelComiteEticaInvestigacion.Visible = valor;
            UpdatePanelEvaluacionesRechazadas.Visible = valor;
            UpdatePanelInformeCAIBSH.Visible = valor;
            tablaNormaLegal.Visible = valor;
            tablaObservaciones.Visible = valor;

            btnGuardarEstudioMedio.Visible = !valor;
            btnCerrarEstudioMedio.Visible = !valor;

            btnGuardarEstudio.Visible = valor;
            btnCerrarEstudio.Visible = valor;
        }

        // -----------------------------------------------------------------------------------------------------------     

        protected void ddlPoblacionVulnerable_SelectedIndexChanged(object sender, EventArgs e)
        {
            if (ddlPoblacionVulnerable.SelectedValue == "SI")
            {
                pnlItemsPoblacionVulnerable.Visible = true;
            }
            else
            {
                pnlItemsPoblacionVulnerable.Visible = false;

                // Saco los checks del control
                for (int i = 0; i < chkItemsPoblacionVulnerable.Items.Count; i++)
                {
                    chkItemsPoblacionVulnerable.Items[i].Selected = false;
                }

                // Borro los datos en la base
                if (Request["idEstudio"].ToString().Trim() != "0")
                {
                    // ,nota: Forma de ejecutar un sp que no devuelve valores, solo borra registros en la base
                    SPs.RisEliminarRegistrosEstudioPoblacionVulnerable(int.Parse(Request["idEstudio"].ToString())).Execute();
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

        private void cargarItemsDesaprobadosCAIBSH()
        {
            // Cargo los datos desde RIS_ItemDesaprobados CAIBHS
            chkItemsDesaprobadosCAIBSH.DataSource = SPs.RisCargarCheckBoxItemsDesaprobados().GetDataSet().Tables[0];
            chkItemsDesaprobadosCAIBSH.DataBind();

            // Cargo los checkboxs que corresponden respecto de RIS_EstudioItemsDesaprobado
            DataTable dtCheckboxsItemsDesaprobados = new DataTable();
            dtCheckboxsItemsDesaprobados = SPs.RisCargarCheckBoxEstudioItemsDesaprobados(int.Parse(Request["idEstudio"].ToString())).GetDataSet().Tables[0];

            for (int i = 0; i < chkItemsDesaprobadosCAIBSH.Items.Count; i++)
            {
                int j = 0;
                foreach (DataRow drCheckboxsActivos in dtCheckboxsItemsDesaprobados.Rows)
                {
                    if (int.Parse(chkItemsDesaprobadosCAIBSH.Items[i].Value) == int.Parse(dtCheckboxsItemsDesaprobados.Rows[j][2].ToString()))
                    {
                        chkItemsDesaprobadosCAIBSH.Items[i].Selected = true;
                        break;
                    }
                    j = j + 1;
                }
            }
        }

        // -----------------------------------------------------------------------------------------------------------    

        private void cargarCaracteristicasDelEstudio()
        {
            //ddlCaracteristica.DataSource = SPs.RisCargarComboItemsCaracteristicasEstudio(Request["TipoDeEstudio"].ToString().Trim()).GetDataSet().Tables[0];
            //ddlCaracteristica.DataBind();

            // ************************************************************************************************
            // ************************************************************************************************
            // En los últimos cambios definieron que solo se puede elegir solo una carecterística.
            // De manera que comento el código que esta debajo y pongo un combo.
            //
            // nota: Recordar que si el código que esta debajo queda sin efecto creo que hay que volar
            //       dos SP:
            //       - RIS_Cargar_CheckBox_Items_Caracteristicas_Estudio
            //       - RIS_Cargar_CheckBox_Items_Caracteristicas_Estudio_Chequeados
            //
            //       Aún así, VERIFICAR !
            //
            // ************************************************************************************************
            // ************************************************************************************************

            // Cargo los datos desde RIS_Caracteristicas
            //chkCaracteristicasDelEstudio.DataSource = SPs.RisCargarCheckBoxItemsCaracteristicasEstudio().GetDataSet().Tables[0];
            //chkCaracteristicasDelEstudio.DataBind();            

            //// Cargo los checkboxs que corresponden respecto de RIS_EstudioCaracteristica
            //DataTable dtCheckboxsExperimentalesActivos = new DataTable();
            //dtCheckboxsExperimentalesActivos = SPs.RisCargarCheckBoxItemsCaracteristicasEstudioChequeados(int.Parse(Request["idEstudio"].ToString())).GetDataSet().Tables[0];

            //for (int i = 0; i < chkCaracteristicasDelEstudio.Items.Count; i++)
            //{
            //    int j = 0;
            //    foreach (DataRow drCheckboxsActivos in dtCheckboxsExperimentalesActivos.Rows)
            //    {
            //        if (int.Parse(chkCaracteristicasDelEstudio.Items[i].Value) == int.Parse(dtCheckboxsExperimentalesActivos.Rows[j][2].ToString()))
            //        {
            //            chkCaracteristicasDelEstudio.Items[i].Selected = true;
            //            break;
            //        }
            //        j = j + 1;
            //    }
            //}

        }

        // -----------------------------------------------------------------------------------------------------------    

        private void cargarItemsPoblacionVulnerable()
        {
            // Cargo los datos desde RIS_PoblacionVulnerable
            chkItemsPoblacionVulnerable.DataSource = SPs.RisCargarCheckBoxItemsParticipacionPoblacionVulnerable().GetDataSet().Tables[0];
            chkItemsPoblacionVulnerable.DataBind();

            // Cargo los checkboxs que corresponden respecto de RIS_EstudioPoblacionVulnerable
            DataTable dtCheckboxsItemsEstudioPoblacionVulnerable = new DataTable();
            dtCheckboxsItemsEstudioPoblacionVulnerable = SPs.RisCargarCheckBoxEstudioPoblacionVulnerable(int.Parse(Request["idEstudio"].ToString())).GetDataSet().Tables[0];

            for (int i = 0; i < chkItemsPoblacionVulnerable.Items.Count; i++)
            {
                int j = 0;
                foreach (DataRow drCheckboxsActivos in dtCheckboxsItemsEstudioPoblacionVulnerable.Rows)
                {
                    if (int.Parse(chkItemsPoblacionVulnerable.Items[i].Value) == int.Parse(dtCheckboxsItemsEstudioPoblacionVulnerable.Rows[j][2].ToString()))
                    {
                        chkItemsPoblacionVulnerable.Items[i].Selected = true;
                        break;
                    }
                    j = j + 1;
                }
            }
        }

        // -----------------------------------------------------------------------------------------------------------    

        private void cargarItemsFuenteRecoleccionDatos()
        {
            // Cargo los datos desde RIS_FuenteRecoleccionDatos
            chkItemsFuenteRecoleccionDatos.DataSource = SPs.RisCargarCheckBoxItemsFuenteRecoleccionDatos().GetDataSet().Tables[0];
            chkItemsFuenteRecoleccionDatos.DataBind();

            // Cargo los checkboxs que corresponden respecto de RIS_EstudioFuenteRecoleccionDatos
            DataTable dtCheckboxsItemsEstudioFuenteRecoleccionDatos = new DataTable();
            dtCheckboxsItemsEstudioFuenteRecoleccionDatos = SPs.RisCargarCheckBoxEstudioFuenteRecoleccionDatos(int.Parse(Request["idEstudio"].ToString())).GetDataSet().Tables[0];

            for (int i = 0; i < chkItemsFuenteRecoleccionDatos.Items.Count; i++)
            {
                int j = 0;
                foreach (DataRow drCheckboxsActivos in dtCheckboxsItemsEstudioFuenteRecoleccionDatos.Rows)
                {
                    if (int.Parse(chkItemsFuenteRecoleccionDatos.Items[i].Value) == int.Parse(dtCheckboxsItemsEstudioFuenteRecoleccionDatos.Rows[j][2].ToString()))
                    {
                        chkItemsFuenteRecoleccionDatos.Items[i].Selected = true;
                        break;
                    }
                    j = j + 1;
                }
            }
        }

        // -----------------------------------------------------------------------------------------------------------    

        private void cargarEstudio()
        {
            RisEstudio oEstudio = new RisEstudio(int.Parse(Request["idEstudio"].ToString()));

            // ------------------------------
            // Datos de identificación
            // ------------------------------

            txtNumeroDeOrden.Text = oEstudio.NroOrden;
            txtNumeroEnmienda.Text = oEstudio.Enmienda;
            txtNumeroAnio.Text = oEstudio.Anio;

            // ------------------------------
            // Fecha de inicio
            // ------------------------------

            inputFechaInicio.Value = oEstudio.FechaInicio.ToString();

            // ------------------------------
            // Fecha de finalización
            // ------------------------------

            inputFechaFinalizacion.Value = oEstudio.FechaFinalizacion.ToString();

            // ------------------------------
            // Datos generales
            // ------------------------------

            txtTituloInvestigacion.Text = oEstudio.TituloInvestigacion;
            txtNumeroRegistroNacional.Text = oEstudio.NroRegistroNacional;
            lblTipoEstudio.Text = oEstudio.TipoEstudio.ToString();
            txtNumeroExpediente.Text = oEstudio.NroExpediente;
            txtNombreAbreviado.Text = oEstudio.NombreAbreviado;
            txtDrogasEnEstudio.Text = oEstudio.Drogas;
            txtPalabrasClaves.Text = oEstudio.PalabrasClave;

            // ------------------------------
            // Afiliación institucional del ...
            // ------------------------------ 

            if (oEstudio.NombreIntitucionAfiliacion != null)
            {
                ddlInstitucionDeReferencia.ClearSelection();
                ddlInstitucionDeReferencia.Items.FindByText(oEstudio.NombreIntitucionAfiliacion).Selected = true;
            }

            txtReferenteInstitucionAfiliacion.Text = oEstudio.ReferenteInstitucionAfiliacion;
            txtNumeroTelefonoInstitucion.Text = oEstudio.TelefonoInstitucionAfiliacion;
            txtDomicilioInstitucion.Text = oEstudio.DomicilioInstitucionAfiliacion;
            txtMailInstitucion.Text = oEstudio.EmailInstitucionAfiliacion;

            // -----------------------------
            // Tipo de investigación
            // -----------------------------

            //switch (oEstudio.TipoDeEnsayo)
            //{
            //    case "1":
            //        rbdTipoEnsayo.SelectedValue = "1";
            //        break;
            //    case "2":
            //        rbdTipoEnsayo.SelectedValue = "2";
            //        break;
            //    case "3":
            //        rbdTipoEnsayo.SelectedValue = "3";
            //        break;
            //}

            //switch (oEstudio.FaseDelEstudio)
            //{
            //    case "I":
            //        rblFase.SelectedValue = "I";
            //        break;
            //    case "II":
            //        rblFase.SelectedValue = "II";
            //        break;
            //    case "III":
            //        rblFase.SelectedValue = "III";
            //        break;
            //    case "IV":
            //        rblFase.SelectedValue = "IV";
            //        break;
            //}

            //if (oEstudio.CuasiExperimental == "1")
            //{
            //    chkCuasiExperimental.Checked = true;
            //}
            //else
            //{
            //    chkCuasiExperimental.Checked = false;
            //}

            //txtOtrosTiposInvestigacion.Text = oEstudio.OtrosTiposInvestigacion;

            //switch (oEstudio.TipoDeInvestigacion)
            //{
            //    case "1":
            //        rblTipoInvestigacionNoExperimentales.SelectedValue = "1";
            //        break;
            //    case "2":
            //        rblTipoInvestigacionNoExperimentales.SelectedValue = "2";
            //        break;
            //    case "3":
            //        rblTipoInvestigacionNoExperimentales.SelectedValue = "3";
            //        break;
            //    case "4":
            //        rblTipoInvestigacionNoExperimentales.SelectedValue = "4";
            //        break;
            //    case "5":
            //        rblTipoInvestigacionNoExperimentales.SelectedValue = "5";
            //        break;
            //    case "6":
            //        rblTipoInvestigacionNoExperimentales.SelectedValue = "6";
            //        break;
            //    case "7":
            //        rblTipoInvestigacionNoExperimentales.SelectedValue = "7";
            //        break;
            //    case "8":
            //        rblTipoInvestigacionNoExperimentales.SelectedValue = "8";
            //        break;
            //}

            // ----------------------------------------------------------------
            // Características del estudio (experimentales y NO experimentales)
            // ----------------------------------------------------------------

            cargarCaracteristicasDelEstudio();

            //txtOtrosCaractEstudios.Text = oEstudio.OtrosCaractEstudios;

            // ---------------------------------------------------------
            // Fechas de presentación de informe de avances
            // ---------------------------------------------------------

            DataTable dtFechasPresentacionInformeAvances = new DataTable();
            dtFechasPresentacionInformeAvances = SPs.RisCargarListaFechasPresentacionInformeAvances(int.Parse(Request["idEstudio"].ToString())).GetDataSet().Tables[0];

            inputFechaPresentacionInformeFinal.Value = oEstudio.FechaPresentacionInformeFinal.ToString();

            // ---------------------------------------------------------
            // Area temática
            // ---------------------------------------------------------

            ddlAreaTematica.SelectedValue = oEstudio.IdAreaTematica.ToString();

            // ---------------------------------------------------------
            // Participación de población vulnerable
            // ---------------------------------------------------------

            if (oEstudio.TienePoblacionVulnerable == null)
            {
                ddlPoblacionVulnerable.SelectedValue = "NO";
                chkItemsPoblacionVulnerable.Visible = false;
            }
            else
            {
                ddlPoblacionVulnerable.SelectedValue = oEstudio.TienePoblacionVulnerable.ToString();
            }

            // ---------------------------------------------------------
            // Tamaño de la muestra
            // ---------------------------------------------------------

            txtTamanioMuestra.Text = oEstudio.TamanioMuestra.ToString().Trim();


            // ---------------------------------------------------------
            // Fuente de recoleccion de datos
            // ---------------------------------------------------------

            DataTable dtCheckboxsItemsRecoleccionDatos = new DataTable();
            dtCheckboxsItemsRecoleccionDatos = SPs.RisCargarCheckBoxEstudioFuenteRecoleccionDatos(int.Parse(Request["idEstudio"].ToString())).GetDataSet().Tables[0];

            for (int i = 0; i < chkItemsFuenteRecoleccionDatos.Items.Count; i++)
            {
                int j = 0;
                foreach (DataRow drCheckboxsActivos in dtCheckboxsItemsRecoleccionDatos.Rows)
                {
                    if (int.Parse(chkItemsFuenteRecoleccionDatos.Items[i].Value) == int.Parse(dtCheckboxsItemsRecoleccionDatos.Rows[j][2].ToString()))
                    {
                        chkItemsFuenteRecoleccionDatos.Items[i].Selected = true;
                        break;
                    }
                    j = j + 1;
                }
            }

            // ---------------------------------------------------------
            // Duración
            // ---------------------------------------------------------

            txtTiempoEstimadoAnios.Text = oEstudio.TiempoEstimadoAnios.ToString();
            txtTiempoEstimadoMeses.Text = oEstudio.TiempoEstimadoMeses.ToString();

            inputFechaPrimerParticipante.Value = oEstudio.FechaIncorporacionPrimerParticipante.ToString();
            inputFechaCierreParticipantes.Value = oEstudio.FechaCierreIncorporacionParticipantes.ToString();

            // ---------------------------------------------------------
            // Tipo de estudio / Lugares de realización
            // ---------------------------------------------------------

            ddlEstudioMulticentrico.SelectedValue = oEstudio.Multicentrico;

            // -------------------------------------------------------------------------------------
            // Informe de la comisión asesora de investigaciones biomédicas en seres humanos (CAIBSH)
            // -------------------------------------------------------------------------------------

            inputFechaAprobadoCAIBSH.Value = oEstudio.FechaAprobadoCAIBSH.ToString();
            inputFechaRechazadoCAIBSH.Value = oEstudio.FechaRechazadoCAIBSH.ToString();
            inputFechaVencimientoPlazoCAIBSH.Value = oEstudio.FechaVencimientoPlazoCAIBSH.ToString();
            inputFechaRetiroEvaluacionCAIBSH.Value = oEstudio.FechaRetiroEvaluacionCAIBSH.ToString();

            if (oEstudio.OtroMotivoDictamenCAIBSH == null)
            {
                txtOtroMotivoDictamenCAIBSH.Text = " ";
            }
            else
            {
                txtOtroMotivoDictamenCAIBSH.Text = oEstudio.OtroMotivoDictamenCAIBSH.Trim();
            }

            // Cargo los checkboxs que corresponden respecto de RIS_EstudioItemsDesaprobado
            DataTable dtCheckboxsItemsDesaprobados = new DataTable();
            dtCheckboxsItemsDesaprobados = SPs.RisCargarCheckBoxEstudioItemsDesaprobados(int.Parse(Request["idEstudio"].ToString())).GetDataSet().Tables[0];

            for (int i = 0; i < chkItemsDesaprobadosCAIBSH.Items.Count; i++)
            {
                int j = 0;
                foreach (DataRow drCheckboxsActivos in dtCheckboxsItemsDesaprobados.Rows)
                {
                    if (int.Parse(chkItemsDesaprobadosCAIBSH.Items[i].Value) == int.Parse(dtCheckboxsItemsDesaprobados.Rows[j][2].ToString()))
                    {
                        chkItemsDesaprobadosCAIBSH.Items[i].Selected = true;
                        break;
                    }
                    j = j + 1;
                }
            }

            txtObservacionesCAIBSH.Text = oEstudio.ObservacionesCAIBSH;

            // -------------------------------------------------------------------------------------
            // Grid´s
            // -------------------------------------------------------------------------------------
            cargarListaInstitucionRespaldatoria(int.Parse(Request["idEstudio"].ToString()));
            cargarListaEnteFinanciador(int.Parse(Request["idEstudio"].ToString()));
            cargarListaConcentimiento(int.Parse(Request["idEstudio"].ToString()));
            cargarListaEnmiendas(int.Parse(Request["idEstudio"].ToString()));
            cargarListaInvestigadores(int.Parse(Request["idEstudio"].ToString()));
            cargarListaPresentacionInformeAvances(int.Parse(Request["idEstudio"].ToString()));
            cargarListaLugaresRealizacion(int.Parse(Request["idEstudio"].ToString()));
            cargarListaAseguradoras(int.Parse(Request["idEstudio"].ToString()));
            cargarListaComiteEtica(int.Parse(Request["idEstudio"].ToString()));
            cargarListaEvaluacionesRechazadas(int.Parse(Request["idEstudio"].ToString()));
            cargarListaInformeAprobado(int.Parse(Request["idEstudio"].ToString()));

            cargarListaCaracteristicasEstudio(int.Parse(Request["idEstudio"].ToString()), Request["TipoDeEstudio"].ToString().Trim());

            cargarListaEfectoresMulticentricos(int.Parse(Request["idEstudio"].ToString()));
            cargarListaProvinciasMulticentricos(int.Parse(Request["idEstudio"].ToString()));
            cargarListaPaisesMulticentricos(int.Parse(Request["idEstudio"].ToString()));
        }

        // -----------------------------------------------------------------------------------------------------------

        private void guardarNuevoEstudio()
        {
            // ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
            // ,nota: Al menos debe existir un investigador principal
            // ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++

            string faltaInvestigadorPrincipal = "NO";

            DataTable dtInvestigadorPrincipal = new DataTable();
            dtInvestigadorPrincipal = SPs.RisObtenerInvestigadorPrincipal(int.Parse(Request["idEstudio"].ToString())).GetDataSet().Tables[0];

            if (dtInvestigadorPrincipal.Rows.Count == 0)
            {
                faltaInvestigadorPrincipal = "SI";
            }

            // ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
            // Campos obligatorios
            // 30/11/2016 Comento los campos a pedio de Macías, para poder cargar sin problemas los estudios,

            // ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++

            //if ((inputFechaInicio.Value == "") ||
            //    (txtTituloInvestigacion.Text == "") ||
            //    (txtNumeroDeOrden.Text == "") ||
            //    (txtNumeroEnmienda.Text == "") ||
            //    (txtNumeroAnio.Text == "") ||
            //    (txtTituloInvestigacion.Text == "") ||
            //    (txtNumeroRegistroNacional.Text == "") ||
            //    (txtNumeroExpediente.Text == "") ||
            //    (txtNombreAbreviado.Text == "") ||
            //    (txtDrogasEnEstudio.Text == "") ||
            //    (txtPalabrasClaves.Text == "") ||
            //    (txtInstitucion.Text == "") ||
            //    (txtReferenteInstitucionAfiliacion.Text == "") ||
            //    (txtNumeroTelefonoInstitucion.Text == "") ||
            //    (txtDomicilioInstitucion.Text == "") ||
            //    (txtMailInstitucion.Text == ""))
            //{
            //    hayError = "SI";
            //}

            // ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++

            // ¿ Nuevo estudio o existente ?
            // -----------------------------

            int idEstudio = SubSonic.Sugar.Web.QueryString<int>("idEstudio");
            RisEstudio oEstudio = new RisEstudio(idEstudio);

            // ++++++++++++++++++++++++++++++
            // Datos de identificación
            // ++++++++++++++++++++++++++++++

            oEstudio.NroOrden = txtNumeroDeOrden.Text.Trim();
            oEstudio.Enmienda = txtNumeroEnmienda.Text.Trim();
            oEstudio.Anio = txtNumeroAnio.Text.Trim();

            // ++++++++++++++++++++++++++++++
            // Fecha de inicio
            // ++++++++++++++++++++++++++++++

            if (inputFechaInicio.Value != "")
            {
                oEstudio.FechaInicio = DateTime.Parse(inputFechaInicio.Value.ToString());
            }

            // ++++++++++++++++++++++++++++++
            // Fecha de finalización
            // ++++++++++++++++++++++++++++++

            if (inputFechaFinalizacion.Value != "")
            {
                oEstudio.FechaFinalizacion = DateTime.Parse(inputFechaFinalizacion.Value.ToString());
            }

            // ++++++++++++++++++++++++++++++
            // Datos generales
            // ++++++++++++++++++++++++++++++

            if (txtTituloInvestigacion.Text.Length > 2000)
            {
                hayError = "SI";
                Response.Write("<script language=javascript>alert('El campo Título de la investigación no puede superar los 2000 caracteres');</script>");
            }
            else
            {
                oEstudio.TituloInvestigacion = txtTituloInvestigacion.Text.Trim();
            }

            oEstudio.NroRegistroNacional = txtNumeroRegistroNacional.Text.Trim();
            oEstudio.TipoEstudio = lblTipoEstudio.Text.Trim();
            oEstudio.NroExpediente = txtNumeroExpediente.Text.Trim();
            oEstudio.NombreAbreviado = txtNombreAbreviado.Text.Trim();
            oEstudio.Drogas = txtDrogasEnEstudio.Text.Trim();
            oEstudio.PalabrasClave = txtPalabrasClaves.Text.Trim();

            // ++++++++++++++++++++++++++++++
            // Afiliación institucional del ...
            // ++++++++++++++++++++++++++++++

            oEstudio.NombreIntitucionAfiliacion = ddlInstitucionDeReferencia.SelectedItem.ToString(); //txtInstitucion.Text.Trim();
            oEstudio.ReferenteInstitucionAfiliacion = txtReferenteInstitucionAfiliacion.Text.Trim();
            oEstudio.TelefonoInstitucionAfiliacion = txtNumeroTelefonoInstitucion.Text.Trim();
            oEstudio.DomicilioInstitucionAfiliacion = txtDomicilioInstitucion.Text.Trim();
            oEstudio.EmailInstitucionAfiliacion = txtMailInstitucion.Text.Trim();

            // ++++++++++++++++++++++++++++++
            // Tipo de investigación
            // ++++++++++++++++++++++++++++++

            //switch (rbdTipoEnsayo.SelectedValue)
            //{
            //    case "1":
            //        oEstudio.TipoDeEnsayo = "1";
            //        break;
            //    case "2":
            //        oEstudio.TipoDeEnsayo = "2";
            //        break;
            //    case "3":
            //        oEstudio.TipoDeEnsayo = "3";
            //        break;
            //}

            //switch (rblFase.SelectedValue)
            //{
            //    case "I":
            //        oEstudio.FaseDelEstudio = "I";
            //        break;
            //    case "II":
            //        oEstudio.FaseDelEstudio = "II";
            //        break;
            //    case "III":
            //        oEstudio.FaseDelEstudio = "III";
            //        break;
            //    case "IV":
            //        oEstudio.FaseDelEstudio = "IV";
            //        break;
            //}

            //if (chkCuasiExperimental.Checked)
            //{
            //    oEstudio.CuasiExperimental = "1";
            //}
            //else
            //{
            //    oEstudio.CuasiExperimental = "0";
            //}

            //oEstudio.OtrosTiposInvestigacion = txtOtrosTiposInvestigacion.Text.Trim();

            //switch (rblTipoInvestigacionNoExperimentales.SelectedValue)
            //{
            //    case "1":
            //        oEstudio.TipoDeInvestigacion = "1";
            //        break;
            //    case "2":
            //        oEstudio.TipoDeInvestigacion = "2";
            //        break;
            //    case "3":
            //        oEstudio.TipoDeInvestigacion = "3";
            //        break;
            //    case "4":
            //        oEstudio.TipoDeInvestigacion = "4";
            //        break;
            //    case "5":
            //        oEstudio.TipoDeInvestigacion = "5";
            //        break;
            //    case "6":
            //        oEstudio.TipoDeInvestigacion = "6";
            //        break;
            //    case "7":
            //        oEstudio.TipoDeInvestigacion = "7";
            //        break;
            //    case "8":
            //        oEstudio.TipoDeInvestigacion = "8";
            //        break;
            //}

            // ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
            // Características del estudio (estudios experimentales y NO experimentales)
            // ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++

            // dani

            //// 1| Borro todos los registros de RIS_EstudioCaracteristica (filtrando por idEstudio)
            //DataTable BorrarRegistrosCaracteristicas = new DataTable();
            //BorrarRegistrosCaracteristicas = SPs.RisObtenerRegistrosEstudioCaracteristicas(int.Parse(Request["idEstudio"].ToString())).GetDataSet().Tables[0];

            //int n = 0;
            //foreach (DataRow drItems in BorrarRegistrosCaracteristicas.Rows)
            //{
            //    RisEstudioCaracteristica.Delete(int.Parse(BorrarRegistrosCaracteristicas.Rows[n][0].ToString()));
            //    n += 1;
            //}

            // ++++++++++++++++++++++++++++++++++++++++++++++++
            // Fechas de presentación de informe de avances
            // ++++++++++++++++++++++++++++++++++++++++++++++++

            if (inputFechaPresentacionInformeFinal.Value.ToString() != "")
            {
                oEstudio.FechaPresentacionInformeFinal = DateTime.Parse(inputFechaPresentacionInformeFinal.Value);
            }

            // +++++++++++++++++++++++++++++++++++++++++++
            // Area temática
            // +++++++++++++++++++++++++++++++++++++++++++

            oEstudio.IdAreaTematica = int.Parse(ddlAreaTematica.SelectedValue.ToString());

            // +++++++++++++++++++++++++++++++++++++++++++
            // Participación de población vulnerable
            // +++++++++++++++++++++++++++++++++++++++++++

            oEstudio.TienePoblacionVulnerable = ddlPoblacionVulnerable.SelectedValue;

            // 1| Borro todos los registros de RIS_EstudioPoblacionVulnerable (filtrando por idEstudio)
            DataTable BorrarRegistrosEstudioPoblacionVulnerable = new DataTable();
            BorrarRegistrosEstudioPoblacionVulnerable = SPs.RisObtenerRegistrosEstudioPoblacionVulnerable(int.Parse(Request["idEstudio"].ToString())).GetDataSet().Tables[0];


            if (BorrarRegistrosEstudioPoblacionVulnerable.Rows.Count != 0)
            {
                int k = 0;
                foreach (DataRow drItems in BorrarRegistrosEstudioPoblacionVulnerable.Rows)
                {
                    RisEstudioPoblacionVulnerable.Delete(int.Parse(BorrarRegistrosEstudioPoblacionVulnerable.Rows[k][0].ToString()));
                    k += 1;
                }
            }

            for (int i = 0; i < chkItemsPoblacionVulnerable.Items.Count; i++)
            {
                if (chkItemsPoblacionVulnerable.Items[i].Selected)
                {
                    // 2| Cargo nuevamente los registros en RIS_EstudioPoblacionVulnerable
                    RisEstudioPoblacionVulnerable oEstudioPoblacionVulnerable = new RisEstudioPoblacionVulnerable();

                    oEstudioPoblacionVulnerable.IdEstudio = int.Parse(Request["idEstudio"].ToString());
                    oEstudioPoblacionVulnerable.IdPoblacionVulnerable = int.Parse(chkItemsPoblacionVulnerable.Items[i].Value.ToString());

                    oEstudioPoblacionVulnerable.Save();
                }
            }

            // +++++++++++++++++++++++++++++++++++++++++++
            // Estudios experimentales y NO experimentales
            // +++++++++++++++++++++++++++++++++++++++++++

            //oEstudio.IdCaractaristica = int.Parse(ddlCaracteristica.SelectedValue.ToString());

            //for (int i = 0; i < chkCaracteristicasDelEstudio.Items.Count; i++)
            //{
            //    if (chkCaracteristicasDelEstudio.Items[i].Selected)
            //    {
            //        // 2| Estudios experimentales: Cargo nuevamente los registros en RIS_EstudioCaracteristica. 
            //        RisEstudioCaracteristica oEstudioCaracteristica = new RisEstudioCaracteristica();

            //        oEstudioCaracteristica.IdEstudio = int.Parse(Request["idEstudio"].ToString());
            //        oEstudioCaracteristica.IdCaracteristica = int.Parse(chkCaracteristicasDelEstudio.Items[i].Value.ToString());

            //        oEstudioCaracteristica.Save();
            //    }
            //}

            //oEstudio.OtrosCaractEstudios = txtOtrosCaractEstudios.Text.Trim();    

            // +++++++++++++++++++++++++++
            // Tamaño de la muestra
            // +++++++++++++++++++++++++++

            string cadena = txtTamanioMuestra.Text.Trim();
            if (verificarExpresionRegular("Numerica", cadena))
            {
                oEstudio.TamanioMuestra = int.Parse(cadena);
            }

            cadena = txtTiempoEstimadoAnios.Text.Trim();
            if (verificarExpresionRegular("Numerica", cadena))
            {
                oEstudio.TiempoEstimadoAnios = int.Parse(cadena);
            }

            cadena = txtTiempoEstimadoMeses.Text.Trim();
            if (verificarExpresionRegular("Numerica", cadena))
            {
                oEstudio.TiempoEstimadoMeses = int.Parse(cadena);
            }

            if (inputFechaPrimerParticipante.Value != "")
            {
                oEstudio.FechaIncorporacionPrimerParticipante = DateTime.Parse(inputFechaPrimerParticipante.Value.ToString());
            }

            if (inputFechaCierreParticipantes.Value != "")
            {
                oEstudio.FechaCierreIncorporacionParticipantes = DateTime.Parse(inputFechaCierreParticipantes.Value.ToString());
            }

            // ++++++++++++++++++++++++++++++++++
            // Fuente de recolección de datos
            // ++++++++++++++++++++++++++++++++++

            // 1| Borro todos los registros de RIS_EstudioFuenteRecoleccionDatos (filtrando por idEstudio)
            DataTable BorrarRegistrosEstudioFuenteRecoleccionDatos = new DataTable();
            BorrarRegistrosEstudioFuenteRecoleccionDatos = SPs.RisObtenerRegistrosEstudioFuenteRecoleccionDatos(int.Parse(Request["idEstudio"].ToString())).GetDataSet().Tables[0];

            if (BorrarRegistrosEstudioPoblacionVulnerable.Rows.Count != 0)
            {
                int s = 0;
                foreach (DataRow drItems in BorrarRegistrosEstudioFuenteRecoleccionDatos.Rows)
                {
                    RisEstudioFuenteRecoleccionDato.Delete(int.Parse(BorrarRegistrosEstudioFuenteRecoleccionDatos.Rows[s][0].ToString()));
                    s += 1;
                }
            }

            for (int w = 0; w < chkItemsFuenteRecoleccionDatos.Items.Count; w++)
            {
                if (chkItemsFuenteRecoleccionDatos.Items[w].Selected)
                {
                    // 2| Cargo nuevamente los registros en RIS_EstudioFuenteRecoleccionDatos
                    RisEstudioFuenteRecoleccionDato estudioFuenteRecoleccionDatos = new RisEstudioFuenteRecoleccionDato();

                    estudioFuenteRecoleccionDatos.IdEstudio = int.Parse(Request["idEstudio"].ToString());
                    estudioFuenteRecoleccionDatos.IdFuenteRecoleccionDatos = int.Parse(chkItemsFuenteRecoleccionDatos.Items[w].Value.ToString());

                    estudioFuenteRecoleccionDatos.Save();
                }
            }

            // +++++++++++++++++++++++++++
            // Duración
            // +++++++++++++++++++++++++++

            if (inputFechaPrimerParticipante.Value.ToString() != "")
            {
                oEstudio.FechaIncorporacionPrimerParticipante = DateTime.Parse(inputFechaPrimerParticipante.Value.ToString());
            }

            if (inputFechaCierreParticipantes.Value.ToString() != "")
            {
                oEstudio.FechaCierreIncorporacionParticipantes = DateTime.Parse(inputFechaCierreParticipantes.Value.ToString());
            }

            // ++++++++++++++++++++++++++++++++++++++++
            // Tipo de estudio / Lugares de realización
            // ++++++++++++++++++++++++++++++++++++++++

            oEstudio.Multicentrico = ddlEstudioMulticentrico.SelectedValue.ToString();

            // +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
            // Informe de la comisión asesora de investigaciones biomédicas en seres humanos (CAIBSH)
            // +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++

            if (inputFechaAprobadoCAIBSH.Value.ToString() != "")
            {
                oEstudio.FechaAprobadoCAIBSH = DateTime.Parse(inputFechaAprobadoCAIBSH.Value.ToString());
            }

            if (inputFechaRechazadoCAIBSH.Value.ToString() != "")
            {
                oEstudio.FechaRechazadoCAIBSH = DateTime.Parse(inputFechaRechazadoCAIBSH.Value.ToString());
            }

            if (inputFechaVencimientoPlazoCAIBSH.Value.ToString() != "")
            {
                oEstudio.FechaVencimientoPlazoCAIBSH = DateTime.Parse(inputFechaVencimientoPlazoCAIBSH.Value.ToString());
            }

            if (inputFechaRetiroEvaluacionCAIBSH.Value.ToString() != "")
            {
                oEstudio.FechaRetiroEvaluacionCAIBSH = DateTime.Parse(inputFechaRetiroEvaluacionCAIBSH.Value.ToString());
            }

            oEstudio.OtroMotivoDictamenCAIBSH = txtOtroMotivoDictamenCAIBSH.Text.Trim();

            // 1| Borro todos los registros de RIS_EstudioItemsDesaprobado (filtrando por idEstudio)
            DataTable BorrarRegistrosEstudioItemsDesaprobado = new DataTable();
            BorrarRegistrosEstudioItemsDesaprobado = SPs.RisObtenerRegistrosEstudioItemsDesaprobado(int.Parse(Request["idEstudio"].ToString())).GetDataSet().Tables[0];

            int m = 0;
            foreach (DataRow drItems in BorrarRegistrosEstudioItemsDesaprobado.Rows)
            {
                RisEstudioItemDesaprobado.Delete(int.Parse(BorrarRegistrosEstudioItemsDesaprobado.Rows[m][0].ToString()));
                m += 1;
            }

            for (int i = 0; i < chkItemsDesaprobadosCAIBSH.Items.Count; i++)
            {
                if (chkItemsDesaprobadosCAIBSH.Items[i].Selected)
                {
                    // 2| Estudios experimentales: Cargo nuevamente los registros en RIS_EstudioItemDesaprobado. 
                    RisEstudioItemDesaprobado oEstudioEtudioItemDesaprobado = new RisEstudioItemDesaprobado();

                    oEstudioEtudioItemDesaprobado.IdEstudio = int.Parse(Request["idEstudio"].ToString());
                    oEstudioEtudioItemDesaprobado.IdItemDesaprobado = int.Parse(chkItemsDesaprobadosCAIBSH.Items[i].Value.ToString());

                    oEstudioEtudioItemDesaprobado.Save();
                }
            }

            oEstudio.ObservacionesCAIBSH = txtObservacionesCAIBSH.Text.Trim();

            if (faltaInvestigadorPrincipal == "SI")
            {
                Response.Write("<script language=javascript>alert('El estudio debe tener al menos un investigador principal');</script>");
            }

            if ((hayError == "NO") && (faltaInvestigadorPrincipal == "NO"))
            {
                oEstudio.Save();
                camposObligatoriosCompletos = "SI";
            }
            else
            {
                Response.Write("<script language=javascript>alert('Los campos marcados con (*) son obligatorios');</script>");
            }
        }

        // -----------------------------------------------------------------------------------------------------------

        private void cargarCombos()
        {
            ddlInstitucionRespaldatoria.DataSource = SPs.RisCargarComboEntidades("Institucion Respaldatoria").GetDataSet().Tables[0]; // ,nota: Si bien paso como parámetro "InstitucionRespaldatoria" el SP también devuelve las que tienen valor "InstitucionRespaldatoria_EnteFinanciador".
            ddlInstitucionRespaldatoria.DataBind();
            ddlInstitucionRespaldatoria.Items.Insert(0, new ListItem("Seleccionar", "0"));

            ddlInstitucionDeReferencia.DataSource = SPs.RisCargarComboEntidades("Institucion Respaldatoria").GetDataSet().Tables[0]; // ,nota: Si bien paso como parámetro "InstitucionRespaldatoria" el SP también devuelve las que tienen valor "InstitucionRespaldatoria_EnteFinanciador".
            ddlInstitucionDeReferencia.DataBind();
            ddlInstitucionDeReferencia.Items.Insert(0, new ListItem("Seleccionar", "0"));

            ddlEnteFinanciador.DataSource = SPs.RisCargarComboEntidades("Ente Financiador").GetDataSet().Tables[0];  // ,nota: Si bien paso como parámetro "EnteFinanciador" el SP también devuelve las que tienen valor "InstitucionRespaldatoria_EnteFinanciador".
            ddlEnteFinanciador.DataBind();
            ddlEnteFinanciador.Items.Insert(0, new ListItem("Seleccionar", "0"));

            ddlAreaTematica.DataSource = RisAreaTematica.FetchAll();
            ddlAreaTematica.DataBind();
            ddlAreaTematica.Items.Insert(0, new ListItem("Seleccionar", "0"));

            ddlCaracteristicasEstudio.DataSource = SPs.RisCargarComboItemsCaracteristicasEstudio(Request["TipoDeEstudio"].ToString()).GetDataSet().Tables[0];
            ddlCaracteristicasEstudio.DataBind();

            ddlMulticentricoEfectores.DataSource = SPs.RisCargarComboEfectores().GetDataSet().Tables[0];
            ddlMulticentricoEfectores.DataBind();
            ddlMulticentricoEfectores.Items.Insert(0, new ListItem("Seleccionar", "0"));

            ddlMulticentricoProvincias.DataSource = SPs.RisCargarComboProvincias().GetDataSet().Tables[0];
            ddlMulticentricoProvincias.DataBind();
            ddlMulticentricoProvincias.Items.Insert(0, new ListItem("Seleccionar", "0"));

            ddlMulticentricoPaises.DataSource = SPs.RisCargarComboPaises().GetDataSet().Tables[0];
            ddlMulticentricoPaises.DataBind();
            ddlMulticentricoPaises.Items.Insert(0, new ListItem("Seleccionar", "0"));
        }

        // -----------------------------------------------------------------------------------------------------------

        private void cargarListaInstitucionRespaldatoria(int idEstudio)
        {
            gvListaInstitucionRespaldatoria.DataSource = SPs.RisCargarListaEntidades(idEstudio, "Institucion Respaldatoria").GetDataSet().Tables[0];
            gvListaInstitucionRespaldatoria.DataBind();
        }

        // -----------------------------------------------------------------------------------------------------------

        private void cargarListaEnteFinanciador(int idEstudio)
        {
            gvListaEnteFinanciador.DataSource = SPs.RisCargarListaEntidades(idEstudio, "Ente Financiador").GetDataSet().Tables[0];
            gvListaEnteFinanciador.DataBind();
        }

        // -----------------------------------------------------------------------------------------------------------

        private void cargarListaConcentimiento(int idEstudio)
        {
            gvListaConcentimiento.DataSource = SPs.RisCargarListaConcentimientos(idEstudio).GetDataSet().Tables[0];
            gvListaConcentimiento.DataBind();
        }

        // -----------------------------------------------------------------------------------------------------------

        private void cargarListaLugaresRealizacion(int idEstudio)
        {
            gvListaLugaresDeRealizacion.DataSource = SPs.RisCargarListaLugaresRealizacion(idEstudio).GetDataSet().Tables[0];
            gvListaLugaresDeRealizacion.DataBind();
        }

        // -----------------------------------------------------------------------------------------------------------

        private void cargarListaEnmiendas(int idEstudio)
        {
            gvListaEnmiendas.DataSource = SPs.RisCargarListaEnmiendas(idEstudio).GetDataSet().Tables[0];
            gvListaEnmiendas.DataBind();
        }

        // -----------------------------------------------------------------------------------------------------------

        private void cargarListaPresentacionInformeAvances(int idEstudio)
        {
            gvListaFechasPresentacionInformeAvances.DataSource = SPs.RisCargarListaFechasPresentacionInformeAvances(idEstudio).GetDataSet().Tables[0];
            gvListaFechasPresentacionInformeAvances.DataBind();
        }

        // -----------------------------------------------------------------------------------------------------------

        private void cargarListaInvestigadores(int idEstudio)
        {
            gvListaInvestigadores.DataSource = SPs.RisCargarListaInvestigadores(idEstudio).GetDataSet().Tables[0];
            gvListaInvestigadores.DataBind();
        }

        // -----------------------------------------------------------------------------------------------------------        

        private void cargarListaAseguradoras(int idEstudio)
        {
            gvListaAseguradora.DataSource = SPs.RisCargarListaAseguradoras(idEstudio).GetDataSet().Tables[0];
            gvListaAseguradora.DataBind();
        }

        // -----------------------------------------------------------------------------------------------------------

        private void cargarListaComiteEtica(int idEstudio)
        {
            gvListaComiteEtica.DataSource = SPs.RisCargarListaComiteEtica(idEstudio).GetDataSet().Tables[0];
            gvListaComiteEtica.DataBind();
        }

        // -----------------------------------------------------------------------------------------------------------

        private void cargarListaEvaluacionesRechazadas(int idEstudio)
        {
            gvListaEvaluacionesRechazadas.DataSource = SPs.RisCargarListaEvaluacionesRechazadas(idEstudio).GetDataSet().Tables[0];
            gvListaEvaluacionesRechazadas.DataBind();
        }

        // -----------------------------------------------------------------------------------------------------------

        private void cargarListaInformeAprobado(int idEstudio)
        {
            gvListaInformeAprobado.DataSource = SPs.RisCargarListaInformeAprobado(idEstudio).GetDataSet().Tables[0];
            gvListaInformeAprobado.DataBind();
        }

        // -----------------------------------------------------------------------------------------------------------

        private void cargarListaCaracteristicasEstudio(int idEstudio, string tipoEstudio)
        {
            gvListaCaracteristicasEstudio.DataSource = SPs.RisCargarListaCaracteristicas(idEstudio, tipoEstudio).GetDataSet().Tables[0];
            gvListaCaracteristicasEstudio.DataBind();
        }

        // -----------------------------------------------------------------------------------------------------------

        private void cargarListaEfectoresMulticentricos(int idEstudio)
        {
            gvListaEfectoresMulticentrico.DataSource = SPs.RisCargarListaEfectoresEstudioMulticentrico(idEstudio).GetDataSet().Tables[0];
            gvListaEfectoresMulticentrico.DataBind();
        }

        // -----------------------------------------------------------------------------------------------------------

        private void cargarListaProvinciasMulticentricos(int idEstudio)
        {
            gvListaProvinciasMulticentrico.DataSource = SPs.RisCargarListaProvinciasEstudioMulticentrico(idEstudio).GetDataSet().Tables[0];
            gvListaProvinciasMulticentrico.DataBind();
        }

        // -----------------------------------------------------------------------------------------------------------

        private void cargarListaPaisesMulticentricos(int idEstudio)
        {
            gvListaPaisesMulticentrico.DataSource = SPs.RisCargarListaPaisesEstudioMulticentrico(idEstudio).GetDataSet().Tables[0];
            gvListaPaisesMulticentrico.DataBind();
        }

        // -----------------------------------------------------------------------------------------------------------

        protected void gvListaInstitucionRespaldatoria_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            switch (e.CommandName)
            {
                case "borrarInstitucionRespaldatoria":
                    RisEstudioEntidad.Delete(e.CommandArgument);
                    break;
            }

            cargarListaInstitucionRespaldatoria(int.Parse(Request["idEstudio"].ToString()));
        }

        // -----------------------------------------------------------------------------------------------------------

        protected void gvListaInstitucionRespaldatoria_RowDataBound(object sender, GridViewRowEventArgs e)
        {
            if (e.Row.RowType == DataControlRowType.DataRow)
            {
                ImageButton CmdBorrarInstitucionRespaldatoria = (ImageButton)e.Row.Cells[0].Controls[1];
                CmdBorrarInstitucionRespaldatoria.CommandArgument = this.gvListaInstitucionRespaldatoria.DataKeys[e.Row.RowIndex].Value.ToString();
                CmdBorrarInstitucionRespaldatoria.CommandName = "borrarInstitucionRespaldatoria";
                CmdBorrarInstitucionRespaldatoria.ToolTip = "Borrar";
            }
        }

        // -----------------------------------------------------------------------------------------------------------

        protected void gvListaInstitucionRespaldatoria_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            this.gvListaInstitucionRespaldatoria.PageIndex = e.NewPageIndex;
            cargarListaInstitucionRespaldatoria(int.Parse(Request["idEstudio"].ToString()));
        }

        // -----------------------------------------------------------------------------------------------------------

        protected void gvListaEnteFinanciador_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            switch (e.CommandName)
            {
                case "borrarEnteFinanciador":
                    RisEstudioEntidad.Delete(e.CommandArgument);
                    break;
            }

            cargarListaEnteFinanciador(int.Parse(Request["idEstudio"].ToString()));

        }

        // -----------------------------------------------------------------------------------------------------------

        protected void gvListaEnteFinanciador_RowDataBound(object sender, GridViewRowEventArgs e)
        {
            if (e.Row.RowType == DataControlRowType.DataRow)
            {
                ImageButton CmdBorrarEnteFinanciador = (ImageButton)e.Row.Cells[0].Controls[1];
                CmdBorrarEnteFinanciador.CommandArgument = this.gvListaEnteFinanciador.DataKeys[e.Row.RowIndex].Value.ToString();
                CmdBorrarEnteFinanciador.CommandName = "borrarEnteFinanciador";
                CmdBorrarEnteFinanciador.ToolTip = "Borrar";
            }
        }

        // -----------------------------------------------------------------------------------------------------------

        protected void gvListaEnteFinanciador_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            this.gvListaEnteFinanciador.PageIndex = e.NewPageIndex;
            cargarListaEnteFinanciador(int.Parse(Request["idEstudio"].ToString()));
        }

        // -----------------------------------------------------------------------------------------------------------

        protected void btnAgregarInstitucionRespaldatoria_Click(object sender, EventArgs e)
        {
            RisEstudioEntidad oEstudioEntidad = new RisEstudioEntidad();

            if (ddlInstitucionRespaldatoria.SelectedValue != "0") // Para que no de error ...
            {
                oEstudioEntidad.IdEstudio = int.Parse(Request["idEstudio"].ToString());
                oEstudioEntidad.IdEntidad = int.Parse(ddlInstitucionRespaldatoria.SelectedValue.ToString());
                oEstudioEntidad.Save();

                // Refresh de los combos
                cargarCombos();

                // Refresh de la lista
                cargarListaInstitucionRespaldatoria(int.Parse(Request["idEstudio"].ToString()));
            }
        }

        // -----------------------------------------------------------------------------------------------------------

        protected void btnAgregarEnteFinanciador_Click(object sender, EventArgs e)
        {
            RisEstudioEntidad oEstudioEntidad = new RisEstudioEntidad();

            if (ddlEnteFinanciador.SelectedValue != "0") // Para que no de error ...
            {
                oEstudioEntidad.IdEstudio = int.Parse(Request["idEstudio"].ToString());
                oEstudioEntidad.IdEntidad = int.Parse(ddlEnteFinanciador.SelectedValue.ToString());
                oEstudioEntidad.Save();

                // Refresh de los combos
                cargarCombos();

                // Refresh de la lista
                cargarListaEnteFinanciador(int.Parse(Request["idEstudio"].ToString()));
            }
        }

        // -----------------------------------------------------------------------------------------------------------

        protected void gvListaConcentimiento_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            switch (e.CommandName)
            {
                case "borrarConcentimiento":
                    RisConcentimiento.Delete(e.CommandArgument);
                    break;
                case "editarConcentimiento":
                    Response.Redirect("ConcentimientoEdit.aspx?idEstudio=" + Request["idEstudio"].ToString() + "&idConcentimiento=" + e.CommandArgument, false);
                    break;
            }

            cargarListaConcentimiento(int.Parse(Request["idEstudio"].ToString()));
        }

        // -----------------------------------------------------------------------------------------------------------

        protected void gvListaConcentimiento_RowDataBound(object sender, GridViewRowEventArgs e)
        {
            if (e.Row.RowType == DataControlRowType.DataRow)
            {
                ImageButton CmdBorrarConcentimiento = (ImageButton)e.Row.Cells[0].Controls[1];
                CmdBorrarConcentimiento.CommandArgument = this.gvListaConcentimiento.DataKeys[e.Row.RowIndex].Value.ToString();
                CmdBorrarConcentimiento.CommandName = "borrarConcentimiento";
                CmdBorrarConcentimiento.ToolTip = "Borrar";

                ImageButton CmdEditarConcentimiento = (ImageButton)e.Row.Cells[1].Controls[1];
                CmdEditarConcentimiento.CommandArgument = this.gvListaConcentimiento.DataKeys[e.Row.RowIndex].Value.ToString();
                CmdEditarConcentimiento.CommandName = "editarConcentimiento";
                CmdEditarConcentimiento.ToolTip = "Editar";
            }
        }

        // -----------------------------------------------------------------------------------------------------------

        protected void gvListaConcentimiento_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            this.gvListaConcentimiento.PageIndex = e.NewPageIndex;
            cargarListaConcentimiento(int.Parse(Request["idEstudio"].ToString()));
        }

        // -----------------------------------------------------------------------------------------------------------

        protected void btnAgregarConcentimiento_Click(object sender, EventArgs e)
        {
            hayError = "NO";
            guardarNuevoEstudio();

            if (hayError == "NO")
            {
                string url = "ConcentimientoEdit.aspx?idEstudio=" + Request["idEstudio"].ToString().Trim() + "&idConcentimiento=0";
                Response.Redirect(url, false);

                // Refresh de la lista
                cargarListaConcentimiento(int.Parse(Request["idEstudio"].ToString()));
            }
        }

        // -----------------------------------------------------------------------------------------------------------

        protected void btnAgregarEnmienda_Click(object sender, EventArgs e)
        {
            hayError = "NO";
            guardarNuevoEstudio();

            if (hayError == "NO")
            {
                string url = "EnmiendaEdit.aspx?idEstudio=" + Request["idEstudio"].ToString().Trim() + "&idEnmienda=0";
                Response.Redirect(url, false);

                cargarListaEnmiendas(int.Parse(Request["idEstudio"].ToString()));
            }
        }

        // -----------------------------------------------------------------------------------------------------------

        protected void btnAgregarInvestigador_Click(object sender, EventArgs e)
        {
            string cadena = txtDocumentoInvestigador.Text.Trim();
            if (verificarExpresionRegular("Numerica", cadena) && (cadena.Length <= 8))
            {
                DataTable dtInvestigador = new DataTable();
                dtInvestigador = SPs.RisVerificarSiExisteInvestigador(int.Parse(txtDocumentoInvestigador.Text.Trim())).GetDataSet().Tables[0];

                if (dtInvestigador.Rows.Count != 0)
                {
                    // Cargo los datos en la tabla "RIS_EstudioInvestigador"
                    RisEstudioInvestigador oEstudioInvestigador = new RisEstudioInvestigador();
                    oEstudioInvestigador.IdEstudio = int.Parse(Request["idEstudio"].ToString().Trim());
                    oEstudioInvestigador.IdInvestigador = int.Parse(dtInvestigador.Rows[0][0].ToString().Trim());
                    oEstudioInvestigador.IdFuncionEnElEquipo = 1; //Investigador Principal
                    oEstudioInvestigador.Save();
                }
                else
                {
                    string url = "InvestigadorEdit.aspx?idEstudio=" + Request["idEstudio"].ToString().Trim() + "&idInvestigador=0" + "&numeroDocumentoInvestigador=" + txtDocumentoInvestigador.Text.Trim();
                    Response.Redirect(url, false);
                }

                cargarListaInvestigadores(int.Parse(Request["idEstudio"].ToString()));
            }
            else
            {
                hayError = "SI";
                Response.Write("<script language=javascript>alert('EL campo Documento solo permite números (máximo 8 caracteres, sin puntos)');</script>");
            }
        }

        // -----------------------------------------------------------------------------------------------------------

        protected void btnAgregarMiembroEquipo_Click(object sender, EventArgs e)
        {
            string url = "MiembroDelEquipoEdit.aspx?idEstudio=" + Request["idEstudio"].ToString().Trim() + "&idInvestigador=0";
            Response.Redirect(url, false);
        }

        // -----------------------------------------------------------------------------------------------------------

        protected void gvListaEnmiendas_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            switch (e.CommandName)
            {
                case "borrarEnmienda":

                    RisEnmienda.Delete(e.CommandArgument);

                    // Debo borrar los motivos de esta enmienda (i.e: es un borrado en cascada)
                    DataTable dtBorrarRegistrosMotivosEnmienda = new DataTable();
                    dtBorrarRegistrosMotivosEnmienda = SPs.RisObtenerRegistrosEnmiendaItemsDesaprobado(int.Parse(e.CommandArgument.ToString())).GetDataSet().Tables[0];

                    int i = 0;
                    foreach (DataRow drItems in dtBorrarRegistrosMotivosEnmienda.Rows)
                    {
                        RisEnmiendaItemDesaprobado.Delete(int.Parse(dtBorrarRegistrosMotivosEnmienda.Rows[i][0].ToString()));
                        i += 1;
                    }

                    break;

                case "editarEnmienda":

                    Response.Redirect("EnmiendaEdit.aspx?idEstudio=" + Request["idEstudio"].ToString() + "&idEnmienda=" + e.CommandArgument, false);

                    break;
            }

            cargarListaEnmiendas(int.Parse(Request["idEstudio"].ToString()));
        }

        // -----------------------------------------------------------------------------------------------------------

        protected void gvListaEnmiendas_RowDataBound(object sender, GridViewRowEventArgs e)
        {
            if (e.Row.RowType == DataControlRowType.DataRow)
            {
                ImageButton CmdBorrarEnmienda = (ImageButton)e.Row.Cells[0].Controls[1];
                CmdBorrarEnmienda.CommandArgument = this.gvListaEnmiendas.DataKeys[e.Row.RowIndex].Value.ToString();
                CmdBorrarEnmienda.CommandName = "borrarEnmienda";
                CmdBorrarEnmienda.ToolTip = "Borrar";

                ImageButton CmdEditarEnmienda = (ImageButton)e.Row.Cells[1].Controls[1];
                CmdEditarEnmienda.CommandArgument = this.gvListaEnmiendas.DataKeys[e.Row.RowIndex].Value.ToString();
                CmdEditarEnmienda.CommandName = "editarEnmienda";
                CmdEditarEnmienda.ToolTip = "Editar";
            }
        }

        // -----------------------------------------------------------------------------------------------------------

        protected void gvListaEnmiendas_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            this.gvListaEnmiendas.PageIndex = e.NewPageIndex;
            cargarListaEnmiendas(int.Parse(Request["idEstudio"].ToString()));
        }

        // -----------------------------------------------------------------------------------------------------------

        protected void gvListaInvestigador_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            switch (e.CommandName)
            {
                case "borrarInvestigador":
                    int idEstudio = int.Parse(Request["idEstudio"].ToString());
                    int idInvestigador = int.Parse(e.CommandArgument.ToString());

                    SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["SicConnectionString"].ToString());
                    conn.Open();
                    SqlCommand comm = new SqlCommand("DELETE FROM dbo.RIS_EstudioInvestigador WHERE idEstudio = " + idEstudio + " AND idInvestigador = " + idInvestigador, conn);

                    comm.ExecuteNonQuery();

                    conn.Close();
                    break;

                case "editarInvestigador":

                    // Distingo si se trata de un investigador o de un miembro del equipo (Documento != 0 --> "Investigador" ó Documento == 0 --> "Integrante del equipo").
                    DataTable dtEsInvestigador = new DataTable();
                    dtEsInvestigador = SPs.RisVerificarSiDocumentoInvestigadorEsCero(int.Parse(e.CommandArgument.ToString())).GetDataSet().Tables[0];

                    if (dtEsInvestigador.Rows.Count != 0)
                    {
                        Response.Redirect("InvestigadorEdit.aspx?idEstudio=" + Request["idEstudio"].ToString() + "&idInvestigador=" + e.CommandArgument + "&numeroDocumentoInvestigador=0", false);
                    }
                    else
                    {
                        Response.Redirect("MiembroDelEquipoEdit.aspx?idEstudio=" + Request["idEstudio"].ToString() + "&idInvestigador=" + e.CommandArgument, false);
                    }

                    break;
            }

            cargarListaInvestigadores(int.Parse(Request["idEstudio"].ToString()));
        }

        // -----------------------------------------------------------------------------------------------------------

        protected void gvListaInvestigador_RowDataBound(object sender, GridViewRowEventArgs e)
        {
            if (e.Row.RowType == DataControlRowType.DataRow)
            {
                ImageButton CmdBorrarInvestigador = (ImageButton)e.Row.Cells[0].Controls[1];
                CmdBorrarInvestigador.CommandArgument = this.gvListaInvestigadores.DataKeys[e.Row.RowIndex].Value.ToString();
                CmdBorrarInvestigador.CommandName = "borrarInvestigador";
                CmdBorrarInvestigador.ToolTip = "Borrar";

                ImageButton CmdEditarInvestigador = (ImageButton)e.Row.Cells[1].Controls[1];
                CmdEditarInvestigador.CommandArgument = this.gvListaInvestigadores.DataKeys[e.Row.RowIndex].Value.ToString();
                CmdEditarInvestigador.CommandName = "editarInvestigador";
                CmdEditarInvestigador.ToolTip = "Editar";
            }
        }

        // -----------------------------------------------------------------------------------------------------------

        protected void gvListaLugaresDeRealizacion_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            switch (e.CommandName)
            {
                case "borrarLugarRealizacion":
                    RisLugarRealizacion.Delete(e.CommandArgument);
                    break;
                case "editarLugarRealizacion":
                    Response.Redirect("LugarDeRealizacionEdit.aspx?idEstudio=" + Request["idEstudio"].ToString() + "&idLugarDeRealizacion=" + e.CommandArgument, false);
                    break;
            }

            cargarListaLugaresRealizacion(int.Parse(Request["idEstudio"].ToString()));
        }

        // -----------------------------------------------------------------------------------------------------------

        protected void gvListaLugaresDeRealizacion_RowDataBound(object sender, GridViewRowEventArgs e)
        {
            if (e.Row.RowType == DataControlRowType.DataRow)
            {
                ImageButton CmdBorrarLugarRealizacion = (ImageButton)e.Row.Cells[0].Controls[1];
                CmdBorrarLugarRealizacion.CommandArgument = this.gvListaLugaresDeRealizacion.DataKeys[e.Row.RowIndex].Value.ToString();
                CmdBorrarLugarRealizacion.CommandName = "borrarLugarRealizacion";
                CmdBorrarLugarRealizacion.ToolTip = "Borrar";

                ImageButton CmdEditarLugarRealizacion = (ImageButton)e.Row.Cells[1].Controls[1];
                CmdEditarLugarRealizacion.CommandArgument = this.gvListaLugaresDeRealizacion.DataKeys[e.Row.RowIndex].Value.ToString();
                CmdEditarLugarRealizacion.CommandName = "editarLugarRealizacion";
                CmdEditarLugarRealizacion.ToolTip = "Editar";
            }
        }

        // -----------------------------------------------------------------------------------------------------------

        protected void btnAgregarLugaresDeRealizacion_Click(object sender, EventArgs e)
        {
            hayError = "NO";
            guardarNuevoEstudio();

            if (hayError == "NO")
            {
                string url = "LugarDeRealizacionEdit.aspx?idEstudio=" + Request["idEstudio"].ToString().Trim() + "&idLugarDeRealizacion=0";
                Response.Redirect(url, false);

                // Refresh de la lista
                cargarListaLugaresRealizacion(int.Parse(Request["idEstudio"].ToString()));
            }
        }

        // -----------------------------------------------------------------------------------------------------------

        protected void gvListaAseguradora_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            switch (e.CommandName)
            {
                case "borrarAseguradora":
                    RisEstudioAseguradora.Delete(e.CommandArgument);
                    break;
                case "editarAseguradora":
                    Response.Redirect("SeguroDeDaniosEdit.aspx?idEstudio=" + Request["idEstudio"].ToString() + "&idEstudioAseguradora=" + e.CommandArgument, false);
                    break;
            }

            cargarListaAseguradoras(int.Parse(Request["idEstudio"].ToString()));
        }

        // -----------------------------------------------------------------------------------------------------------

        protected void gvListaAseguradora_RowDataBound(object sender, GridViewRowEventArgs e)
        {
            if (e.Row.RowType == DataControlRowType.DataRow)
            {
                ImageButton CmdBorrarAseguradora = (ImageButton)e.Row.Cells[0].Controls[1];
                CmdBorrarAseguradora.CommandArgument = this.gvListaAseguradora.DataKeys[e.Row.RowIndex].Value.ToString();
                CmdBorrarAseguradora.CommandName = "borrarAseguradora";
                CmdBorrarAseguradora.ToolTip = "Borrar";

                ImageButton CmdEditarAseguradora = (ImageButton)e.Row.Cells[1].Controls[1];
                CmdEditarAseguradora.CommandArgument = this.gvListaAseguradora.DataKeys[e.Row.RowIndex].Value.ToString();
                CmdEditarAseguradora.CommandName = "editarAseguradora";
                CmdEditarAseguradora.ToolTip = "Editar";
            }
        }

        // -----------------------------------------------------------------------------------------------------------

        protected void btnAgregarAseguradora_Click(object sender, EventArgs e)
        {
            hayError = "NO";
            guardarNuevoEstudio();

            if (hayError == "NO")
            {
                string url = "SeguroDeDaniosEdit.aspx?idEstudio=" + Request["idEstudio"].ToString().Trim() + "&idEstudioAseguradora=0";
                Response.Redirect(url, false);

                // Refresh de la lista
                cargarListaAseguradoras(int.Parse(Request["idEstudio"].ToString()));
            }
        }

        // -----------------------------------------------------------------------------------------------------------

        protected void gvListaComiteEtica_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            switch (e.CommandName)
            {
                case "borrarComiteEtica":
                    RisEstudioComiteEtica.Delete(e.CommandArgument);
                    break;
                case "editarComiteEtica":
                    Response.Redirect("ComiteEticaInvestigacionEdit.aspx?idEstudio=" + Request["idEstudio"].ToString() + "&idEstudioComiteEtica=" + e.CommandArgument, false);
                    break;
            }

            cargarListaComiteEtica(int.Parse(Request["idEstudio"].ToString()));
        }

        // -----------------------------------------------------------------------------------------------------------

        protected void gvListaComiteEtica_RowDataBound(object sender, GridViewRowEventArgs e)
        {
            if (e.Row.RowType == DataControlRowType.DataRow)
            {
                ImageButton CmdBorrarComiteEtica = (ImageButton)e.Row.Cells[0].Controls[1];
                CmdBorrarComiteEtica.CommandArgument = this.gvListaComiteEtica.DataKeys[e.Row.RowIndex].Value.ToString();
                CmdBorrarComiteEtica.CommandName = "borrarComiteEtica";
                CmdBorrarComiteEtica.ToolTip = "Borrar";

                ImageButton CmdEditarComiteEtica = (ImageButton)e.Row.Cells[1].Controls[1];
                CmdEditarComiteEtica.CommandArgument = this.gvListaComiteEtica.DataKeys[e.Row.RowIndex].Value.ToString();
                CmdEditarComiteEtica.CommandName = "editarComiteEtica";
                CmdEditarComiteEtica.ToolTip = "Editar";
            }
        }

        // -----------------------------------------------------------------------------------------------------------


        protected void btnAgregarComiteEtica_Click(object sender, EventArgs e)
        {
            hayError = "NO";
            guardarNuevoEstudio();

            if (hayError == "NO")
            {
                string url = "ComiteEticaInvestigacionEdit.aspx?idEstudio=" + Request["idEstudio"].ToString().Trim() + "&idEstudioComiteEtica=0";
                Response.Redirect(url, false);

                // Refresh de la lista
                cargarListaComiteEtica(int.Parse(Request["idEstudio"].ToString()));
            }
        }

        // -----------------------------------------------------------------------------------------------------------

        protected void gvListaInformeAprobado_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            switch (e.CommandName)
            {
                case "borrarInformeAprobado":
                    RisEstudioItemAprobado.Delete(e.CommandArgument);
                    break;
                case "editarInformeAprobado":
                    Response.Redirect("HistorialAprobacionesDelEstudio.aspx?idEstudio=" + Request["idEstudio"].ToString() + "&idEstudioItemAprobado=" + e.CommandArgument, false);
                    break;
            }

            cargarListaInformeAprobado(int.Parse(Request["idEstudio"].ToString()));
        }

        // -----------------------------------------------------------------------------------------------------------

        protected void gvListaInformeAprobado_RowDataBound(object sender, GridViewRowEventArgs e)
        {
            if (e.Row.RowType == DataControlRowType.DataRow)
            {
                ImageButton CmdBorrarInformeAprobado = (ImageButton)e.Row.Cells[0].Controls[1];
                CmdBorrarInformeAprobado.CommandArgument = this.gvListaInformeAprobado.DataKeys[e.Row.RowIndex].Value.ToString();
                CmdBorrarInformeAprobado.CommandName = "borrarInformeAprobado";
                CmdBorrarInformeAprobado.ToolTip = "Borrar";

                ImageButton CmdEditarInformeAprobado = (ImageButton)e.Row.Cells[1].Controls[1];
                CmdEditarInformeAprobado.CommandArgument = this.gvListaInformeAprobado.DataKeys[e.Row.RowIndex].Value.ToString();
                CmdEditarInformeAprobado.CommandName = "editarInformeAprobado";
                CmdEditarInformeAprobado.ToolTip = "Editar";
            }
        }

        // -----------------------------------------------------------------------------------------------------------

        protected void btnAgregarInformeAprobado_Click(object sender, EventArgs e)
        {
            hayError = "NO";
            guardarNuevoEstudio();

            if (hayError == "NO")
            {
                string url = "HistorialAprobacionesDelEstudio.aspx?idEstudio=" + Request["idEstudio"].ToString().Trim() + "&idEstudioItemAprobado=0";
                Response.Redirect(url, false);

                // Refresh de la lista
                cargarListaInformeAprobado(int.Parse(Request["idEstudio"].ToString()));
            }
        }

        // -----------------------------------------------------------------------------------------------------------

        protected void gvListaFechasPresentacionInformeAvances_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            switch (e.CommandName)
            {
                case "borrarFechaPresentacionAvance":
                    RisPresentacionInforme.Delete(e.CommandArgument);
                    break;
                case "editarFechaPresentacionAvance":
                    Response.Redirect("FechaPresentacionInformeEdit.aspx?idEstudio=" + Request["idEstudio"].ToString() + "&idPresentacionInforme=" + e.CommandArgument, false);
                    break;
            }

            cargarListaPresentacionInformeAvances(int.Parse(Request["idEstudio"].ToString()));
        }

        // -----------------------------------------------------------------------------------------------------------

        protected void gvListaFechasPresentacionInformeAvances_RowDataBound(object sender, GridViewRowEventArgs e)
        {
            if (e.Row.RowType == DataControlRowType.DataRow)
            {
                ImageButton CmdBorrarFechaPresentacionAvance = (ImageButton)e.Row.Cells[0].Controls[1];
                CmdBorrarFechaPresentacionAvance.CommandArgument = this.gvListaFechasPresentacionInformeAvances.DataKeys[e.Row.RowIndex].Value.ToString();
                CmdBorrarFechaPresentacionAvance.CommandName = "borrarFechaPresentacionAvance";
                CmdBorrarFechaPresentacionAvance.ToolTip = "Borrar";

                ImageButton CmdEditarFechaPresentacionAvance = (ImageButton)e.Row.Cells[1].Controls[1];
                CmdEditarFechaPresentacionAvance.CommandArgument = this.gvListaFechasPresentacionInformeAvances.DataKeys[e.Row.RowIndex].Value.ToString();
                CmdEditarFechaPresentacionAvance.CommandName = "editarFechaPresentacionAvance";
                CmdEditarFechaPresentacionAvance.ToolTip = "Editar";
            }
        }

        // -----------------------------------------------------------------------------------------------------------

        protected void btnNormaLegal_Click(object sender, EventArgs e)
        {
            //hayError = "NO";
            //guardarNuevoEstudio();

            //if (hayError == "NO")
            //{
            //    // Falta completar !!!!!
            //    // Falta completar !!!!!
            //    // Falta completar !!!!!
            //    // Falta completar !!!!!
            //}
        }

        // -----------------------------------------------------------------------------------------------------------

        protected void btnGuardarEstudio_Click(object sender, EventArgs e)
        {
            hayError = "NO";
            guardarNuevoEstudio();
        }

        // -----------------------------------------------------------------------------------------------------------

        protected void btnCerrarEstudio_Click(object sender, EventArgs e)
        {
            string url = "BuscadorEstudio.aspx";
            Response.Redirect(url, false);
        }

        // -----------------------------------------------------------------------------------------------------------

        protected void ddlEstudioMulticentrico_SelectedIndexChanged(object sender, EventArgs e)
        {
            if (ddlEstudioMulticentrico.SelectedValue == "SI")
            {
                pnlMulticentrico.Visible = true;
            }
            else
            {
                pnlMulticentrico.Visible = false;
            }
        }

        // -----------------------------------------------------------------------------------------------------------

        protected void btnAgregarFechasPresentacionInformes_Click(object sender, EventArgs e)
        {
            hayError = "NO";
            guardarNuevoEstudio();

            if (hayError == "NO")
            {
                string url = "FechaPresentacionInformeEdit.aspx?idEstudio=" + Request["idEstudio"].ToString().Trim() + "&idPresentacionInforme=0";
                Response.Redirect(url, false);

                // Refresh de la lista
                cargarListaPresentacionInformeAvances(int.Parse(Request["idEstudio"].ToString()));
            }
        }

        // -----------------------------------------------------------------------------------------------------------

        protected void btnAgregarEvaluacionRechazada_Click(object sender, EventArgs e)
        {
            hayError = "NO";
            guardarNuevoEstudio();

            if (hayError == "NO")
            {
                string url = "EvaluacionRechazada.aspx?idEstudio=" + Request["idEstudio"].ToString().Trim() + "&idEvaluacionRechazada=0";
                Response.Redirect(url, false);

                // Refresh de la lista
                cargarListaEvaluacionesRechazadas(int.Parse(Request["idEstudio"].ToString()));
            }
        }

        // -----------------------------------------------------------------------------------------------------------

        protected void gvListaEvaluacionesRechazadas_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            switch (e.CommandName)
            {
                case "borrarEvaluacionRechazada":
                    RisEvaluacionRechazada.Delete(e.CommandArgument);
                    break;
                case "editarEvaluacionRechazada":
                    Response.Redirect("EvaluacionRechazada.aspx?idEstudio=" + Request["idEstudio"].ToString() + "&idEvaluacionRechazada=" + e.CommandArgument, false);
                    break;
            }

            cargarListaEvaluacionesRechazadas(int.Parse(Request["idEstudio"].ToString()));
        }

        // -----------------------------------------------------------------------------------------------------------

        protected void gvListaEvaluacionesRechazadas_RowDataBound(object sender, GridViewRowEventArgs e)
        {
            if (e.Row.RowType == DataControlRowType.DataRow)
            {
                ImageButton CmdBorrarEvaluacionRechazada = (ImageButton)e.Row.Cells[0].Controls[1];
                CmdBorrarEvaluacionRechazada.CommandArgument = this.gvListaEvaluacionesRechazadas.DataKeys[e.Row.RowIndex].Value.ToString();
                CmdBorrarEvaluacionRechazada.CommandName = "borrarEvaluacionRechazada";
                CmdBorrarEvaluacionRechazada.ToolTip = "Borrar";

                ImageButton CmdEditarEvaluacionRechazada = (ImageButton)e.Row.Cells[1].Controls[1];
                CmdEditarEvaluacionRechazada.CommandArgument = this.gvListaEvaluacionesRechazadas.DataKeys[e.Row.RowIndex].Value.ToString();
                CmdEditarEvaluacionRechazada.CommandName = "editarEvaluacionRechazada";
                CmdEditarEvaluacionRechazada.ToolTip = "Editar";
            }
        }

        // -----------------------------------------------------------------------------------------------------------

        protected void btnAgregarCaracteristicaEstudio_Click(object sender, EventArgs e)
        {
            RisEstudioCaracteristica estudioCaracteristica = new RisEstudioCaracteristica();

            if (ddlCaracteristicasEstudio.SelectedValue != "0") // Para que no de error ...
            {
                estudioCaracteristica.IdEstudio = int.Parse(Request["idEstudio"].ToString());
                estudioCaracteristica.IdCaracteristica = int.Parse(ddlCaracteristicasEstudio.SelectedValue.ToString());

                estudioCaracteristica.Save();

                // Refresh de los combos
                cargarCombos();

                // Refresh de la lista
                cargarListaCaracteristicasEstudio(int.Parse(Request["idEstudio"].ToString()), Request["TipoDeEstudio"].ToString().Trim());
            }
        }

        // -----------------------------------------------------------------------------------------------------------

        protected void gvListaCaracteristicasEstudio_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            this.gvListaCaracteristicasEstudio.PageIndex = e.NewPageIndex;
            cargarListaCaracteristicasEstudio(int.Parse(Request["idEstudio"].ToString()), Request["TipoDeEstudio"].ToString().Trim());
        }

        // -----------------------------------------------------------------------------------------------------------

        protected void gvListaCaracteristicasEstudio_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            switch (e.CommandName)
            {
                case "borrarCaracteristicasEstudio":
                    RisEstudioCaracteristica.Delete(e.CommandArgument);
                    break;
            }

            cargarListaCaracteristicasEstudio(int.Parse(Request["idEstudio"].ToString()), Request["TipoDeEstudio"].ToString().Trim());
        }

        // -----------------------------------------------------------------------------------------------------------

        protected void gvListaCaracteristicasEstudio_RowDataBound(object sender, GridViewRowEventArgs e)
        {
            if (e.Row.RowType == DataControlRowType.DataRow)
            {
                ImageButton CmdBorrarCaracteristicasEstudio = (ImageButton)e.Row.Cells[0].Controls[1];
                CmdBorrarCaracteristicasEstudio.CommandArgument = this.gvListaCaracteristicasEstudio.DataKeys[e.Row.RowIndex].Value.ToString();
                CmdBorrarCaracteristicasEstudio.CommandName = "borrarCaracteristicasEstudio";
                CmdBorrarCaracteristicasEstudio.ToolTip = "Borrar";
            }
        }

        // -----------------------------------------------------------------------------------------------------------

        // &&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&
        // &&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&
        // &&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&


        protected void gvListaEfectoresMulticentrico_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            switch (e.CommandName)
            {
                case "borrarEfectorMulticentrico":
                    RisEstudioSysEfectorMulticentrico.Delete(e.CommandArgument);
                    break;
            }

            cargarListaEfectoresMulticentricos(int.Parse(Request["idEstudio"].ToString()));
        }

        // -----------------------------------------------------------------------------------------------------------

        protected void gvListaEfectoresMulticentrico_RowDataBound(object sender, GridViewRowEventArgs e)
        {
            if (e.Row.RowType == DataControlRowType.DataRow)
            {
                ImageButton CmdBorrarEfectorMulticentrico = (ImageButton)e.Row.Cells[0].Controls[1];
                CmdBorrarEfectorMulticentrico.CommandArgument = this.gvListaEfectoresMulticentrico.DataKeys[e.Row.RowIndex].Value.ToString();
                CmdBorrarEfectorMulticentrico.CommandName = "borrarEfectorMulticentrico";
                CmdBorrarEfectorMulticentrico.ToolTip = "Borrar";
            }
        }

        // -----------------------------------------------------------------------------------------------------------

        protected void gvListaProvinciasMulticentrico_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            switch (e.CommandName)
            {
                case "borrarProvinciaMulticentrico":
                    RisEstudioSysProvinciaMulticentrico.Delete(e.CommandArgument);
                    break;
            }

            cargarListaProvinciasMulticentricos(int.Parse(Request["idEstudio"].ToString()));
        }

        // -----------------------------------------------------------------------------------------------------------

        protected void gvListaProvinciasMulticentrico_RowDataBound(object sender, GridViewRowEventArgs e)
        {
            if (e.Row.RowType == DataControlRowType.DataRow)
            {
                ImageButton CmdBorrarProvinciaMulticentrico = (ImageButton)e.Row.Cells[0].Controls[1];
                CmdBorrarProvinciaMulticentrico.CommandArgument = this.gvListaProvinciasMulticentrico.DataKeys[e.Row.RowIndex].Value.ToString();
                CmdBorrarProvinciaMulticentrico.CommandName = "borrarProvinciaMulticentrico";
                CmdBorrarProvinciaMulticentrico.ToolTip = "Borrar";
            }
        }

        // -----------------------------------------------------------------------------------------------------------

        protected void gvListaPaisesMulticentrico_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            switch (e.CommandName)
            {
                case "borrarPaisMulticentrico":
                    RisEstudioSysPaisMulticentrico.Delete(e.CommandArgument);
                    break;
            }

            cargarListaPaisesMulticentricos(int.Parse(Request["idEstudio"].ToString()));
        }

        // -----------------------------------------------------------------------------------------------------------

        protected void gvListaPaisesMulticentrico_RowDataBound(object sender, GridViewRowEventArgs e)
        {
            if (e.Row.RowType == DataControlRowType.DataRow)
            {
                ImageButton CmdBorrarPaisMulticentrico = (ImageButton)e.Row.Cells[0].Controls[1];
                CmdBorrarPaisMulticentrico.CommandArgument = this.gvListaPaisesMulticentrico.DataKeys[e.Row.RowIndex].Value.ToString();
                CmdBorrarPaisMulticentrico.CommandName = "borrarPaisMulticentrico";
                CmdBorrarPaisMulticentrico.ToolTip = "Borrar";
            }
        }

        // -----------------------------------------------------------------------------------------------------------

        protected void btnAgregarMulticentricoEfector_Click(object sender, EventArgs e)
        {
            RisEstudioSysEfectorMulticentrico efectorMulticentrico = new RisEstudioSysEfectorMulticentrico();

            if (ddlMulticentricoEfectores.SelectedValue != "0") // Para que no de error ...
            {
                efectorMulticentrico.IdEstudio = int.Parse(Request["idEstudio"].ToString());
                efectorMulticentrico.IdEfector = int.Parse(ddlMulticentricoEfectores.SelectedValue.ToString());

                efectorMulticentrico.Save();

                // Refresh de los combos
                cargarCombos();

                // Refresh de la lista
                cargarListaEfectoresMulticentricos(int.Parse(Request["idEstudio"].ToString()));
            }
        }

        // -----------------------------------------------------------------------------------------------------------

        protected void btnAgregarMulticentricoProvincia_Click(object sender, EventArgs e)
        {
            RisEstudioSysProvinciaMulticentrico provinciaMulticentrico = new RisEstudioSysProvinciaMulticentrico();

            if (ddlMulticentricoProvincias.SelectedValue != "0") // Para que no de error ...
            {
                provinciaMulticentrico.IdEstudio = int.Parse(Request["idEstudio"].ToString());
                provinciaMulticentrico.IdProvincia = int.Parse(ddlMulticentricoProvincias.SelectedValue.ToString());

                provinciaMulticentrico.Save();

                // Refresh de los combos
                cargarCombos();

                // Refresh de la lista
                cargarListaProvinciasMulticentricos(int.Parse(Request["idEstudio"].ToString()));
            }
        }

        // -----------------------------------------------------------------------------------------------------------

        protected void btnAgregarMulticentricoPaise_Click(object sender, EventArgs e)
        {
            RisEstudioSysPaisMulticentrico paisMulticentrico = new RisEstudioSysPaisMulticentrico();

            if (ddlMulticentricoPaises.SelectedValue != "0") // Para que no de error ...
            {
                paisMulticentrico.IdEstudio = int.Parse(Request["idEstudio"].ToString());
                paisMulticentrico.IdPais = int.Parse(ddlMulticentricoPaises.SelectedValue.ToString());

                paisMulticentrico.Save();

                // Refresh de los combos
                cargarCombos();

                // Refresh de la lista
                cargarListaPaisesMulticentricos(int.Parse(Request["idEstudio"].ToString()));
            }
        }

        // -----------------------------------------------------------------------------------------------------------

        protected void chkItemsPoblacionVulnerable_SelectedIndexChanged(object sender, EventArgs e)
        {
            if (ddlPoblacionVulnerable.SelectedValue == "SI")
            {
                pnlItemsPoblacionVulnerable.Visible = true;
            }
            else
            {
                pnlItemsPoblacionVulnerable.Visible = false;
            }
        }

        // -----------------------------------------------------------------------------------------------------------

        protected void btnGuardarEstudioMedio_Click(object sender, EventArgs e)
        {
            hayError = "NO";
            guardarNuevoEstudio();

            if ((hayError == "NO") && (Session["RIS_llamada_desde_Nuevo_Registro"].ToString().Trim() == "SI"))
            {
                Session["RIS_llamada_desde_Nuevo_Registro"] = "NO";
                ocultarCampos(true);
            }
        }

        // -----------------------------------------------------------------------------------------------------------
    }
}
