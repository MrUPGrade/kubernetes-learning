FROM python:3.6-stretch

RUN pip install flask

ADD app.py /

ENV FLASK_APP app.py
WORKDIR /

CMD ["flask", "run", "-h", "0.0.0.0", "-p", "8080" ]