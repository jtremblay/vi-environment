# Install all dependencies
sudo apt-get install build-essential
sudo apt-get install fort77
sudo apt-get install xorg-dev
sudo apt-get install liblzma-dev  libblas-dev gfortran
sudo apt-get install gcc-multilib
sudo apt-get install gobjc++
sudo apt-get install aptitude
sudo aptitude install libreadline-dev
sudo aptitude install libcurl4-openssl-dev
sudo apt-get install default-jdk
sudo apt-get install texlive-latex-base

# Install r-base with ubuntu
sudo apt-get install R-base

# Install newest version of R from source
 wget https://cran.r-project.org/src/base/R-3/R-3.4.0.tar.gz
./configure --prefix=/home/jtrembla/software/R/R-3.4.0 --with-x=no --enable-R-shlib=yes
make
# NEWS.pdf file is missing and will make installation crash.
touch doc/NEWS.pdf
make install

# Download Rstudio and install it.
wget https://download1.rstudio.org/rstudio-1.0.143-amd64.deb
sudo dpkg -i rstudio-1.0.143-amd64.deb

# Do not forget to update your PATH
export PATH=~/software/R/R-3.4.0/bin:$PATH
export RSTUDIO_WHICH_R=~/software/R/R-3.4.0/bin/R

## for rJava and ReporteRs installation you also need to do this:
sudo apt-get install libxml2-dev
sudo R CMD javareconf
sudo apt-get install libcairo2-dev 

# That's it type rstudio and all should be good!
