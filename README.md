# steamlink
Автозапуск для приложения emulate station.

Файлы залить через scp в папку /home/steam

Через ssh задать права на выполнение для emustation.sh - chmod 755 /home/steam/emustation.sh

Emulatestation должен быть установлен. 

По идее если он не будет установлен, то загрузка вернется к стандартному запуску родной оболочки, но я не проверял.

Все манимуляции с устройством - на свой страх и риск. 

rc.local можно не заменять, просто добавить запуск скрипта выше, чем powermanager

```bash
....
ulimit -c unlimited

./emustation.sh

# Start power manager, which will start the application if appropriate
./bin/powermanager.sh &
```
