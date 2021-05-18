FROM python:3.9-buster

EXPOSE 80

ENV PIP_NO_CACHE_DIR=off \
    PIP_DISABLE_PIP_VERSION_CHECK=on \
    PIP_DEFAULT_TIMEOUT=90

RUN pip install -U "uwsgi==2.0.19.1" "gevent"

COPY app.py /app.py

# broken
# CMD ["uwsgi", "--protocol", "http", "--socket", "0.0.0.0:80", "--show-config", "--wsgi-file", "/app.py", "--single-interpreter", "--master", "--processes", "4"]

# should be working, creates weird kinds of 500 and 502 responses though
CMD ["uwsgi", "--http", "0.0.0.0:80", "--http-keepalive", "--show-config", "--wsgi-file", "/app.py", "--single-interpreter", "--master", "--processes", "4", "--lazy-apps", "--gevent", "100", "--gevent-monkey-patch", "--gevent-early-monkey-patch"]
