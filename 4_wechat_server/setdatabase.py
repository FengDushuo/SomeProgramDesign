import pymysql

mysqluser="root"
mysqlpassword="19971130"
logindatabase="login_db_2"
admin_db = "admin_2"
hostsrc="localhost"

conn = pymysql.connect(host=hostsrc,port=3306,user=mysqluser,password="19971130",charset='utf8')
cursor = conn.cursor()

createloginsql="CREATE DATABASE IF NOT EXISTS "+logindatabase
cursor.execute(createloginsql)

createadminsql="CREATE DATABASE IF NOT EXISTS "+admin_db
cursor.execute(createadminsql)

#读取sql文件返回指令数组
def read_sql_return(filename):
    # sql文件名， .sql后缀的
    sql_file = filename
    # 读取 sql 文件文本内容
    sql1 = open(sql_file, 'r', encoding='utf8')
    sqltxt = sql1.readlines()
    # 此时 sqltxt 为 list 类型
    # 读取之后关闭文件
    sql1.close()
    # list 转 str
    sql2 = "".join(sqltxt)
    sql2 = sql2.replace("\n", "")
    sql_list = sql2.split(";")
    sql_list.pop()
    return sql_list

logconnect = pymysql.connect(    #连接数据库服务器
    user=mysqluser,              #本地mysql用户名
    password="19971130",          #本地MySQL密码
    host=hostsrc,
    port=3306,
    db=logindatabase,
    charset="utf8"
)

loginconnect = logconnect                #连接数据库服务器   
loginconn = loginconnect.cursor()        #创建操作游标
                                         #你需要一个游标 来实现对数据库的操作相当于一条线索
loginconn.execute("CREATE TABLE IF NOT EXISTS users (id int(11) PRIMARY KEY ,username VARCHAR(20),password VARCHAR(40),email VARCHAR(40))")
loginconn.close()
loginconnect.close()

adminconnect = pymysql.connect(    #连接数据库服务器
    user=mysqluser,              #本地mysql用户名
    password="19971130",          #本地MySQL密码
    host=hostsrc,
    port=3306,
    db=admin_db,
    charset="utf8"
)

adminconn = adminconnect.cursor()        #创建操作游标
                                         #你需要一个游标 来实现对数据库的操作相当于一条线索
adminsql_list = read_sql_return("./static/sql/admin.sql")
for sql_command in adminsql_list:
    adminconn.execute(sql_command+";")
                                         #你需要一个游标 来实现对数据库的操作相当于一条线索
wechatusersql_list = read_sql_return("./static/sql/wechatuser.sql")
for sql_command in wechatusersql_list:
    adminconn.execute(sql_command+";")

imagesourcesql_list = read_sql_return("./static/sql/imagesource.sql")
for sql_command in imagesourcesql_list:
    adminconn.execute(sql_command+";")

adminconn.close()
adminconnect.close()

