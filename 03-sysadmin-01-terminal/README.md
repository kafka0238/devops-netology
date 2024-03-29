## Домашнее задание к занятию "3.1. Работа в терминале, лекция 1"

1. Ознакомьтесь с графическим интерфейсом VirtualBox, посмотрите как выглядит виртуальная машина, 
   которую создал для вас Vagrant, какие аппаратные ресурсы ей выделены. Какие ресурсы выделены по-умолчанию?
    - **Оперативной памяти выделенно: 1024 MB**
    - **Количество ядер: 1**
    - **Размер выделенного хранилища: 64 GB**

1. Ознакомьтесь с возможностями конфигурации VirtualBox через Vagrantfile: 
   [документация](https://www.vagrantup.com/docs/providers/virtualbox/configuration.html). 
   Как добавить оперативной памяти или ресурсов процессора виртуальной машине?
    - **Для добавления оперативной памяти: v.memory = 1024**
    - **Для добавления ресурсов процессора: v.cpus = 2**


1. Ознакомиться с разделами `man bash`, почитать о настройках самого bash:
    - какой переменной можно задать длину журнала `history`, и на какой строчке manual это описывается?
        - **Длину журнала `history` можно задать переменными: HISTFILESIZE(Максимальное количество строк, содержащихся в файле истории - 627 строчка) 
          и HISTSIZE(Количество команд, которые нужно запомнить в истории команд - 637 строчка)**
    - что делает директива `ignoreboth` в bash?
        - **Данная директива отменяет сохранение команд начинающиеся с пробела и повторяющиеся команды подряд**

1. Основываясь на знаниях о просмотре текущих (например, PATH) и установке новых переменных; командах, которые мы рассматривали, добейтесь в выводе type -a bash в виртуальной машине наличия первым пунктом в списке:

	```bash
	bash is /tmp/new_path_directory/bash
	bash is /usr/local/bin/bash
	bash is /bin/bash
	```

	(прочие строки могут отличаться содержимым и порядком)

    - **Добавил выполением команды: export PATH=/tmp/new_path_directory:$PATH**
    
1. Чем отличается планирование команд с помощью `batch` и `at`?
    - **Команда at используется для назначения одноразового задания на заданное время, а команда batch — для назначения одноразовых задач, которые должны выполняться, когда загрузка системы становится меньше 0,8**
    
1. В каких сценариях использования применимы скобки `{}` и на какой строчке `man bash` это описано?
   - **В сценариях для генерации строк**
   - **На строке 806**

1. Основываясь на предыдущем вопросе, как создать однократным вызовом touch 100000 файлов? 
   А получилось ли создать 300000?
   - **Командой touch test{1..100000}**
   - **Вернулась ошибка: bash: /usr/bin/touch: Argument list too long**
   
1. В man bash поищите по `/\[\[`. Что делает конструкция `[[ -d /tmp ]]`
   - **Возвращает 0 или 1 в зависимости от того существует данная директория или нет**
   
## Доработка домашнего задания

1. Есть замечания к пункту 7. Подумайте как можно еще попробовать создать нужное количество файлов. 
   Попробуйте использовать перенаправление ввода-вывода команд. 
   Так же подумайте над тем почему у вас возникла такая ошибка, и можно ли ее как то исправить? 
   А так же проверьте действительно ли на строке 806 вы нашли информацию о применении 
   фигурных скобок, или укажите версию дистрибутива где вызывалась команда man bash
   
   - **Исправил перенаправлением вывода генерации строк по одному параметру команде touch (echo {1..300000}test | xargs -n 1 touch), 
     в данном случае получилось создать 300000 файлов**
   - **Правильно ли понял что имеллось ввиду Brace Expansion, или нужно было найти что то другое про сценарии применения `{}`, 
     отобразил строки без увеличения размеров консоли, отобразилась строчка 1508**
   - **Верия дистрибутива: 20.04.1 LTS (Focal Fossa)**