:start
DEL /F /Q /A "%~dp0image.txt"
DEL /F /Q /A "%~dp0container.txt"
docker system prune -a -f
docker build https://raw.githubusercontent.com/randomtable/ChimeraOS/master/DockerFile-Tor-Relay --iidfile "%~dp0image.txt"
SET /P iid=<"%~dp0image.txt"
SET iid=%iid:sha256:=%
docker create %iid%
docker ps -l -q >> container.txt
SET /P ciid=<"%~dp0container.txt"
docker commit %ciid% alessandrofiori/tor-relay:latest
docker login
docker push alessandrofiori/tor-relay:latest
DEL /F /Q /A "%~dp0image.txt"
DEL /F /Q /A "%~dp0container.txt"
docker system prune -a -f
docker build https://raw.githubusercontent.com/randomtable/ChimeraOS/master/DockerFile-Non-Exit-Relay --iidfile "%~dp0image.txt"
SET /P iid=<"%~dp0image.txt"
SET iid=%iid:sha256:=%
docker create %iid%
docker ps -l -q >> container.txt
SET /P ciid=<"%~dp0container.txt"
docker commit %ciid% alessandrofiori/tor-non-exit-relay:latest
docker login
docker push alessandrofiori/tor-non-exit-relay:latest
DEL /F /Q /A "%~dp0image.txt"
DEL /F /Q /A "%~dp0container.txt"
docker system prune -a -f
docker build https://raw.githubusercontent.com/randomtable/ChimeraOS/master/DockerFile-Tor-World --iidfile "%~dp0image.txt"
SET /P iid=<"%~dp0image.txt"
SET iid=%iid:sha256:=%
docker create %iid%
docker ps -l -q >> container.txt
SET /P ciid=<"%~dp0container.txt"
docker commit %ciid% alessandrofiori/torworld-template:latest
docker login
docker push alessandrofiori/torworld-template:latest
DEL /F /Q /A "%~dp0image.txt"
DEL /F /Q /A "%~dp0container.txt"
docker system prune -a -f
docker build https://raw.githubusercontent.com/randomtable/ChimeraOS/master/DockerFile-IRC-Server --iidfile "%~dp0image.txt"
SET /P iid=<"%~dp0image.txt"
SET iid=%iid:sha256:=%
docker create %iid%
docker ps -l -q >> container.txt
SET /P ciid=<"%~dp0container.txt"
docker commit %ciid% alessandrofiori/torworld-irc:latest
docker login
docker push alessandrofiori/torworld-irc:latest
TIMEOUT /T 777 /NOBREAK
GOTO start
