import binascii
import socket
import sqlite3

# Getting local IP address and name
host_name = socket.gethostname()
host_addr = socket.gethostbyname(host_name)
host_port = 8080

db_con = sqlite3.connect("badgeplace.db")
db_cur = db_con.cursor()

try:
    db_cur.execute("CREATE TABLE badges (badgeid, hasright)")
except:
    pass

print("*************************************************")
print("                STARTING DATABASE ")
print("*************************************************")
print(f"Opened at adress : {host_addr}")
print(f"Port number      : {host_port}")
print(f"Name             : {host_name}")
print("*************************************************")
print("              WAITING FOR CONNECTION ...         ")

with socket.socket(socket.AF_INET, socket.SOCK_STREAM) as s:

    # Setup TCP communication
    s.bind((host_addr, host_port))
    s.listen()

    # Waiting for a connection
    conn, addr = s.accept()

    print("*************************************************")
    print(f"NEW CONNECTION FROM : {addr}")
    print("*************************************************")

    while True:
        # Waiting to receive bytes
        received_data = conn.recv(6)

        # Watchdog
        if not received_data:
            print(" AN ERROR OCCURED : LEAVING ")
            print("*************************************************")
            break

        if received_data.startswith(b'MS'):
            newUID = received_data.replace(b'MS', b'')
            hex_UID = binascii.hexlify(newUID).decode('utf-8')
            print(f"New badge detected : {hex_UID} ")
            searchbadge = db_cur.execute(f"SELECT badgeid, hasright FROM badges WHERE badgeid='{hex_UID}'")
            searchbadge = searchbadge.fetchone()

            if searchbadge is None:
                print(" This badge is not specified in database ")

                userIn = input(" Do you want to give him access to station {addr} ? [Y][N] \n")

                if (userIn == 'Y') or (userIn == 'y'):
                    db_cur.execute(f"INSERT INTO badges (badgeid, hasright) VALUES ('{hex_UID}', 'Y')")
                    accessByte = b'Y'
                    print("Badge access : ACCEPTED ")
                elif (userIn == 'N') or (userIn == 'n'):
                    db_cur.execute(f"INSERT INTO badges (badgeid, hasright) VALUES ('{hex_UID}', 'N')")
                    accessByte = b'N'
                    print("Badge access : DECLINED ")
                    print("*************************************************")
                sending = received_data + accessByte
                db_con.commit()
            else:
                if searchbadge[1] == 'Y':
                    print("Badge access : ACCEPTED ")
                else:
                    print("Badge access : DECLINED ")
                print("*************************************************")
                conn.sendall(sending)
            conn.sendall(sending)

        else:
            print(" Wrong message prefix received ")
