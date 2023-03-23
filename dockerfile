# FROM ubuntu:latest
FROM python:3.10
WORKDIR /app
COPY pyproject.toml ./
RUN DEBIAN_FRONTEND=noninteractive apt-get update -y
##build-essential for gcc to build PyQt5
RUN curl -fsSL https://deb.nodesource.com/setup_16.x | sh -s -- -y
RUN DEBIAN_FRONTEND=noninteractive apt-get install build-essential \
    curl \
    wget \
    libssl-dev \
    libgtk-3-dev \
    libayatana-appindicator3-dev \
    librsvg2-dev \
    nodejs \
    libsoup2.4 \
    npm -y

##Tauri dependencies
RUN DEBIAN_FRONTEND=noninteractive apt-get  install libwebkit2gtk-4.0-dev \
    build-essential \
    curl \
    wget \
    libssl-dev \
    libgtk-3-dev \
    libayatana-appindicator3-dev \
    librsvg2-dev -y

RUN DEBIAN_FRONTEND=noninteractive apt-get clean -y


ENV PATH="/root/.cargo/bin:${PATH}"
# RUN cargo install create-tauri-app


RUN pip install --no-cache-dir --upgrade pip && \
    pip install --no-cache-dir poetry
RUN poetry install --no-interaction --no-root

RUN curl --proto '=https' --tlsv1.2 https://sh.rustup.rs -sSf | sh -s -- -y
# RUN cargo install create-tauri-app 
# RUN cargo create-tauri-app

CMD ["bash"]