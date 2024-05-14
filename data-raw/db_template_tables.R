## code to prepare `db_template_tables` dataset goes here

library(RMariaDB)
library(dm)

# connect to database
con <-
  RMariaDB::dbConnect(
    drv = RMariaDB::MariaDB(),
    dbname = "dpeatdecomposition",
    username = "root", # ---todo: adjust or get from config file
    password = "coucou",
    host = "mariadb"
  )

# create template tables
db_template_tables <-
  dpeatdecomposition::dp_get_dm(con, learn_keys = TRUE) %>%
  as.list() %>%
  purrr::map(function(.x) {
    tibble::as_tibble(.x) %>%
      dplyr::slice(0)
  })

usethis::use_data(db_template_tables, overwrite = TRUE)

RMariaDB::dbDisconnect(con)
