import os
import tornado.web
import tornado.httpserver
import tornado.ioloop

class IndexBgHandler(tornado.web.RequestHandler):
    def get(self):
        print("GET方式请求成功")
        returndata = "http://127.0.0.1:8888/public/upload-imagesource/IndexBg/indexbg.png"
        self.write(returndata)
