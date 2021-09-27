#' Merge a Web of Science bib file and a Scopus bib file
#'
#' @param Scopus A path to a .bib file from a Scopus search.
#' @param Wos A path to a .bib file from a Web of Science search.
#'
#' @return A data frame with the results in Scopus format
#' @importFrom bibliometrix convert2df
#' @export
#'
#' @examples
#'
#' Test <- MergeToScopus(Scopus = system.file("extdata/scopus16aug.bib", package="BiblioUtils"),
#'                       Wos = system.file("extdata/WOS11aug.bib", package="BiblioUtils"))
#'

MergeToScopus <- function(Scopus, Wos){
  SCOPUS <- suppressMessages(bibliometrix::convert2df(file = Scopus, dbsource = "scopus", format = "bibtex"))
  WOS <- suppressMessages(bibliometrix::convert2df(file = Wos, dbsource = "wos", format = "bibtex"))
  SCOPUS[setdiff(names(WOS), names(SCOPUS))] <- NA
  WOS[setdiff(names(SCOPUS), names(WOS))] <- NA
  DF <- rbind(SCOPUS, WOS)
  return(DF)
}
