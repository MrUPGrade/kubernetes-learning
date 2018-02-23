FROM python:3.6-stretch

WORKDIR /

ADD requirements.txt /
RUN pip install -r /requirements.txt && \
    rm requirements.txt

ADD app.py /

ENV FLASK_APP app.py
EXPOSE 8080

CMD ["flask", "run", "-h", "0.0.0.0", "-p", "8080" ]