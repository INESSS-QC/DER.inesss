#' Requêtes SQL
#'
#' @return `string`
#' @keywords internal
#' @encoding UTF-8
#' @export
query_V_FORME_MED <- function() {
  return(cat(
    "select\n",
    "  f.NMED_COD_FORME_MED as COD_FORME,\n",
    "  f.NMED_NOM_FORME as NOM_FORME,\n",
    "  f.NMED_NOM_FORME_ABR as NOM_FORME_ABR,\n",
    "  f.NMED_NOM_ANGL_FORME as NOM_ANGL_FORME,\n",
    "  f.NMED_COD_TYP_FORME as COD_TYP_FORME,\n",
    "  d.CODE_DES as NOM_TYPE_FORME\n",
    "from PROD.V_FORME_MED as f\n",
    "left join PROD.V_DES_COD as d on d.CODE_VAL_COD = f.NMED_COD_TYP_FORME\n",
    "                and d.code_nom_cod = 'COD_TYP_FORME'\n",
    "order by COD_FORME;",
    sep = ''
  ))
}
