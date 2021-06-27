import os
import sys

path_to_repo = sys.argv[1]
if path_to_repo[-1] != '/':
    path_to_repo += '/'

if os.path.exists(path_to_repo + '.git'):
    bash_command = [f"cd {path_to_repo}", "git status", "pwd"]
    result_os = os.popen(' && '.join(bash_command)).read()
    absolut_path = os.popen('pwd').read()
    is_change = False
    for result in result_os.split('\n'):
        if result.find('modified') != -1:
            prepare_result = result.replace('\tmodified:   ', '')
            print(result_os.split('\n')[-2] + '/' + prepare_result)
else:
    print('this directory has not repository')