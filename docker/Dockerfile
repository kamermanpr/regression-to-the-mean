#-- Pull the latest image from Docker Hub --#
# docker pull kamermanpr/regression-to-the-mean:v1.3

#-- Run command --#
# docker run --name pain_regression -d -p 8787:8787 -e USER=user -e PASSWORD=password kamermanpr/regression-to-the-mean:v1.3

#-- Login to RStudio --#
# In your browser, navigate to: localhost:8787
# Username: user
# Password: password

#-- Get the verse rocker image --#

FROM rocker/verse:4.0.4

MAINTAINER Peter Kamerman <peter.kamerman@gmail.com>

#-- Install extra packages --#

RUN Rscript -e "install.packages(c('boot', 'ggExtra', 'MASS', 'MBESS', 'matrixStats', 'patchwork', 'rcompanion', 'remotes', 'skimr'), dependencies = TRUE)"