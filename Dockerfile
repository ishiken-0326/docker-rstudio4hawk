FROM rocker/rstudio:latest

RUN sudo apt-get update && \
    sudo apt-get install -y \
    gdebi-core \
    pandoc \
    pandoc-citeproc \
    libcurl4-gnutls-dev \
    libcairo2-dev \
    libxt-dev \
    libxml2-dev \
    libglpk40 \
    libjq-dev \
    libv8-dev \
    fonts-ipaexfont \
    fonts-noto-cjk

RUN ln -sf  /usr/share/zoneinfo/Asia/Tokyo /etc/localtime

COPY --chown=rstudio:rstudio ./rstudio-prefs.json /home/rstudio/.config/rstudio/rstudio-prefs.json

COPY ./shiny-hawk/development.R /home/development.r
COPY ./shiny-hawk/package_list.txt /home/package_list.txt
WORKDIR /home
RUN R -e "source('./development.r')"