pgk <- c(
  "askpass",
  "crayon",
  "data.table", "DT",
  "lubridate",
  "miniUI",
  "odbc",
  "shiny", "shinyAce", "shinydashboard", "stringr",
  "usethis",
  "writexl"
)
for (p in pgk) {
  library(p, character.only = TRUE)
}
