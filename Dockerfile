FROM python:3-slim as mkdocs
COPY docs/ /opt/docs
COPY mkdocs.yml /opt
COPY requirements.txt /opt
WORKDIR /opt
RUN pip install --no-cache-dir -r requirements.txt
RUN mkdocs build

FROM caddy:alpine
COPY --from=mkdocs /opt/site/ /usr/share/caddy/
