

## Some useful default options

#' A (Biased) Collection of Useful Default Options
#'
#' The function body is self-explanatory. You may put \code{lucky::set_defaults()}
#' into your Rprofile.
#'
#' @export
#'
#' @examples
#' print(set_defaults)
set_defaults <- function() {

    options(prompt="R> ")

    options(warnPartialMatchDollar = TRUE)

    # So that "devtools::install_github" can work correctly on openSUSE
    # See: https://github.com/RevolutionAnalytics/RRO/issues/37
    options(unzip = "internal")

    # Set printing limit
    options(max.print = 200)

    # Used by `install.packages`
    options(Ncpus = parallel::detectCores())

    # Set memory limit, ref http://krlmlr.github.io/ulimit/
    #(function () invisible(ulimit::memory_limit(8000)))()

    # Used by devtools::install()
    options(keep.source.pkgs = TRUE)

    # Set CRAN mirror
    opt_repos <- getOption("repos")
    if (is.null(opt_repos[["CRAN"]]) || opt_repos[["CRAN"]] == "@CRAN@") {
        opt_repos["CRAN"] <- "https://cran.rstudio.com/"
        options(repos = opt_repos)
    }

    invisible()
}

