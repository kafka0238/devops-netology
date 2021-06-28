# Домашнее задание к занятию "4.2. Использование Python для решения типовых DevOps задач"

## Обязательные задания

1. Есть скрипт:
	```python
    #!/usr/bin/env python3
	a = 1
	b = '2'
	c = a + b
	```
	* Какое значение будет присвоено переменной c?
        - **Значение прсвоенно не будет, т.к. будет ошибка из-за разных типов данных**
	* Как получить для переменной c значение 12?
        - **Нужно изменить тип переменной `a`, сделать ее строкой `str(a)`**
	* Как получить для переменной c значение 3?
        - **Нужно изменить тип переенной `b`, сделать ее числом `int(b)`**

1. Мы устроились на работу в компанию, где раньше уже был DevOps Engineer. Он написал скрипт, позволяющий узнать, какие файлы модифицированы в репозитории, относительно локальных изменений. Этим скриптом недовольно начальство, потому что в его выводе есть не все изменённые файлы, а также непонятен полный путь к директории, где они находятся. Как можно доработать скрипт ниже, чтобы он исполнял требования вашего руководителя?

	```python
    #!/usr/bin/env python3

    import os

	bash_command = ["cd ~/netology/sysadm-homeworks", "git status"]
	result_os = os.popen(' && '.join(bash_command)).read()
    is_change = False
	for result in result_os.split('\n'):
        if result.find('modified') != -1:
            prepare_result = result.replace('\tmodified:   ', '')
            print(prepare_result)
            break

	```
    - **Убрать `break`, чтоб цикл не останавливался на первом подходящем условии**
    - **Добавить в bash_command еще одну строчку `pwd`, чтоб получить путь до рабочей директории, и потом в цикле добавлять перед выводом `result_os.split('\n')[-2] + '/'`**
	
	```python
    #!/usr/bin/env python3

    import os
 
	path_to_repo = '~/netology/sysadm-homeworks'
 	
	os.chdir(path_to_repo)
	absolut_repo_path = os.getcwd()
	result_os = os.popen("git status").read()
	for result in result_os.split('\n'):
        if result.find('modified') != -1:
            prepare_result = result.replace('\tmodified:   ', '')
            print(absolut_repo_path + '/' + prepare_result)

	```

1. Доработать скрипт выше так, чтобы он мог проверять не только локальный репозиторий в текущей директории, а также умел воспринимать путь к репозиторию, который мы передаём как входной параметр. Мы точно знаем, что начальство коварное и будет проверять работу этого скрипта в директориях, которые не являются локальными репозиториями.
	```python
    #!/usr/bin/env python3

	import os
	import sys
	
	path_to_repo = sys.argv[1]
	if path_to_repo[-1] != '/':
	    path_to_repo += '/'
	
	os.chdir(path_to_repo)
	absolut_repo_path = os.getcwd()
	
	if os.path.exists(path_to_repo + '.git'):
	    result_os = os.popen("git status").read()
	    for result in result_os.split('\n'):
	        if result.find('modified') != -1:
	            prepare_result = result.replace('\tmodified:   ', '')
	            print(absolut_repo_path + '/' + prepare_result)
	else:
	    print('this directory has not repository')


	```

1. Наша команда разрабатывает несколько веб-сервисов, доступных по http. Мы точно знаем, что на их стенде нет никакой балансировки, кластеризации, за DNS прячется конкретный IP сервера, где установлен сервис. Проблема в том, что отдел, занимающийся нашей инфраструктурой очень часто меняет нам сервера, поэтому IP меняются примерно раз в неделю, при этом сервисы сохраняют за собой DNS имена. Это бы совсем никого не беспокоило, если бы несколько раз сервера не уезжали в такой сегмент сети нашей компании, который недоступен для разработчиков. Мы хотим написать скрипт, который опрашивает веб-сервисы, получает их IP, выводит информацию в стандартный вывод в виде: <URL сервиса> - <его IP>. Также, должна быть реализована возможность проверки текущего IP сервиса c его IP из предыдущей проверки. Если проверка будет провалена - оповестить об этом в стандартный вывод сообщением: [ERROR] <URL сервиса> IP mismatch: <старый IP> <Новый IP>. Будем считать, что наша разработка реализовала сервисы: drive.google.com, mail.google.com, google.com.
	```python
    #!/usr/bin/env python3

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


	```

