#' Access the Peatland Decomposition Database as a `dm` object.
#'
#' `dp_get_dm` extracts tables and relations in the form of a
#' `dm` object. It is a wrapper around
#' [dm::dm_from_src()] which manually adds primary and
#' foreign keys to the tables which dm currently does not support for MariaDB
#' databases.
#'
#' @param con A connection to the Peatland Decomposition Database. This should
#' be an object of class `MariaDBConnection`, created with [RMariaDB::dbConnect()](RMariaDB::dbConnect_MariaDBDriver).
#'
#' @param learn_keys A logical value indicating if primary and foreign keys
#' should be assigned (`TRUE`) or not (`FALSE`).
#'
#' @return A `dm` object with the Peatland Decomposition Database and all primary and
#' foreign keys.
#'
#' @examples
#' \dontrun{
#' # connect to database
#' con <-
#'   RMariaDB::dbConnect(
#'     drv = RMariaDB::MariaDB(),
#'     dbname = "dpeatdecomposition",
#'     default.file = "~/my.cnf"
#'   )
#'
#' # get Peatland Decomposition Database as dm object
#' dm_dpeatdecomposition <- dp_get_dm(con, learn_keys = TRUE)
#'
#' # disconnect
#' RMariaDB::dbDisconnect(con)
#' }
#' @export
dp_get_dm <- function(con, learn_keys = FALSE) {

  # checks
  stopifnot(inherits(con, "MariaDBConnection"))
  stopifnot(is.logical(learn_keys) && length(learn_keys) == 1)

  # extract tables
  dm_dpeatdecomposition <-
    dm::dm_from_src(src = con, table_names = NULL, learn_keys = FALSE)

  # add keys
  if(learn_keys) {
    dm_dpeatdecomposition <-
      dm_dpeatdecomposition %>%
      dm::dm_add_pk(datasets, id_dataset) %>%
      dm::dm_add_pk(citations, id_citation) %>%
      dm::dm_add_pk(data, id_measurement) %>%
      dm::dm_add_pk(samples, id_sample) %>%
      dm::dm_add_pk(attributes, attribute_name) %>%
      dm::dm_add_pk(measurement_scales, id_measurement_scale) %>%
      dm::dm_add_pk(measurement_scales_nominal, id_measurement_scale) %>%
      dm::dm_add_pk(measurement_scales_ordinal, id_measurement_scale) %>%
      dm::dm_add_pk(measurement_scales_interval, id_measurement_scale) %>%
      dm::dm_add_pk(measurement_scales_ratio, id_measurement_scale) %>%
      dm::dm_add_pk(measurement_scales_date_time, id_measurement_scale) %>%
      dm::dm_add_pk(missing_value_codes, id_missing_value_code) %>%
      dm::dm_add_pk(units, id_unit) %>%
      dm::dm_add_pk(custom_units, id_unit) %>%
      dm::dm_add_pk(unit_types, unit_type) %>%
      dm::dm_add_pk(experimental_design_format, c(id_dataset, experimental_design_format)) %>%
      dm::dm_add_fk(citations_to_datasets, id_dataset, datasets, check = TRUE) %>%
      dm::dm_add_fk(citations_to_datasets, id_citation, citations, check = TRUE) %>%
      dm::dm_add_fk(samples, id_dataset, datasets, check = TRUE) %>%
      dm::dm_add_fk(data, id_sample, samples, check = TRUE) %>%
      dm::dm_add_fk(data, attribute_name, attributes, check = TRUE) %>%
      dm::dm_add_fk(attributes, id_measurement_scale, measurement_scales, check = TRUE) %>%
      dm::dm_add_fk(attributes, id_missing_value_code, missing_value_codes, check = TRUE) %>%
      dm::dm_add_fk(measurement_scales_nominal, id_measurement_scale, measurement_scales, check = TRUE) %>%
      dm::dm_add_fk(measurement_scales_ordinal, id_measurement_scale, measurement_scales, check = TRUE) %>%
      dm::dm_add_fk(measurement_scales_interval, id_measurement_scale, measurement_scales, check = TRUE) %>%
      dm::dm_add_fk(measurement_scales_ratio, id_measurement_scale, measurement_scales, check = TRUE) %>%
      dm::dm_add_fk(measurement_scales_date_time, id_measurement_scale, measurement_scales, check = TRUE) %>%
      dm::dm_add_fk(measurement_scales_interval, id_unit, units, check = TRUE) %>%
      dm::dm_add_fk(measurement_scales_ratio, id_unit, units, check = TRUE) %>%
      dm::dm_add_fk(custom_units, id_unit, units, check = TRUE) %>%
      dm::dm_add_fk(experimental_design_format, id_dataset, datasets, check = TRUE) %>%
      dm::dm_add_fk(samples_to_samples, id_sample_parent, samples, ref_columns = id_sample, check = TRUE) %>%
      dm::dm_add_fk(samples_to_samples, id_sample_child, samples, ref_columns = id_sample, check = TRUE) %>%
      dm::dm_add_fk(unit_types, unit_type, custom_units, ref_columns = unit_type, check = TRUE)
  }

  dm_dpeatdecomposition

}
