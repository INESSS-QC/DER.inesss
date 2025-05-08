pgk <- c(
  "askpass",
  "crayon",
  "data.table", "DT",
  "lubridate",
  "miniUI",
  "odbc",
  "shiny", "shinyAce", "shinydashboard", "stringr",
  "testthat",
  "usethis",
  "writexl"
)
for (p in pgk) {
  install.packages(p)
}
