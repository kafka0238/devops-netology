# devops-netology

## Description gitignore in terraform directory

Будут проигнорированы файлы по следующим правилам
1. Все файлы во всех вложенных директориях .terraform
1. Все файлы с расширением tfstate и другими расширениями у этих файлов
1. Файл crach.log
1. Файлы с расширением tfvars
1. Файлы override.tf и override.tf.json
1. Файлы заканчивающиеся на _override.tf и _override.tf.json
1. Файлы .terraformrc и terraform.rc
