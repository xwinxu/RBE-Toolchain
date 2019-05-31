from flask import Flask
from redis import Redis, RedisError
import os
import socket

# Connect to Redis
redis = Redis(host="redis", db=0, socket_connect_timeout=2, socket_timeout=2)

app = Flask(__name__)

@app.route("/")
def hello():
    try:
        visits = redis.incr("counter")
    except RedisError:
        visits = "<i>cannot connect to Redis, counter disabled</i>"

    html = "<h3>Hello {name}!</h3>" \
           "<b>Hostname:</b> {hostname}<br/>" \
           "<b>Visits:</b> {visits}"
    return html.format(name=os.getenv("NAME", "world"), hostname=socket.gethostname(), visits=visits)

if __name__ == "__main__":
    app.run(host='0.0.0.0', port=80)

# """TODO(xwinxu): DO NOT SUBMIT without one-line documentation for app.
# 
# TODO(xwinxu): DO NOT SUBMIT without a detailed description of app.
# """
# 
# from __future__ import absolute_import
# from __future__ import division
# from __future__ import google_type_annotations
# from __future__ import print_function
# 
# from absl import app
# from absl import flags
# 
# FLAGS = flags.FLAGS
# 
# 
# def main(argv):
#   if len(argv) > 1:
#     raise app.UsageError('Too many command-line arguments.')
# 
# if __name__ == '__main__':
#   app.run(main)
