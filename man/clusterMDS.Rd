% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/1001-clusterMDS.R
\name{clusterMDS}
\alias{clusterMDS}
\title{visualize clustering result using multi-dimensional scaling}
\usage{
clusterMDS(db, cls, size.cutoff, distmat = NULL, color.vector = NULL,
  cluster.result = 1, dimensions = 2, quiet = FALSE,
  highlight.compounds = NULL, highlight.color = NULL)
}
\arguments{
\item{db}{The desciptor database}

\item{cls}{The clustering result returned by 'clusterCMP'.}

\item{size.cutoff}{The cutoff size for clusters considered in this 
visualization. Clusters of size smaller than the cutoff will not be considered.}

\item{distmat}{A distance matrix that corresponds to the 'db'. If not provided, 
it will be computed on-the-fly in an efficient manner.}

\item{color.vector}{Colors to be used in the plot. If the number of colors in 
the vector is not enough for the plot, colors will be reused. If not provided, 
color will be generated and randomly sampled from 'rainbow'.}

\item{cluster.result}{Used to select the clustering result if multiple 
clustering results are present in 'cls'.}

\item{dimensions}{Dimensionality to be used in visualization. See details.}

\item{quiet}{Whether to supress the progress bar.}

\item{highlight.compounds}{A vector of compound IDs, corresponding to 
compounds to be highlighted in the plot. A highlighted compound is 
represented as a filled circle.}

\item{highlight.color}{Color used for highlighted compounds. If not set, 
a highlighted compounds will have the same color as that used for other 
compounds in the same cluster.}
}
\value{
This function returns a data frame of MDS coordinates and 
clustering result. This value can be passed to 3D plot utilities such as
'scatterplot3d' and 'rggobi'.

The last column of the output gives whether the compounds have been 
clicked in the interactive mode.
}
\description{
'clusterMDS' takes clustering result returned by 'clusterCMP' and 
generate multi-dimensional scaling plot for visualization purpose.
}
\details{
'clusterMDS' internally calls the 'cmdscale' function to generate a 
set of points in 2-D for the compounds in selected clusters.Note that for 
compounds in clusters smaller than the cutoff size, they will not be 
considered in this calculation - their entries in 'distmat' will be 
discarded if 'distmat' is provided, and distances involving them will 
not be computed if 'distmat' is not provided.
To determine the value for 'size.cutoff', you can use 'cluster.sizestat' 
to see the size distribution of clusters.
Because 'clusterCMP' function allows you to perform multiple clustering 
processes simultaneously with different cutoff values, the 'cls' parameter 
may point to a data frame containing multiple clustering results. The user 
can use 'cluster.result' to specify which result to use. By default, this 
is set to 1, and the first clustering result will be used in visualization. 
Whatever the value is, in interactive mode (described below), all clustering 
result will be displayed when a compound is selected in the interactive plot.
If the colors provided in 'color.vector' are not enough to distinguish 
clusters by colors, the function will silently reuse the colors, resulting 
multiple clusters colored in the same color. 
By default, 'dimensions' is set to 2, and the built-in 'plot' function will 
be used for plotting. If you need to do 3-Dimensional plotting, set 
'dimensions' to 3, and pass the returned value to 3D plot utilities, such 
as 'scatterplot3d' or 'rggobi'. This package does not perform 3D plot 
on its own.
}
\examples{
data(sdfbcl) 
apbcl = convSDFtoAP(sdfbcl)
clusters <- clusterCMP(apbcl, cutoff = c(0.5, 0.4))
clusterMDS(apbcl, clusters, size.cutoff = 2, quiet = TRUE)

}
\references{
...
}
\seealso{
See \code{\link{clusterCMP}} for cluster compounds using a 
descriptor database.
}
\author{
Min-feng Zhu <\email{wind2zhu@163.com}>
}
\keyword{cluster}
\keyword{clusterMDS}
\keyword{visualize}
