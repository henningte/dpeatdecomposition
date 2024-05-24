#' Adds primary and foreign keys to a `dm` object with tables present in the Peatland Decomposition Database
#'
#' `dp_dm_add_keys` is a helper function which takes a `dm` object
#' with tables from the Peatland Decomposition Database, adds the necessary (and
#' possible) primary and foreign keys, and checks if these are valid, using
#' [dm::dm_examine_constraints()].
#'
#' @param x A `dm` object with tables that are present in the
#' Peatland Decomposition Database.
#'
#' @param dm_dpeatdecomposition A [dm::dm()] object representing the
#' Peatland Decomposition Database. This is used to get the keys present in the
#' Peatland Decomposition Database.
#'
#' @param progress A logical value. See
#' [dm::dm_examine_constraints()].
#'
#' @return `x` with added primary and foreign keys.
#'
#' @export
dp_dm_add_keys <- function(x, dm_dpeatdecomposition, progress = NA) {

  stopifnot(inherits(x, "dm"))
  stopifnot(inherits(dm_dpeatdecomposition, "dm"))

  child_table <- NULL
  parent_table <- NULL

  # get keys
  dm_dpeatdecomposition_pk <-
    dm_dpeatdecomposition %>%
    dm::dm_get_all_pks()

  dm_dpeatdecomposition_fk <-
    dm_dpeatdecomposition %>%
    dm::dm_get_all_fks()

  # get tables in x
  x_tables <- names(x)

  # filter keys
  x_pk <-
    dm_dpeatdecomposition_pk %>%
    dplyr::filter(table %in% x_tables)

  x_fk <-
    dm_dpeatdecomposition_fk %>%
    dplyr::filter(child_table %in% x_tables & parent_table %in% x_tables)

  # add keys
  for(i in seq_len(nrow(x_pk))) {
    x <-
      x %>%
      dm::dm_add_pk(!!x_pk$table[[i]], !!x_pk$pk_col[[i]])
  }
  for(i in seq_len(nrow(x_fk))) {
    x <-
      x %>%
      dm::dm_add_fk(!!x_fk$child_table[[i]], !!x_fk$child_fk_cols[[i]], !!x_fk$parent_table[[i]])
  }

  x_check <- dm::dm_examine_constraints(x, progress = progress)
  if(!all(x_check$is_key)) {
    stop("Key constraint not met!")
  }

  x

}
