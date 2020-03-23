FROM python:3.6.0-alpine

RUN apk --no-cache add lftp ca-certificates openssh && \
    pip install --upgrade pip
    pip install mkdocs
    
RUN mkdir /container-workspace
WORKDIR /container-workspace

COPY mkdocs.yml ./mkdocs.yml
COPY docs ./docs

EXPOSE 8000

ENTRYPOINT ["mkdocs"]

CMD ["serve", "--dev-addr=127.0.0.1:8000"]
