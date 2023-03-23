# FROM ubuntu:latest
FROM python:3.10
WORKDIR /app
COPY pyproject.toml ./
RUN DEBIAN_FRONTEND=noninteractive apt-get update -y
##build-essential for gcc to build PyQt5
RUN DEBIAN_FRONTEND=noninteractive apt-get install build-essential  -y
RUN DEBIAN_FRONTEND=noninteractive apt-get clean -y
RUN pip install --no-cache-dir --upgrade pip && \
    pip install --no-cache-dir poetry

# CMD [ "executable" ] ls
RUN poetry install --no-interaction --no-root
CMD ["bash"]