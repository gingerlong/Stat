# Set working directory
setwd("/home/user/data_analysis/Stat/")

# Load packages
require(knitr)
require(markdown)


# Create .md, .html, and .pdf files
knit("inference.Rmd")
markdownToHTML('inference.md', 'inference.html', options=c("use_xhml"))
system("pandoc -s inference.html -o inference.pdf")