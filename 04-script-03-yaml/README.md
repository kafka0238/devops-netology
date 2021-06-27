# Домашнее задание к занятию "4.3. Языки разметки JSON и YAML"

## Обязательные задания

1. Мы выгрузили JSON, который получили через API запрос к нашему сервису:
	```json
    { "info" : "Sample JSON output from our service\t",
        "elements" :[
            { "name" : "first",
            "type" : "server",
            "ip" : 7175 
            },
            { "name" : "second",
            "type" : "proxy",
            "ip : 71.78.22.43
            }
        ]
    }
	```
  Нужно найти и исправить все ошибки, которые допускает наш сервис
	
```json
{
  "info": "Sample JSON output from our service\t",
  "elements": [
    {
      "name": "first",
      "type": "server",
      "ip": 7175
    },
    {
      "name": "second",
      "type": "proxy",
      "ip": "71.78.22.43"
    }
  ]
}
```
2. В прошлый рабочий день мы создавали скрипт, позволяющий опрашивать веб-сервисы и получать их IP. К уже реализованному функционалу нам нужно добавить возможность записи JSON и YAML файлов, описывающих наши сервисы. Формат записи JSON по одному сервису: { "имя сервиса" : "его IP"}. Формат записи YAML по одному сервису: - имя сервиса: его IP. Если в момент исполнения скрипта меняется IP у сервиса - он должен так же поменяться в yml и json файле.

	```python
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
	

	```