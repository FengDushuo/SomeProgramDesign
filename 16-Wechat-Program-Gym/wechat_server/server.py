#!/usr/bin/env python
# coding=utf-8

import os
import tornado.web
import tornado.websocket
import tornado.httpserver
import tornado.ioloop
import tornado.options
from tornado.options import define, options
import json
import uuid
import requests
from redis import StrictRedis
from handlers.login import LoginHandler
from handlers.login_image import LoginImageHandler
from handlers.index_env import IndexEnvHandler
from handlers.index_banner import IndexBannerHandler
from handlers.index_bg import IndexBgHandler
from handlers.index_video import IndexVideoHandler


define("port", default = 8000, help = "run on the given port", type = int)

class Application(tornado.web.Application):
    def __init__(self):
        handlers = [
            (r'/index_env', IndexEnvHandler),
            (r'/index_banner', IndexBannerHandler),
            (r'/index_bg', IndexBgHandler),
            (r'/index_video', IndexVideoHandler),
            (r'/wxlogin', LoginHandler),
            (r'/login_image', LoginImageHandler),
        ]

        settings = dict(
        template_path = os.path.join(os.path.dirname(__file__), "templates"),
        static_path = os.path.join(os.path.dirname(__file__), "static"),
        )
        tornado.web.Application.__init__(self, handlers, **settings)


def main():
    tornado.options.parse_command_line()
    http_server = tornado.httpserver.HTTPServer(Application())
    http_server.listen(options.port)

    print("Development server is running at http://localhost:%s" % options.port)
    print("Quit the server with Control-C")

    tornado.ioloop.IOLoop.instance().start()

if __name__ == "__main__":
    main()