#' SQL requête
#'
#' @param conn Paramètre de connexion. Voir `SQL_connexion()`
#' @param script Chaîne de caractère contenant le code de la requête SQL
#'
#' @return `data.table`
#' @export
SQL_execute <- function(conn, script) {

  DT <- as.data.table(dbGetQuery(conn, statement = script))
  return(DT)

}

dt <- SQL_execute(conn, query_V_FORME_MED())
