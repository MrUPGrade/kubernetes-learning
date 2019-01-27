FROM python:3.7-stretch

ADD requirements.txt /
RUN pip install --upgrade --no-cache-dir -r /requirements.txt && \
    pip install gevent gunicorn && \
    rm requirements.txt

ADD webapp /webapp
VOLUME /log
ENV PYTHONPATH /webapp
EXPOSE 8080

CMD ["gunicorn", "--access-logfile", "/log/access.log", "-b", "0.0.0.0:8080", "-k", "gevent", "webapp.app:app"]
