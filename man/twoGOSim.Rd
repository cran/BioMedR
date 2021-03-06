% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/907-parGOSim.R
\name{twoGOSim}
\alias{twoGOSim}
\title{Protein/DNA Similarity Calculation based on Gene Ontology (GO) Similarity}
\usage{
twoGOSim(id1, id2, type = c("go", "gene"), ont = "MF",
  organism = "human", measure = "Resnik", combine = "BMA")
}
\arguments{
\item{id1}{A character vector. length > 1: each element is a GO term;
length = 1: the Entrez Gene ID.}

\item{id2}{A character vector. length > 1: each element is a GO term;
length = 1: the Entrez Gene ID.}

\item{type}{Input type of id1 and id2, \code{'go'} for GO Terms, \code{'gene'} for gene ID.}

\item{ont}{Default is \code{'MF'}, could be one of \code{'MF'}, \code{'BP'}, or \code{'CC'} subontologies.}

\item{organism}{Default is \code{'human'}, could be one of \code{'anopheles'}, \code{'arabidopsis'}, \code{'bovine'}, \code{'canine'},
\code{'chicken'}, \code{'chimp'}, \code{'coelicolor'}, \code{'ecolik12'},
\code{'ecsakai'}, \code{'fly'}, \code{'human'}, \code{'malaria'},
\code{'mouse'}, \code{'pig'}, \code{'rat'}, \code{'rhesus'},
\code{'worm'}, \code{'xenopus'}, \code{'yeast'} or \code{'zebrafish'}.}

\item{measure}{Default is \code{'Resnik'}, could be one of \code{'Resnik'}, \code{'Lin'}, \code{'Rel'}, \code{'Jiang'} or \code{'Wang'}.}

\item{combine}{Default is \code{'BMA'}, could be one of \code{'max'}, \code{'average'}, \code{'rcmax'} or \code{'BMA'}
for combining semantic similarity scores of multiple GO terms associated with protein.}
}
\value{
A n x n matrix.
}
\description{
Protein/DNA Similarity Calculation based on Gene Ontology (GO) Similarity
}
\details{
This function calculates the Gene Ontology (GO) similarity
between two groups of GO terms or two Entrez gene IDs.
}
\examples{
\donttest{
# Be careful when testing this since it involves GO similarity computation
# and might produce unpredictable results in some environments

require(GOSemSim)
require(org.Hs.eg.db)

# by GO terms
go1 = c("GO:0004022", "GO:0004024", "GO:0004023")
go2 = c("GO:0009055", "GO:0020037")
gsim1 = twoGOSim(go1, go2, type = 'go', ont = 'MF', measure = 'Wang')
print(gsim1)

# by Entrez gene id
gene1 = '241'
gene2 = '251'
gsim2 = twoGOSim(gene1, gene2, type = 'gene', ont = 'BP', measure = 'Lin')
print(gsim2)}
}
\seealso{
See \code{\link{parGOSim}} for
protein similarity calculation based on
Gene Ontology (GO) semantic similarity.
See \code{\link{parSeqSim}} for paralleled protein/DNA similarity
calculation based on Smith-Waterman local alignment.
}
\author{
Min-feng Zhu <\email{wind2zhu@163.com}>, 
        Nan Xiao <\url{http://nanx.me}>
}
\keyword{GO}
\keyword{Ontology}
\keyword{similarity}
