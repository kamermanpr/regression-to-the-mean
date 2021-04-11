# Regression to the mean

## Bibliographic information
Kamerman PR, Vollert J. Greater baseline pain inclusion criteria in clinical trials increases regression to the mean effect: a modelling study.

## Abstract
We used statistical modelling to assess the effects of pain intensity inclusion thresholds (3/10, 4/10, and 5/10 on an 11-point NRS) on the magnitude of the regression to the mean effect under conditions that were consistent with the sample mean and variance, and inter-measurement correlation observed in clinical trials for the management of chronic pain. All data were modelled on a hypothetical placebo control group. We found a progressive increase in the mean pain intensity as the pain inclusion threshold increased, but this increase was not uniform, having an increasing effect on baseline measurements compared to study endpoint measurements as the threshold was increased. That is, the regression to the mean effect was magnified by increasing inclusion thresholds. Further, the effect increasing pain inclusion thresholds had on the regression to the mean effect was increased by decreasing sample means at baseline and inter-measurement correlations, and increasing sample variance. At its smallest the regression to the mean effect was 0.13/10 (95% CI: 0.03/10 to 0.24/10; threshold: 3/10, baseline mean pain: 6.5/10, standard deviation: 1.6/10, correlation: 0.44) and at its greatest it was 0.78/10 (95% CI: 0.63/10 to 0.94/10; threshold: 5/10, baseline mean pain: 6/10, standard deviation: 1.8/10, correlation: 0.19). We have shown that using pain inclusion thresholds in clinical trials drives progressively larger regression to the mean effects. We believe that a threshold of 3/10, offers the best compromise between maintaining assay sensitivity (the goal of thresholds) and the size of the regression to the mean effect.


## Reproducibility
For reproducibility we have built a docker image with the environment used to run the scripts:  
[kamermanpr/regression-to-the-mean](https://hub.docker.com/repository/docker/kamermanpr/regression-to-the-mean){target='_blank'}

### Using Docker to run the scripts
You need to have docker installed on your computer. To do so, go to [docker.com](https://www.docker.com/community-edition#/download){target='_blank'} and follow the instructions for installing Docker for your operating system. Once Docker has been installed, follow the steps below, noting that Docker commands are entered in a terminal window (Linux and OSX/macOS) or command prompt window (Windows). 

#### Download the latest image
Enter: `docker pull kamermanpr/regression-to-the-mean:v1.3`

#### Run the container

Enter: `docker run --name pain_regression -d -p 8787:8787 -e USER=user -e PASSWORD=password kamermanpr/regression-to-the-mean:v1.3`

#### Login to RStudio Server
- Open a web browser window and navigate to: `localhost:8787`

- Use the following login credentials: 
    - Username: _user_	
    - Password: _password_
    
#### Upload repository
- Go to the [regression-to-the-mean](https://github.com/kamermanpr/regression-to-the-mean.git){target='_blank'} repository on GitHub and select _Code_ and then _Download ZIP_.

- In the _Files_ tab on the lower right panel of RStudio, click **Upload**, located the zip file you downloaded and the click **OK**. The zip file will be uploaded and will automatically unzip, giving you access to all the content, including the analysis scripts, for the project.

- Please note that because the output file is a PDF, the build will be slow because the required latex packages will need to be downloaded and installed (this is an automatic process, but it is slow).


