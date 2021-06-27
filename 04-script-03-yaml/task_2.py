import socket
import json
import yaml

web_services = {'drive.google.com': '', 'mail.google.com': '', 'google.com': ''}

while True:
    for name, host in web_services.items():
        new_host = socket.gethostbyname(name)
        if new_host != host:
            print(f'[ERROR] {name} IP mismatch: {host} {new_host}')
            web_services[name] = new_host
            with open("web-services.json", "w") as web_services_json:
                web_services_json.write(json.dumps(web_services, indent=2))
            with open("web-services.yaml", "w") as web_services_yaml:
                web_services_yaml.write(yaml.dump(web_services, explicit_start=True, explicit_end=True))
        else:
            print(f'{name} - {host}')

