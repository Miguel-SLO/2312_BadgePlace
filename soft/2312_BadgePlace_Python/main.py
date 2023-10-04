import binascii
import socket

host_name = socket.gethostname()
# getting the IP address using socket.gethostbyname() method
host_addr = socket.gethostbyname(host_name)

host_port = 8080  # Port to listen on (non-privileged ports are > 1023)

print("*************************************************")
print("                STARTING DATABASE ")
print("*************************************************")
print(f"Opened at adress : {host_addr}")
print(f"Port number      : {host_port}")
print(f"Name             : {host_name}")
print("*************************************************")
print("              WAITING FOR CONNECTION ...         ")

with socket.socket(socket.AF_INET, socket.SOCK_STREAM) as s:
    s.bind((host_addr, host_port))
    s.listen()
    conn, addr = s.accept()
    with conn:
        print("*************************************************")
        print(f"NEW CONNECTION FROM : {addr}")
        print("*************************************************")
        while True:
            # Waiting to receive 4 bytes
            data = conn.recv(4)

            # Watchdog
            if not data:
                break

            # Convert to hexadecimal
            hex_data = binascii.hexlify(data).decode('utf-8')

            print(hex_data)

            conn.sendall(data)
