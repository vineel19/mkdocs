Python 3.6 on Alpine

MkDocs is a simple static website generator. Documentation source files are written in Markdown, and configured with a single YAML configuration file.

Description:

In mkdocs.yml, theme: amelia to use amelia theme.

Bootstrap mkdocs project in the current directory:

docker run -it -p 8000:8000 docker-mkdocs .

Project configuration file (mkdocs.yml, docs) is under path /container-workspace from docker image "docker-mkdocs"

Serving mkdocs project in the current directory:

docker run -it -p 8000:8000 -v /host-workspace:/container-workspace docker-mkdocs serve -a 127.0.0.1:8000

Building the mkdocs project:

docker run -it -v /host-workspace:/container-workspace docker-mkdocs build


