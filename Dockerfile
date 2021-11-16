FROM rocker/rstudio:latest

RUN apt-get update && apt-get install -y \
    sudo \
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

ENV LANG ja_JP.UTF-8
ENV LC_ALL ja_JP.UTF-8
RUN sed -i '$d' /etc/locale.gen \
  && echo "ja_JP.UTF-8 UTF-8" >> /etc/locale.gen \
    && locale-gen ja_JP.UTF-8 \
    && /usr/sbin/update-locale LANG=ja_JP.UTF-8 LANGUAGE="ja_JP:ja"
RUN /bin/bash -c "source /etc/default/locale"
RUN ln -sf  /usr/share/zoneinfo/Asia/Tokyo /etc/localtime

COPY --chown=rstudio:rstudio ./rstudio-prefs.json /home/rstudio/.config/rstudio/rstudio-prefs.json

# RUN R -e "install.packages(c('packrat', 'rsconnect'), dependencies=TRUE, repos='http://cran.rstudio.com/')"