FROM python:3.7-stretch

ADD requirements.txt /

RUN pip install  --upgrade --no-cache-dir -r /requirements.txt && \
    rm requirements.txt

ADD webapp /webapp
WORKDIR /webapp

ENV FLASK_APP app.py
EXPOSE 8080

CMD ["flask", "run", "-h", "0.0.0.0", "-p", "8080" ]
