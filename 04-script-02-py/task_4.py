import socket

dict = {'drive.google.com': '', 'mail.google.com': '', 'google.com': ''}

while True:
    for name, host in dict.items():
        new_host = socket.gethostbyname(name)
        if new_host != host:
            print(f'[ERROR] {name} IP mismatch: {host} {new_host}')
            dict[name] = new_host
        else:
            print(f'{name} - {host}')

