import aiml
import time
import pymysql
import requests

database = {
    "host": "localhost",
    "port": 3306,
    "user": "root",
    "password": "",
    "db": "laravel-chat",
    "cursorclass": pymysql.cursors.DictCursor
}
BASE_URL = 'http://127.0.0.1:8000/'
con_db = pymysql.connect(**database)
c_db = con_db.cursor()

while True:
    print("Cek")
    c_db.execute("SELECT id FROM `users` WHERE `type`='bot'")
    bot = c_db.fetchone()
    print(bot['id'])
    c_db.execute(
        "SELECT * FROM `outbox` WHERE `receiver`='%s' AND `status` = 'just_arrived' ORDER BY id asc limit 1" % bot['id'])
    message = c_db.fetchone()
    con_db.rollback()
    print(message)
    if message is not None and message['messages'] == 'hey':
        data = {'sender': message['receiver'], 'receiver': message['sender'],
                'id_chatroom': message['id_chatroom'], 'message': 'Hey Juga Bro'}
        rv = requests.post(BASE_URL + 'api/messagesBot', data=data)
        status = rv.json()
        print(status)
        if status['status'] == '1':
            c_db.execute("SELECT * FROM inbox WHERE id_chatroom='%s'"%message['id_chatroom'])
            inboxs = c_db.fetchall()
            for inbox in inboxs:
                c_db.execute("UPDATE inbox SET `status`='done' WHERE `id`='%s'" % inbox['id'])
                con_db.commit()
                con_db.rollback()
            c_db.execute("SELECT * FROM outbox WHERE id_chatroom='%s'" % message['id_chatroom'])
            outboxs = c_db.fetchall()
            for outbox in outboxs:
                c_db.execute("UPDATE outbox SET `status`='done' WHERE `id`='%s'" % outbox['id'])
                con_db.commit()
                con_db.rollback()
    if message is not None and message['messages'] == 'kamu siapa ?':
        data = {'sender': message['receiver'], 'receiver': message['sender'],
                'id_chatroom': message['id_chatroom'], 'message': 'Aku Nana Bot, Salam Kenal'}
        rv = requests.post(BASE_URL + 'api/messagesBot', data=data)
        status = rv.json()
        print(status)
        if status['status'] == '1':
            c_db.execute("SELECT * FROM inbox WHERE id_chatroom='%s'"%message['id_chatroom'])
            inboxs = c_db.fetchall()
            for inbox in inboxs:
                c_db.execute("UPDATE inbox SET `status`='done' WHERE `id`='%s'" % inbox['id'])
                con_db.commit()
                con_db.rollback()
            c_db.execute("SELECT * FROM outbox WHERE id_chatroom='%s'" % message['id_chatroom'])
            outboxs = c_db.fetchall()
            for outbox in outboxs:
                c_db.execute("UPDATE outbox SET `status`='done' WHERE `id`='%s'" % outbox['id'])
                con_db.commit()
                con_db.rollback()
    time.sleep(1)

