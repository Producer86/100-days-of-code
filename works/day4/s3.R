new_human <- function(name, bd) {
  birthDate <- as.Date(as.character(bd))
  stopifnot(
    is.character(name) |
      length(name) > 0 |
      !is.na(bd)
    )
  result <- list(name = name, birthDate = birthDate)
  class(result) <- c("human", class(result))
  result
}

new_worker <- function(n, bd, j) {
  stopifnot(is.character(j))
  result <- new_human(n, bd)
  result$job <- j
  class(result) <- c("worker", class(result))
  result
}

p <- new_human("Rick", "1970-10-10")
w <- new_worker("Morty", "2010-10-10", "Pilot")

sayhello <- function(x) UseMethod("sayhello")
sayhello.human <- function(x) paste("Hello", x$name)
sayhello.worker <- function(x) {
  pr <- NextMethod("sayhello")
  paste(pr, "the", x$job)
}

sayhello(p)
sayhello(w)
