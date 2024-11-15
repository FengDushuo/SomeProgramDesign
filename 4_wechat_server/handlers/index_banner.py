import os
import tornado.web
import tornado.httpserver
import tornado.ioloop

class IndexBannerHandler(tornado.web.RequestHandler):
    def get(self):
        print("GET方式请求成功")
        returndata = {"data":[{"picUrl":"http://127.0.0.1:8000/public/upload-imagesource/IndexBanner/indexbanner1.png","type":"banner"},{"picUrl":"http://127.0.0.1:8000/public/upload-imagesource/IndexBanner/indexbanner2.png","type":"banner"},{"picUrl":"http://127.0.0.1:8000/public/upload-imagesource/IndexBanner/indexbanner3.png","type":"banner"}]}
        self.write(returndata)