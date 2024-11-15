import os
import tornado.web
import tornado.httpserver
import tornado.ioloop

class IndexEnvHandler(tornado.web.RequestHandler):
    def get(self):
        print("GET方式请求成功")
        returndata = {"data":[{"picUrl":"http://127.0.0.1:8888/public/upload-imagesource/IndexEnv/indexenv1.png","type":"env"},{"picUrl":"http://127.0.0.1:8888/public/upload-imagesource/IndexEnv/indexenv2.png","type":"env"},{"picUrl":"http://127.0.0.1:8888/public/upload-imagesource/IndexEnv/indexenv3.png","type":"env"}]}
        self.write(returndata)