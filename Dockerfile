FROM ubuntu

RUN apt-get update && \
    apt-get -y upgrade && \
    DEBIAN_FRONTEND=noninteractive apt-get install -yq libpq-dev gcc python3.10 python3-pip net-tools curl && \
    apt-get clean

WORKDIR /app

COPY . /app/

RUN pip3 install -r requirements.txt && \
    pip3 install -r requirements-server.txt

ENV LC_ALL="C.UTF-8"
ENV LANG="C.UTF-8"
ENV FLASK_RUN_PORT=8000
ENV FLASK_APP=app

EXPOSE 8000/tcp

CMD ["/bin/sh", "-c", "flask run --host=0.0.0.0"]