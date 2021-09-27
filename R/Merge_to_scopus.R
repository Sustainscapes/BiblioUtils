#' Merge a Web of Science bib file and a Scopus bib file
#'
#' @param Scopus A path to a .bib file from a Scopus search.
#' @param Wos A path to a .bib file from a Web of Science search.
#'
#' @return A data frame with the results in Scopus format
#' @export
#'
#' @examples
#'
#' Test <- MergeToScopus(Scopus = system.file("scopus16aug.bib", package="BiblioUtils"), Wos = system.file("WOS11aug.bib", package="BiblioUtils"))
#'

MergeToScopus <- function(Scopus, Wos){
  SCOPUS <-bibliometrix::convert2df(file = Scopus, dbsource = "scopus", format = "bibtex")
  WOS <-bibliometrix::convert2df(file = Wos, dbsource = "wos", format = "bibtex")
  return(list(Scopus = SCOPUS, Wos = WOS))
}
