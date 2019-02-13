
setClass(
    "ShCMD",
    slots = c(cmd = "character", args = "character")
)

cmd <- function(cmd) {
    stopifnot(is.character(cmd))
    stopifnot(length(cmd) == 1L)
    new("ShCMD", cmd = cmd, args = character())
}

setMethod(
    show, c("ShCMD"),
    definition = function(object) {
        name <- object@cmd
        args <- paste(object@args, collapse = " ")
        system2(name, args = args)
    }
)

setMethod(
    `+`,
    c(e1 = "ShCMD"),
    function(e1, e2) {
        stopifnot(.Generic %in% c("+"))
        e2 <- as.character(e2)
        e1@args <- c(e1@args, e2)
        e1
    }
)

if (FALSE) {
    ls <- cmd("ls")
    ls + "-alh"
}



