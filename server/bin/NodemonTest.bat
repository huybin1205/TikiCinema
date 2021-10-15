@ECHO OFF
start cmd /k "SET PORT=8888 && nodemon www"
start chrome http://localhost:8888