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