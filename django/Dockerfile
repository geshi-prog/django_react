FROM ubuntu_japanese

# インストールに必要な物をインストール
RUN apt install -y \
    build-essential \
    libbz2-dev \
    libdb-dev \
    libreadline-dev \
    libffi-dev \
    libgdbm-dev \
    liblzma-dev \
    libncursesw5-dev \
    libsqlite3-dev \
    libssl-dev \
    zlib1g-dev \
    uuid-dev \
    tk-dev \
    libpq-dev \
    default-libmysqlclient-dev \
    mysql-client

# pythonのバージョン
ARG python_version="3.9.9"

# set environment variables
ENV PYTHONDONTWRITEBYTECODE 1
ENV PYTHONUNBUFFERED 1

# 作業ディレクトリを作成する
WORKDIR /app

# pythonをビルドする
RUN cd /root && \
    wget https://www.python.org/ftp/python/${python_version}/Python-${python_version}.tar.xz && \
    tar xJf Python-${python_version}.tar.xz && \
    cd Python-${python_version} && \
    /root/Python-${python_version}/configure && \
    make && \
    make install

COPY requirements.txt ./
# pipのアップグレード
RUN python3 -m pip install --upgrade pip
RUN python3 -m pip install --upgrade setuptools
RUN python3 -m pip install --upgrade ez_setup

# djangoのインストール
RUN python3 -m pip install -r requirements.txt

# エイリアスを変更する。
RUN echo 'alias python=python3' >> /root/.bashrc
RUN echo "alias pip='python3 -m pip'" >> /root/.bashrc
