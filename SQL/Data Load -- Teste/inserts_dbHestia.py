import psycopg2 as db

def connect():
    try:
        conn = db.connect(
            database="defaultdb",
            user="avnadmin",
            password="AVNS_3URGOb6MG5fTz7u4pnP",
            host="pg-aplicativo-hestia24.k.aivencloud.com",
            port="23986"
        )
        return conn.cursor()
    except db.OperationalError as sqle:
        print(sqle)
        return False

def admin(nome, email, senha):
    cur = connect()
    cur.execute("INSERT INTO admin (nome, email, senha) VALUES (%s, %s, %s)", [nome, email, senha])

    