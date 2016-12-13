using System;
using System.Web.UI;
using System.Web.UI.WebControls;
using DalRis;
using System.Data;

namespace SIPS.RIS
{
    public partial class BuscadorEstudio : System.Web.UI.Page
    {

        // -----------------------------------------------------------------------------------------------------------

        protected void Page_Load(object sender, EventArgs e)
        {
            if (IsPostBack) return;
        }

        // -----------------------------------------------------------------------------------------------------------

        private void cargarListaEstudios(DataTable dt)
        {
            gvListaEstudiosEncontrados.DataSource = dt;
            gvListaEstudiosEncontrados.DataBind();
        }

        // -----------------------------------------------------------------------------------------------------------

        protected void gvListaEstudiosEncontrados_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            this.gvListaEstudiosEncontrados.PageIndex = e.NewPageIndex;
            buscarEstudios();
        }

        // -----------------------------------------------------------------------------------------------------------

        protected void gvListaEstudiosEncontrados_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            switch (e.CommandName)
            {
                case "detalleEstudio":

                    RisEstudio oEstudio = new RisEstudio(int.Parse(e.CommandArgument.ToString()));

                    Session["RIS_nuevo_registro"] = "NO";
                    Session["RIS_llamada_desde_Nuevo_Registro"] = "NO";
                    Response.Redirect("EstudioEdit.aspx?idEstudio=" + e.CommandArgument + "&TipoDeEstudio=" + oEstudio.TipoEstudio.ToString().Trim(), false);
                    break;
            }
        }

        // -----------------------------------------------------------------------------------------------------------

        protected void gvListaEstudiosEncontrados_RowDataBound(object sender, GridViewRowEventArgs e)
        {
            if (e.Row.RowType == DataControlRowType.DataRow)
            {
                ImageButton CmdDetalleEstudio = (ImageButton)e.Row.Cells[0].Controls[1];
                CmdDetalleEstudio.CommandArgument = this.gvListaEstudiosEncontrados.DataKeys[e.Row.RowIndex].Value.ToString();
                CmdDetalleEstudio.CommandName = "detalleEstudio";
                CmdDetalleEstudio.ToolTip = "Detalle del estudio";
            }
        }

        // -----------------------------------------------------------------------------------------------------------

        protected void btnNuevoRegistro_Click(object sender, EventArgs e)
        {
            Session["RIS_llamada_desde_Nuevo_Registro"] = "SI";
            
            string url = "SeleccionarTipoEstudio.aspx";
            Response.Redirect(url, false);        
        }

        // -----------------------------------------------------------------------------------------------------------------

        private void buscarEstudios()
        {
            if (txtCriterioBusqueda.Text == "")
            {
                Response.Write("<script language=javascript>alert('El campo de búsqueda no puede ser vacio !');</script>");
            }
            else
            {
                // ------------------------------------------------------------------------
                // Busco los datos en la base
                // ------------------------------------------------------------------------

                DataTable dtBuscadorEnEstudios = new DataTable();
                dtBuscadorEnEstudios = SPs.RisBuscadorEnEstudios().GetDataSet().Tables[0];

                DataTable dtBuscadorEnEntidades = new DataTable();
                dtBuscadorEnEntidades = SPs.RisBuscadorEnEntidades().GetDataSet().Tables[0];

                DataTable dtBuscadorEnInvestigadores = new DataTable();
                dtBuscadorEnInvestigadores = SPs.RisBuscadorEnInvestigadores().GetDataSet().Tables[0];

                DataTable dtBuscadorEnLugarRealizacion = new DataTable();
                dtBuscadorEnLugarRealizacion = SPs.RisBuscadorEnLugarRealizacion().GetDataSet().Tables[0];

                // ------------------------------------------------------------------------                
                // Armo el datatable para poder buscar
                // ------------------------------------------------------------------------                

                DataTable dtBuscador_AUX = new DataTable();

                dtBuscador_AUX.Columns.Add("idEstudio");
                dtBuscador_AUX.Columns.Add("investigador");
                dtBuscador_AUX.Columns.Add("tituloInvestigacion");
                dtBuscador_AUX.Columns.Add("nombreInstitucionAfiliacion");
                dtBuscador_AUX.Columns.Add("tipoEstudio");
                dtBuscador_AUX.Columns.Add("campoBusqueda");

                string campoBusqueda, investigador, tituloInvestigacion, nombreInstitucionAfiliacion, tipoEstudio;
                
                for (int i = 0; i < dtBuscadorEnEstudios.Rows.Count; i++)
                {
                    investigador = "";

                    campoBusqueda = dtBuscadorEnEstudios.Rows[i].ItemArray[1].ToString();
                    tituloInvestigacion = dtBuscadorEnEstudios.Rows[i].ItemArray[2].ToString();
                    nombreInstitucionAfiliacion = dtBuscadorEnEstudios.Rows[i].ItemArray[3].ToString();
                    tipoEstudio = dtBuscadorEnEstudios.Rows[i].ItemArray[4].ToString();

                    for (int j = 0; j < dtBuscadorEnEntidades.Rows.Count; j++)
                    {
                        if (dtBuscadorEnEntidades.Rows[j].ItemArray[0].ToString() == dtBuscadorEnEstudios.Rows[i].ItemArray[0].ToString())
                        {
                            campoBusqueda = campoBusqueda + " " + dtBuscadorEnEntidades.Rows[j].ItemArray[1].ToString();
                        }
                    }

                    for (int k = 0; k < dtBuscadorEnInvestigadores.Rows.Count; k++)
                    {
                        if (dtBuscadorEnInvestigadores.Rows[k].ItemArray[0].ToString() == dtBuscadorEnEstudios.Rows[i].ItemArray[0].ToString())
                        {
                            campoBusqueda = campoBusqueda + " " + dtBuscadorEnInvestigadores.Rows[k].ItemArray[1].ToString();
                            investigador = dtBuscadorEnInvestigadores.Rows[k].ItemArray[2].ToString();                            
                        }
                    }

                    for (int m = 0; m < dtBuscadorEnLugarRealizacion.Rows.Count; m++)
                    {
                        if (dtBuscadorEnLugarRealizacion.Rows[m].ItemArray[0].ToString() == dtBuscadorEnEstudios.Rows[i].ItemArray[0].ToString())
                        {
                            campoBusqueda = campoBusqueda + " " + dtBuscadorEnLugarRealizacion.Rows[m].ItemArray[1].ToString();
                        }
                    }

                    dtBuscador_AUX.Rows.Add(dtBuscadorEnEstudios.Rows[i].ItemArray[0],
                                            investigador,
                                            tituloInvestigacion,
                                            nombreInstitucionAfiliacion,
                                            tipoEstudio,
                                            campoBusqueda);
                }

                // ------------------------------------------------------------------------                
                // Busco en la tabla que construí
                // ------------------------------------------------------------------------    

                // ,nota: Por cada una de las palabras busco que todas esten contenidas en uno de los
                //        registros cargados en dtBuscador_AUX.
                //        Recordar que lo estoy trabajando como un "AND".

                string s = txtCriterioBusqueda.Text.Trim();
                bool existe = false;

                DataTable dtResultadoBusqueda = new DataTable();

                dtResultadoBusqueda.Columns.Add("idEstudio");
                dtResultadoBusqueda.Columns.Add("investigador");
                dtResultadoBusqueda.Columns.Add("tituloInvestigacion");
                dtResultadoBusqueda.Columns.Add("nombreInstitucionAfiliacion");
                dtResultadoBusqueda.Columns.Add("tipoEstudio");

                s = s.ToUpper();

                for (int n = 0; n < dtBuscador_AUX.Rows.Count; n++)
                {
                    string[] words = s.Split(' ');  // ,nota: Mi separador es un "espacio en blanco".

                    foreach (string word in words)
                    {
                        campoBusqueda = dtBuscador_AUX.Rows[n].ItemArray[5].ToString().Trim(); // ,nota: La posición 5 corresponde a la columna "campoBusqueda".
                        campoBusqueda = campoBusqueda.ToUpper(); // ,nota: El buscador NO es case sensitive.
                        existe = campoBusqueda.Contains(word);

                        if (existe == false)
                        {
                            break;
                        }
                    }

                    if (existe == true)
                    {
                        // ,nota: En el caso de que una investigación tenga mas de un investigador en la grilla
                        //        debe figurar un investigador principal. Recordar que se exige al usuario que
                        //        el primer investigador que se carga debe se el principal (puede haber mas de uno).

                        // ,nota: Si tiene mas de un investigador principal considero el primero de la grilla (fila = 0).
                        DataTable dtInvestigadorPrincipal = new DataTable();
                        dtInvestigadorPrincipal = SPs.RisObtenerInvestigadorPrincipal(int.Parse(dtBuscador_AUX.Rows[n].ItemArray[0].ToString())).GetDataSet().Tables[0];

                        string nombreInvestigador = "no tiene investigador principal !";

                        if (dtInvestigadorPrincipal.Rows.Count != 0)
                        {
                            nombreInvestigador = dtInvestigadorPrincipal.Rows[0].ItemArray[3].ToString().Trim();
                        }

                        dtResultadoBusqueda.Rows.Add(dtBuscador_AUX.Rows[n].ItemArray[0],
                                                     nombreInvestigador,
                                                     dtBuscador_AUX.Rows[n].ItemArray[2],
                                                     dtBuscador_AUX.Rows[n].ItemArray[3],
                                                     dtBuscador_AUX.Rows[n].ItemArray[4]);
                    }
                }

                cargarListaEstudios(dtResultadoBusqueda);

            }
        }

        // -----------------------------------------------------------------------------------------------------------


        protected void btnBuscar_Click(object sender, EventArgs e)
        {            
            buscarEstudios();
        }

        // -----------------------------------------------------------------------------------------------------------
    }
}
