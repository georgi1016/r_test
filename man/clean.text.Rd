\name{clean.text}
\alias{clean.text}
%- Also NEED an '\alias' for EACH other topic documented here.
\title{
%%  ~~function to do ... ~~
}
\description{
%%  ~~ A concise (1-5 lines) description of what the function does. ~~
}
\usage{
clean.text(some_txt)
}
%- maybe also 'usage' for other objects documented here.
\arguments{
  \item{some_txt}{
%%     ~~Describe \code{some_txt} here~~
}
}
\details{
%%  ~~ If necessary, more details than the description above ~~
}
\value{
%%  ~Describe the value returned
%%  If it is a LIST, use
%%  \item{comp1 }{Description of 'comp1'}
%%  \item{comp2 }{Description of 'comp2'}
%% ...
}
\references{
%% ~put references to the literature/web site here ~
}
\author{
%%  ~~who you are~~
}
\note{
%%  ~~further notes~~
}

%% ~Make other sections like Warning with \section{Warning }{....} ~

\seealso{
%% ~~objects to See Also as \code{\link{help}}, ~~~
}
\examples{
##---- Should be DIRECTLY executable !! ----
##-- ==>  Define data, use random,
##--	or do  help(data=index)  for the standard data sets.

## The function is currently defined as
function (some_txt) 
{
    some_txt = gsub("(RT|via)((?:\\b\\W*@\\w))", "", some_txt)
    some_txt = gsub("@\\w", "", some_txt)
    some_txt = gsub("[[:punct:]]", "", some_txt)
    some_txt = gsub("[[:digit:]]", "", some_txt)
    some_txt = gsub("http\\w", "", some_txt)
    some_txt = gsub("[ \t]{2,}", "", some_txt)
    some_txt = gsub("^\\s|\\s$", "", some_txt)
    some_txt = gsub("amp", "", some_txt)
    try.tolower = function(x) {
        y = NA
        try_error = tryCatch(tolower(x), error = function(e) e)
        if (!inherits(try_error, "error")) 
            y = tolower(x)
        return(y)
    }
    some_txt = sapply(some_txt, try.tolower)
    some_txt = some_txt[some_txt != ""]
    names(some_txt) = NULL
    return(some_txt)
  }
}
% Add one or more standard keywords, see file 'KEYWORDS' in the
% R documentation directory.
\keyword{ ~kwd1 }
\keyword{ ~kwd2 }% __ONLY ONE__ keyword per line
