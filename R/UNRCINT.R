#' Title Unit Root Testing
#'
#' @param x Only Numeric values
#'
#' @return Returns a Data frame of unit Root test with Critical and P-Values
#' @export
#'
#' @examples
#' urootp(data)


urootp <- function(x) {
  # Initialize an empty list to store the results
  results <- list()

  # Loop through each variable in the dataframe
  for (var_name in names(x)) {
    # Get the current variable
    var_data <- x[[var_name]]

    # Check if the variable is numeric (unit root tests apply to numeric data)
    if (is.numeric(var_data)) {

      # Conduct the tests

      # ADF Test
      adf_test <- tseries::adf.test(var_data)
      adf_stat <- round(adf_test$statistic, 2)
      adf_pval <- round(adf_test$p.value, 2)

      # PP Test
      pp_test <- tseries::pp.test(var_data)
      pp_stat <- round(pp_test$statistic, 2)
      pp_pval <- round(pp_test$p.value, 2)

      # KPSS Test
      kpss_test <- tseries::kpss.test(var_data)
      kpss_stat <- round(kpss_test$statistic, 2)
      kpss_pval <- round(kpss_test$p.value, 2)

      # Combine the results in a data frame
      test_results <- data.frame(
        Variable = var_name,
        ADF = adf_stat,
        ADF.P = adf_pval,
        PP = pp_stat,
        PP.P = pp_pval,
        KPSS = kpss_stat,
        KPSS.P = kpss_pval
      )

      # Append the results to the list
      results[[var_name]] <- test_results
    }
  }

  # Combine all results into a single dataframe
  final_results <- do.call(rbind, results)

  return(suppressWarnings(final_results))
}



urootc <- function(x) {
  # Initialize an empty list to store the results
  results <- list()

  # Loop through each variable in the dataframe
  for (var_name in names(x)) {
    # Get the current variable
    var_data <- x[[var_name]]

    # Check if the variable is numeric (unit root tests apply to numeric data)
    if (is.numeric(var_data)) {

      # Conduct the tests using the urca package

      # ADF Test (using ur.df from urca package)
      adf_test <- urca::ur.df(var_data, type = "drift", selectlags = "AIC")
      adf_stat <- round(adf_test@teststat[1], 2)
      adf_crit_val <- round(adf_test@cval[1, ], 2)  # Critical values

      # PP Test (using ur.pp from urca package)
      pp_test <- urca::ur.pp(var_data, type = "Z-tau", model = "constant")
      pp_stat <- round(pp_test@teststat, 2)
      pp_crit_val <- round(pp_test@cval, 2)

      # KPSS Test (using ur.kpss from urca package)
      kpss_test <- urca::ur.kpss(var_data, type = "mu")
      kpss_stat <- round(kpss_test@teststat, 2)
      kpss_crit_val <- round(kpss_test@cval, 2)

      # Combine the results in a data frame
      test_results <- data.frame(
        Variable = var_name,
        ADF = adf_stat,
        ADF.C = paste(adf_crit_val, collapse = ", "),
        PP = pp_stat,
        PP.C = paste(pp_crit_val, collapse = ", "),
        KPSS = kpss_stat,
        KPSS.C = paste(kpss_crit_val, collapse = ", ")
      )

      # Append the results to the list
      results[[var_name]] <- test_results
    }
  }

  # Combine all results into a single dataframe
  final_results <- do.call(rbind, results)

  return(suppressWarnings(final_results))
}
