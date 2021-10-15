@ECHO OFF
start cmd /k "pm2 start www --name server1 -- -- port 1111"
timeout /t 2
start cmd /k "pm2 start www --name server2 -- -- port 1212"
timeout /t 2
start cmd /k "pm2 start www --name server3 -- -- port 1313"
timeout /t 2
start cmd /k "pm2 start www --name server4 -- -- port 1414"
timeout /t 2
start chrome http://localhost/
timeout /t 1
start cmd /k "pm2 monit"