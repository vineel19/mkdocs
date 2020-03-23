FROM python:3.6.0-alpine

RUN apk --no-cache add lftp ca-certificates openssh && \
    pip install --upgrade pip
    pip install mkdocs
    
RUN mkdir /workdir
WORKDIR /workdir

COPY mkdocs.yml ./mkdocs.yml
COPY docs ./docs

EXPOSE 8000

CMD mkdocs server
