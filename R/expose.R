
expose <- function (package) {
    if (missing(package)) {
        package <- read.dcf("DESCRIPTION")[, "Package"]
    }

    attachname <- paste0("expose:", package)
    while(attachname %in% search())
        detach(attachname, character.only = TRUE, unload = TRUE)

    pkgns <- loadNamespace(package)
    attach(pkgns, name = attachname)
    invisible(pkgns)
}

detach_exposed <- function(package) {
    if (missing(package))
        names <- grep("^expose:", search(), value = TRUE)
    else
        names <- paste0("expose:", package)

    for (attachname in names)
        while(attachname %in% search())
            detach(attachname, character.only = TRUE, unload = TRUE)
    invisible(names)
}

