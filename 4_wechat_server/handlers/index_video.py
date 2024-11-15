import os
import tornado.web
import tornado.httpserver
import tornado.ioloop

class IndexVideoHandler(tornado.web.RequestHandler):
    def get(self):
        print("GET方式请求成功")
        returndata = "D:\\develop\\Web_Design\\work\\wx_server\\static\\image\\1.mp4"
        self.write(returndata)