FROM ubuntu_japanese

# 作業ディレクトリを作成する
WORKDIR /app

RUN curl -sL https://deb.nodesource.com/setup_14.x | sudo -E bash - && \
    apt install -y build-essential && \
    apt install -y nodejs && \
    npm -g install create-react-app

COPY build_react.sh /app/
