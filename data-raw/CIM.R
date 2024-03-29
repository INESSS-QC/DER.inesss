# Tables CIM9 et CIM10 provenant de la RAMQ. Il y a également une table de conversion.
#
# https://www.ramq.gouv.qc.ca/fr/professionnels/medecins-omnipraticiens/facturation/repertoire-diagnostics/Pages/repertoire-diagnostics.aspx
# Le fichier Excel qu'on peut télécharger est le même qu'on passe par CIM10 ou CIM9 : il contient les deux.
# -> On a décidé de télécharger le CIM10 uniquement.
# Télécharger également le tableau de correspondance.

library(readxl)
library(data.table)
library(usethis)

MaJ <- as.Date("2024-02-27")

# CIM9 ----------------------------------------------------------------------------------------

CIM9 <- as.data.table(read_excel("inst/extdata/repertoire-diagnostics-cim10.xlsx",
                                  sheet = "CIM-9",
                                  skip = 1))
CIM9 <- CIM9[, .(CIM9 = Code, DIAGNOSTIC = Diagnostic)]
setkey(CIM9)


# CIM10 ---------------------------------------------------------------------------------------

CIM10 <- as.data.table(read_excel("inst/extdata/repertoire-diagnostics-cim10.xlsx",
                                  sheet = "CIM-10",
                                  skip = 1))
CIM10 <- CIM10[, .(CIM10 = Code, DIAGNOSTIC = Diagnostic)]
setkey(CIM10)


# Tableau correspondance ----------------------------------------------------------------------

CIM_correspondance <- as.data.table(read_excel("inst/extdata/Tableau_de_correspondance.xlsx",
                                     sheet = "Diagnostics",
                                     skip = 1))
col_names <- c("CIM9", "DIAGNOSTIC_CIM9", "CIM10", "DIAGNOSTIC_CIM10")
setnames(CIM_correspondance, names(CIM_correspondance), col_names)
setkey(CIM_correspondance)


# SAVE ----------------------------------------------------------------------------------------

CIM <- list(
  CIM9 = CIM9,
  CIM10 = CIM10,
  Correspondance = CIM_correspondance
)
attr(CIM, "MaJ") <- MaJ
use_data(CIM, overwrite = TRUE)

rm(CIM, CIM9, CIM10, CIM_correspondance,
   col_names, MaJ)

