# Домашнее задание к занятию «2.4. Инструменты Git»

Для выполнения заданий в этом разделе давайте склонируем репозиторий с исходным кодом 
терраформа https://github.com/hashicorp/terraform 

В виде результата напишите текстом ответы на вопросы и каким образом эти ответы были получены. 

1. Найдите полный хеш и комментарий коммита, хеш которого начинается на `aefea`.
    - Нашел выполнив команду: git show aefea   
    - Полный хэш коммита: aefead2207ef7e2aa5dc81a34aedf0cad4c32545   
    - Комментарий коммита: Update CHANGELOG.md
1. Какому тегу соответствует коммит `85024d3`?
    - Нашел выполнив команду: git show 85024d3   
    - Тэг коммита: v0.12.23   
1. Сколько родителей у коммита `b8d720`? Напишите их хеши.
    - Нашел родителей через команды: git show b8d720^1 и git show b8d720^2
    - У данного коммита два родителя
    - Хэш первого родителя: 56cd7859e05c36c06b56d013b55a252d0bb7e158
    - Хэш второго родителя: 9ea88f22fc6269854151c571162c5bcf958bee2b
1. Перечислите хеши и комментарии всех коммитов которые были сделаны между тегами  v0.12.23 и v0.12.24.
    - Нашел выполнив команду: git log v0.12.23..v0.12.24
    - Список хэшей и их коммитов:
        - b14b74c4939dcab573326f4e3ee2a62e23e12f89 
            > [Website] vmc provider links
        - 3f235065b9347a758efadc92295b540ee0a5e26e 
            > Update CHANGELOG.md
        - 6ae64e247b332925b872447e9ce869657281c2bf 
            > registry: Fix panic when server is unreachable
          
            > Non-HTTP errors previously resulted in a panic due to dereferencing the
            resp pointer while it was nil, as part of rendering the error message.
            This commit changes the error message formatting to cope with a nil
            response, and extends test coverage.
    
            > Fixes #24384
        - 5c619ca1baf2e21a155fcdb4c264cc9e24a2a353
            > website: Remove links to the getting started guide's old location
            > Since these links were in the soon-to-be-deprecated 0.11 language section, I
            think we can just remove them without needing to find an equivalent link.
        - 06275647e2b53d97d4f0a19a0fec11f6d69820b5
            > Update CHANGELOG.md
        - d5f9411f5108260320064349b757f55c09bc4b80
            > command: Fix bug when using terraform login on Windows
        - 4b6d06cc5dcb78af637bbb19c198faff37a066ed
            > Update CHANGELOG.md
        - dd01a35078f040ca984cdd349f18d0b67e486c35
            > Update CHANGELOG.md
        - 225466bc3e5f35baa5d07197bbc079345b77525e
            > Cleanup after v0.12.23 release
1. Найдите коммит в котором была создана функция `func providerSource`, ее определение в коде выглядит 
так `func providerSource(...)` (вместо троеточего перечислены аргументы).
   - Нашел файл в котором содержится данная функция через команду: git grep 'func providerSource('
   - Нашел коммит в котором была создана эта функция с помощью команды: git log -L :providerSource:provider_source.go
   - Хэш коммита: 8c928e83589d90a031f811fae52a81be7153e82f 
1. Найдите все коммиты в которых была изменена функция `globalPluginDirs`.     
   - Нашел файл в котором содержится данная функция через команду: git grep 'func globalPluginDirs('
   - Нашел коммит в котором была создана эта функция с помощью команды: git log -L :globalPluginDirs:plugins.go
   - Список хэшей коммитов от первого к последнему:
        - 8364383c359a6b738a436d1b7745ccdce178df47
        - 66ebff90cdfaa6938f26f908c7ebad8d547fea17
        - 41ab0aef7a0fe030e84018973a64135b11abcd70
        - 52dbf94834cb970b510f2fba853a5b49ad9b1a46
        - 78b12205587fe839f10d946ea3fdc06719decb05
1. Кто автор функции `synchronizedWriters`? 
    - Нашел коммиты в которых редактировалась данная функция с помощью команды: git log -SsynchronizedWriters --oneline
        - bdfea50cc remove unused 
        - fd4f7eb0b remove prefixed io
        - 5ac311e2a main: synchronize writes to VT100-faker on Windows
    - Переключился на первый коммит где встречается функция: git checkout 5ac311e2a
    - Нашел файл в котором встречается данная функция: git grep 'func synchronizedWriters'
    - Выполнил команду для определения пользователя изменившего файл: git blame synchronized_writers.go | grep synchronizedWriters
    - Автор функции: Martin Atkins

