DEL /F /Q /A "%~dp0image.txt"
DEL /F /Q /A "%~dp0container.txt"
docker build --no-cache=true "%~dp09004" --iidfile "%~dp0image.txt"
SET /P iid=<"%~dp0image.txt"
SET iid=%iid:sha256:=%
docker create %iid%
docker ps -l -q >> container.txt
SET /P ciid=<"%~dp0container.txt"
docker commit %ciid% 9004
docker run -p 9004:9004 9004
