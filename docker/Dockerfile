#-- Pull the latest image from Docker Hub --#
# docker pull kamermanpr/regression-to-the-mean:v1.4

#-- Run command --#
# docker run --name pain_regression -d -p 8787:8787 -e USER=user -e PASSWORD=password kamermanpr/regression-to-the-mean:v1.4

#-- Login to RStudio --#
# In your browser, navigate to: localhost:8787
# Username: user
# Password: password

#-- Get the verse rocker image --#

FROM rocker/verse:4.0.4

MAINTAINER Peter Kamerman <peter.kamerman@gmail.com>

#-- Install extra packages --#

RUN Rscript -e "install.packages(c('boot', 'ggExtra', 'MASS', 'MBESS', 'matrixStats', 'patchwork', 'rcompanion', 'remotes', 'skimr'), dependencies = TRUE)"

# Not sure what is wrong, but wrong versions of xfun and rmarkdown are installed if using 'install.packages', so install from remote instead

RUN Rscript -e "remotes::install_github('yihui/xfun', ref = '974c1a28e2f53b92e4c6bce70cc4774de9339d90', dependencies = TRUE, upgrade = 'always')"

RUN Rscript -e "remotes::install_github('rstudio/rmarkdown', ref = '17861f3ee4b675805d7115b883688f0f2b7419de', dependencies = TRUE, upgrade = 'always')"