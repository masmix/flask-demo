FROM ubuntu

RUN apt-get update && \
    apt-get -y upgrade && \
    DEBIAN_FRONTEND=noninteractive apt-get install -yq libpq-dev gcc python3.10 python3-pip && \
    apt-get clean

WORKDIR /app

COPY . /app/

RUN pip3 install -r requirements.txt && \
    pip3 install -r requirements-server.txt

ENV LC_ALL="C.UTF-8"
ENV LANG="C.UTF-8"

EXPOSE 8000/tcp

CMD ["/bin/sh", "-c", "flask db upgrade && gunicorn app:app -b 0.0.0.0:8000"]