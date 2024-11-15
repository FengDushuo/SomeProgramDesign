# -*- coding: utf-8 -*-
import base64
import tornado.escape
import tornado.web
import uuid
import requests
from redis import StrictRedis
import pymysql

mysqluser="root"
mysqlpassword="19971130"
admin_db = "admin_2"
hostsrc="localhost"

user_redis = StrictRedis.from_url('redis://localhost:6379')

def get_user_info(js_code):
        req_params = {
            "appid": 'wxc4394048bb3c2afc',  # 小程序的 ID
            "secret": '1abc15623464cf74fd5f2ecd0cb16d7e',  # 小程序的 secret
            "js_code": js_code,
            "grant_type": 'authorization_code'
        }
        req_result = requests.get('https://api.weixin.qq.com/sns/jscode2session', 
                                params=req_params, timeout=3, verify=False)
        return req_result.json()

class LoginHandler(tornado.web.RequestHandler):

    def get(self):
        js_code = self.get_query_argument("code")
        user_nick = self.get_query_argument("nick")
        user_sex = self.get_query_argument("sex")
        user_avaurl = self.get_query_argument("avaurl")
        user_city = self.get_query_argument("city")
        user_province = self.get_query_argument("province")
        # 这里是换取用户的信息
        user_info = get_user_info(js_code)
        openid = user_info['openid']
        session_key = user_info['session_key']
        user_uuid = str(uuid.uuid4())  # 暴露给小程序端的用户标示
        # 用来维护用户的登录态
        User.save_user_session(
            user_uuid=user_uuid,
            openid=openid,
            session_key=session_key
        )
        # 微信小程序不能设置cookie，把用户信息存在了 headers 中
        self.set_header('Authorization', user_uuid)
        # 存储用户信息
        conn = pymysql.connect(host=hostsrc,port=3306,user=mysqluser,password=mysqlpassword,db=admin_db,charset='utf8')
        cursor = conn.cursor()
        sql_str="insert into wx_users (open_id,nickname,avatar,birth,phone,city,province,gender) values (%s,%s,%s,%s,%s,%s,%s,%s)"
        sql_value=(openid,user_nick,user_avaurl,0,0,user_city,user_province,user_sex,)
        cursor.execute(sql_str,sql_value)
        conn.commit()
        cursor.close()
        conn.close()
        self.set_status(204)

class User(object):

    REDIS_EXPIRES = 7 * 24 * 60 * 60
    # table = tables['user']

    @classmethod
    def save_user_session(cls, user_uuid, openid, session_key):
        user_session_value = {
            'openid': openid,
            'session_key': session_key
        }
        user_session_key = 'US:' + user_uuid
        with user_redis.pipeline(transaction=False) as pipe:
            pipe.hmset(user_session_key, user_session_value)
            pipe.expire(user_session_key, cls.REDIS_EXPIRES)
            pipe.execute()

