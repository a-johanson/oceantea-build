cd ../../../oceantea-visualization-gateway
call npm install
call npm update
start /b cmd /c node index.js

cd ../oceantea-auth
call npm install
call npm update
start /b cmd /c node index.js

cd ../oceantea-scalar-time-series
call npm install
call npm update
start /b cmd /c node index.js

cd ../oceantea-time-series-conversion
call npm install
call npm update
start /b cmd /c node index.js

cd ../oceantea-spatial-analysis
start /b cmd /c python server.py

cd ../oceantea-vector-time-series
start /b cmd /c python server.py

cd ../oceantea-coral-analysis
start /b cmd /c python server.py

cd ../oceantea-build/run-local/windows
