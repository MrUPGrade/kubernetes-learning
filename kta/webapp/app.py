import os

from pathlib import Path
from flask import Flask, jsonify
from datetime import date, datetime

app = Flask(__name__)


@app.route('/')
def hello():
    return 'Hello World 2 !'


@app.route('/env')
def env():
    variable = os.getenv('KTA_DEBUG_VAR')
    message = 'KTA_DEBUG_VAR={}'.format(variable)
    return message


@app.route('/environ')
def environ():
    result = {}
    for k, v in os.environ.items():
        result[k] = v
    return jsonify(result)


@app.route('/storage')
def storage():
    path = os.getenv('KTA_LOG_PATH')

    file_name = '{}.log'.format(date.today())
    path = Path(path) / file_name

    message = '{}: Hello from app!\n'.format(datetime.now().time())

    with path.open('a') as f:
        f.write(message)

    return message


if __name__ == '__main__':
    app.run(debug=True)
