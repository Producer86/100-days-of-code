library(ggplot2)

ufo <- read.delim("ufo_awesome.tsv", sep = "\t", stringsAsFactors = F, na.strings = "")
names(ufo)<-c("DateOccurred","DateReported","Location","ShortDescription", "Duration","LongDescription")

good.rows <- nchar(ufo$DateReported) == 8 & nchar(ufo$DateOccurred) == 8
ufo <- ufo[good.rows,]

ufo$DateOccurred <- as.Date(ufo$DateOccurred, format = "%Y%m%d")
ufo$DateReported <- as.Date(ufo$DateReported, format = "%Y%m%d")
strsplit("Mil WI", ",")
