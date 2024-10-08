library(usethis)
library(odbc)
library(data.table)
library(lubridate)
library(DER.inesss)
color_text <- function(x) {return(crayon::italic(crayon::green(x)))}
if (!exists("user")) {
  user <- askpass::askpass("User")
}
if (!exists("pwd")) {
  pwd <- askpass::askpass()
}
if (is.null(conn)) {
  conn <- SQL_connexion(user, pwd)
}

fct <- function() {

  cat(color_text("V_DENOM_COMNE_MED\n"))

  ### Tableau des codes DENOM
  query <-
    "select NMED_COD_DENOM_COMNE as DENOM,
  	  NMED_DD_DENOM_COMNE as DATE_DEBUT,
  	  NMED_DF_DENOM_COMNE as DATE_FIN,
  	  NMED_NOM_DENOM_COMNE as NOM_DENOM,
  	  NMED_NOM_DENOM_COMNE_SYNON as NOM_DENOM_SYNON,
  	  NMED_NOM_ANGL_DENOM_COMNE as NOM_DENOM_ANGLAIS,
  	  NMED_NOM_ANGL_DENOM_SYNON as NOM_DENOM_SYNON_ANGLAIS
    from PROD.V_DENOM_COMNE_MED;"
  DT <- as.data.table(dbGetQuery(conn, query))

  ### S'assurer que les dates sont au format Date
  DT[, `:=` (DATE_DEBUT = as_date(DATE_DEBUT),
             DATE_FIN = as_date(DATE_FIN))]

  setkey(DT, DENOM, DATE_DEBUT)
  attr(DT, "MaJ") <- Sys.Date()  # date de création
  return(DT)

}

V_DENOM_COMNE_MED <- fct()
use_data(V_DENOM_COMNE_MED, overwrite = TRUE)
rm(V_DENOM_COMNE_MED)
