FROM jupyter/tensorflow-notebook
LABEL MAINTAINER Hitoshi TAKEUCHI <hitoshi@namaraii.com>

USER root

RUN apt-get update \
&&  apt-get install -y --no-install-recommends \
    libtool \
    libtool-bin \
    pkg-config \
    build-essential \
    autoconf \
    automake \
    uuid-dev \
    libssl-dev \ 
    libreadline-dev \ 
    zlib1g-dev \
&&  apt-get clean \
&&  rm -rf /var/lib/apt/lists/ \
&&  git clone git://github.com/rbenv/rbenv.git /usr/local/rbenv \
&&  git clone git://github.com/rbenv/ruby-build.git /usr/local/rbenv/plugins/ruby-build \
&&  git clone git://github.com/jf/rbenv-gemset.git /usr/local/rbenv/plugins/rbenv-gemset \
&&  /usr/local/rbenv/plugins/ruby-build/install.sh
ENV PATH /usr/local/rbenv/bin:$PATH
ENV RBENV_ROOT /usr/local/rbenv

RUN echo 'export RBENV_ROOT=/usr/local/rbenv' >> /etc/profile.d/rbenv.sh \
&&  echo 'export PATH=/usr/local/rbenv/bin:$PATH' >> /etc/profile.d/rbenv.sh \
&&  echo 'eval "$(rbenv init -)"' >> /etc/profile.d/rbenv.sh

RUN echo 'export RBENV_ROOT=/usr/local/rbenv' >> /root/.bashrc \
&&  echo 'export PATH=/usr/local/rbenv/bin:$PATH' >> /root/.bashrc \
&&  echo 'eval "$(rbenv init -)"' >> /root/.bashrc

ENV CONFIGURE_OPTS --disable-install-doc
ENV PATH /usr/local/rbenv/bin:/usr/local/rbenv/shims:$PATH

ENV RBENV_VERSION 2.5.1

RUN eval "$(rbenv init -)"; rbenv install $RBENV_VERSION \
&&  eval "$(rbenv init -)"; rbenv global $RBENV_VERSION \
&&  eval "$(rbenv init -)"; gem update --system \
&&  eval "$(rbenv init -)"; gem install bundler -f \
&&  eval "$(rbenv init -)"; gem install rbczmq iruby -f \
&&  eval "$(rbenv init -)"; gem install rbplotly nyaplot daru daru-plotly spreadsheet mechanize \
&&  eval "$(rbenv init -)"; gem install pry pycall numpy pandas -f \
&&  pip install --upgrade pip \
&&  pip install py_d3  \
&&  rm -rf /tmp/*

# Switch back to jovyan to avoid accidental container runs as root
USER $NB_USER

WORKDIR /documents

RUN iruby register