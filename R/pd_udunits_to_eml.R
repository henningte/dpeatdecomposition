#' Converts a column with udunits as character values to the respective EML units.
#'
#' `pd_udunits_to_eml` takes a character vector with values representing
#' udunits units and converts these to units as used by the Ecological Metadata
#' Language. Note that the function converts only a specific sets of units as
#' needed for the Peatland Decomposition Database. All other units are converted
#' to `NA`.
#'
#' @param x A character vector with values representing udunits units.
#'
#' @return A character vector with the same length as rows in `x` with
#' units according to the Ecological Metadata Language.
#'
#' @keywords Internal
#' @examples
#' \dontrun{
#' # convert a known unit
#' pd_udunits_to_eml("mm")
#'
#' # convert a unit not yet implemented
#' pd_udunits_to_eml("L")
#' }
pd_udunits_to_eml <- function(x) {

  # checks
  stopifnot(is.character(x))

  tibble::tibble(
    unit = x
  ) %>%
    dplyr::mutate(unit =
                    dplyr::case_when(
                      unit == "g" ~ "gram",
                      unit == "cm" ~ "centimeter",
                      unit == "m" ~ "meter",
                      unit == "cm^3" ~ "centimeterCubed",
                      unit == "g/g" ~ "gramsPerGram",
                      unit == "ug/g" ~ "microgramsPerGram",
                      unit == "cm^3/cm^3" ~ "cubicCentimetersPerCubicCentimeters",
                      unit == "g/cm^3" ~ "gramsPerCubicCentimeter",
                      unit == "umol/g" ~ "micromolePerGram",
                      unit == "kJ/mol" ~ "kilojoulePerMole",
                      unit == "J/K/mol" ~ "joulePerKelvinPerMole",
                      unit == "cm/h" ~ "centimeterPerHour",
                      unit == "Bq/kg" ~ "becquerelPerKilogram",
                      unit == "yr BP" ~ "nominalYear",
                      unit == "yr" ~ "nominalYear",
                      unit == "1/g/min" ~ "perGramPerMinute",
                      unit == "s" ~ "seconds",
                      unit == "kHz" ~ "kilohertz",
                      unit == "g/L" ~ "gramsPerLiter",
                      unit == "K" ~ "kelvin",
                      unit == "L/L" ~ "litersPerLiter",
                      unit == "mm" ~ "millimeter",
                      TRUE ~ "dimensionless"
                    )
    ) %>%
    dplyr::pull(unit)

}
