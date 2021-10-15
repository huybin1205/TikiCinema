@ECHO OFF
start cmd /k "set PORT=1111 && nodemon www"
timeout /t 2
start cmd /k "set PORT=1212 && nodemon www"
timeout /t 2
start cmd /k "set PORT=1313 && nodemon www"
timeout /t 2
start cmd /k "set PORT=1414 && nodemon www"
timeout /t 2
start cmd /k "set PORT=1515 && nodemon www"
timeout /t 2
start cmd /k "set PORT=2121 && nodemon www"
timeout /t 2
start cmd /k "set PORT=2222 && nodemon www"
timeout /t 2
start cmd /k "set PORT=2323 && nodemon www"
timeout /t 2
start cmd /k "set PORT=2424 && nodemon www"
timeout /t 2
start cmd /k "set PORT=2525 && nodemon www"
timeout /t 2
start chrome http://tracnghiemhutech.com/