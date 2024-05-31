#' Utils
#'
#' Créer les requêtes (`string`) de SQL vers une fonction R
#'
#' @return `files`
#' @importFrom stringr str_replace_all
#' @keywords internal
#' @encoding UTF-8
#' @export
files_query_create <- function() {

  file.create("Automatisation-Compas/query_V_FORME_MED.R", overwrite = TRUE)

  header <-
"#' Requêtes SQL
#'
#' @return `string`
#' @keywords internal
#' @encoding UTF-8
#' @export
query_V_FORME_MED <- function() {
  return(cat("

  SQLquery <- readLines("Automatisation-Compas/V_FORME_MED.sql")
  SQLquery <- str_replace_all(SQLquery, "\\t", "  ")
  SQLquery <- paste0("    \"",SQLquery)
  SQLquery[1:(length(SQLquery)-1)] <- paste0(SQLquery[1:(length(SQLquery)-1)], "\\n\",")
  SQLquery[length(SQLquery)] <- paste0(SQLquery[length(SQLquery)], "\",")

  end_fct <-
"    sep = ''
  ))
}"

  writeLines(c(header, SQLquery, end_fct), "Automatisation-Compas/query_V_FORME_MED.R")

}
